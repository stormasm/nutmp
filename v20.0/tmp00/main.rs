use nu_cli::create_default_context;
use std::error::Error;

use flexi_logger::Logger;
use log::*;

fn main() -> Result<(), Box<dyn Error>> {
    let context = create_default_context(true)?;

    Logger::with_env().start().unwrap();
    error!("error log");
    warn!("warn log");
    info!("info log");
    debug!("debug log");
    trace!("trace log");

    #[cfg(feature = "rustyline-support")]
    {
        futures::executor::block_on(nu_cli::cli(context))?;
    }

    Ok(())
}
