source ../ansi_ctrl.nu

# BROKEN case one of first parens by itself
#
#def paren_broken_case1 [arg]
#{
#echo $arg }

# BROKEN case two of both parens by themselves
#
#def paren_broken_case2 [arg]
#{
#echo $arg
#}

def echo1 [arg] { echo $arg }

def echo2 [arg] {
echo $arg }

def echo3 [arg] {
echo $arg
}

def echo4 [--bar(-b): int] {
    echo $bar
}

echo1 'hi one'
skip1
echo2 'hi two'
skip1
echo3 (hi three)
skip1
echo4 -b 10
skip1
echo4 --bar 10
skip1
