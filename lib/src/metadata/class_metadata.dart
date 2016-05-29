// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_analyzer/metadata.dart';

import 'field_metadata.dart';
import 'metadata.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Checks if the class [a] and [b] are equal.
bool classMetadataEqual(ClassMetadata a, ClassMetadata b) =>
    metadataEqual(a, b) &&
    classFieldsEqual(a, b);

/// Checks if the classes in [a] and [b] are equal.
bool classesEqual(Iterable<ClassMetadata> a, Iterable<ClassMetadata> b) =>
    metadataValuesEqual/*<ClassMetadata>*/(a, b, classMetadataEqual);

/// Checks if the fields contained in the classes [a] and [b] are equal.
bool classFieldsEqual(ClassMetadata a, ClassMetadata b) =>
    metadataValuesEqual/*<FieldMetadata>*/(
        a.fields,
        b.fields,
        fieldMetadataEqual
    );
