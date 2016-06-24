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
const String modelExtendBaseName = 'ModelExtendBase';

/// Gets a library containing the ModelExtendBase class.
LibraryMetadata modelExtendBaseLibrary() =>
    new LibraryMetadata(
        join('test/lib/src/model/model_extend_base.dart'),
        imports: [modelBaseReference()],
        classes: [modelExtendBaseMetadata()]);

/// Metadata for the ModelExtendBase class.
ClassMetadata modelExtendBaseMetadata() {
  // Create fields
  var fields = <FieldMetadata>[
    new FieldMetadata.field('s', new TypeMetadata.string())
  ];

  // Create default constructor
  var constructors = <ConstructorMetadata>[
    new ConstructorMetadata(new TypeMetadata(modelExtendBaseName))
  ];

  return new ClassMetadata(
      modelExtendBaseName,
      constructors: constructors,
      supertype: modelBaseMetadata().type,
      fields: fields
  );
}
