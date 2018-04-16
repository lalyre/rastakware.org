rastakware.org
==============

Rastakware GNU/Linux distribution

## 1. FHS 2.3 requirements

For FHS (Filesystem Hierarchy Standard) compliancy, the Rastakware distribution follows the requirements described
in the [fhs-2.3](http://refspecs.linuxfoundation.org/FHS_2.3/fhs-2.3.html) specification. The Rastakware filesystem
directory tree must be implemented as described below :

    /bin
    /boot
    /dev
    /etc
    /etc/opt
    /etc/X11
    /etc/sgml
    /etc/xml
    /home
    /lib
    /lib/modules
    /lib32
    /lib64
    /media
    /media/floppy
    /media/cdrom
    /media/cdrecorder
    /media/usb
    /media/zip
    /mnt
    /opt
    /opt/bin
    /opt/doc
    /opt/include
    /opt/info
    /opt/lib
    /opt/man
    /proc
    /root
    /sbin
    /srv
    /tmp
    /usr
    /usr/bin
    /usr/include
    /usr/lib
    /usr/lib/X11
    /usr/local
    /usr/local/bin
    /usr/local/etc
    /usr/local/games
    /usr/local/include
    /usr/local/lib
    /usr/local/man
    /usr/local/sbin
    /usr/local/share
    /usr/local/share/man --> /usr/local/man
    /usr/local/src
    /usr/sbin
    /usr/share
    /usr/share/dict
    /usr/share/doc
    /usr/share/games
    /usr/share/info
    /usr/share/locale
    /usr/share/man
    /usr/share/man/man1
    /usr/share/man/man2
    /usr/share/man/man3
    /usr/share/man/man4
    /usr/share/man/man5
    /usr/share/man/man6
    /usr/share/man/man7
    /usr/share/man/man8
    /usr/share/misc
    /usr/share/nls
    /usr/share/sgml
    /usr/share/terminfo
    /usr/share/tmac
    /usr/share/xml
    /usr/share/zoneinfo
    /usr/games
    /usr/src
    /usr/src/linux
    /usr/src/linux/include
    /var
    /var/account
    /var/cache
    /var/cache/fonts
    /var/cache/man
    /var/cache/www
    /var/crash
    /var/games
    /var/mail
    /var/lib
    /var/lib/hwclock
    /var/lib/misc
    /var/lib/xdm
    /var/local
    /var/lock
    /var/log
    /var/opt
    /var/run
    /var/spool
    /var/spool/cron
    /var/spool/lpd
    /var/spool/mqueue
    /var/spool/news
    /var/spool/rwho
    /var/spool/uucp
    /var/tmp
    /var/backups
    /var/cron
    /var/msgs
    /var/preserve
    /var/yp

Under the `/bin` directory you must have the following binaries :
[, bash, cat, csh, chgrp, chmod, chown, cp, cpio, date, dd, df, dmesg, echo, ed, gzip, gunzip (--> gzip), false, ftp,
hostname, kill, ln, login, ls, mkdir, mknod, more, mount, mv, netstat, ping, ps,
pwd, rm, rmdir, sed, sh (--> bash), stty, su, sync, tar, tftp, tcsh, true, test, umount, uname, zcat (--> gzip). **KO**

Under the `/dev` directory you should have the `MAKEDEV` binary. **KO**

Under the `/etc` directory you must have the following configuration files :
csh.login, exports, fstab, ftpusers, gateways, gettydefs, group, host.conf, hosts,
hosts.allow, hosts.deny, hosts.equiv, hosts.lpd, inetd.conf, inittab, issue, ld.so.conf,
motd, mtab, mtools.conf, networks, passwd, printcap, profile, protocols, resolv.conf, rpc,
securetty, services, shells, syslog.conf.  **KO**

Under the `/etc/X11` directory you should have the following configuration files :
Xconfig, XF86Config, Xmodmap. **KO**

Under the `/etc/sgml` and `/etc/xml` directories you should have a `catalog` file. **KO**

Under the `/lib` directory you should have the following files :
libc.so.*, ld*, cpp (--> /usr/bin/cpp). **KO**

Under the `/sbin` directory you should have the following files :
shutdown, fastboot, fasthalt, fdisk, fsck, fsck.*, getty, halt, ifconfig,
init, mkfs, mkfs.*, mkswap, reboot, route, swapon, swapoff, update, badblocks,
dumpe2fs, e2fsck, mke2fs, mklost+found, tune2fs, lilo, ldconfig, sln, ssync,
ctrlaltdel, kbdrate. **KO**

Under the `/usr/bin` directory you should have the following files :
awk (--> gawk), yacc (--> bison), mh, perl, python, tclsh, wish, expect, chfn, cpp (C preprocessor). **KO**

Under the `/usr/sbin` directory you should have the following files :
makewhatis, sendmail, useradd, usermod. **KO**

Under the `/usr/share/dict` directory, you should have the `words` file. **KO**

Under the `/usr/share/misc` directory you should have the files :
ascii, magic, termcap, termcap.db. **KO**

Under the `/var/lib/hwclock` directory you should have the `adjtime` file. **KO**

Under the `/var/log` directory you should have the following files :
lastlog, messages, wtmp. **KO**

Under the `/boot` directory you should have the `vmlinux` file.  **KO**

Under the `/dev` directory you should have the following files :
null, zero, tty. **KO**


## 2. Download source archives

You can edit the [toolchain.csv](./toolchain.csv) and [system.csv](./system.csv) files with OpenOffice
with the following commands

    ooffice toolchain.csv
    ooffice system.csv

You need an already installed Linux system, the Host, for building a Rastakware GNU/Linux distribution.
Download sources archives that are described in the files [toolchain.csv](./toolchain.csv) and
[system.csv](./system.csv). Packages downloading can be performed automatically with the following commands

    mkdir packages
    chmod -v a+wt packages
    cat toolchain.csv | cut -d";" -f3 | sed s/\"//g | wget -i - -P ./packages
    cat system.csv | cut -d";" -f3 | sed s/\"//g | wget -i - -P ./packages

## 3. Build temporary bootstrap toolchain

As described in [LFS](http://www.linuxfromscratch.org/lfs/view/7.3) specification, you first
need to build a host-independant system with cross-compilation tools (compiler, assembler, linker,
librairies,...) that reside in a `/TOOLS` directory. Just execute the following commands

    su root
    rm -rf {/mnt/rastakware,/TOOLS}
    mkdir -v /mnt/rastakware/{sources,patches}
    ln -sv /mnt/rastakware/TOOLS /TOOLS
    ln -sv /mnt/rastakware/TOOLS/lib /mnt/rastakware/TOOLS/lib64
    groupdel rasta
    userdel rasta
    groupadd rasta
    useradd -s /bin/bash -g rasta -m -k /dev/null rasta
    passwd rasta
    chown -R -v rasta /mnt/rastakware

Then create a dedicated user **rasta** for the compilation procedures and execute the script [toolchain.sh](./toolchain.sh)
with that user

    #export LC_ALL=POSIX
    #export PATH=/mnt/rastakware/tools/bin:$PATH

    su - rasta
    cp ./packages/* /mnt/rastakware/sources
    ./toolchain.sh

Lots of tools (bintuils, gcc, glibc, Linux API headers,...) will be compiled and installed in
the /TOOLS temporary directory. Those tools are required for building the final system in an autonomous way.




http://refspecs.linuxfoundation.org/


mktexpk

syslogd

crond

rwhod


‘cpu-vendor-os’

/etc/bashrc
/etc/dircolors
/etc/fstab
/etc/hosts
/etc/inputrc
/etc/profile
/etc/resolv.conf
/etc/vimrc
/root/.bash_profile
/root/.bashrc
/etc/sysconfig/network
/etc/sysconfig/ifconfig.eth0


http://freecode.com/
http://www.cert.org/
http://www.us-cert.gov/cas/signup.html
http://www.securityfocus.com/archive





















=====================================================================

http://www.linuxfromscratch.org/lfs/view/stable/


bootstrap
toolchain

1)
Need an already installed Linux system, the Host, for building the Rastakware Linux distribution.

Recommended partitions :


2)
Choose an <INSTALL> directory and create a <INSTALL>/sources directory.
$ chmod -v a+wt <INSTALL>/sources


3)
Download the build tools
Create a file wget-list with the following content :

http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz
http://ftp.gnu.org/gnu/automake/automake-1.12.3.tar.xz
http://ftp.gnu.org/gnu/bash/bash-4.2.tar.gz
http://ftp.gnu.org/gnu/binutils/binutils-2.22.tar.bz2
http://ftp.gnu.org/gnu/bison/bison-2.6.2.tar.xz
http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz
http://sourceforge.net/projects/check/files/check/0.9.8/check-0.9.8.tar.gz
http://ftp.gnu.org/gnu/coreutils/coreutils-8.19.tar.xz
http://ftp.gnu.org/gnu/dejagnu/dejagnu-1.5.tar.gz
http://ftp.gnu.org/gnu/diffutils/diffutils-3.2.tar.gz
http://prdownloads.sourceforge.net/e2fsprogs/e2fsprogs-1.42.5.tar.gz
http://prdownloads.sourceforge.net/expect/expect5.45.tar.gz
ftp://ftp.astron.com/pub/file/file-5.11.tar.gz
http://ftp.gnu.org/gnu/findutils/findutils-4.4.2.tar.gz
http://prdownloads.sourceforge.net/flex/flex-2.5.37.tar.bz2
http://ftp.gnu.org/gnu/gawk/gawk-4.0.1.tar.xz
http://ftp.gnu.org/gnu/gcc/gcc-4.7.1/gcc-4.7.1.tar.bz2
http://ftp.gnu.org/gnu/gdbm/gdbm-1.10.tar.gz
http://ftp.gnu.org/gnu/gettext/gettext-0.18.1.1.tar.gz
http://ftp.gnu.org/gnu/glibc/glibc-2.16.0.tar.xz
http://ftp.gnu.org/gnu/gmp/gmp-5.0.5.tar.xz
http://ftp.gnu.org/gnu/grep/grep-2.14.tar.xz
http://ftp.gnu.org/gnu/groff/groff-1.21.tar.gz
http://ftp.gnu.org/gnu/grub/grub-2.00.tar.xz
http://ftp.gnu.org/gnu/gzip/gzip-1.5.tar.xz
http://anduin.linuxfromscratch.org/sources/LFS/lfs-packages/conglomeration//iana-etc/iana-etc-2.30.tar.bz2
http://ftp.gnu.org/gnu/inetutils/inetutils-1.9.1.tar.gz
http://www.kernel.org/pub/linux/utils/net/iproute2/iproute2-3.5.1.tar.xz
http://ftp.altlinux.org/pub/people/legion/kbd/kbd-1.15.3.tar.gz
http://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-9.tar.xz
http://www.greenwoodsoftware.com/less/less-444.tar.gz
http://www.linuxfromscratch.org/lfs/downloads/7.2/lfs-bootscripts-20120901.tar.bz2
http://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.2.1.tar.gz
http://ftp.gnu.org/gnu/libtool/libtool-2.4.2.tar.gz
http://www.kernel.org/pub/linux/kernel/v3.x/linux-3.5.2.tar.xz
http://ftp.gnu.org/gnu/m4/m4-1.4.16.tar.bz2
http://ftp.gnu.org/gnu/make/make-3.82.tar.bz2
http://download.savannah.gnu.org/releases/man-db/man-db-2.6.2.tar.xz
http://www.kernel.org/pub/linux/docs/man-pages/man-pages-3.42.tar.xz
http://www.multiprecision.org/mpc/download/mpc-1.0.tar.gz
http://www.mpfr.org/mpfr-3.1.1/mpfr-3.1.1.tar.xz
ftp://ftp.gnu.org/gnu/ncurses/ncurses-5.9.tar.gz
http://ftp.gnu.org/gnu/patch/patch-2.6.1.tar.bz2
http://www.cpan.org/src/5.0/perl-5.16.1.tar.bz2
http://pkgconfig.freedesktop.org/releases/pkg-config-0.27.tar.gz
http://procps.sourceforge.net/procps-3.2.8.tar.gz
http://prdownloads.sourceforge.net/psmisc/psmisc-22.19.tar.gz
http://ftp.gnu.org/gnu/readline/readline-6.2.tar.gz
http://ftp.gnu.org/gnu/sed/sed-4.2.1.tar.bz2
http://pkg-shadow.alioth.debian.org/releases/shadow-4.1.5.1.tar.bz2
http://www.infodrom.org/projects/sysklogd/download/sysklogd-1.5.tar.gz
http://download.savannah.gnu.org/releases/sysvinit/sysvinit-2.88dsf.tar.bz2
http://ftp.gnu.org/gnu/tar/tar-1.26.tar.bz2
http://prdownloads.sourceforge.net/tcl/tcl8.5.12-src.tar.gz
http://www.iana.org//time-zones/repository/releases/tzdata2012e.tar.gz
http://ftp.gnu.org/gnu/texinfo/texinfo-4.13a.tar.gz
http://www.freedesktop.org/software/systemd/systemd-188.tar.xz
http://anduin.linuxfromscratch.org/sources/other/udev-lfs-188-3.tar.bz2
http://www.kernel.org/pub/linux/utils/util-linux/v2.21/util-linux-2.21.2.tar.xz
ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
http://tukaani.org/xz/xz-5.0.4.tar.xz
http://www.zlib.net/zlib-1.2.7.tar.bz2
http://www.linuxfromscratch.org/patches/lfs/7.2/bash-4.2-fixes-8.patch
http://www.linuxfromscratch.org/patches/lfs/7.2/binutils-2.22-build_fix-1.patch
http://www.linuxfromscratch.org/patches/lfs/7.2/bzip2-1.0.6-install_docs-1.patch
http://www.linuxfromscratch.org/patches/lfs/7.2/coreutils-8.19-i18n-1.patch
http://www.linuxfromscratch.org/patches/lfs/7.2/flex-2.5.37-bison-2.6.1-1.patch
http://www.linuxfromscratch.org/patches/lfs/7.2/glibc-2.16.0-res_query_fix-1.patch
http://www.linuxfromscratch.org/patches/lfs/7.2/kbd-1.15.3-upstream_fixes-1.patch
http://www.linuxfromscratch.org/patches/lfs/7.2/kbd-1.15.3-backspace-1.patch
http://www.linuxfromscratch.org/patches/lfs/7.2/kmod-9-testsuite-1.patch
http://www.linuxfromscratch.org/patches/lfs/7.2/make-3.82-upstream_fixes-2.patch
http://www.linuxfromscratch.org/patches/lfs/7.2/patch-2.6.1-test_fix-1.patch
http://www.linuxfromscratch.org/patches/lfs/7.2/perl-5.16.1-libc-2.patch
http://www.linuxfromscratch.org/patches/lfs/7.2/procps-3.2.8-fix_HZ_errors-1.patch
http://www.linuxfromscratch.org/patches/lfs/7.2/procps-3.2.8-watch_unicode-1.patch
http://www.linuxfromscratch.org/patches/lfs/7.2/readline-6.2-fixes-1.patch
http://www.linuxfromscratch.org/patches/lfs/7.2/sed-4.2.1-testsuite_fixes-1.patch

And execute the following command
$ cat wget-list | wget -i - -P <INSTALL>/sources

4)
Create a tools directory with the following command
$ mkdir -v <INSTALL>/tools
$ export LC_ALL=POSIX
$ export PATH=<INSTALL>/tools/bin:$PATH


5)
Build host-independant toolchain (compiler, assembler, linker, libraries,...)

Compile cross binutils
tar xvfz binutils.tar.gz
patch -Np1 -i binutils-2.22-build_fix-1.patch
mkdir -v binutils-build
cd binutils-build
time { ../binutils-2.22/configure     \
    --prefix=<INSTALL>/tools        \
    --with-sysroot=/mnt/lfs        \
    --with-lib-path=<INSTALL>/tools/lib  \
    --target=i686-rastakware-gnu-gcc       \
    --disable-nls              \
    --disable-werror \
    && make && make install; }

6)
Compile cross Gcc

tar xvfz gcc.tar.gz
patch gcc
cd gcc
tar -Jxf ../mpfr-3.1.1.tar.xz
mv -v mpfr-3.1.1 mpfr
tar -Jxf ../gmp-5.0.5.tar.xz
mv -v gmp-5.0.5 gmp
tar -zxf ../mpc-1.0.tar.gz
mv -v mpc-1.0 mpc

In gcc/config/linux64.h and gcc/config/linux.h gcc/config/sysv4.h, remove "/usr/include" default search directory
and add the <INSTALL>/tools/lib for search directory.

<INSTALL>/tools/lib/ld, <INSTALL>/tools/lib64/ld or <INSTALL>/tools/lib32/ld

#undef STANDARD_STARTFILE_PREFIX_1
#undef STANDARD_STARTFILE_PREFIX_2
#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"
#define STANDARD_STARTFILE_PREFIX_2 ""' >> $file


sed -i '/k prot/agcc_cv_libc_provides_ssp=yes' gcc/configure

mkdir -v ../gcc-build
cd ../gcc-build

../gcc-4.7.1/configure         \
    --target=i686-rastakware-gnu-gcc          \
    --prefix=<INSTALL>/tools            \
    --with-sysroot=/mnt/lfs   \
    --with-newlib              \
    --without-headers          \
    --with-local-prefix=<INSTALL>/tools \
    --with-native-system-header-dir=<INSTALL>/tools/include \
    --disable-nls              \
    --disable-shared           \
    --disable-multilib         \
    --disable-decimal-float    \
    --disable-threads          \
    --disable-libmudflap       \
    --disable-libssp           \
    --disable-libgomp          \
    --disable-libquadmath      \
    --enable-languages=c       \
    --with-mpfr-include=$(pwd)/../gcc-4.7.1/mpfr/src \
    --with-mpfr-lib=$(pwd)/mpfr/src/.libs
make
make install


7)
Install Linux API headers

make mrproper
make headers_check
make INSTALL_HDR_PATH=dest headers_install
cp -rv dest/include/* <INSTALL>/tools/include

8)
Compilation of Glibc

if [ ! -r /usr/include/rpc/types.h ]; then 
  su -c 'mkdir -p /usr/include/rpc'
  su -c 'cp -v sunrpc/rpc/*.h /usr/include/rpc'
fi

sed -i 's/ -lgcc_s//' Makeconfig

mkdir -v ../glibc-build
cd ../glibc-build


../glibc-2.16.0/configure                             \
      --prefix=<INSTALL>/tools                        \
      --host=i686-rastakware-gnu-gcc              \
      --build=$(../glibc-2.16.0/scripts/config.guess) \
      --disable-profile                               \
      --enable-add-ons                                \
      --enable-kernel=2.6.25                          \
      --with-headers=/tools/include                   \
      libc_cv_forced_unwind=yes                       \
      libc_cv_ctors_header=yes                        \
      libc_cv_c_cleanup=yes
      
make
make install


echo 'main(){}' > dummy.c
$LFS_TGT-gcc dummy.c
readelf -l a.out | grep ': /tools'
rm -v dummy.c a.out


9)
Compilation of binutils Pass 2

tar xvfz binutils.tar.gz
patch -Np1 -i ../binutils-2.22-build_fix-1.patch
mkdir -v ../binutils-build
cd ../binutils-build

CC=i686-rastakware-gnu-gcc            \
AR=i686-rastakware-gnu-ar             \
RANLIB=i686-rastakware-gnu-ranlib     \
../binutils-2.22/configure \
    --prefix=<INSTALL>/tools        \
    --disable-nls          \
    --with-lib-path=<INSTALL>/tools/lib

make
make install

make -C ld clean
make -C ld LIB_PATH=/usr/lib:/lib
cp -v ld/ld-new <INSTALL>/tools/bin


10)
Compilation of GCC Pass 2

tar -Jxf ../mpfr-3.1.1.tar.xz
mv -v mpfr-3.1.1 mpfr
tar -Jxf ../gmp-5.0.5.tar.xz
mv -v gmp-5.0.5 gmp
tar -zxf ../mpc-1.0.tar.gz
mv -v mpc-1.0 mpc

mkdir -v ../gcc-build
cd ../gcc-build

CC=i686-rastakware-gnu-gcc \
AR=i686-rastakware-gnu-ar                  \
RANLIB=i686-rastakware-gnu-ranlib          \
../gcc-4.7.1/configure          \
    --prefix=/tools             \
    --with-local-prefix=/tools  \
    --with-native-system-header-dir=<INSTALL>/tools/include \
    --enable-clocale=gnu        \
    --enable-shared             \
    --enable-threads=posix      \
    --enable-__cxa_atexit       \
    --enable-languages=c,c++    \
    --disable-libstdcxx-pch     \
    --disable-multilib          \
    --disable-bootstrap         \
    --disable-libgomp           \
    --with-mpfr-include=$(pwd)/../gcc-4.7.1/mpfr/src \
    --with-mpfr-lib=$(pwd)/mpfr/src/.libs
    
make
make install

ln -vs gcc <INSTALL>/tools/bin/cc

echo 'main(){}' > dummy.c
cc dummy.c
readelf -l a.out | grep ': /tools'

rm -v dummy.c a.out

11)
Compilation of Tcl

./configure --prefix=<INSTALL>/tools
make
TZ=UTC make test
make install
chmod -v u+w <INSTALL>/tools/lib/libtcl8.5.so
make install-private-headers
ln -sv tclsh8.5 <INSTALL>/tools/bin/tclsh


12)
Compilation of Expect

cp -v configure{,.orig}
sed 's:/usr/local/bin:/bin:' configure.orig > configure

./configure --prefix=<INSTALL>/tools --with-tcl=/tools/lib --with-tclinclude=<INSTALL>/tools/include
make
make test
make SCRIPTS="" install

13)
Compilation of DejaGNU

./configure --prefix=<INSTALL>/tools
make install
make check

14)
Compilation of Check

./configure --prefix=<INSTALL>/tools
make
make check
make install

15)
Compilation of Ncurses

./configure --prefix=<INSTALL>/tools --with-shared \
    --without-debug --without-ada --enable-overwrite
make
make install


16)
Compilation of Bash

patch -Np1 -i ../bash-4.2-fixes-8.patch
./configure --prefix=<INSTALL>/tools --without-bash-malloc
make
make tests
make install
ln -vs bash <INSTALL>/tools/bin/sh

17)
Compilation of Bzip2

make
make PREFIX=<INSTALL>/tools install


18)
Compilation of Coreutils

./configure --prefix=<INSTALL>/tools --enable-install-program=hostname
make
make RUN_EXPENSIVE_TESTS=yes check
make install

19)
Compilation of Diffutils

sed -i -e '/gets is a/d' lib/stdio.in.h
./configure --prefix=<INSTALL>/tools
make
make check
make install

20)
Compilation of File

./configure --prefix=<INSTALL>/tools
make
make check
make install

21)
Compilation of Findutils

./configure --prefix=<INSTALL>/tools
make
make check
make install

22)
Compilation of Gawk

./configure --prefix=<INSTALL>/tools
make
make check
make install

23)
Compilation Gettext

sed -i -e '/gets is a/d' gettext-*/*/stdio.in.h
cd gettext-tools
EMACS="no" ./configure --prefix=<INSTALL>/tools --disable-shared

make -C gnulib-lib
make -C src msgfmt
cp -v src/msgfmt <INSTALL>/tools/bin

24)
Compilation of Grep

./configure --prefix=<INSTALL>/tools
make
make check
make install

25)
Compilation of Gzip

./configure --prefix=<INSTALL>/tools
make
make check
make install

26)
Compilation of M4

