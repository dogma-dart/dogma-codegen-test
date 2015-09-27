// Copyright (c) 2015, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

/// Allows a test to wait.
library dogma_codegen_test.isolates.wait;

//---------------------------------------------------------------------
// Standard libraries
//---------------------------------------------------------------------

import 'dart:async';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Waits until [milliseconds] have passed.
Future<Null> wait([int milliseconds = 2000]) {
  var completer = new Completer();
  var timer = new Timer(new Duration(milliseconds: milliseconds), () {
    completer.complete();
  });

  return completer.future;
}
