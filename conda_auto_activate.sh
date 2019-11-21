#!/bin/bash

# conda_auto_activate automatically activates a conda environment when
# enterring a folder that contains a `environment.yml` or `.venv` file. 
# The `environment.yml` can exported from a existed conda env and we 
# use it to create a new conda env. The first line in the `.venv` file
# is the name of the conda env.
#
# To make this work you have to source conda_auto_activate.sh from your
# ~/.bashrc or ~/.zshrc.

function _conda_auto_activate() {
  if [ -e "environment.yml" ]; then
    # echo "environment.yml file found"
    ENV=$(head -n 1 environment.yml | cut -f2 -d ' ')
    # Check if you are already in the environment
    if [[ $PATH != *$ENV* ]]; then
      source activate $ENV
      # Check if the environment exists
      if [ $? -eq 0 ]; then
        :
      else
        # Create the environment and activate
        echo "Conda env '$ENV' doesn't exist."
        conda env create -q
        source activate $ENV
      fi
    fi
  elif [ -e ".venv" ]; then
    # echo ".venv file found"
    ENV=$(head -n 1 .venv)
    # Check if you are already in the environment
    if [[ $PATH != *"$ENV"* ]]; then
      source activate $ENV
      if [ $? -eq 0 ]; then
        :
      else
        echo "Conda env '$ENV' doesn't exist."
      fi
    fi
  fi
}

function chpwd() {
  _conda_auto_activate
}
