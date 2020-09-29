
I like how in hir.rs how you introduced a new

```
pub enum SpecialVariable {
    It,
    Table,
    Row,
}
```

This is much cleaner than the old $it implementation and allows for
expansion to future SpecialVariables.
