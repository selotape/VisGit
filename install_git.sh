#!/usr/bin/env bash
echo 'Installing git (if not installed already)'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


function install_git {
    sudo apt-get update
    package="git"
    PKG_OK=$(dpkg-query -W --showformat='${Status}\n' ${package} | grep "install ok installed")
    echo "Checking for '${package}': $PKG_OK"
    if [ "" == "$PKG_OK" ]; then
      echo "No ${package}. Setting up ${package}."
      sudo apt-get --force-yes --yes install ${package}
    fi
}

install_git



#echo 'configuring password caches'


#echo 'setting aliases'
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"

# block committing large files


# add hooks
mkdir -p ~/.git-template/hooks
cp ${DIR}/resources/.git-templates/hooks/* ~/.git-template/hooks


# fetch repos
# TODO - make this generic
pushd ~/dev
for git_repo in platform_shopymate sep_shopymate ui_shopymate; do
    pushd ${git_repo}
    git fetch
    popd
done
popd

