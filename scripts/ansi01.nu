echo [$(ansi rb) Hello " " $(ansi gb) Nu " " $(ansi pb) World] | str collect
echo [$(char newline)] | str collect
echo [$(ansi rb) Hello] | str collect
echo [$(char newline)] | str collect
echo [$(char newline)] | str collect

echo [$(ansi -e '3;93;41m') Hello $(ansi reset) " " $(ansi gb) Nu " " $(ansi pb) World] | str collect


echo [$(char newline)] | str collect
echo [$(char newline)] | str collect


echo [$(ansi -e '7;93;41m') Hello $(ansi reset) " " $(ansi gb) Nu " " $(ansi pb) World] | str collect
