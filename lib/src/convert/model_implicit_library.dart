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
LibraryMetadata modelImplicitLibrary() =>
    new LibraryMetadata(
        join('test/lib/src/convert/model_implicit_convert.dart'),
        imports: [dogmaConvertReference()],
        classes: [
          modelImplicitDecoderMetadata(),
          modelImplicitEncoderMetadata(),
          modelImplicitCodecMetadata()
        ]
    );

/// Metadata for the ModelImplicitDecoder class.
ClassMetadata modelImplicitDecoderMetadata() =>
    modelDecoderMetadata(
        'ModelImplicitDecoder',
        model.modelImplicitName
    );

/// Metadata for the ModelImplicitEncoder class.
ClassMetadata modelImplicitEncoderMetadata() =>
    modelEncoderMetadata(
        'ModelImplicitEncoder',
        model.modelImplicitName
    );

/// Metadata for the ModelImplicitCodec class.
ClassMetadata modelImplicitCodecMetadata() =>
    modelCodecMetadata(
        'ModelImplicitCodec',
        model.modelImplicitName
    );
