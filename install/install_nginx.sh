#!/bin/bash

. ./install_base.sh

app=nginx-1.4.2
url="http://centos-files.liaohuqiu.net/f/nginx-1.4.2.tar.gz"

current_dir=`pwd`
nginx_path="/usr/local/nginx"
sample_config_dir=$current_dir"/config/nginx"


function do_install()
{
    download_src $app $url
    goto_src $app

    ./configure --prefix=$nginx_path
    make
    make install
}

function make_easy_use()
{
    exe_cmd "cp  $sample_config_dir/init.d.nginx /etc/init.d/nginx"
    chmod u+x /etc/init.d/nginx

    chkconfig nginx on
    service nginx start
}

do_install

make_easy_use
