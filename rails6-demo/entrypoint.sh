#!/bin/sh

#this makes the script fail fast if any subsequent commands terminate with an error
set -e

#if server.pid exist, then remove it.
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

#Replace the currently running process (this Bash script) by running the following program
#The $@ means all arguments that were provided to this Bash script, which in our case would be bin/rails s -b 0.0.0.0. 

exec "$@"


