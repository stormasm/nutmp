
# Cratification: porting math commands over to nu-cmd-extra

I am in the process of moving over the math commands to nu-cmd-extra

In the process of doing that I discovered that the *math sum* command
is a virus across all of our nushell tests.  See the list below !

So I decided to move the math commands over slowly instead...

And I kind of like this idea because we may want to leave some of the
math commands in nu-command...

Clearly based on these findings the *math sum* command will stay in
nu-command.

The following tests use the *math sum* command...

```rust
tests::test_engine::loose_each
tests::test_engine::range_right_exclusive
tests::test_engine::reusable_in
tests::test_ranges::range_and_reduction
tests::test_table_operations::where_on_ranges

shell::pipeline::commands::internal::better_subexpr_lex
shell::pipeline::commands::internal::echoing_exclusive_ranges
shell::pipeline::commands::internal::echoing_ranges
shell::pipeline::commands::internal::exclusive_range_with_mixed_types
shell::pipeline::commands::internal::exclusive_range_with_open_left
shell::pipeline::commands::internal::exclusive_range_with_open_right
shell::pipeline::commands::internal::list_with_commas
shell::pipeline::commands::internal::range_with_left_var
shell::pipeline::commands::internal::range_with_mixed_types
shell::pipeline::commands::internal::range_with_open_left
shell::pipeline::commands::internal::range_with_open_right
shell::pipeline::commands::internal::range_with_right_var
shell::pipeline::commands::internal::table_literals2
shell::pipeline::commands::internal::table_with_commas
```

### Tests in the nu-command crate that use math sum

```rust
commands::break_::break_each
commands::drop::rows
commands::each::each_works_separately
commands::match_::match_list_rest
commands::merge::row
commands::open::open_multiple_files
commands::reduce::folding_with_tables
commands::skip::until::condition_is_met
commands::skip::while_::condition_is_met
commands::str_::converts_to_decimal
commands::take::rows::rows
commands::take::until::condition_is_met
commands::take::while_::condition_is_met
commands::where_::filters_with_nothing_comparison
commands::where_::where_in_table
commands::where_::where_not_in_table
```
