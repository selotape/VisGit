#!/usr/bin/env bash
echo 'Installing git (if not installed already)'
install_git

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

#echo 'configuring password caches'


#echo 'setting aliases'
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"



