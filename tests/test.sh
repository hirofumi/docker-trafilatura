#!/bin/sh

set -e

cd "$(dirname "$0")"

set -x

want='The quick brown fox jumps over the lazy dog.'
got=$(trafilatura < test.html)
test "$got" = "$want"
