// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_analyzer/metadata.dart';

import 'abstract_metadata.dart';
import 'function_metadata.dart';
import 'metadata.dart';
import 'static_metadata.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Checks if the methods [a] and [b] are equal.
bool methodMetadataEqual(MethodMetadata a, MethodMetadata b) =>
    functionMetadataEqual(a, b) &&
    abstractMetadataEqual(a, b) &&
    staticMetadataEqual(a, b);

/// Checks if the methods in [a] and [b] are equal.
bool methodsEqual(Iterable<MethodMetadata> a,
                  Iterable<MethodMetadata> b) =>
    metadataValuesEqual/*<MethodMetadata>*/(a, b, methodMetadataEqual);
