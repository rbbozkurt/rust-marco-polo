rust-version:
	@echo "Rust command-line utility versions:"
	rustc --version 			#rust compiler
	cargo --version 			#rust package manager
	rustfmt --version			#rust code formatter
	rustup --version			#rust toolchain manager
	clippy-driver --version		#rust linter

format:
	@rustup component list | grep 'rustfmt.*installed' >/dev/null || rustup component add rustfmt
	cargo fmt --quiet

lint:
	@command -v cargo-clippy >/dev/null 2>&1 || { echo >&2 "Installing clippy..."; rustup component add clippy; }
	cargo clippy --quiet

test:
	cargo test --quiet

run:
	cargo run

release:
	cargo build --release

all: format lint test run
