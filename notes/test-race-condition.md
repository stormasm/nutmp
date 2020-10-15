
A commit made on August 8, 2020 started causing many of my tests
to start failing...

[Allow disabling welcome message on launch (#2314)](Allow disabling welcome message on launch (#2314)) is where the bug / race condition started
showing up for me...

It took me a long while to chase down why my tests were failing
but finally I believe this is the problem...

```rust
println!("Welcome to Nushell {} (type 'help' for more info)",
          clap::crate_version!());
```

When this code was removed, it introduced just enough of a time
savings that the problem starts appearing.

When I reintroduced this line of code back in, all of my tests
started passing...
