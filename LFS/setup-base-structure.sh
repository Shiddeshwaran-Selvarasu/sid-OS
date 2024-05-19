#!/bin/bash

check_source () {
    cd $SOURCES 
	md5sum -c $MD5SUMS
}

export_variables () {
    LC_ALL=POSIX
    LFS_TGT=$(uname -m)-lfs-linux-gnu
    PATH=$LFS/tools/bin:$PATH
    CONFIG_SITE=$LFS/usr/share/config.site

    export LC_ALL LFS_TGT LFS PATH CONFIG_SITE
}

start_build () {
    # setup LFS and source folder
    mkdir -pv $SOURCES
    chmod -v a+wt $SOURCES
    cp -r $TARBALLS/* $SOURCES/
    chown $USER:$USER $SOURCES/*

    check_source

    # create other required folders for build
    mkdir -pv $LFS/{etc,var,home,root} $LFS/usr/{bin,lib,sbin}
	mkdir -pv $LFS/tools
	ln -sv usr/bin $LFS/bin
	ln -sv usr/lib $LFS/lib
	ln -sv usr/sbin $LFS/sbin

	# Changes for 64-BIT based systems
    case $(uname -m) in 
        x86_64|aarch64) 
            mkdir -pv $LFS/lib64 
            ;;
    esac;

    export_variables
}


echo "************************** LFS Setup Started ******************************"

parse_params () {
    local param=$1
    case "$param" in
        tarballs=*)
            TARBALLS=`echo $param | cut -d'=' -f 2`
            echo TARBALLS = $TARBALLS
            ;;
        lfs=*)
            LFS=`echo $param | cut -d'=' -f 2`
            echo LFS = $LFS
            ;;
        sources=*)
            SOURCES=`echo $param | cut -d'=' -f 2`
            echo SOURCES = $SOURCES
            ;;
        md5sum=*)
            MD5SUMS=`echo $param | cut -d'=' -f 2`
            echo MD5SUMS = $MD5SUMS
            ;;
        *) 
            echo "unknown param $param, so exiting..."
    esac
}

for arg in "$@"
do
    parse_params $arg
done

help () {
    echo "  ____________________________________________________________________________________"
    echo " |                                                                                    |"
    echo " | ./setup-base-structure.sh [tarballs] [lfs] [sources] [md5sum]                      |"
    echo " | tarballs   - path to tarballs directory                                            |"
    echo " | lfs        - LFS base path                                                         |"
    echo " | sources    - path to sources directory                                             |"
    echo " | md5sum     - md5sum file path                                                      |"
    echo " |                                                                                    |"
    echo " | example:                                                                           |" 
    echo " | ./build.sh tarballs=/path/to/tarballs lfs=path/to/lfs/dir md5sum=md5sum/file/path  |"
    echo " |     sources=/path/to/source/dir                                                    |"
    echo " |  Note: arguments can be passed in any order                                        |"
    echo " |____________________________________________________________________________________|"
    echo ""
    exit 1
}

if [ -z $TARBALLS ] \
    || [ -z $LFS ] \
    || [ -z $SOURCES ] \
    || [ -z $MD5SUMS ]; then
    echo "All required arguments not passed. Exiting..."
    help
fi

# starting point
start_build