// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_analyzer/metadata.dart';
import 'package:dogma_source_analyzer/path.dart';

import 'enum_implicit_library.dart';
import 'model_implicit_library.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// The name of the class.
const String modelCompoundName = 'ModelCompound';

/// Gets a library containing the ModelCompound class.
LibraryMetadata modelCompoundLibrary() =>
    new LibraryMetadata(
        join('test/lib/src/model/model_compound.dart'),
        imports: [
          new UriReferencedMetadata.withLibrary(enumImplicitLibrary()),
          new UriReferencedMetadata.withLibrary(modelImplicitLibrary())
        ],
        classes: [modelCompoundMetadata()]);

/// Metadata for the ModelCompound class.
ClassMetadata modelCompoundMetadata() {
  // Create fields
  var fields = <FieldMetadata>[
    new FieldMetadata.field('m', new TypeMetadata(modelImplicitName)),
    new FieldMetadata.field('e', new TypeMetadata(enumImplicitName))
  ];

  // Create default constructor
  var constructors = <ConstructorMetadata>[
    new ConstructorMetadata(new TypeMetadata(modelCompoundName))
  ];

  return new ClassMetadata(
      modelCompoundName,
      constructors: constructors,
      fields: fields
  );
}
