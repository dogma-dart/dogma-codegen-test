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
        imports: [dogmaConvertReference],
        classes: [
          modelImplicitDecoderMetadata(),
          modelImplicitEncoderMetadata(),
          modelImplicitCodecMetadata()
        ]
    );

/// Metadata for the ModelImplicitDecoder class.
ClassMetadata modelImplicitDecoderMetadata() {
  var modelType = new TypeMetadata(model.modelImplicitName);

  // Create the supertype
  var supertype = new TypeMetadata(
      'Converter',
      arguments: <TypeMetadata>[new TypeMetadata.map(), modelType]
  );

  // Create the interfaces
  var interfaces = <TypeMetadata>[
     new TypeMetadata(
         'ModelDecoder',
         arguments: <TypeMetadata>[modelType]
     )
  ];

  // Create default constructor
  var constructors = <ConstructorMetadata>[
    new ConstructorMetadata(
        new TypeMetadata('ModelImplicitDecoder'),
        isConst: true
    )
  ];

  // Create the methods
  var methods = <MethodMetadata>[
    new MethodMetadata(
        'create',
        modelType,
        annotations: [override]
    ),
    new MethodMetadata(
        'convert',
        modelType,
        parameters: <ParameterMetadata>[
          new ParameterMetadata('input', new TypeMetadata.map()),
          new ParameterMetadata(
              'model',
              modelType,
              parameterKind: ParameterKind.positional
          )
        ],
        annotations: [override]
    )
  ];

  return new ClassMetadata(
      'ModelImplicitDecoder',
      supertype: supertype,
      interfaces: interfaces,
      constructors: constructors,
      methods: methods
  );
}

/// Metadata for the ModelImplicitEncoder class.
ClassMetadata modelImplicitEncoderMetadata() {

}

/// Metadata for the ModelImplicitCodec class.
ClassMetadata modelImplicitCodecMetadata() {

}
