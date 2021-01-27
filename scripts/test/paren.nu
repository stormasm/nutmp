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
my_echo2 (hi two)
my_echo3 (hi three)
my_echo4 -b 10
my_echo4 --bar 10
