#!/usr/bin/env bash

# fetch repos
# TODO - make this generic
pushd ~/dev
for git_repo in platform_shopymate sep_shopymate ui_shopymate; do
    pushd ${git_repo}
    git fetch
    popd
done
popd

