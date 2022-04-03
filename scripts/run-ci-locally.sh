#!/usr/bin/env bash
set -o nounset -o pipefail -o errexit -o xtrace

# This script tries to emulate a run of CI.yml. If you can run this script
# without errors you can be reasonably sure that CI will pass for real when you
# upload the code.

# CI.yml
set -o errexit -o nounset -o pipefail -o xtrace
cargo fmt -- --check
RUSTDOCFLAGS='-D warnings' cargo doc --no-deps
cargo clippy --all-targets --all-features -- -D clippy::all -D clippy::pedantic
cargo test

# nightly.yml
RUSTDOCFLAGS='-Z unstable-options --output-format json' cargo +nightly doc --manifest-path ./tests/crates/comprehensive_api/Cargo.toml --lib --no-deps
cargo run -- ./target/doc/comprehensive_api.json
