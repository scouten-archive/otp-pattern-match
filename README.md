Elixir / OTP Pattern Match Bug?
===============================

This repo demonstrates a possible bug in either Elixir or OTP. When running this
set of tests on Travis CI, the tests succeed on OTP 18 (Elixir 1.2 or 1.3) but
fail on OTP 19 (again, any 1.2 or 1.3 version).

The latest build that demonstrates this is at https://travis-ci.org/scouten/otp-pattern-match/builds/186417802.

Simplified from https://github.com/mmmries/sqlitex.
