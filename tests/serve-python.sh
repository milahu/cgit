#!/usr/bin/env bash

# NOTE "git clone" does not work with this http server

cd "$(dirname "$0")"/..

port=$RANDOM

echo "TODO open http://127.0.0.1:$port/cgi-bin/cgit"

if ! [ -e cgitrc ]; then
cat >cgitrc <<EOF
repo.url=path/to/cgit.git
repo.path=$PWD/.git
repo.desc=web interface (cgi) for Git repositories, written in C
EOF
fi

export CGIT_CONFIG=$PWD/cgitrc

mkdir -p cgi-bin
if ! [ -e cgi-bin/cgit ]; then
  ln -sr cgit cgi-bin/cgit
fi

exec python3 -m http.server --cgi --bind 127.0.0.1 $port
