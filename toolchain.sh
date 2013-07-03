#! /usr/bin/env sh

rm -rf /mnt/rastakware/build
mkdir /mnt/rastakware/build


### compile cross Binutils
cd /mnt/rastakware/build
rm -rf binutils-2.23.2
tar xvfz /mnt/rastakware/sources/binutils-2.23.2.tar.gz
rm -rf binutils-build
mkdir -v binutils-build
cd binutils-build
time { ../binutils-2.23.2/configure \
--target=i386-rastakware-linux-gnu \
--prefix=/TOOLS \
--with-sysroot=/mnt/rastakware \
--with-lib-path=/TOOLS/lib \
--disable-nls \
&& make && make install ; }


#rm -rf *
#time { ../binutils-2.23.2/configure \
#--prefix=/TOOLS \
#--target=x86_64-rastakware-linux-gnu \
#--with-sysroot=/mnt/rastakware \
#--with-lib-path=/TOOLS/lib \
#--disable-nls \
#&& make && make install; }

#rm -rf *
#time { ../binutils-2.23.2/configure \
#--prefix=/TOOLS \
#--target=x86_64-rastakware-darwin12.3.0 \
#--with-lib-path=/TOOLS/lib \
#--with-build-sysroot=/mnt/rastakware \
#--disable-nls \
#&& make && make install; }

/mnt/rastakware/TOOLS/bin/i386-rastakware-linux-gnu-ld --verbose | grep SEARCH
#/mnt/rastakware/TOOLS/bin/x86_64-rastakware-linux-gnu-ld --verbose | grep SEARCH
#/mnt/rastakware/TOOLS/bin/x86_64-rastakware-darwin12.3.0-ld --verbose | grep SEARCH


### compile cross Gcc
cd /mnt/rastakware/build
rm -rf gcc-4.8.0
rm -rf gmp-5.1.1
rm -rf mpfr-3.1.2
rm -rf mpc-1.0.1
tar xvzf /mnt/rastakware/sources/gcc-4.8.0.tar.gz
tar xvjf /mnt/rastakware/sources/gmp-5.1.1.tar.bz2
tar xvjf /mnt/rastakware/sources/mpfr-3.1.2.tar.bz2
tar xvzf /mnt/rastakware/sources/mpc-1.0.1.tar.gz
cp -r gmp-5.1.1 gcc-4.8.0/gmp    
cp -r mpfr-3.1.2 gcc-4.8.0/mpfr
cp -r mpc-1.0.1 gcc-4.8.0/mpc

cd gcc-4.8.0
for file in $(find gcc/config -name linux64.h -o -name linux.h -o -name sysv4.h)
do
cp -uv $file{,.orig}
sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' \
-e 's@/usr@/tools@g' $file.orig > $file
echo '
#undef STANDARD_STARTFILE_PREFIX_1
#undef STANDARD_STARTFILE_PREFIX_2
#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"
#define STANDARD_STARTFILE_PREFIX_2 ""' >> $file
touch $file.orig
done
sed -i '/k prot/agcc_cv_libc_provides_ssp=yes' gcc/configure
cd ..
rm -rf gcc-build
mkdir -v gcc-build
cd gcc-build

rm -rf *
time { ../gcc-4.8.0/configure \
--target=i386-rastakware-linux-gnu \
--prefix=/TOOLS \
--with-sysroot=/mnt/rastakware \
--with-newlib \
--without-headers \
--with-local-prefix=/TOOLS \
--with-native-system-header-dir=/TOOLS/include \
--disable-nls \
--disable-shared \
--disable-multilib \
--disable-decimal-float \
--disable-threads \
--disable-libatomic \
--disable-libgomp \
--disable-libitm \
--disable-libmudflap \
--disable-libquadmath \
--disable-libsanitizer \
--disable-libssp \
--disable-libstdc++-v3 \
--enable-languages=c,c++ \
--with-mpfr-include=$(pwd)/../gcc-4.8.0/mpfr/src \
--with-mpfr-lib=$(pwd)/mpfr/src/.libs \
&& make && make install; }

ln -sv libgcc.a `/mnt/rastakware/TOOLS/bin/i386-rastakware-linux-gnu-gcc -print-libgcc-file-name | sed 's/libgcc/&_eh/'`


gcc -print-prog-name=ld
ln -sv gcc /TOOLS/bin/cc




### compile bootstrap Linux API headers
cd /mnt/rastakware/build
rm -rf linux-3.9
tar xvjf /mnt/rastakware/sources/linux-3.9.tar.bz2
cd linux-3.9
cp /mnt/rastakware/sources/patch-3.9.1.bz2 .
bzip2 -d patch-3.9.1.bz2
patch -Np1 -i patch-3.9.1
make mrproper
make headers_check
make INSTALL_HDR_PATH=dest headers_install
rm -rf /TOOLS/include
cp -rv dest/include/* /TOOLS/include



### compile bootstrap Glibc
cd /mnt/rastakware/build
rm -rf glibc-2.17
tar xvzf /mnt/rastakware/sources/glibc-2.17.tar.gz
rm -rf glibc-build
mkdir -v glibc-build
cd glibc-build

rm -rf *
time { ../glibc-2.17/configure \
--target=i386-rastakware-linux-gnu \
--prefix=/TOOLS \
--build=$(../glibc-2.17/scripts/config.guess) \
--disable-profile \
--enable-kernel=2.6.25 \
--with-headers=/TOOLS/include \
libc_cv_forced_unwind=yes \
libc_cv_ctors_header=yes \
libc_cv_c_cleanup=yes \
&& make && make install; }


echo 'main(){}' > dummy.c
cc -v dummy.c
readelf -l a.out | grep ': /tools'
rm -v dummy.c a.out




### compile bootstrap Binutils


### compile bootstrap Gcc




