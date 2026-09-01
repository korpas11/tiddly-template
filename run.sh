#!/usr/bin/bash


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export TIDDLYWIKI_PLUGIN_PATH=$SCRIPT_DIR/plugins
export TIDDLYWIKI_THEME_PATH=$SCRIPT_DIR/plugins

CONFIG_FILE="$SCRIPT_DIR/config.sh"

if [[ -f "$CONFIG_FILE" ]]; then
    source "$CONFIG_FILE"
else
    echo "Config file not found: $CONFIG_FILE" >&2
    exit 1
fi

WIKIDIR=$SCRIPT_DIR/content
LOG_DIR=$SCRIPT_DIR/log
ACCESS_LOG=$LOG_DIR/access.log
ERROR_LOG=$LOG_DIR/error.log
WIKI_PID=$LOG_DIR/wiki.pid

cd $CRIPT_DIR

if ! netstat -tuln | grep :$PORT > /dev/null; then
  nohup $WIKIEXE $WIKIDIR --listen port=$PORT debug-level=none > $ACCESS_LOG 2> $ERROR_LOG < /dev/null & echo $! > $WIKI_PID
  sleep 2s
fi

xdg-open http://localhost:$PORT
