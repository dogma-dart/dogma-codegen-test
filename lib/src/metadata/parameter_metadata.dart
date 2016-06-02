// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_analyzer/metadata.dart';

import 'metadata.dart';
import 'typed_metadata.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Checks if the parameters [a] and [b] are equal.
bool parameterMetadataEqual(ParameterMetadata a, ParameterMetadata b) =>
    metadataEqual(a, b) &&
    typedMetadataEqual(a, b) &&
    a.parameterKind == b.parameterKind &&
    a.defaultValue == b.defaultValue;

/// Checks if the parameters in [a] and [b] are equal.
bool parametersEqual(Iterable<ParameterMetadata> a,
                     Iterable<ParameterMetadata> b) =>
    metadataValuesEqual/*<ParameterMetadata>*/(a, b, parameterMetadataEqual);
