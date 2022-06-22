#! /bin/bash
workspace=$(dirname $0)
shc -o release-tool -f release-tool.sh
rm release-tool.sh.x.c