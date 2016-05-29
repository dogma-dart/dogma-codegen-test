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

/// Checks whether the metadata in [a] and [b] is equal.
bool abstractMetadataEqual(AbstractMetadata a, AbstractMetadata b) =>
    a.isAbstract == b.isAbstract;
