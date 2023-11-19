
let jq1 = '{"data": {"values": [1, 2, 3], "nested": {"values": [4, 5, 6]}}}' | from json

let record1 = {name: "Bobby", age: 99}

let record2 = {data: {values: [1, 2, 3]}}

let record3 = {data: {values: [1, 2, 3], nested: [4, 5, 6]}}
