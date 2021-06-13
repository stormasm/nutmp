
https://github.com/nushell/nushell/issues/3609

I would like to track the relative compile times of Nushell crates as the project evolves...
This seems like a good place to keep these numbers unless somewhere else makes more sense...

These times were generated and compared by removing target after each compile so we are starting with a fresh build...


| crate  | compile time |
| ------------- | ------------- |
| nu-ansi-term | 4 seconds |
| nu-pretty-hex | 7 seconds |
| nu-table | 14 seconds |
| nu-source    | 24 seconds  |
| nu-json | 32 seconds |
| nu-errors    | 41 seconds  |
| nu-protocol  | 50 seconds  |
| nu-value-ext | 53 seconds  |
| nu-stream | 63 seconds |
| nu-test-support | 69 seconds |
| nu-plugin | 71 seconds |
| nu-parser  | 79 seconds  |
| nu-data | 83 seconds |
| nu-engine | 126 seconds |
| nu-command | 208 seconds |
|nu-cli | 210 seconds |
|nu v0.32.1 | 306 seconds |
