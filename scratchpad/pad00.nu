
# Like `describe` but dropping item types for collections.
export def describe-primitive []: any -> string {
  $in | describe | str replace --regex '<.*' ''
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


let jq1 = '{"data": {"values": [1, 2, 3], "nested": {"values": [4, 5, 6]}}}' | from json

let record1 = {name: "Bobby", age: 99}

let record2 = {data: {values: [1, 2, 3]}}

let record3 = {data: {values: [1, 2, 3], nested: [4, 5, 6]}}

let record4 = {data: {values: [1, 2, 3], nested: {values: [4, 5, 6]}}}

def test00 [] {
    $jq1 | filter-map {|value| if ($value | describe) == "int" { $value * 2 } else { $value }}
}

def test01 [] {
    $record4 | filter-map {|value| if ($value | describe) == "int" { $value * 2 } else { $value }}
}

def test02 [] {
    $record4 | filter {|value| if ($value | describe) == "int" { $value * 2 } else { $value }}
}
