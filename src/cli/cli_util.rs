use clap::{Parser, Subcommand};

#[derive(Parser, Debug)]
#[clap(
    version = "1.0",
    author = "R. Berkay Bozkurt",
    about = "Marco Polo game"
)]
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

#[cfg(test)]
mod tests {
    use super::*;

    impl PartialEq for Commands {
        fn eq(&self, other: &Self) -> bool {
            match (self, other) {
                (Commands::Play { name: name1 }, Commands::Play { name: name2 }) => name1 == name2,
            }
        }
    }

    #[test]
    fn test_cli_play_command() {
        let args = vec!["myapp", "play", "--name", "John"];
        let cli: Cli = Cli::parse_from(args);
        assert_eq!(
            cli.command,
            Some(Commands::Play {
                name: "John".to_string()
            })
        );
    }
}
