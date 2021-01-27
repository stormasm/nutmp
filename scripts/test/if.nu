source ../ansi_ctrl.nu
### This is broken simply by adding the 2nd set of parens down one line

#def if_broken_case1 [dir] {
#  if $dir == crates {
#    echo 'got crates'
#  }
#  {
#    echo 'got something else'
#  }
#}

let y = true
if $y == true {echo hi} {echo bye}
skip1

def t1 [] {
  let y = true
  if $y == true {echo hi} {echo bye}
}

def t2 [dir] {
  if $dir == crates {echo 'got crates t2'} {echo 'got something else t2'}
}

def t3 [dir] {
  if $dir == crates {
    echo 'got crates t3'
  } {
    echo 'got something else t3'
  }
}

t2 crates
skip1
t2 other
skip1
t3 crates
skip1
t3 other
skip1
