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
import 'package:build_test/build_test.dart';
import 'package:dogma_codegen/build.dart';
import 'package:dogma_source_analyzer/metadata.dart';

import 'expected_metadata_builder.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Tests the [builder]'s output comparing it to the [expected] metadata.
Future<Null> testBuilder(SourceBuilder builder,
                         LibraryMetadata input,
                         LibraryMetadata expected) async {
  var package = currentPackageName;

  var files = new InputSet(package, ['**/*']);

  var phaseGroup = new PhaseGroup()
      ..addPhase(new Phase()..addAction(builder, files))
      ..addPhase(
          new Phase()
            ..addAction(
                new ExpectedMetadataBuilder(expected, []),
                new InputSet(package, ['${builder.libraryOutput}/*.dart'])
            )
      );

  var inputAsset = rootAssetIdFromUri(input.uri);
  var inputAssetName = inputAsset.toString();
  var outputAssetName = builder.outputAssetId(inputAsset).toString();

  await testPhases(
      phaseGroup, {
        inputAssetName: ''
      },
      outputs: {
        outputAssetName: '',
        '$outputAssetName.test': ExpectedMetadataBuilder.pass
      },
      packageGraph: currentPackageGraph
  );
}
