
```rust
influxdb_iox$ nuruniox
~/j/tmp06/influxdb_iox> ioxsql paul
You are now querying the database company_sensors
sql_result = Ok("Error running remote query: Tonic(Status { code: InvalidArgument, message: \"Error while planning query: SQL error: ParserError(\\\"Expected an SQL statement, found: paul\\\")\", metadata: MetadataMap { headers: {\"content-type\": \"application/grpc\", \"date\": \"Wed, 13 Sep 2023 16:11:34 GMT\", \"content-length\": \"0\"} }, source: None })")

number of csv records = Ok(0)

thread 'main' panicked at 'called `Result::unwrap()` on an `Err` value: Error(Error { input: "Error running remote query: Tonic(Status { code: InvalidArgument, message: \"Error while planning query: SQL error: ParserError(\\\"Expected an SQL statement, found: paul\\\")\", metadata: MetadataMap { headers: {\"content-type\": \"application/grpc\", \"date\": \"Wed, 13 Sep 2023 16:11:34 GMT\", \"content-length\": \"0\"} }, source: None })", code: TakeUntil })', nu-command/src/iox/nuerror.rs:45:44
stack backtrace:
```

***

```rust
   0: rust_begin_unwind
             at /rustc/5680fa18feaa87f3ff04063800aec256c3d4b4be/library/std/src/panicking.rs:593:5
   1: core::panicking::panic_fmt
             at /rustc/5680fa18feaa87f3ff04063800aec256c3d4b4be/library/core/src/panicking.rs:67:14
   2: core::result::unwrap_failed
             at /rustc/5680fa18feaa87f3ff04063800aec256c3d4b4be/library/core/src/result.rs:1651:5
   3: core::result::Result<T,E>::unwrap
             at /rustc/5680fa18feaa87f3ff04063800aec256c3d4b4be/library/core/src/result.rs:1076:23
   4: nu_command::iox::nuerror::NuIoxError::build
             at ./nu-command/src/iox/nuerror.rs:45:23
   5: nu_command::iox::nuerror::NuIoxErrorHandler::new
             at ./nu-command/src/iox/nuerror.rs:72:28
   6: <nu_command::iox::sql::Ioxsql as nu_protocol::engine::command::Command>::run
             at ./nu-command/src/iox/sql.rs:70:34
   7: nu_engine::eval::eval_call
             at /Users/ma/.cargo/registry/src/index.crates.io-6f17d22bba15001f/nu-engine-0.84.0/src/eval.rs:172:9
   8: nu_engine::eval::eval_expression_with_input
             at /Users/ma/.cargo/registry/src/index.crates.io-6f17d22bba15001f/nu-engine-0.84.0/src/eval.rs:714:25
   9: nu_engine::eval::eval_element_with_input
             at /Users/ma/.cargo/registry/src/index.crates.io-6f17d22bba15001f/nu-engine-0.84.0/src/eval.rs:789:49
  10: nu_engine::eval::eval_block
             at /Users/ma/.cargo/registry/src/index.crates.io-6f17d22bba15001f/nu-engine-0.84.0/src/eval.rs:1103:31
  11: nu_cli::util::eval_source
             at /Users/ma/.cargo/registry/src/index.crates.io-6f17d22bba15001f/nu-cli-0.84.0/src/util.rs:244:9
  12: nu_cli::repl::evaluate_repl
             at /Users/ma/.cargo/registry/src/index.crates.io-6f17d22bba15001f/nu-cli-0.84.0/src/repl.rs:587:21
  13: nu::run::run_repl
             at ./nushell/src/run.rs:243:19
  14: nu::main
             at ./nushell/src/main.rs:296:9
  15: core::ops::function::FnOnce::call_once
             at /rustc/5680fa18feaa87f3ff04063800aec256c3d4b4be/library/core/src/ops/function.rs:250:5
note: Some details are omitted, run with `RUST_BACKTRACE=full` for a verbose backtrace.
influxdb_iox$
```
