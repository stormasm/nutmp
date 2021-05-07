
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

* ansi/strip.rs
* append.rs
* benchmark.rs
* config/get.rs
* config/remove.rs
* config/set.rs
* config/set_into.rs
* date/format.rs
* date/to_timezone.rs
* debug.rs
* def.rs
* default.rs
* describe.rs
* do_.rs
* drop/column.rs
* drop/command.rs
* du.rs
* each/group.rs
* each/window.rs
* empty.rs
* enter.rs
* every.rs
* exec.rs
* first.rs
* flatten.rs
* format/command.rs
* format/format_filesize.rs
* get.rs
* group_by.rs
* group_by_date.rs
* hash_/base64_.rs
* hash_/md5_.rs
* help.rs
* history.rs
* insert.rs
* into/binary.rs
* into/int.rs
* keep/command.rs
* kill.rs
* last.rs
* length.rs
* let_env.rs
* merge.rs
* move_/command.rs
* nth.rs
* nu/plugin.rs
* open.rs
* parse/command.rs
* pivot.rs
* prepend.rs
* random/bool.rs
* random/chars.rs
* random/decimal.rs
* random/dice.rs
* random/integer.rs
* reduce.rs
* reject.rs
* rename.rs
* roll/column.rs
* roll/command.rs
* roll/up.rs
* rotate/command.rs
* rotate/counter_clockwise.rs
* seq.rs
* seq_dates.rs
* skip/command.rs
* sleep.rs
* sort_by.rs
* source.rs
* split_by.rs
* split/column.rs
* split/row.rs
* termsize.rs
* touch.rs
* to_html.rs
* to_md.rs
* update.rs
* url_/mod.rs
* where_.rs
* with_env.rs
* wrap.rs
