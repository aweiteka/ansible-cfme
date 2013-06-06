#!/bin/bash
#
# rbenv_wrapper <command> <args>
# 
# Example:
#   $ rbenv_wrapper rbenv install <ruby_ver>
#   $ rbenv_wrapper rbenv gemset create <ruby_ver> <gemset>
#

# Make sure we have the ruby environment loaded
if [ -f $HOME/.bash_profile ]; then
  source $HOME/.bash_profile
fi

# Now run the desired command
$@
