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
const String modelExplicitName = 'ModelExplicit';

/// Gets a library containing the ModelExplicit class.
LibraryMetadata modelExplicitLibrary() =>
    new LibraryMetadata(
        join('test/lib/src/models/model_explicit.dart'),
        imports: [dogmaSerializeReference()],
        classes: [modelExplicitMetadata()]);

/// Metadata for the ModelImplicit class.
ClassMetadata modelExplicitMetadata() {
  var fields = <FieldMetadata>[
    new FieldMetadata.field(
        'n',
        new TypeMetadata.num(),
        annotations: [new Serialize.field('num')]
    ),
    new FieldMetadata.field(
        'i',
        new TypeMetadata.int(),
        annotations: [new Serialize.field('int')]
    ),
    new FieldMetadata.field(
        'd',
        new TypeMetadata.double(),
        annotations: [new Serialize.field('double')]
    ),
    new FieldMetadata.field(
        'b',
        new TypeMetadata.bool(),
        annotations: [new Serialize.field('bool')]
    ),
    new FieldMetadata.field(
        's',
        new TypeMetadata.string(),
        annotations: [new Serialize.field('string')]
    ),
    new FieldMetadata.field(
        'l',
        new TypeMetadata.list(new TypeMetadata.num()),
        annotations: [new Serialize.field('numList')]
    ),
    new FieldMetadata.field(
        'm',
        new TypeMetadata.map(new TypeMetadata.string(), new TypeMetadata.num()),
        annotations: [new Serialize.field('stringNumMap')]
    )
  ];

  // Create default constructor
  var constructors = <ConstructorMetadata>[
    new ConstructorMetadata(new TypeMetadata(modelExplicitName))
  ];

  return new ClassMetadata(
      modelExplicitName,
      constructors: constructors,
      fields: fields
  );
}
