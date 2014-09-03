conda-recipes
=============

Conda Recipes in support of Psychopy

Most dependencies were created with `conda pipbuild depname`, which builds a binstar package that can be installed but doesn't create a recipe. This repo contains recipes that required special attention because they failed with `pipbuild`. For example, the LabJack library uses dates for version names, where the dashes break version number parsing. The version can be specified manually, and there are a handful of similar work-arounds.

To install psychopy with conda, try this:

    conda config --add channels https://conda.binstar.org/erik
    conda config --add channels https://conda.binstar.org/quasiben
    conda config --add channels https://conda.binstar.org/pramukta
    conda create -n psychopyenv psychopy
    source activate psychopyenv

The that could be auto-generated with pipbuild were run with:


    # OSX Only
    for i in pyobjc-core pyobjc pyobjc-framework-qtkit py2app ; do 
        conda pipbuild $i;
    done
    
    for i in bdist_mpkg pyserial ioLabs pyxid altgraph macholib PySoundCard PySoundFile PyOpenGl altgraph ; do
        conda pipbuild $i;
    done
    
    
    # For testing, you can also use `--use-local`, eg:
    conda pipbuild altgraph
    conda install altgraph --use-local
    
    # labjackpython has non-standard versioning and can't use pipbuild
    conda build labjackpython


Linux:

    yum install gtk+-devel gtk+extra-devel gtk2-devel gtk2-engines-devel gtkglext-devel gtkmm24-devel wxGTK-devel wxBase SDL-devel gstreamer-devel gstreamer-plugins-base-devel
    pygtk2.x86_64 pygtk2.x86_64 pygtkglext-devel.x86_64 python-gtkextra.x86_64
    