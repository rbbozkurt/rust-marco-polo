//! Cli utils for marco polo game

use clap::Parser;

#[derive(Parser)]
#[clap(
    version = "1.0",
    author = "R. Berkay Bozkurt",
    about = "Marco Polo game"
)]

struct Cli {
    #[clap(subcommand)]
    command: Option<Commands>,
}

#[derive(Parser)]
enum Commands {
    #[clap(version = "1.0", author = "R. Berkay Bozkurt")]
    Play {
        #[clap(short, long)]
        name: String,
    },
}
