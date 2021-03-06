#!/bin/bash
#
. ../base.sh

app_name=$1
url=$2

if [ $# != 2 ]; then
    url="http://centos-files.liaohuqiu.net/f/$app_name.tar.gz"
fi

install_dir="/data0/install"
src_dir=$install_dir/src
downloads_dir=$install_dir/downloads

make_dir $downloads_dir;
make_dir $src_dir;

if [ ! -e $downloads_dir/$app_name.tar.gz ]; then

    exe_cmd "rm -rf $downloads_dir/$app_name.tar.gz"
    exe_cmd "cd $downloads_dir"
    exe_cmd "wget $url -P $downloads_dir"

fi

if [ ! -d $src_dir/$app_name ]; then
    exe_cmd "tar -zxvf $downloads_dir/$app_name.tar.gz -C $src_dir"
fi
exe_cmd "cd $src_dir/$app_name"
exe_cmd "./configure"
exe_cmd "make && make install"
