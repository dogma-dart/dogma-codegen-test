# Dogma Codegen Test

> Code generation testing for the Dogma libraries

[![Join the chat at https://gitter.im/dogma-dart/dogma-dart.github.io](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/dogma-dart/dogma-dart.github.io?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Build Status](http://beta.drone.io/api/badges/dogma-dart/dogma-codegen-test/status.svg)](http://beta.drone.io/dogma-dart/dogma-codegen-test)
[![Coverage Status](https://coveralls.io/repos/dogma-dart/dogma-codegen-test/badge.svg?branch=master&service=github)](https://coveralls.io/github/dogma-dart/dogma-codegen-test?branch=master)

## Usage

Dogma Codegen Test provides helpers for running tests on the code generation pipeline. This is only meant for libraries that build upon Dogma Codegen facilities, not for libraries that are consuming those libraries.

To verify the code generation pipeline a test is written that invokes the pipeline and writes source code to disk. After the source code is written then the test executes a dart file written using the `test` library which targets the generated code. This code is executed through an isolate. If the isolate completes without receiving an error then the generated code was built successfully. If not then there is an issue with the pipeline. Not only does this allow the test suite verify the pipeline it also allows code coverage to be determined.

```dart
import 'package:dogma_codegen_test/isolate_test.dart';
import 'package:test/test.dart';

void main() {
  group('codegeneration', () {
    // Run the code generation pipeline to generate the source code
    ...
    
    // Run the tests on the generated code to verify behavior
    testInIsolate('verify', 'test/src/generated/verify_test.dart');
  });
}
```

## Excluding Generated Tests

When using `pub run test` by default it will attempt to run all files that end in `_test.dart`. To avoid the generated tests being run when invoking that command they should be excluded within the pubspec.

```yaml
transformers:
- test/pub_serve:
    $exclude: test/src/generated/**_test{.*,}.dart
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/dogma-dart/dogma-codegen-test/issues
