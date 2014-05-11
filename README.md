conda-recipes
=============

Conda Recipes in support of Psychopy

Most dependencies were created with `conda pipbuild depname`, which builds a binstar package that can be installed but doesn't create a recipe. This repo contains recipes that requried special attention because they failed with `pipbuild`. For example, the LabJack library uses dates for version names, where the dashes break version number parsing. The version can be specified manually, and there are a handuful of similar work-arounds.

To install psychopy with conda, try this:

    conda config --add channels https://conda.binstar.org/erik
    conda create -n psychopyenv psychopy
    source activate psychopyenv

NB - The version of psychopy that is listed in the recipe currently is Dan Schreij's 64-bit fork, and the pyglet used is pyglet1.2alpha1. 

The dependencies that weren't available already (ie created with `conda pipbuild`) were run with:

    for i in pyobjc-core pyobjc pyobjc-framework-qtkit py2app bdist_mpkg pyserial ioLabs pyxid ; do 
        conda pipbuild $i;
    done

I don't know for sure that these all worked since there was a lot of trial and error involved, but I think they did.
