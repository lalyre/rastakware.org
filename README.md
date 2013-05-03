rastakware.org
==============

Rastakware GNU/Linux distribution

# 1. FHS 2.3 requirements

For FHS (*Filesystem Hierarchy Standard*) compliancy, the Rastakware distribution follows the requirements
described in the [fhs-2.3](http://refspecs.linuxfoundation.org/FHS_2.3/fhs-2.3.html) specification.

# 2. Download source archives

You can edit the [toolchain.csv](./toolchain.csv) and [system.csv](./system.csv) files with OpenOffice
with the following commands

    ooffice toolchain.csv
    ooffice system.csv

You need an already installed Linux system, the Host, for building a Rastakware GNU/Linux distribution.
Download sources archives that are described in the files [toolchain.csv](./toolchain.csv) and
[system.csv](./system.csv). Packages downloading can be performed automatically with the following commands

    mkdir packages
    chmod -v a+wt packages
    cat toolchain.csv | cut -d";" -f2 | sed s/\"//g | wget -i - -P ./packages
    cat system.csv | cut -d";" -f2 | sed s/\"//g | wget -i - -P ./packages

# 3. Build cross-compilation toolchain

First build a host-independant system (compiler, assembler, linker, librairies,...)

    mkdir -v /mnt/rastakware
    cd /mnt/rastakware
    mkdir sources
    mkdir tools
    mkdir tools/bin
    export LC_ALL=POSIX
    export PATH=/mnt/rastakware/tools/bin:$PATH

## compile cross binutils

## compile cross gcc













http://refspecs.linuxfoundation.org/





# TODO

- supported hardware devices
- automatic/manual OS upgrade
- desktop environment
- package management system (deb, rpm, apt-get, yum, pkgutils, installpkg, pacman, etc...)
- OS installer
- configuration tools
- LSB compliancy
- POSIX compliancy


