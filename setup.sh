#!/bin/zsh

## Figure out where this script is located
SCRIPT_DIR=`dirname ${BASH_SOURCE[0]-$0}`
SCRIPT_DIR=`cd $SCRIPT_DIR && pwd`

## Generate the command that loads the functions
LOAD_COMMAND="if [ -f '$SCRIPT_DIR/.d_commands' ]; then . '$SCRIPT_DIR/.d_commands'; d_databases_setup_volumes_dirs; fi"

## Add the LOAD_COMMAND to .zshrc if not there yet
grep -qxF "$LOAD_COMMAND" ~/.zshrc || echo "$LOAD_COMMAND" >> ~/.zshrc

## Load .zshrc
source ~/.zshrc

## Setup volume directories
d_databases_setup_volumes_dirs