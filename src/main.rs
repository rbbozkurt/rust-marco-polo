use clap::Parser;
use marco_polo::cli_util::Cli;
use marco_polo::cli_util::Commands;
use marco_polo::marco;

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
