#!/bin/bash
ORG="<SOME_VALUE>""
for reponame in $(gh repo list $ORGVALUE -L 100 |  sed 's/\|/ /'|awk '{print $1}' | sed 's/youse-seguradora//g' | sed 's/\///g'); do
    git clone https://github.com/$ORGVALUE/$reponame.git
done
