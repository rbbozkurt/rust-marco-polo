SHELL := /bin/bash

.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

rust-version:
	@echo "Rust command-line utility versions:"
	rustc --version 			#rust compiler
	cargo --version 			#rust package manager
	rustfmt --version			#rust code formatter
	rustup --version			#rust toolchain manager
	clippy-driver --version		#rust linter



format: ## Format the code
	@rustup component list | grep 'rustfmt.*installed' >/dev/null || rustup component add rustfmt
	cargo fmt --quiet

lint: ## Lint the code
	@command -v cargo-clippy >/dev/null 2>&1 || { echo >&2 "Installing clippy..."; rustup component add clippy; }
	cargo clippy --quiet

test: ## Run the tests
	cargo test --quiet

NAME ?= Marco
run-play: ## Run the game (ex. make run-play NAME=<your_input_here> or make run-play with default NAME=Marco)
	cargo run -- play --name "$(NAME)"
run: ## Run the game
	cargo run

release: ## Build the release version
	cargo build --release

all: format lint test run ## Run all the checks and tests
