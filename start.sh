#!/usr/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
WIKIEXE=/usr/local/bin/tiddlywiki

WIKIDIR=$SCRIPT_DIR/content
ACCESS_LOG=$SCRIPT_DIR/log/access.log
ERROR_LOG=$SCRIPT_DIR/log/error.log
WIKI_PID=$SCRIPT_DIR/log/wiki.pid

PORT=9852

cd $CRIPT_DIR
nohup $WIKIEXE $WIKIDIR --listen port=$PORT debug-level=none > $ACCESS_LOG 2> $ERROR_LOG < /dev/null & echo $! > $WIKI_PID

