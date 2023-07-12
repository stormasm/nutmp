# nu-cmd-extra

## the extra commands are not part of the Nushell binary

The commands in this crate are the *extra commands* of Nushell.  They do not
get built for the release and it is the responsibility of the developer to
build these commands if they want to use them.

These commands are not going to part of the 1.0 API; meaning that there
is no guarantee longer term that these commands will be around into the future.
Of course since they are part of the source tree now the developer could always
incorporate them into their own custom release.

### How to build the commands in this crate

You must first make sure that you have Rust installed on your system.  For
more details you can [go here to install Rust](https://rustup.rs/).

Once Rust is installed you can then build Nushell with the following command.

```rust
cargo build --features=extra
```

Your Nushell binary which just got built is called *nu* and will be located here.

```
nushell/target/debug/nu
```
