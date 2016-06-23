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

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// The name of the enumeration.
const String enumExplicitName = 'EnumExplicit';

/// Gets a library containing the EnumExplicit class.
LibraryMetadata enumExplicitLibrary() =>
    new LibraryMetadata(
        join('test/lib/src/model/enum_explicit.dart'),
        classes: [enumExplicitMetadata()]);

/// Metadata for the EnumImplicit class.
ClassMetadata enumExplicitMetadata() {
  var type = new TypeMetadata(enumExplicitName);
  var fields = <FieldMetadata>[
    new FieldMetadata.field('red', type, isStatic: true, isConst: true, defaultValue: 0),
    new FieldMetadata.field('green', type, isStatic: true, isConst: true, defaultValue: 1),
    new FieldMetadata.field('blue', type, isStatic: true, isConst: true, defaultValue: 2)
  ];

  var annotation = new Serialize.values({
    0xff0000: 0,
    0x00ff00: 1,
    0x0000ff: 2
  });

  return new EnumMetadata(
      enumExplicitName,
      fields,
      annotations: [annotation]
  );
}
