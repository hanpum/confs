#!/usr/bin/env bash
#
# Usage: 
# Author: hanpu(hanpu.mwx@gmail.com)

rootdir=`dirname ${BASH_SOURCE[0]}`
rootdir=`cd ${rootdir}; pwd`

function install() {
    tgt=$1
    src=$2

    rm -rf ${tgt}.bk

    if [[ -e ${tgt} ]]; then
	mv ${tgt} ${tgt}.bk
    fi

    ln -fs ${src} ${tgt}
}

install ${HOME}/.git ${rootdir}/git
install ${HOME}/.pip ${rootdir}/pip
install ${HOME}/.vim ${rootdir}/vim/vim
install ${HOME}/.vimrc ${rootdir}/vim/vimrc

sed -i.bk "/source .*\/confs/d" ${HOME}/.bashrc
echo "source ${rootdir}/confs" >> ${HOME}/.bashrc
