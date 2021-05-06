
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
