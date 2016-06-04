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

/// Reference of the [dartConvert] library.
UriReferencedMetadata dartConvertReference() =>
    new UriReferencedMetadata.withLibrary(dartConvert);

/// Reference of the [dartCollection] library.
UriReferencedMetadata dartCollectionReference() =>
    new UriReferencedMetadata.withLibrary(dartCollection);

/// The dart:convert library.
///
/// This is required for generated converters as they implement Converter.
final LibraryMetadata dartConvert = new LibraryMetadata(
    Uri.parse('dart:convert'),
    name: 'dart:convert'
);

/// The dart:collection library.
///
/// This is required when UnmodifiableListView or UnmodifiableMapView are
/// needed for unmodifiable views over models.
final LibraryMetadata dartCollection = new LibraryMetadata(
    Uri.parse('dart:collection'),
    name: 'dart:collection'
);
