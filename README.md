rastakware.org
==============

Rastakware GNU/Linux distribution


### Download source archives

You need an already installed Linux system, the Host, for building a Rastakware GNU/Linux distribution.
First, download sources archives that are described in the files [toolchain.csv](./toolchain.csv) and
[system.csv](./system.csv). Packages downloading can be performed automatically with the following commands

    mkdir sources
    cat toolchain.csv | cut -d";" -f2 | sed s/\"//g | wget -i - -P ./sources
    cat system.csv | cut -d";" -f2 | sed s/\"//g | wget -i - -P ./sources

### Build cross-compilation toolchain


