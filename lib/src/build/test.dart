// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Standard libraries
//---------------------------------------------------------------------

import 'dart:async';

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:build/build.dart';
import 'package:dogma_codegen/build.dart';
import 'package:dogma_source_analyzer/metadata.dart';
import 'package:dogma_source_analyzer/path.dart' as p;
import 'package:test/test.dart';

import 'expected_metadata_builder.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Tests a build [pipeline] with the given [inputs] and checking the [outputs]
/// for correctness.
///
/// The [inputs] are a map of strings where the key is the relative path and
/// the value the contents of the file to write.
Future<Null> testWithFileInput(Map<String, String> inputs,
                               List<SourceBuilder> pipeline,
                               List<LibraryMetadata> outputs,
                              {AssetWriter writer}) {
  writer ??= new FileBasedAssetWriter(currentPackageGraph);

  _writeInputs(inputs, writer);

  return _testPipeline(inputs.keys, pipeline, outputs, new PhaseGroup(), writer);
}

/// Tests a build [pipeline] with the given [inputs] and checking the [outputs]
/// for correctness.
///
/// The [inputs] need to implement [PredefinedMetadataStep] as that will be
/// used to create the metadata.
Future<Null> testWithPredefinedMetadata(List<SourceBuilder> inputs,
                                        List<SourceBuilder> pipeline,
                                        List<LibraryMetadata> outputs,
                                       {AssetWriter writer}) {
  writer ??= new FileBasedAssetWriter(currentPackageGraph);

  // Create the phase group
  var phases = new PhaseGroup();

  // Hook in the predefined steps
  var dummyInputs = <String, String>{};
  var inputValues = <String>[];

  for (var builder in inputs) {
    assert(builder is PredefinedMetadataStep);

    // Get the relative path to the library
    var library = (builder as PredefinedMetadataStep).library;
    var relativePath = p.relative(library.uri);

    inputValues.add(relativePath);

    // Modify the last directory of the path
    //
    // This is done because an asset cannot be overwritten
    var pathSegments = p.split(relativePath);

    pathSegments[pathSegments.length - 2] = 'null';

    // Create a dummy input to write
    var dummyPath = pathSegments.join('/');

    dummyInputs[dummyPath] = '';

    // Add into build phases
    var inputSet = new InputSet(
        currentPackageName,
        [dummyPath]
    );

    phases.addPhase(new Phase()..addAction(builder, inputSet));
  }

  // Write the dummy inputs
  _writeInputs(dummyInputs, writer);

  return _testPipeline(inputValues, pipeline, outputs, phases, writer);
}

/// Writes the [inputs] into the [writer] which starts the pipeline.
void _writeInputs(Map<String, String> inputs, AssetWriter writer) {
  inputs.forEach((path, contents) {
    // Create the asset
    var asset = new Asset(rootAssetFromRelativePath(path), contents ?? '');

    // Write the asset
    writer.writeAsString(asset);
  });
}

/// Tests the build pipeline.
Future<Null> _testPipeline(Iterable<String> inputs,
                           List<SourceBuilder> pipeline,
                           List<LibraryMetadata> outputs,
                           PhaseGroup phases,
                           AssetWriter writer) async {
  // Write the input assets
  var writer = new FileBasedAssetWriter(currentPackageGraph);
  var previousAssetIds = <AssetId>[];
  var previousInputs = <String>[];

  for (var input in inputs) {
    // Create the asset
    var assetId = rootAssetFromRelativePath(input);

    // Add to list
    previousAssetIds.add(assetId);
    previousInputs.add(input);
  }

  // Iterate over the builders creating the pipeline
  for (var builder in pipeline) {
    if (builder is SourceBuilder) {
      // Create the phase
      var inputSet = new InputSet(currentPackageName, previousInputs);
      phases.addPhase(new Phase()..addAction(builder, inputSet));

      // Create the list of assets that will be outputted
      var outputAssetIds = <AssetId>[];

      for (var previousId in previousAssetIds) {
        for (var assetId in builder.declareOutputs(previousId)) {
          outputAssetIds.add(assetId);
        }
      }

      // Convert to input set format
      var outputPaths = <String>[];

      for (var assetId in outputAssetIds) {
        outputPaths.add(assetId.path);
      }

      // Switch over the previous
      previousAssetIds = outputAssetIds;
      previousInputs = outputPaths;
    } else if (builder is RootLibraryBuilder) {
      var sourceDirectory =
          (builder.config as RootLibraryBuilderConfig).sourceDirectory;

      var inputSet = new InputSet(
          currentPackageName,
          ['$sourceDirectory/*.dart']
      );

      phases.addPhase(new Phase()..addAction(builder, inputSet));
    } else {
      throw new ArgumentError.value(pipeline, 'An unknown builder is present');
    }
  }

  // Verify the output
  for (var output in outputs) {
    var expected = new ExpectedMetadataBuilder(output, []);

    var inputSet = new InputSet(
        currentPackageName,
        [p.relative(output.uri)]
    );

    print(inputSet.globs);

    phases.addPhase(new Phase()..addAction(expected, inputSet));
  }

  // Run the tests
  var result = await build(
      phases,
      deleteFilesByDefault: true,
      reader: new FileBasedAssetReader(currentPackageGraph),
      writer: writer,
      packageGraph: currentPackageGraph
  );

  expect(result.status, BuildStatus.success);
}
