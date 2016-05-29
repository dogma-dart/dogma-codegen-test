// Copyright (c) 2015-2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_analyzer/metadata.dart';

import 'class_metadata.dart';
import 'field_metadata.dart';
import 'metadata.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Checks if the two libraries, [a] and [b], are equal.
bool libraryMetadataEqual(LibraryMetadata a, LibraryMetadata b) {
  var isEqual = libraryFieldsEqual(a, b);
  isEqual = isEqual && libraryClassesEqual(a, b);

  return isEqual;
}

/// Checks if the fields contained in the libraries [a] and [b] are equal.
bool libraryFieldsEqual(LibraryMetadata a, LibraryMetadata b) =>
    metadataValuesEqual/*<FieldMetadata>*/(
        a.fields,
        b.fields,
        fieldMetadataEqual
    );

/// Checks if the classes contained in the libraries [a] and [b] are equal.
bool libraryClassesEqual(LibraryMetadata a, LibraryMetadata b) =>
    metadataValuesEqual/*<ClassMetadata>*/(
        a.classes,
        b.classes,
        classMetadataEqual
    );
