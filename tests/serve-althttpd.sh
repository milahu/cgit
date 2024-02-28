#!/usr/bin/env bash

# NOTE "git clone" works only over the dumb http transport

cd "$(dirname "$0")"/..

port=$RANDOM

echo "TODO open http://127.0.0.1:$port/cgit"

if ! [ -e cgitrc ]; then
cat >cgitrc <<EOF
repo.url=path/to/cgit.git
repo.path=$PWD/.git
repo.desc=web interface (cgi) for Git repositories, written in C
EOF
fi

export CGIT_CONFIG=$PWD/cgitrc

exec althttpd -root $PWD -port $port
