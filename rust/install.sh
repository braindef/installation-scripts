#!/bin/bash
curl https://sh.rustup.rs -sSf | sh

source $HOME/.cargo/env
rustup install nightly beta
rustc --version


