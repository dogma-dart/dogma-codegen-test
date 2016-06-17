// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_analyzer/metadata.dart';
import 'package:dogma_source_analyzer/path.dart';

import '../../library.dart';
import '../../model.dart' as model;
import 'convert.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Gets a library containing the ModelExplicit converters.
LibraryMetadata modelExplicitLibrary() =>
    new LibraryMetadata(
        join('test/lib/src/convert/model_explicit_convert.dart'),
        imports: [dogmaConvertReference()],
        classes: [
          modelExplicitDecoderMetadata(),
          modelExplicitEncoderMetadata(),
          modelExplicitCodecMetadata()
        ]
    );

/// Metadata for the ModelExplicitDecoder class.
ClassMetadata modelExplicitDecoderMetadata() =>
    modelDecoderMetadata(
        'ModelExplicitDecoder',
        model.modelExplicitName
    );

/// Metadata for the ModelExplicitEncoder class.
ClassMetadata modelExplicitEncoderMetadata() =>
    modelEncoderMetadata(
        'ModelExplicitEncoder',
        model.modelExplicitName
    );

/// Metadata for the ModelExplicitCodec class.
ClassMetadata modelExplicitCodecMetadata() =>
    modelCodecMetadata(
        'ModelExplicitCodec',
        model.modelExplicitName
    );
