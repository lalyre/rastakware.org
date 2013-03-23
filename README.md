rastakware.org
==============

Rastakware GNU/Linux distribution


### Download source archives

You can edit the [toolchain.csv](./toolchain.csv) and [system.csv](./system.csv) files with OpenOffice
with the following commands

    ooffice toolchain.csv
    ooffice system.csv

You need an already installed Linux system, the Host, for building a Rastakware GNU/Linux distribution.
First, download sources archives that are described in the files [toolchain.csv](./toolchain.csv) and
[system.csv](./system.csv). Packages downloading can be performed automatically with the following commands

    mkdir sources
    chmod -v a+wt sources
    cat toolchain.csv | cut -d";" -f2 | sed s/\"//g | wget -i - -P ./sources
    cat system.csv | cut -d";" -f2 | sed s/\"//g | wget -i - -P ./sources

### Build cross-compilation toolchain



/mnt/lfs
/mnt/lfs/tools/




