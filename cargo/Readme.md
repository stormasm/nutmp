These are the 3 critical default dependencies in Cargo.toml that must be set.

```rust
default = [
    "directories-support",
    "ctrlc-support",
    "rustyline-support",
]
```

[directories-support](https://crates.io/crates/directories-next) is needed so that it can find the default directory on Linux, Mac, and Windows

Without *directories-support* it is not able to find your config.toml here:

```
/Users/ma/Library/Application Support/org.nushell.nu/config.toml
```

using this command
```
config path
```
