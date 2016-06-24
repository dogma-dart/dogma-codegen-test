// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_analyzer/metadata.dart';
import 'package:dogma_source_analyzer/path.dart';

import 'model_base_library.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// The name of the class.
const String modelMixinName = 'ModelMixin';

/// Gets a library containing the ModelMixin class.
LibraryMetadata modelMixinLibrary() =>
    new LibraryMetadata(
        join('test/lib/src/model/model_mixin.dart'),
        imports: [modelBaseReference()],
        classes: [
          modelMixinMetadata(),
          _modelMixin('a'),
          _modelMixin('b'),
          _modelMixin('c')
        ]);

/// Metadata for the ModelMixin class.
ClassMetadata modelMixinMetadata() {
  // Create fields
  var fields = <FieldMetadata>[
    new FieldMetadata.field('s', new TypeMetadata.string())
  ];

  // Create default constructor
  var constructors = <ConstructorMetadata>[
    new ConstructorMetadata(new TypeMetadata(modelMixinName))
  ];

  return new ClassMetadata(
      modelMixinName,
      constructors: constructors,
      supertype: modelBaseMetadata().type,
      mixins: [
        _modelMixin('a').type,
        _modelMixin('b').type,
        _modelMixin('c').type
      ],
      fields: fields
  );
}

/// Creates a mixin with the given [id].
ClassMetadata _modelMixin(String id) {
  var name = 'Model${id.toUpperCase()}';

  // Create fields
  var fields = <FieldMetadata>[
    new FieldMetadata.field(id, new TypeMetadata.string())
  ];

  // Create default constructor
  var constructors = <ConstructorMetadata>[
    new ConstructorMetadata(new TypeMetadata(name))
  ];

  return new ClassMetadata(
      name,
      constructors: constructors,
      fields: fields
  );
}
