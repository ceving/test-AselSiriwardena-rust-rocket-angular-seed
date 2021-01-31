# Basic performance test of a basic Rust REST api

This repository has been created by following the steps in the
following howto:

https://medium.com/better-programming/rest-api-in-rust-step-by-step-guide-b8a6c5fcbff0

The guide belongs to the following repository:

https://github.com/AselSiriwardena/rust-rocket-angular-seed

I have added the `torture.sh` script for a very basic performance
test.  The two test cases are:

  - `test-http-users`: use `curl` to query the API implemented in Rust.
  - `test-psql-users`: use `psql` to query the database directly.

The results on a Raspberry Pi 4 are:

    $ ./torture.sh ./test-http-users
    1000 loops: 15.6583 seconds
    $ ./torture.sh ./test-psql-users
    1000 loops: 55.3919 seconds

Using the REST API is more than three times faster than using the
native client.
