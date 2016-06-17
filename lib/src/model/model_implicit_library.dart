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
const String modelImplicitName = 'ModelImplicit';

/// Gets a library containing the ModelImplicit class.
LibraryMetadata modelImplicitLibrary() =>
    new LibraryMetadata(
        join('test/lib/src/model/model_implicit.dart'),
        classes: [modelImplicitMetadata()]);

/// Metadata for the ModelImplicit class.
ClassMetadata modelImplicitMetadata() {
  // Create fields
  var fields = <FieldMetadata>[
    new FieldMetadata.field('n', new TypeMetadata.num()),
    new FieldMetadata.field('i', new TypeMetadata.int()),
    new FieldMetadata.field('d', new TypeMetadata.double()),
    new FieldMetadata.field('b', new TypeMetadata.bool()),
    new FieldMetadata.field('s', new TypeMetadata.string()),
    new FieldMetadata.field(
        'l',
        new TypeMetadata.list(new TypeMetadata.num())
    ),
    new FieldMetadata.field(
        'm',
        new TypeMetadata.map(new TypeMetadata.string(), new TypeMetadata.num())
    )
  ];

  // Create default constructor
  var constructors = <ConstructorMetadata>[
    new ConstructorMetadata(new TypeMetadata(modelImplicitName))
  ];

  return new ClassMetadata(
      modelImplicitName,
      constructors: constructors,
      fields: fields
  );
}
