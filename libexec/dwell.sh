#!/usr/bin/env bash

#
# dwell
# 
# Author: Wess Cope (me@wess.io)
# Created: 08/17/2021
# 
# Copywrite (c) 2021 Wess.io
#

export DWELL_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${DWELL_ROOT}/__echo.sh
source ${DWELL_ROOT}/__helpers.sh

if [ $# -eq 0 ]; then
  echo "Directory is required: example: 'dwell .venv'" | error
  exit 1
fi

VENV_NAME=$1
shift

CURRENT_DIR=${PWD}
VENV_DIR="$CURRENT_DIR/$VENV_NAME"
BIN_DIR="$VENV_DIR/bin"
RUST_DIR="$VENV_DIR/rust"
RUST_BIN_DIR="$RUST_DIR/bin"

rm -rf "$VENV_DIR"
mkdir -p "$BIN_DIR"
mkdir -p "$RUST_DIR"

export RUSTUP_HOME="$RUST_DIR"
export CARGO_HOME="$RUST_DIR"

echo "Installing Rust environment to $VENV_DIR..." | status

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

##

echo "Creating activation and deactivation scripts..." | status


define ACTIVATE <<EOF
#!/usr/bin/env bash

export _DWELL_VENV_NAME="$VENV_NAME"
export _DWELL_OLD_PATH="\$PATH"
export _DWELL_OLD_PS1="\$PS1"

export RUSTUP_HOME="$RUST_DIR"
export CARGO_HOME="$RUST_DIR"
export PATH="$RUST_BIN_DIR:$BIN_DIR:$PATH"
export PS1="[$VENV_NAME] \$_DWELL_OLD_PS1"

hash -r 2>/dev/null

deactivate() {
    export PS1="\$_DWELL_OLD_PS1"
    export PATH="\$_DWELL_OLD_PATH"

    hash -r 2>/dev/null

    unset _DWELL_VENV_NAME
    unset _DWELL_OLD_PS1
    unset _DWELL_OLD_PATH
    unset RUSTUP_HOME
    unset CARGO_HOME
}
EOF

ACTIVATE_SCRIPT_PATH="$BIN_DIR/activate"
touch -- "$ACTIVATE_SCRIPT_PATH"

echo "$ACTIVATE" >> $ACTIVATE_SCRIPT_PATH
chmod u+x $ACTIVATE_SCRIPT_PATH
##


##
echo "Cleaning up..." | status

unset RUSTUP_HOME
unset CARGO_HOME
unset DWELL_ROOT

##
echo "Rust ennvironment successfully setup." | success
echo "Run ./$(basename $VENV_DIR)/bin/activate to start." | info