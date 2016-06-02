// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_analyzer/metadata.dart';

import 'metadata.dart';
import 'parameter_metadata.dart';
import 'privacy_metadata.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Checks if the functions [a] and [b] are equal.
bool functionMetadataEqual(FunctionMetadata a, FunctionMetadata b) =>
    metadataEqual(a, b) &&
    privacyMetadataEqual(a, b) &&
    a.returnType == b.returnType &&
    parametersEqual(a.parameters, b.parameters);

/// Checks if the functions in [a] and [b] are equal.
bool functionsEqual(Iterable<FunctionMetadata> a,
                    Iterable<FunctionMetadata> b) =>
    metadataValuesEqual/*<FunctionMetadata>*/(a, b, functionMetadataEqual);
