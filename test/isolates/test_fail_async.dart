// Copyright (c) 2015, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

/// A test that fails when run as an isolate.
library dogma_codegen_test.test.isolates.test_fail_async;

//---------------------------------------------------------------------
// Standard libraries
//---------------------------------------------------------------------

import 'dart:async';

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:test/test.dart';
import 'wait.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

Future<bool> _result() async {
  await wait();
  return false;
}

/// Test entry point.
void main() {
  test('Fail', () async {
    var result = await _result();

    expect(result, true);
  });
}
