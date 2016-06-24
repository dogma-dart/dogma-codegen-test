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
import 'model_base_library.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// The name of the class.
const String modelImplementBaseName = 'ModelImplementBase';

/// Gets a library containing the ModelImplementBase class.
LibraryMetadata modelImplementBaseLibrary() =>
    new LibraryMetadata(
        join('test/lib/src/model/model_implement_base.dart'),
        imports: [modelBaseReference(), dogmaSerializeReference()],
        classes: [modelImplementBaseMetadata()]);

/// Metadata for the ModelImplementBase class.
ClassMetadata modelImplementBaseMetadata() {
  // Create fields
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
        's',
        new TypeMetadata.string(),
        annotations: [new Serialize.field('string')]
    )
  ];

  // Create default constructor
  var constructors = <ConstructorMetadata>[
    new ConstructorMetadata(new TypeMetadata(modelImplementBaseName))
  ];

  return new ClassMetadata(
      modelImplementBaseName,
      constructors: constructors,
      interfaces: [modelBaseMetadata().type],
      fields: fields
  );
}
