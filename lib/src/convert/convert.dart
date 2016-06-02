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

/// Creates model decoder metadata with the given [name] which decodes the
/// [model].
///
/// The [fields] can be specified. If given then the parameters for the
/// constructor will be generated.
ClassMetadata modelDecoderMetadata(String name,
                                   String model,
                                  {List<FieldMetadata> fields}) {
  // Default to no fields
  fields ??= <FieldMetadata>[];

  // Create the model type
  var modelType = new TypeMetadata(model);

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
      name,
      supertype: supertype,
      interfaces: interfaces,
      fields: fields,
      constructors: [_converterConstructor(name, fields)],
      methods: methods
  );
}

/// Creates model encoder metadata with the given [name] which decodes the
/// [model].
///
/// The [fields] can be specified. If given then the parameters for the
/// constructor will be generated.
ClassMetadata modelEncoderMetadata(String name,
                                   String model,
                                  {List<FieldMetadata> fields}) {
  // Default to no fields
  fields ??= <FieldMetadata>[];

  // Create the model type
  var modelType = new TypeMetadata(model);

  // Create the supertype
  var supertype = new TypeMetadata(
      'Converter',
      arguments: <TypeMetadata>[modelType, new TypeMetadata.map()]
  );

  // Create the interfaces
  var interfaces = <TypeMetadata>[
    new TypeMetadata(
        'ModelEncoder',
        arguments: <TypeMetadata>[modelType]
    )
  ];

  // Create the methods
  var methods = <MethodMetadata>[
    new MethodMetadata(
        'convert',
        new TypeMetadata.map(),
        parameters: <ParameterMetadata>[
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
      name,
      supertype: supertype,
      interfaces: interfaces,
      fields: fields,
      constructors: [_converterConstructor(name, fields)],
      methods: methods
  );
}

/// Creates model codec metadata with the given [name] which decodes the
/// [model].
ClassMetadata modelCodecMetadata(String name, String model) {
  // Create the model type
  var modelType = new TypeMetadata(model);

  // Create the supertype
  var supertype = new TypeMetadata(
      'ModelCodec',
      arguments: <TypeMetadata>[modelType]
  );

  var constructors = <ConstructorMetadata>[
    new ConstructorMetadata(
        new TypeMetadata(name),
        parameters: [
          new ParameterMetadata(
              'decoder',
              new TypeMetadata('ModelDecoder', arguments: [modelType]),
              parameterKind: ParameterKind.named
          ),
          new ParameterMetadata(
              'encoder',
              new TypeMetadata('ModelEncoder', arguments: [modelType]),
              parameterKind: ParameterKind.named
          )
        ],
        isConst: true
    )
  ];

  return new ClassMetadata(
      name,
      supertype: supertype,
      constructors: constructors
  );
}

/// Creates the default constructor for a converter with the given [name] and
/// the set of final [fields].
ConstructorMetadata _converterConstructor(String name,
                                          List<FieldMetadata> fields) {
  var parameters = <ParameterMetadata>[];

  for (var field in fields) {
    parameters.add(
        new ParameterMetadata(
            field.name,
            field.type,
            parameterKind: ParameterKind.named
        )
    );
  }

  return new ConstructorMetadata(
      new TypeMetadata(name),
      parameters: parameters,
      isConst: true
  );
}
