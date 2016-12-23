Elixir / OTP Pattern Match Bug?
===============================

This repo demonstrates a possible bug in either Elixir or OTP. When running this
set of tests on Travis CI, the tests succeed on OTP 18 (Elixir 1.2 or 1.3) but
fail on OTP 19.0.x (again, any 1.2 or 1.3 version).

**Update**: Further testing suggests this was a bug in the 19.0.x series that was subsequently fixed in OTP 19.1.

The latest build that demonstrates this is at https://travis-ci.org/scouten/otp-pattern-match/builds/186424731.

A bug has been filed against Elixir language at https://github.com/elixir-lang/elixir/issues/5586.

Simplified from https://github.com/mmmries/sqlitex.

