
#
### nushell
#

alias getnu = git clone git@github.com:nushell/nushell.git
alias getnustorm = git clone git@github.com:stormasm/nushell.git
alias gpnu = git pull https://github.com/nushell/nushell main

alias cbr = cargo build --features=rustyline-support

alias nuconfig = cd /Users/ma/Library/Application\ Support/org.nushell.nu
alias nuconfigold = cd /Users/ma/Library/Preferences/org.nushell.nu
#alias nusave = nuconfig; cp config.toml /mia/current/config; cd /mia/current/config

# This is not the latest code snapshot
alias nutop28 = cd /j/tmp28/nushell
#alias nu28 = nutop28; ./target/debug/nu

#
# nutop is the latest code snapshot
#

alias nutop = cd /j/tmp26/nushell
alias nutmp = cd /j/tmp26/nutmp

#alias nurunn = ./target/debug/nu

#alias nurun = 'nutop; ./target/debug/nu --skip-plugins'
#alias nurun = cd /j/tmp26/nutmp/scripts; /j/tmp26/nushell/target/debug/nu --skip-plugins

#alias nurunp = 'nutop; ./target/debug/nu'
#alias nuruni = 'nurun -l info'
#alias nurund = 'nurun -l debug'
#alias nurunt = 'nurun -l trace'
#alias nuruntlog = 'nurun -l trace 2> log.txt'
#alias nude = 'nutop; ./target/debug/nude --loglevel=debug'

#alias nurundate = 'nurunt -c date'
#alias nurunls = 'nurunt -c ls'

### Changing to various nushell crates

alias nuc = 'nutop; cd crates'
alias nucli = 'nutop; cd crates/nu-cli/src'
alias nucom = 'nutop; cd crates/nu-command/src'
alias nudata = 'nutop; cd crates/nu-data/src'
alias nuen = 'nutop; cd crates/nu-engine/src'
alias nup = 'nutop; cd crates/nu-parser/src'
alias nupro = 'nutop; cd crates/nu-protocol/src'
alias nusource = 'nutop; cd crates/nu-source/src'
alias nust = 'nutop; cd crates/nu-stream/src'
alias nutest = 'nutop; cd crates/nu-test-support/src'

### Utils for working with nushell

alias cpcli = 'cp cli.rs /j/tmp24/nushelltmp/v18.2/tmp01; cd /j/tmp24/nushelltmp/v18.2/tmp01'
alias cpar = 'cp parse.rs /j/tmp25/nushelltmp/v19.0/tmp00; cd /j/tmp25/nushelltmp/v19.0/tmp00'

# Nushell Testing
#
#alias ntall = 'cargo test --all --features=stable'
#
#  Testing an individual nushell command
#   Type the command name after typing the alias
#   cargo test --package nu-cli --test main -- commands::<command_name_here>
#alias ntcomall = 'cargo test --package nu-cli --test main -- commands::'
#alias ntcom = 'cargo test --package nu-cli --test main -- '

# Nushell Scripts
#alias nusd = 'nutop; cd ..; cd nushell_scripts'
alias nus = cd /j/tmp26/nutmp/scripts
alias nusi = cd /j/tmp26/nutmp/scripts/init
#alias nus = 'nutop; cd ..; cd nutmp/scripts'
alias nusn = cd /j/tmp26/nu_scripts
