source ../ansi_ctrl.nu

# The case of parens on their own lines is broken
#
#def my_echo_broken [arg]
#{
#echo $arg
#}

def my_echo1 [arg] { echo $arg }

def my_echo2 [arg] {
echo $arg }

def my_echo3 [arg] {
echo $arg
}

def my_echo4 [--bar(-b): int] {
    echo $bar
}

my_echo1 'hi one'
skip1
my_echo2 'hi two'
skip1
my_echo3 (hi three)
skip1
my_echo4 -b 10
skip1
my_echo4 --bar 10
skip1
