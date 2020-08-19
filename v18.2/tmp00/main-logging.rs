use clap::{App, Arg};
use log::LevelFilter;
use nu_cli::utils::test_bins as binaries;
use nu_cli::{create_default_context, EnvironmentSyncer};
use std::error::Error;
use std::fs::File;
use std::io::{prelude::*, BufReader};
use log::{debug, trace};

fn main() -> Result<(), Box<dyn Error>> {

    pretty_env_logger::init();
    trace!("main top = {}", 1);

    debug!("[root] debug");

    let matches = App::new("nushell")
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

    if let Some(bin) = matches.value_of("testbin") {
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

    let loglevel = match matches.value_of("loglevel") {
        None => LevelFilter::Warn,
        Some("error") => LevelFilter::Error,
        Some("warn") => LevelFilter::Warn,
        Some("info") => LevelFilter::Info,
        Some("debug") => LevelFilter::Debug,
        Some("trace") => LevelFilter::Trace,
        _ => unreachable!(),
    };


    trace!("Immediately before calling XXXXXXXXXXXXXXXXX 01");


    let mut builder = pretty_env_logger::formatted_builder();

    if let Ok(s) = std::env::var("RUST_LOG") {
        builder.parse_filters(&s);
    }

    builder.filter_module("nu", loglevel);

    println!("{} ROCK AND ROLL {}",1,2);
    trace!("{} Immediately before calling XXXXXXXXXXXXXXXXX 01",1);
    debug!("x = {x}, y = {y}", x=10, y=20);
    println!("{} BILL AND PETE {}",3,4);


    match matches.values_of("develop") {
        None => {}
        Some(values) => {
            for item in values {
                builder.filter_module(&format!("nu::{}", item), LevelFilter::Trace);
            }
        }
    }

    match matches.values_of("debug") {
        None => {}
        Some(values) => {
            for item in values {
                builder.filter_module(&format!("nu::{}", item), LevelFilter::Debug);
            }
        }
    }

    trace!(target: "nu::main", "Immediately before calling builder.try_init()");

    builder.try_init()?;

    match matches.values_of("commands") {
        None => {}
        Some(values) => {
            println!("{} FREAKING A B C D E {}",1,2);
            let pipelines: Vec<String> = values.map(|x| x.to_string()).collect();
            futures::executor::block_on(nu_cli::run_vec_of_pipelines(
                pipelines,
                matches.is_present("stdin"),
            ))?;
            return Ok(());
        }
    }

    match matches.value_of("script") {
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
                matches.is_present("stdin"),
            ))?;
            return Ok(());
        }

        None => {
            let mut syncer = EnvironmentSyncer::new();
            let context = create_default_context(&mut syncer, true)?;
            trace!(target: "nu::main", "Immediately before calling nu_cli::cli(syncer,context)");
            futures::executor::block_on(nu_cli::cli(syncer, context))?;
        }
    }

    Ok(())
}
