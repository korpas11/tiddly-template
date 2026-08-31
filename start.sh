#!/usr/bin/bash

CONFIG_FILE="./config.sh"

if [[ -f "$CONFIG_FILE" ]]; then
    # shellcheck source=/dev/null
    source "$CONFIG_FILE"
else
    echo "Config file not found: $CONFIG_FILE" >&2
    exit 1
fi


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# WIKIEXE=/usr/local/bin/tiddlywiki

WIKIDIR=$SCRIPT_DIR/content
ACCESS_LOG=$SCRIPT_DIR/log/access.log
ERROR_LOG=$SCRIPT_DIR/log/error.log
WIKI_PID=$SCRIPT_DIR/log/wiki.pid

# PORT=9852

cd $CRIPT_DIR

if ! netstat -tuln | grep :$PORT > /dev/null; then
  nohup $WIKIEXE $WIKIDIR --listen port=$PORT debug-level=none > $ACCESS_LOG 2> $ERROR_LOG < /dev/null & echo $! > $WIKI_PID
  sleep 2s
fi

xdg-open http://localhost:$PORT
