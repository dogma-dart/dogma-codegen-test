// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_analyzer/metadata.dart';

import 'constructor_metadata.dart';
import 'field_metadata.dart';
import 'metadata.dart';
import 'method_metadata.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Checks if the classes [a] and [b] are equal.
bool classMetadataEqual(ClassMetadata a, ClassMetadata b) =>
    metadataEqual(a, b) &&
    fieldsEqual(a.fields, b.fields) &&
    constructorsEqual(a.constructors, b.constructors) &&
    methodsEqual(a.methods, b.methods);

/// Checks if the classes in [a] and [b] are equal.
bool classesEqual(Iterable<ClassMetadata> a, Iterable<ClassMetadata> b) =>
    metadataValuesEqual/*<ClassMetadata>*/(a, b, classMetadataEqual);
