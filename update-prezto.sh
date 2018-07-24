#!/bin/bash
# git remote add prezto https://github.com/sorin-ionescu/prezto.git
git fetch prezto master
git subtree pull --prefix prezto/ prezto master --squash
