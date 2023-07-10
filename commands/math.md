
## Proposal : Move the math sum command out of math

I am in the process of moving over the math commands to nu-cmd-extra

In the process of doing that I discovered that the *math sum* command
is a virus across all of our nushell tests.  See the list below !

Therefore prior to moving over the math commands to nu-cmd-extra I am
proposing that we create a new *sum* command that does not live in math
so that all of the tests below will pass.

Once that is accomplished then we should be able to move the math commands
over nu-cmd-extra...

Unless we discover something else...

I am open to other suggestions

Thank you !

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

### Tests in the nu-command crate that use sum

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

### These tests in nu-command will move over to nu-cmd-extra

```rust
commands::math::avg::can_average_bytes
commands::math::avg::can_average_numbers
commands::math::median::median_mixed_numbers
commands::math::median::median_numbers_with_even_rows
commands::math::median::median_numbers_with_odd_rows
commands::math::round::can_round_float_with_negative_precision
commands::math::round::can_round_integer_with_negative_precision
commands::math::round::can_round_very_large_numbers
commands::math::round::can_round_very_large_numbers_with_precision
commands::math::round::fails_with_wrong_input_type
commands::math::sqrt::can_sqrt_irrational
commands::math::sqrt::can_sqrt_numbers
commands::math::sqrt::can_sqrt_perfect_square
```

### These test commands will integrate into the new sum command

```rust
commands::math::sum::all
commands::math::sum::compute_sum_of_individual_row
commands::math::sum::compute_sum_of_table
commands::math::sum::sum_of_a_row_containing_a_table_is_an_error
```
