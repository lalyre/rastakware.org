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
[, cat, csh, chgrp, chmod, chown, cp, cpio, date, dd, df, dmesg, echo, ed, gzip, gunzip (--> gzip), false, ftp,
hostname, kill, ln, login, ls, mkdir, mknod, more, mount, mv, netstat, ping, ps,
pwd, rm, rmdir, sed, sh, stty, su, sync, tar, tftp, tcsh, true, test, umount, uname, zcat (--> gzip). **KO**

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
mh, perl, python, tclsh, wish, expect, chfn, cpp (C preprocessor). **KO**

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

## 3. Build cross-compilation toolchain

First build a host-independant system with cross-compilation tools (compiler, assembler, linker, librairies,...).

    su root
    rmdir -rf /mnt/rastakware
    mkdir -v /mnt/rastakware
    groupadd rasta
    useradd -s /bin/bash -g rasta -m -k /dev/null rasta
    passwd rasta
    chown -v rasta /mnt/rastawkare
    su - rasta
    cd /mnt/rastakware
    mkdir sources
    mkdir patches
    mkdir tools
    mkdir tools/bin
    mkdir tools/lib
    ln -sv /mnt/rastakware/tools /
    export LC_ALL=POSIX
    export PATH=/mnt/rastakware/tools/bin:$PATH

### compile cross Binutils

    cp binutils-2.23.2.tar.gz /mnt/rastakware/sources
    cd /mnt/rastakware/sources
    tar xvfz binutils-2.23.2.tar.gz 
    mkdir -v binutils-build
    cd binutils-build
    time { ../binutils-2.23.2/configure \
    --prefix=/mnt/rastakware/tools \
    --with-build-sysroot=/mnt/rastakware \
    --with-lib-path=/tools/lib \
    --target=x86-rastakware-linux \
    && make && make install; }


--target=x86-rastakware-linux
--target=x86_64-rastakware-linux

ld --verbose | grep SEARCH
gcc -print-prog-name=ld




### compile cross Gcc


tar -Jxf ../mpfr-3.1.1.tar.xz
mv -v mpfr-3.1.1 mpfr
tar -Jxf ../gmp-5.1.1.tar.xz
mv -v gmp-5.1.1 gmp
tar -zxf ../mpc-1.0.1.tar.gz
mv -v mpc-1.0.1 mpc


mkdir -v ../gcc-build
cd ../gcc-build

../gcc-4.7.2/configure         \
    --target=$LFS_TGT          \
    --prefix=/tools            \
    --with-sysroot=$LFS        \
    --with-newlib              \
    --without-headers          \
    --with-local-prefix=/tools \
    --with-native-system-header-dir=/tools/include \
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
    --with-mpfr-include=$(pwd)/../gcc-4.7.2/mpfr/src \
    --with-mpfr-lib=$(pwd)/mpfr/src/.libs

make

make install

ln -sv libgcc.a `$LFS_TGT-gcc -print-libgcc-file-name | sed 's/libgcc/&_eh/'`



### compile bootstrap Linux API headers 

    make mrproper
    make headers_check
    make INSTALL_HDR_PATH=dest headers_install
    cp -rv dest/include/* /tools/include



### compile bootstrap Glibc



### compile bootstrap Binutils


### compile bootstrap Gcc








http://refspecs.linuxfoundation.org/


mktexpk

syslogd

crond

rwhod



## TODO

- supported hardware devices
- automatic/manual OS upgrade
- desktop environment
- package management system (deb, rpm, apt-get, yum, pkgutils, installpkg, pacman, etc...)
- OS installer
- configuration tools
- LSB compliancy
- POSIX compliancy


