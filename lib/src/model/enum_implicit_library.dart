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

/// The name of the enumeration.
const String enumImplicitName = 'EnumImplicit';

/// Gets a library containing the EnumExplicit class.
LibraryMetadata enumImplicitLibrary() =>
    new LibraryMetadata(
        join('test/lib/src/model/enum_implicit.dart'),
        classes: [enumImplicitMetadata()]);

/// Metadata for the EnumImplicit class.
ClassMetadata enumImplicitMetadata() {
  var type = new TypeMetadata(enumImplicitName);
  var fields = <FieldMetadata>[
    new FieldMetadata.field('red', type, isStatic: true, isConst: true),
    new FieldMetadata.field('green', type, isStatic: true, isConst: true),
    new FieldMetadata.field('blue', type, isStatic: true, isConst: true)
  ];

  return new EnumMetadata(
      enumImplicitName,
      fields
  );
}
