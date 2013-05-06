rastakware.org
==============

Rastakware GNU/Linux distribution

# 1. FHS 2.3 requirements

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
    /lib64
    /lib/modules
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
pwd, rm, rmdir, sed, sh, stty, su, sync, tar, tftp, tcsh, true, test, umount, uname, zcat (--> gzip).

Under the `/dev` directory you should have the `MAKEDEV` binary.

Under the `/etc` directory you must have the following configuration files :
csh.login, exports, fstab, ftpusers, gateways, gettydefs, group, host.conf, hosts,
hosts.allow, hosts.deny, hosts.equiv, hosts.lpd, inetd.conf, inittab, issue, ld.so.conf,
motd, mtab, mtools.conf, networks, passwd, printcap, profile, protocols, resolv.conf, rpc,
securetty, services, shells, syslog.conf. 

Under the `/etc/X11` directory you should have the following configuration files :
Xconfig, XF86Config, Xmodmap.

Under the `/etc/sgml` and `/etc/xml` directories you should have a `catalog` file.

Under the `/lib` directory you should have the following files :
libc.so.*, ld*, cpp (--> /usr/bin/cpp).

Under the `/sbin` directory you should have the following files :
shutdown, fastboot, fasthalt, fdisk, fsck, fsck.*, getty, halt, ifconfig,
init, mkfs, mkfs.*, mkswap, reboot, route, swapon, swapoff, update, badblocks,
dumpe2fs, e2fsck, mke2fs, mklost+found, tune2fs, lilo, ldconfig, sln, ssync,
ctrlaltdel, kbdrate.

Under the `/usr/bin` directory you should have the following files :
mh, perl, python, tclsh, wish, expect, chfn, cpp (C preprocessor).

Under the `/usr/sbin` directory you should have the following files :
makewhatis, sendmail, useradd, usermod.

Under the `/usr/share/dict` directory, you should have the `words` file.

Under the `/usr/share/misc` directory you should have the files :
ascii, magic, termcap, termcap.db.

Under the `/var/lib/hwclock` directory you should have the `adjtime` file.

Under the `/var/log` directory you should have the following files :
lastlog, messages, wtmp.

Under the `/boot` directory you should have the `vmlinux` file. 

Under the `/dev` directory you should have the following files :
null, zero, tty.


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

    rmdir -rf /mnt/rastakware
    mkdir -v /mnt/rastakware
    cd /mnt/rastakware
    mkdir sources
    mkdir patches
    mkdir tools
    mkdir tools/bin
    export LC_ALL=POSIX
    export PATH=/mnt/rastakware/tools/bin:$PATH

## compile cross binutils

## compile cross gcc













http://refspecs.linuxfoundation.org/


mktexpk

syslogd

crond

rwhod



# TODO

- supported hardware devices
- automatic/manual OS upgrade
- desktop environment
- package management system (deb, rpm, apt-get, yum, pkgutils, installpkg, pacman, etc...)
- OS installer
- configuration tools
- LSB compliancy
- POSIX compliancy


