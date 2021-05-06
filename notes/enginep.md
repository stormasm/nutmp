
#### How do you tell quickly what commands have not been ported to engine-p ?

```
cd crates/nu-command/src
rg Deserialize
```

This will show you this line of code
```
#[derive(Deserialize)]
```

and lead you to another way to show a command has not been ported.

```
args.process()?;
```

If you see the above line of code anywhere in a command file its a
candidate for re-factoring to engine-p style coding...

In concert with
[andrasio's](https://github.com/andrasio) document called
[Implementing Nu Command Guide](https://github.com/nushell/nushell/blob/main/docs/implementing_a_command.md)...

Here are the steps needed to port a command over to engine-p.

I will go over one example with a tutorial.

#### List of Commands that have not yet been ported

* default.rs
* do_.rs
* first.rs
* kill.rs
* prepend.rs
* split_by.rs
* touch.rs
