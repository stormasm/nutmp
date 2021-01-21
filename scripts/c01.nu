def show_index_colors [] {
    let prefix = "38;5;"
    echo 1..256 | each {
        let cr = $(echo $(build-string $it % 16) | math eval)
        if $cr  == 0 {
            echo [$(ansi -e $prefix) $(build-string $it) 'm' $(build-string $it | str lpad -l 3 -c '0') ' ' $(char newline)]
        } {
            echo [$(ansi -e $prefix) $(build-string $it) 'm' $(build-string $it | str lpad -l 3 -c '0') ' ']
        }
    } | str collect
}

#show_index_colors

def show_simple_1 [] {
  echo 0..3 | each {echo [$(ansi -e '38;5;') $(build-string $it) 'm' $(build-string $it) ' ']}
}

def show_simple_2 [] {
  echo 0..3 | each {echo [$(ansi -e '38;5;') $(build-string $it) 'm' $(build-string $it) ' ']} | str collect
}

show_simple_1
show_simple_2
