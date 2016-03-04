// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_analyzer/metadata.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// The dogma_convert.serialize library.
///
/// This is required when generating code that uses the Serialize annotation.
final LibraryMetadata dogmaSerialize = new LibraryMetadata(
    Uri.parse('package:dogma_convert/serialize.dart'),
    name: 'dogma_convert.serialize'
);

/// The dogma_convert.convert library.
///
/// This is required for generated Converters.
final LibraryMetadata dogmaConvert = new LibraryMetadata(
    Uri.parse('package:dogma_convert/convert.dart'),
    name: 'dogma_convert.convert'
);
