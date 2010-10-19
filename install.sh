#!/bin/sh
# Raw checkout (no updates)
# http://code.google.com/p/yasnippet/ 

SB=~/sandbox

cd $SB
if [ ! -d yasnippet ]
then
    svn checkout http://yasnippet.googlecode.com/svn/trunk/ yasnippet
else 
    pushd yasnippet
    svn up 
    popd
fi

if [ ! -d js-yasnippets ]
then 
    git clone git@github.com:jwalsh/js-yasnippets.git
else 
    cd js-yasnippets
    git pull
fi

if [ ! -d ~/.emacs.d/plugins ] 
then
    mkdir -p ~/.emacs.d/plugins
fi

if [ ! -d ~/.emacs.d/plugins/yasnippet ] 
then 
    ln -s $SB/yasnippet ~/.emacs.d/plugins/yasnippet 
fi

# js2-mode is now part of core Emacs 
if [ ! -d ~/.emacs.d/plugins/yasnippet/snippets ] 
then
    ln -s $SB/js-yasnippets ~/.emacs.d/plugins/yasnippet/snippets/js2-mode
fi