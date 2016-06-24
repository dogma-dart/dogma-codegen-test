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
const String modelBaseName = 'ModelBase';

/// Gets a library containing the ModelBase class.
LibraryMetadata modelBaseLibrary() =>
    new LibraryMetadata(
        join('test/lib/src/model/model_base.dart'),
        classes: [modelBaseMetadata()]);

/// Gets a reference to a library containing the ModelBaseClass.
UriReferencedMetadata modelBaseReference() =>
    new UriReferencedMetadata.withLibrary(modelBaseLibrary());

/// Metadata for the ModelBase class.
ClassMetadata modelBaseMetadata() {
  // Create fields
  var fields = <FieldMetadata>[
    new FieldMetadata.field('n', new TypeMetadata.num()),
    new FieldMetadata.field('i', new TypeMetadata.int()),
  ];

  // Create default constructor
  var constructors = <ConstructorMetadata>[
    new ConstructorMetadata(new TypeMetadata(modelBaseName))
  ];

  return new ClassMetadata(
      modelBaseName,
      constructors: constructors,
      fields: fields
  );
}
