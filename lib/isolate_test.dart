// Copyright (c) 2015, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

/// Contains helpers for running test code in isolates
library dogma_codegen_test.isolate_test;

//---------------------------------------------------------------------
// Standard libraries
//---------------------------------------------------------------------

import 'dart:async';
import 'dart:isolate';

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:test/test.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// The default matcher for a test.
const bool _matcher = true;
/// The default for checked mode.
const bool _checked = true;

/// Runs a test with the [description] within an isolate whose source is at
/// the given [path].
///
/// The isolate either ran successfully or failed. By default it is assumed
/// that the isolate should exit without error. If this isn't the desired
/// behavior then [matcher] should be set to false.
///
/// Additionally [checked] mode can be specified when running the test within
/// the isolate.
void testInIsolate(String description,
                   Uri path,
                  {bool matcher: _matcher,
                   bool checked: _checked})
{
  test(description, () async {
    var actual = await runInIsolate(path, checked);
    expect(actual, matcher);
  });
}

/// Runs a test at the [path] within an isolate and returns whether it
/// completed successfully.
///
/// Additionally [checked] mode can be specified when running the test within
/// the isolate.
Future<bool> runInIsolate(Uri path, bool checked) async {
  // Create receive ports for isolate communications
  var completed = new ReceivePort();
  var errors = new ReceivePort();

  // Create the isolate
  var isolate = await Isolate.spawnUri(
      path,
      [],
      null,
      checked: checked,
      errorsAreFatal: true,
      onExit: completed.sendPort,
      onError: errors.sendPort
  );

  // If errors is never called then the isolate exited without errors
  var success = true;

  errors.first.then((_) {
    success = false;
  });

  // Wait for the isolate to complete
  await completed.first;

  // Make sure the isolate shuts down
  isolate.kill(priority: Isolate.IMMEDIATE);

  return success;
}
