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
import 'function_metadata.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Checks if the two libraries, [a] and [b], are equal.
bool libraryMetadataEqual(LibraryMetadata a, LibraryMetadata b) =>
    classesEqual(a.classes, b.classes) &&
    fieldsEqual(a.fields, b.fields) &&
    functionsEqual(a.functions, b.functions);
