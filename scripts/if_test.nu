let y = true
if $y == true {echo hi} {echo bye}

def t1 [] {
  let y = true
  if $y == true {echo hi} {echo bye}
}

def t2 [dir] {
  if $dir == crates {echo 'got crates'} {echo 'got something else'}
}

### This works too

def t3 [dir] {
  if $dir == crates {
    echo 'got crates'
  } {
    echo 'got something else'
  }
}

### This is broken

#def t4 [dir] {
#  if $dir == crates {
#    echo 'got crates'
#  }
#  {
#    echo 'got something else'
#  }
#}