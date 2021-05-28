
let df1 = (pls load iwv.csv)   
let df2 = (echo [[a b]; [1 2] [3 4]] | pls convert)   

echo [[a b]; [rick paul] [bill pete]] | pls convert | pls show   


### How to compile

```
cargo build --no-default-features --features=rustyline-support --features=dataframe'
cargo build --features=dataframe'
cargo install --path . --install --features=extra,dataframe
```
