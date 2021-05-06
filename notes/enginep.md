
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

* append.rs
* date/format.rs
* date/to_timezone.rs
* debug.rs
* default.rs
* describe.rs
* do_.rs
* drop/column.rs
* drop/command.rs
* enter.rs
* first.rs
* format/command.rs
* format/format_filesize.rs
* get.rs
* group_by_date.rs
* hash_/base64_.rs
* hash_/md5_.rs
* help.rs
* history.rs
* insert.rs
* into/binary.rs
* into/int.rs
* kill.rs
* last.rs
* merge.rs
* open.rs
* pivot.rs
* prepend.rs
* random/bool.rs
* random/chars.rs
* random/decimal.rs
* random/dice.rs
* random/integer.rs
* reject.rs
* seq.rs
* skip/command.rs
* sleep.rs
* source.rs
* split_by.rs
* touch.rs
* update.rs
* url_/mod.rs
* where_.rs
* wrap.rs
