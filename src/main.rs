use marco_polo::cli_util;
use marco_polo::cli_util::Cli; // Add missing import

fn main() {
    let args = Cli::parse();
    match args.command {
        Some(Commands::Play { name }) => {
            println!("{}", marco(&name));
        }
        None => {
            println!("What's your name?");
        }
    }
}
