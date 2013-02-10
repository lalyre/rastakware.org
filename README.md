rastakware.org
==============

Rastakware GNU/Linux distribution


Download source packages
------------------------

For building a Ratakware operating system, you first need to download sources packages
that are described in the file [toolchain.csv](./toolchain.csv). Execute the following
command

  cat toolchain.csv | cut -d";" -f3 | wget -i - -P ./packages

Then you can check these packages