sed -i -e '/gets is a/d' lib/stdio.in.h
./configure --prefix=<INSTALL>/tools
make
make check
make install

27)
Compilation of Make

./configure --prefix=<INSTALL>/tools
make
make check
make install

28)
Compilation of Patch

./configure --prefix=<INSTALL>/tools
make
make check
make install

29)
Compilation of Perl

patch -Np1 -i ../perl-5.16.1-libc-2.patch
sh Configure -des -Dprefix=<INSTALL>/tools
make
cp -v perl cpan/podlators/pod2man <INSTALL>/tools/bin
mkdir -pv <INSTALL>/tools/lib/perl5/5.16.1
cp -Rv lib/* <INSTALL>/tools/lib/perl5/5.16.1


30)
Compilation of Sed

./configure --prefix=<INSTALL>/tools
make
make check
make install


31)
Compilation of Tar

sed -i -e '/gets is a/d' gnu/stdio.in.h
./configure --prefix=<INSTALL>/tools
make
make check
make install


32)
Compilation of Texinfo

./configure --prefix=<INSTALL>/tools
make
make check
make install


33)
Compilation of Xz-utils

./configure --prefix=<INSTALL>/tools
make
make check
make install


34)
Stripping of binaries and libraries

strip --strip-debug <INSTALL>/tools/lib/*
strip --strip-unneeded <INSTALL>/tools/{,s}bin/*
rm -rf <INSTALL>/tools/{,share}/{info,man,doc}

chown -R root:root <INSTALL>/tools


35)
Preparing virtual Kernel file system

mkdir -v <INSTALL>/{dev,proc,sys}

mknod -m 600 <INSTALL>/dev/console c 5 1
mknod -m 666 <INSTALL>/dev/null c 1 3

36)
Mounting dev

mount -v --bind /dev <INSTALL>/dev

37)
Mount remaining virtual kernel filesystem

mount -vt devpts devpts <INSTALL>/dev/pts
mount -vt proc proc <INSTALL>/proc
mount -vt sysfs sysfs <INSTALL>/sys

if [ -h /dev/shm ]; then
   rm -f <INSTALL>/dev/shm
   mkdir <INSTALL>/dev/shm
fi
mount -vt tmpfs shm <INSTALL>/dev/shm


38)
Package management

pkgtool
installpkg
removepkg
upgradepkg

/etc/hosts
/etc/fstab
/etc/passwd
/etc/group
/etc/shadow
/etc/ld.so.conf
/etc/sysconfig/rc.site
/etc/sysconfig/network
/etc/sysconfig/ifconfig.eth0

39)
Chroot environment

chroot "<INSTALL>" /tools/bin/env -i \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='\u:\w\$ '              \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    /tools/bin/bash --login +h
    
40)
Creating directories

mkdir -pv /{bin,boot,etc/{opt,sysconfig},home,lib,mnt,opt,run}
mkdir -pv /{media/{floppy,cdrom,usb},sbin,srv,var}
install -dv -m 0750 /root
install -dv -m 1777 /tmp /var/tmp
mkdir -pv /usr/{doc,man,src,pkg}
mkdir -pv /usr/{,local/}{bin,include,lib,sbin,src}
mkdir -pv /usr/{,local/}share/{doc,info,locale,man}
mkdir -v  /usr/{,local/}share/{misc,terminfo,zoneinfo}
mkdir -pv /usr/{,local/}share/man/man{1..8}
for dir in /usr /usr/local; do
  ln -sv share/{man,doc,info} $dir
done
case $(uname -m) in
 x86_64) ln -sv lib /lib64 && ln -sv lib /usr/lib64 ;;
esac
mkdir -v /var/{log,mail,spool}
ln -sv /run /var/run
ln -sv /run/lock /var/lock
mkdir -pv /var/{opt,cache,lib/{misc,locate},local}


ln -sv /tools/bin/{bash,cat,echo,pwd,stty} /bin
ln -sv /tools/bin/perl /usr/bin
ln -sv /tools/lib/libgcc_s.so{,.1} /usr/lib
ln -sv /tools/lib/libstdc++.so{,.6} /usr/lib
sed 's/tools/usr/' /tools/lib/libstdc++.la > /usr/lib/libstdc++.la
ln -sv bash /bin/sh

touch /etc/mtab

cat > /etc/passwd << "EOF"
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/dev/null:/bin/false
nobody:x:99:99:Unprivileged User:/dev/null:/bin/false
EOF


cat > /etc/group << "EOF"
root:x:0:
bin:x:1:
sys:x:2:
kmem:x:3:
tape:x:4:
tty:x:5:
daemon:x:6:
floppy:x:7:
disk:x:8:
lp:x:9:
dialout:x:10:
audio:x:11:
video:x:12:
utmp:x:13:
usb:x:14:
cdrom:x:15:
mail:x:34:
nogroup:x:99:
EOF

exec /tools/bin/bash --login +h

touch /var/log/{btmp,lastlog,wtmp}
chgrp -v utmp /var/log/lastlog
chmod -v 664  /var/log/lastlog
chmod -v 600  /var/log/btmp


41)
Linux Headers installation

make mrproper
make headers_check
make INSTALL_HDR_PATH=dest headers_install
find dest/include \( -name .install -o -name ..install.cmd \) -delete
cp -rv dest/include/* /usr/include

42)
Installing man-pages

make install

43)
Glibc compilation


sed -i 's#<rpc/types.h>#"rpc/types.h"#' sunrpc/rpc_clntout.c
sed -i '/test-installation.pl/d' Makefile
sed -i 's|@BASH@|/bin/bash|' elf/ldd.bash.in
patch -Np1 -i ../glibc-2.16.0-res_query_fix-1.patch

mkdir -v ../glibc-build
cd ../glibc-build
../glibc-2.16.0/configure  \
    --prefix=/usr          \
    --disable-profile      \
    --enable-add-ons       \
    --enable-kernel=2.6.25 \
    --libexecdir=/usr/lib/glibc
make
make -k check 2>&1 | tee glibc-check-log
grep Error glibc-check-log

touch /etc/ld.so.conf
make install

cp -v ../glibc-2.16.0/sunrpc/rpc/*.h /usr/include/rpc
cp -v ../glibc-2.16.0/sunrpc/rpcsvc/*.h /usr/include/rpcsvc
cp -v ../glibc-2.16.0/nis/rpcsvc/*.h /usr/include/rpcsvc

mkdir -pv /usr/lib/locale

localedef -i cs_CZ -f UTF-8 cs_CZ.UTF-8
localedef -i de_DE -f ISO-8859-1 de_DE
localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro
localedef -i de_DE -f UTF-8 de_DE.UTF-8
localedef -i en_GB -f UTF-8 en_GB.UTF-8
localedef -i en_HK -f ISO-8859-1 en_HK
localedef -i en_PH -f ISO-8859-1 en_PH
localedef -i en_US -f ISO-8859-1 en_US
localedef -i en_US -f UTF-8 en_US.UTF-8
localedef -i es_MX -f ISO-8859-1 es_MX
localedef -i fa_IR -f UTF-8 fa_IR
localedef -i fr_FR -f ISO-8859-1 fr_FR
localedef -i fr_FR@euro -f ISO-8859-15 fr_FR@euro
localedef -i fr_FR -f UTF-8 fr_FR.UTF-8
localedef -i it_IT -f ISO-8859-1 it_IT
localedef -i it_IT -f UTF-8 it_IT.UTF-8
localedef -i ja_JP -f EUC-JP ja_JP
localedef -i ru_RU -f KOI8-R ru_RU.KOI8-R
localedef -i ru_RU -f UTF-8 ru_RU.UTF-8
localedef -i tr_TR -f UTF-8 tr_TR.UTF-8
localedef -i zh_CN -f GB18030 zh_CN.GB18030

or this command
make localedata/install-locales


cat > /etc/nsswitch.conf << "EOF"
# Begin /etc/nsswitch.conf

passwd: files
group: files
shadow: files

hosts: files dns
networks: files

protocols: files
services: files
ethers: files
rpc: files

# End /etc/nsswitch.conf
EOF


tar -xf ../tzdata2012e.tar.gz
ZONEINFO=/usr/share/zoneinfo
mkdir -pv $ZONEINFO/{posix,right} 

for tz in etcetera southamerica northamerica europe africa antarctica  \
          asia australasia backward pacificnew solar87 solar88 solar89 \
          systemv; do
    zic -L /dev/null   -d $ZONEINFO       -y "sh yearistype.sh" ${tz} 
    zic -L /dev/null   -d $ZONEINFO/posix -y "sh yearistype.sh" ${tz} 
    zic -L leapseconds -d $ZONEINFO/right -y "sh yearistype.sh" ${tz}
done

cp -v zone.tab iso3166.tab $ZONEINFO
zic -d $ZONEINFO -p America/New_York
unset ZONEINFO


tzselect
cp -v --remove-destination /usr/share/zoneinfo/<xxx> /etc/localtime

44)
Installation of dynamic loader

cat > /etc/ld.so.conf << "EOF"
# Begin /etc/ld.so.conf
/usr/local/lib
/opt/lib

EOF

or

cat >> /etc/ld.so.conf << "EOF"
# Add an include directory
include /etc/ld.so.conf.d/*.conf

EOF
mkdir /etc/ld.so.conf.d


45)
Adjusting toolchain

mv -v /tools/bin/{ld,ld-old}
mv -v /tools/$(gcc -dumpmachine)/bin/{ld,ld-old}
mv -v /tools/bin/{ld-new,ld}
ln -sv /tools/bin/ld /tools/$(gcc -dumpmachine)/bin/ld

gcc -dumpspecs | sed -e 's@/tools@@g' \
    -e '/\*startfile_prefix_spec:/{n;s@.*@/usr/lib/ @}' \
    -e '/\*cpp:/{n;s@$@ -isystem /usr/include@}' > \
    `dirname $(gcc --print-libgcc-file-name)`/specs
    
echo 'main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log
readelf -l a.out | grep ': /lib'

grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log

grep -B1 '^ /usr/include' dummy.log

grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'

grep "/lib.*/libc.so.6 " dummy.log

