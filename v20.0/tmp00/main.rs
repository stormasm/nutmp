use nu_cli::create_default_context;
use std::error::Error;

fn main() -> Result<(), Box<dyn Error>> {
    let context = create_default_context(true)?;

    #[cfg(feature = "rustyline-support")]
    {
        futures::executor::block_on(nu_cli::cli(context))?;
    }

    Ok(())
}
