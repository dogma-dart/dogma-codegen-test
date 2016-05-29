// Copyright (c) 2015-2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_analyzer/metadata.dart';
import 'package:test/test.dart';

import 'package:dogma_codegen_test/metadata.dart';
import 'package:dogma_codegen_test/model.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

void main() {
  test('Equality', () {
    var libraries = <LibraryMetadata>[
      modelImplicitLibrary(),
      modelExplicitLibrary()
    ];

    var libraryCount = libraries.length;

    for (var j = 0; j < libraryCount; ++j) {
      var a = libraries[j];

      for (var i = 0; i < libraryCount; ++i) {
        var b = libraries[i];

        expect(libraryMetadataEqual(a, b), equals(i == j));
      }
    }
  });
}
