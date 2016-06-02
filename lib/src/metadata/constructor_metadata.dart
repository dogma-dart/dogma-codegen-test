// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_analyzer/metadata.dart';

import 'constant_metadata.dart';
import 'function_metadata.dart';
import 'metadata.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Checks if the constructors [a] and [b] are equal.
bool constructorMetadataEqual(ConstructorMetadata a, ConstructorMetadata b) =>
    functionMetadataEqual(a, b) &&
    constantMetadataEqual(a, b) &&
    a.isFactory == b.isFactory;

/// Checks if the constructors in [a] and [b] are equal.
bool constructorsEqual(Iterable<ConstructorMetadata> a,
                       Iterable<ConstructorMetadata> b) =>
    metadataValuesEqual/*<ConstructorMetadata>*/(
        a,
        b,
        constructorMetadataEqual
    );
