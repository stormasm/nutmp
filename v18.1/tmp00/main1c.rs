use clap::{App, Arg};
use log::LevelFilter;
use nu_cli::utils::test_bins as binaries;
use nu_cli::{create_default_context, EnvironmentSyncer};
use std::error::Error;
use std::fs::File;
use std::io::{prelude::*, BufReader};
use log::{info};

fn main() -> Result<(), Box<dyn Error>> {
    let sambill = App::new("nushell")
        .version(clap::crate_version!())
        .arg(
            Arg::with_name("loglevel")
                .short("l")
                .long("loglevel")
                .value_name("LEVEL")
                .possible_values(&["error", "warn", "info", "debug", "trace"])
                .takes_value(true),
        )
        .arg(
            Arg::with_name("testbin")
                .hidden(true)
                .long("testbin")
                .value_name("TESTBIN")
                .possible_values(&["cococo", "iecho", "fail", "nonu", "chop"])
                .takes_value(true),
        )
        .arg(
            Arg::with_name("commands")
                .short("c")
                .long("commands")
                .multiple(false)
                .takes_value(true),
        )
        .arg(
            Arg::with_name("develop")
                .long("develop")
                .multiple(true)
                .takes_value(true),
        )
        .arg(
            Arg::with_name("info")
                .long("info")
                .multiple(true)
                .takes_value(true),
        )
        .arg(
            Arg::with_name("debug")
                .long("debug")
                .multiple(true)
                .takes_value(true),
        )
        .arg(
            Arg::with_name("stdin")
                .long("stdin")
                .multiple(false)
                .takes_value(false),
        )
        .arg(
            Arg::with_name("script")
                .help("the nu script to run")
                .index(1),
        )
        .arg(
            Arg::with_name("args")
                .help("positional args (used by --testbin)")
                .index(2)
                .multiple(true),
        )
        .get_matches();

    if let Some(bin) = sambill.value_of("testbin") {
        match bin {
            "cococo" => binaries::cococo(),
            "iecho" => binaries::iecho(),
            "fail" => binaries::fail(),
            "nonu" => binaries::nonu(),
            "chop" => binaries::chop(),
            _ => unreachable!(),
        }

        return Ok(());
    }

    let loglevel = match sambill.value_of("loglevel") {
        None => LevelFilter::Warn,
        Some("error") => LevelFilter::Error,
        Some("warn") => LevelFilter::Warn,
        Some("info") => LevelFilter::Info,
        Some("debug") => LevelFilter::Debug,
        Some("trace") => LevelFilter::Trace,
        _ => unreachable!(),
    };

    let mut builder = pretty_env_logger::formatted_builder();

    if let Ok(s) = std::env::var("RUST_LOG") {
        builder.parse_filters(&s);
    }

    builder.filter_module("nu", loglevel);

    match sambill.values_of("develop") {
        None => {}
        Some(values) => {
            for item in values {
                builder.filter_module(&format!("nu::{}", item), LevelFilter::Trace);
            }
        }
    }

    match sambill.values_of("info") {
        None => {}
        Some(values) => {
            for item in values {
                builder.filter_module(&format!("nu::{}", item), LevelFilter::Info);
            }
        }
    }

    match sambill.values_of("debug") {
        None => {}
        Some(values) => {
            for item in values {
                builder.filter_module(&format!("nu::{}", item), LevelFilter::Debug);
            }
        }
    }

    // Everything after this line of code can be shown with info!'s
    // as this is where the logger gets initialized
    builder.try_init()?;

    // info!("{:?}",sambill);

    match sambill.values_of("commands") {
        None => {}
        Some(values) => {
            let pipelines: Vec<String> = values.map(|x| x.to_string()).collect();
            futures::executor::block_on(nu_cli::run_vec_of_pipelines(
                pipelines,
                sambill.is_present("stdin"),
            ))?;
            return Ok(());
        }
    }

    match sambill.value_of("script") {
        Some(script) => {
            let file = File::open(script)?;
            let reader = BufReader::new(file);
            let pipelines: Vec<String> = reader
                .lines()
                .filter_map(|x| {
                    if let Ok(x) = x {
                        if !x.starts_with('#') {
                            Some(x)
                        } else {
                            None
                        }
                    } else {
                        None
                    }
                })
                .collect();

            futures::executor::block_on(nu_cli::run_vec_of_pipelines(
                pipelines,
                sambill.is_present("stdin"),
            ))?;
            return Ok(());
        }

        None => {
            info!("{:?}","Defaults down to the bottom");
            let mut syncer = EnvironmentSyncer::new();
            let context = create_default_context(&mut syncer, true)?;
            futures::executor::block_on(nu_cli::cli(syncer, context))?;
        }
    }

    Ok(())
}
