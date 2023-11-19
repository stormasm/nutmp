# toolbox.nu
use std assert

# A command for cherry-picking values from a record key recursively
export def cherry-pick [
    test               # The test function to run over each element
    list: list = []    # The initial list for collecting cherry-picked values
] {
    let input = $in

    if ($input | describe) =~ "record|table" {
        $input
        | values
        | reduce --fold $list { |value, acc|
            $acc | append [($value | cherry-pick $test)]
          }
        | prepend [(do $test $input)]
        | flatten
    } else {
        $list
    }
}


#[test]
def test_deep_record_with_key [] {
    assert equal ({data: {value: 42, nested: {value: 442}}} | cherry-pick {|x| $x.value?}) [null 42 442]
    assert equal ({value: 42, nested: {value: 442, nested: {other: 4442}}} | cherry-pick {|x| $x.value?}) [42 442 null]
    assert equal ({
        value: 1,
        nested: {value: 2, nested: {terminal: 3}}
        terminal: 4,
        nested2: {value: 5}} | cherry-pick {|x| $x.value?}) [1 2 null 5]
}

#[test]
def test_record_without_key [] {
    assert equal ({data: 1} | cherry-pick {|x| $x.value?}) [null]
}

#[test]
def test_integer [] {
    assert equal (1 | cherry-pick {|x| $x.value?}) []
}

def test_string [] {
    assert equal ("foo" | cherry-pick {|x| $x.value?}) []
}

#[test]
def test_list [] {
    assert equal (["foo"] | cherry-pick {|x| $x.value?}) []
}

#[test]
def test_table [] {
    assert equal ([[a b]; [1.1 1.2] [2.1 2.2]] | cherry-pick {|x| $x.value?}) [null null]
    assert equal ([[a b]; [1.1 1.2] [2.1 2.2]] | cherry-pick {|x| $x.b?}) [1.2 2.2]
}

#[test]
def test_record_with_key [] {
    assert equal ({value: 42} | cherry-pick {|x| $x.value?}) [42]
    assert equal ({value: null} | cherry-pick {|x| $x.value?}) [null]
}

#[test]
def test_deep_record_without_key [] {
    assert equal ({data: {v: 42}} | cherry-pick {|x| $x.value?}) [null null]
}

# Like `describe` but dropping item types for collections.
export def describe-primitive []: any -> string {
  $in | describe | str replace --regex '<.*' ''
}


# A command for cherry-picking values from a record key recursively
export def "flatten record-paths" [
    --separator (-s): string = "."    # The separator to use when chaining paths
] {
    let input = $in

    if ($input | describe) !~ "record" {
        error make {msg: "The record-paths command expects a record"}
    }

    $input | flatten-record-paths $separator
}

def flatten-record-paths [separator: string, ctx?: string] {
    let input = $in

    match ($input | describe-primitive) {
        "record" => {
            $input
            | items { |key, value|
                  let path = if $ctx == null { $key } else { [$ctx $key] | str join $separator }
                  {path: $path, value: $value}
              }
            | reduce -f [] { |row, acc|
                  $acc
                  | append ($row.value | flatten-record-paths $separator $row.path)
                  | flatten
              }
        },
        "list" => {
            $input
            | enumerate
            | each { |e|
                  {path: ([$ctx $e.index] | str join $separator), value: $e.item}
              }
        },
        "table" | "block" | "closure" => { error make {msg: "Unexpected type"} },
        _ => {
            {path: $ctx, value: $input}
        },
    }
}

#[test]
def test_record_path [] {
    assert equal ({a: 1} | flatten record-paths) [{path: "a", value: 1}]
    assert equal ({a: 1, b: [2 3]} | flatten record-paths) [[path value]; [a 1] ["b.0" 2] ["b.1" 3]]
    assert equal ({a: 1, b: {c: 2}} | flatten record-paths) [[path value]; [a 1] ["b.c" 2]]
    assert equal ({a: {b: {c: null}}} | flatten record-paths -s "->") [[path value]; ["a->b->c" null]]
}



# A command for walking through a complex data structure and tranforming its values recursively
export def filter-map [mapping_fn: closure] {
    let input = $in

    match ($input | describe-primitive) {
        "record" => {
            $input
            | items { |key, value|
                  {key: $key, value: ($value | filter-map $mapping_fn)}
              }
            | transpose -rd
        },
        "list" => {
            $input
            | each { |value|
                  $value | filter-map $mapping_fn
              }
        },
        "table" | "block" | "closure" => { error make {msg: "unimplemented"} },
        _ => {
            do $mapping_fn $input
        },
    }
}

#[test]
def test_filtermap [] {
    assert equal ({a: 42} | filter-map {|x| if ($x | describe) == "int" { $x * 2 } else { $x }}) {a: 84}
    assert equal ({a: 1, b: 2, c: {d: 3}} | filter-map {|x| if ($x | describe) == "int" { $x * 2 } else { $x }}) {a: 2, b: 4, c: {d: 6}}
    assert equal ({a: 1, b: "2", c: {d: 3}} | filter-map {|x| if ($x | describe) == "int" { $x * 2 } else { $x }}) {a: 2, b: "2", c: {d: 6}}
}
