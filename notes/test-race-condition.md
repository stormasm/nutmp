
A commit made on August 8, 2020 started causing many of my tests
to start failing...

[Allow disabling welcome message on launch (#2314)](https://github.com/nushell/nushell/commit/f14c0df582399f5baffdd93c92b365f4f3b87a9a)
is where the bug / race condition started showing up for me...

It took me a long while to chase down why my tests were failing
but finally I believe this is the problem...

```rust
println!(
    "Welcome to Nushell {} (type 'help' for more info)",
    clap::crate_version!()
);
```

When this code was removed, it introduced just enough of a time
savings that the problem starts appearing.

When I reintroduced this line of code back in, all of my tests
started passing again...

It appears that the race condition is possibly associated with creating the
default context ?

Here is the
[modified main.rs](https://github.com/stormasm/nushelltmp/blob/master/v21.0/tmp00/main.rs)
code which makes all of my tests pass again.

### References

[surrounding commits during that August 8, 2020 time period](https://github.com/nushell/nushell/commits/main?before=a2cc2259e71ace3b2d808cb395da1b8fe4336020+245&branch=main)