grep found dummy.log

rm -v dummy.c a.out dummy.log



=====================================================================


## TODO

- supported hardware devices
- automatic/manual OS upgrade
- desktop environment
- package management system (deb, rpm, apt-get, yum, pkgutils, installpkg, pacman, etc...)
- OS installer
- configuration tools
- LSB compliancy
- POSIX compliancy




Lancer le site Web avec Maven
-----------------------------
Taper la commande `mvn jetty:run` ou `mvn tomcat7:run`. Une fois que le
serveur Jetty ou Tomcat est lancé, ouvrir un navigateur avec l'URL suivante

    http://localhost:8080/kenoconcept/



TODO configuration servlet CGI tomcat et jetty
TODO configuration Wordpress
TODO affichage d'une liste de résultats
TODO import fichier historique Keno FDJ
TODO parsing page resultat FDJ
TODO affichage historique Keno
TODO mettre en ligne cette version 0.1

TODO cliquer sur un numero, le surligner partout dans l'historique
TODO retard de sortie des numéros
TODO nombre de sortie des numéros sur une periode donnee
TODO numéros amis sur 1, 2, 3, 4 ou 5 dernières sorties 
TODO numéros annonciateurs sur 1, 2, 3, 4 ou 5 dernières sorties à Tirage-1, Tirage-2, Tirage-3, Tirage-4, Tirage-5
TODO trouver les x-uplets les moins sortis
TODO trouver les x-uplets les plus sortis
TODO trouver les combinaisons deja sorties contenant un x-uplet
TODO configuration HaProxy pour partage plusieurs site Web sur une seule machine
TODO Docker pour déploiement
TODO configuration firewall Bind


## References

1. [HTML 5.1](http://www.w3.org/TR/html51/single-page.html "HTML 5.1 specification")    
2. [CSS 2](http://www.w3.org/TR/CSS2/css2.pdf "CSS 2 specification")    
3. Cookie specification - [RFC2964](http://www.ietf.org/rfc/rfc2964.txt "RFC2964") - [RFC2965](http://www.ietf.org/rfc/rfc2965.txt "RFC2965")    

