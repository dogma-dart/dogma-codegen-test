#!/bin/sh
set -ex

# Clone dogma libraries
git clone https://github.com/dogma-dart/dogma-convert.git ../dogma-convert
git clone https://github.com/dogma-dart/dogma-source-analyzer.git ../dogma-source-analyzer
git clone https://github.com/dogma-dart/dogma-union-type.git ../dogma-union-type

# Get version
dart --version

# Get dependencies
pub install

# Verify that the libraries are error and warning-free.
dartanalyzer ${DARTANALYZER_FLAGS} $(ls -rt lib/*.dart)

# Clone coverage till repo is fixed
git clone -b migration https://github.com/dart-lang/coverage.git ../coverage

# Run the tests
pub global activate --source path ../coverage
OBSERVATORY_PORT=8000
COVERAGE_OUTPUT=lcov.info

pub global run coverage:coverage collect \
    --port=${OBSERVATORY_PORT} \
    --output=${COVERAGE_OUTPUT} \
    --pause-timeout=120 \
    --wait-paused \
    --resume-isolates & \

dart --checked --observe=${OBSERVATORY_PORT} test/all.dart

wait $!

ls
