#!/usr/bin/env bash

#
# __proxy.sh
# dwell
# 
# Author: Wess Cope (me@wess.io)
# Created: 08/17/2021
# 
# Copywrite (c) 2021 Wess.io
#

set -eu

rustinstall=$(dirname $(dirname $(readlink -f "$0")))/rust

export CARGO_HOME="$rustinstall"
export RUSTUP_HOME="$rustinstall"

exec "${rustinstall}/bin/$(basename "$0")" "$@"