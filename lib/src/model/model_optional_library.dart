// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_convert/serialize.dart';
import 'package:dogma_source_analyzer/metadata.dart';
import 'package:dogma_source_analyzer/path.dart';

import '../../library.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// The name of the class.
const String modelOptionalName = 'ModelOptional';

/// Gets a library containing the ModelOptional class.
///
/// This tests models where values are optionally serialized.
LibraryMetadata modelOptionalLibrary() =>
    new LibraryMetadata(
        join('test/lib/src/model/model_optional.dart'),
        imports: [dogmaSerializeReference()],
        classes: [modelOptionalMetadata()]);

/// Metadata for the ModelOptional class.
ClassMetadata modelOptionalMetadata() {
  // Create fields
  var fields = <FieldMetadata>[
    new FieldMetadata.field(
        'n',
        new TypeMetadata.num(),
        annotations: [
          new Serialize.field('n', optional: true, defaultsTo: 1.0)
        ]
    ),
    new FieldMetadata.field(
        'i',
        new TypeMetadata.int(),
        annotations: [
          new Serialize.field('i', optional: true, defaultsTo: 2)
        ]
    ),
    new FieldMetadata.field(
        'd',
        new TypeMetadata.double(),
        annotations: [
          new Serialize.field('d', optional: true, defaultsTo: 3.0)
        ]
    ),
    new FieldMetadata.field(
        'b',
        new TypeMetadata.bool(),
        annotations: [
          new Serialize.field('b', optional: true, defaultsTo: true)
        ]
    ),
    new FieldMetadata.field(
        's',
        new TypeMetadata.string(),
        annotations: [
          new Serialize.field('s', optional: true, defaultsTo: 'foo')
        ]
    ),
    new FieldMetadata.field(
        'l',
        new TypeMetadata.list(new TypeMetadata.num()),
        annotations: [
          new Serialize.field('l', optional: true, defaultsTo: [1, 2, 3, 4])
        ]
    ),
    new FieldMetadata.field(
        'm',
        new TypeMetadata.map(new TypeMetadata.string(), new TypeMetadata.num()),
        annotations: [
          new Serialize.field('m', optional: true, defaultsTo: {'a': 'a', 'b': 'b'})
        ]
    )
  ];

  // Create default constructor
  var constructors = <ConstructorMetadata>[
    new ConstructorMetadata(new TypeMetadata(modelOptionalName))
  ];

  return new ClassMetadata(
      modelOptionalName,
      constructors: constructors,
      fields: fields
  );
}
