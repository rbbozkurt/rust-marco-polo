use clap::{Parser, Subcommand};

#[derive(Parser, Debug)]
#[clap(version = "1.0", author = "R. Berkay Bozkurt", about = "Marco Polo game")]
pub struct Cli {
    #[clap(subcommand)]
    pub command: Option<Commands>,
}

#[derive(Subcommand, Debug)]
pub enum Commands {
    #[clap(version = "1.0", author = "R. Berkay Bozkurt")]
    Play {
        #[clap(short, long)]
        name: String,
    },
}