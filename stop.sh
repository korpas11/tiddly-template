#!/usr/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
WIKI_PID=$SCRIPT_DIR/log/wiki.pid

kill -SIGINT `cat $WIKI_PID`

