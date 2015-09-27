#!/bin/sh
set -ex

# Get version
dart --version

# Install dependencies
pub install

# Run the linter
pub global activate linter
pub global run linter .

# Run the tests
dart --checked test/isolate_test.dart