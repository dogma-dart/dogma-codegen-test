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
import 'package:dogma_source_analyzer/analyzer.dart';
import 'package:dogma_codegen/build.dart';
import 'package:dogma_source_analyzer/metadata.dart';

import '../../metadata.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A builder which checks the output of a previous builder against the
/// expected library metadata.
///
/// The [ExpectedMetadataBuilder] will output a text file at the same location
/// as the generated file. This will say either [pass] or [fail] dependent
/// on whether the metadata from the previous step is equal.
class ExpectedMetadataBuilder extends Builder with AnalyzerMetadataStep {
  //---------------------------------------------------------------------
  // Class variables
  //---------------------------------------------------------------------

  /// Indicator for passing builds.
  static const String pass = 'PASS';
  /// Indicator for failing builds.
  static const String fail = 'FAIL';

  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// The expected metadata from the previous build step.
  final LibraryMetadata expected;
  @override
  final List<AnalyzeAnnotation> annotationCreators;

  //---------------------------------------------------------------------
  // Constructors
  //---------------------------------------------------------------------

  /// Creates an instance of [ExpectedMetadataBuilder] which will check the
  /// actual output with the [expected].
  ///
  /// If the builder will be creating annotations then [annotationCreators]
  /// should be provided.
  ExpectedMetadataBuilder(this.expected, this.annotationCreators);

  //---------------------------------------------------------------------
  // Builder
  //---------------------------------------------------------------------

  @override
  Future build(BuildStep step) async {
    var actual = await metadata(step);

    // Write the output
    var outputAsset = new Asset(
        _outputId(step.input.id),
        libraryMetadataEqual(actual, expected) ? pass : fail
    );

    step.writeAsString(outputAsset);
  }

  @override
  List<AssetId> declareOutputs(AssetId inputId) => [_outputId(inputId)];

  /// Creates the output identifier.
  static AssetId _outputId(AssetId inputId) => inputId.addExtension('.test');
}
