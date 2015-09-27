// Copyright (c) 2015, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

/// Tests running test code in isolates.
library dogma_codegen_test.test.isolate_test;

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_codegen_test/isolate_test.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

final Uri _testPass = Uri.parse('isolates/test_pass.dart');
final Uri _testPassAsync = Uri.parse('isolates/test_pass_async.dart');
final Uri _testFail = Uri.parse('isolates/test_fail.dart');
final Uri _testFailAsync = Uri.parse('isolates/test_fail_async.dart');

/// Test entry point.
void main() {
  testInIsolate('Pass', _testPass);
  testInIsolate('Pass async', _testPassAsync);
  testInIsolate('Fail', _testFail, matcher: false);
  testInIsolate('Fail async', _testFailAsync, matcher: false);
}
