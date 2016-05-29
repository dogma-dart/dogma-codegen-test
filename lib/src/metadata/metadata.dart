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

/// A function comparing two instances of metadata, [a] and [b] for equality.
typedef bool MetadataEqual<T extends Metadata>(T a, T b);

/// Checks if the metadata [a] and [b] are equal.
bool metadataEqual(Metadata a, Metadata b) => a.name == b.name;

/// Checks equality of all values in [a] and [b] using the [equal] function
/// for comparison.
bool metadataValuesEqual/*<T extends Metadata>*/(Iterable<Metadata /*=T*/> a,
                                                 Iterable<Metadata /*=T*/> b,
                                                 MetadataEqual/*<T>*/ equal) {
  var isEqual = true;

  if (a.length != b.length) {
    print('The number of fields is not equal between metadata');

    isEqual = false;
  }

  for (var aMetadata in a) {
    var name = aMetadata.name;

    var bMetadata = b.firstWhere(
        (metadata) => metadata.name == name,
        orElse: () => null
    );

    if (bMetadata != null) {
      var isFieldEqual = equal(aMetadata, bMetadata);

      if (!isFieldEqual) {
        print('$name is not equal between the metadata');
        isEqual = false;
      }
    } else {
      print('$name is not equal between the metadata');
      isEqual = false;
    }
  }

  return isEqual;
}
