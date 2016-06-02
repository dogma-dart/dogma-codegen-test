// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_analyzer/metadata.dart';

import 'abstract_metadata.dart';
import 'constant_metadata.dart';
import 'metadata.dart';
import 'privacy_metadata.dart';
import 'static_metadata.dart';
import 'typed_metadata.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Checks if the fields [a] and [b] are equal.
bool fieldMetadataEqual(FieldMetadata a, FieldMetadata b) =>
    metadataEqual(a, b) &&
    typedMetadataEqual(a, b) &&
    abstractMetadataEqual(a, b) &&
    privacyMetadataEqual(a, b) &&
    staticMetadataEqual(a, b) &&
    constantMetadataEqual(a, b) &&
    a.isProperty == b.isProperty &&
    a.getter == b.getter &&
    a.setter == b.setter &&
    a.isFinal == b.isFinal &&
    a.defaultValue == b.defaultValue;

/// Checks if the fields in [a] and [b] are equal.
bool fieldsEqual(Iterable<FieldMetadata> a, Iterable<FieldMetadata> b) =>
    metadataValuesEqual/*<FieldMetadata>*/(a, b, fieldMetadataEqual);
