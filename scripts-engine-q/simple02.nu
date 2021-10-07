let x = 10; def foo [] { $x };
let z = 11;
if (foo) == 10 { $z + 12 }
$z

def bob [] { sam }; def sam [] { 3 + $z }; bob

def rick [x] { $x + 3 }; rick 4
