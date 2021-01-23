source ansi_ctrl.nu

echo [$(ansi rb) Hello " " $(ansi gb) Nu " " $(ansi pb) World] | str collect
skip1
echo [$(ansi rb) Hello] | str collect
skip2
echo [$(ansi -e '3;93;41m') Hello $(ansi reset) " " $(ansi gb) Nu " " $(ansi pb) World] | str collect
skip2
echo [$(ansi -e '7;93;41m') Hello $(ansi reset) " " $(ansi gb) Nu " " $(ansi pb) World] | str collect
