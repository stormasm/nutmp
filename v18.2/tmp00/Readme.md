

Remove some tracing and debugging code so we see less cruft when tracing...

For the logging issue use this main-logging.rs and switch the name back to main.rs

run it like this :

RUST_LOG=trace nurun --debug=true --loglevel=trace -c date

RUST_LOG=trace nurunt

