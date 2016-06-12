// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_analyzer/metadata.dart';
import 'package:dogma_source_analyzer/path.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// The name of the class.
const String modelRecursiveName = 'ModelRecursive';

/// Gets a library containing the ModelRecursive class.
///
/// This tests models that contain instances of themselves. This behavior is
/// found in tree structures.
LibraryMetadata modelRecursiveLibrary() =>
    new LibraryMetadata(
        join('test/libs/src/models/model_recursive.dart'),
        classes: [modelRecursiveMetadata()]);

/// Metadata for the ModelRecursive class.
ClassMetadata modelRecursiveMetadata() {
  var type = new TypeMetadata(modelRecursiveName);

  // Create fields
  var fields = <FieldMetadata>[
    new FieldMetadata.field('s', new TypeMetadata.string()),
    new FieldMetadata.field('l', type)
  ];

  // Create default constructor
  var constructors = <ConstructorMetadata>[
    new ConstructorMetadata(type)
  ];

  return new ClassMetadata(
      modelRecursiveName,
      constructors: constructors,
      fields: fields
  );
}
