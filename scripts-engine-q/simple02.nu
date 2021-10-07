let $x = 10; def foo [] { $x };
#if foo = 10
foo

#[test]
#fn predecl_check() -> TestResult {
#run_test("def bob [] { sam }; def sam [] { 3 }; bob", "3")
#}

#[test]
#fn def_with_no_dollar() -> TestResult {
#run_test("def bob [x] { $x + 3 }; bob 4", "7")
#}
