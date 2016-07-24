#! /bin/bash
# das ist fuer OS X
alias ls='ls -G'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias llh='ls -lh'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias tailf='tail -f'
# end

# mount ntfs disk
ntfs.mount()
{
	code='0'
	msg=
	origin=$1
	point=$2

	tmp=`diskutil info ${origin} | grep 'Type ' | cut -d':' -f2 | sed s/[[:space:]]//g`
	type=${tmp}
	echo ":$tmp:"
	case ${type} in
		'ntfs')
			echo "type ist ntfs............."
			;;
		*)
			echo "type ist andere............."
			code='-1'
			msg="ERROR:\n\tdisk: ${origin} ist ${type}"
			origin=${code}
			;;
	esac

	case ${origin} in
		'-1')
			echo -e ${msg}
			;;
		'h'|'-h'|'--help'|'?'|'-?')
			echo -e "USEAGE:\n\tntfs.mount origin point\nSamples:\n\tntfsmount /dev/disk2s1 ~/zgd_cs701"
			;;
		*)
			echo sudo mount -v -o 'rw,auto,nobrowse' -t ntfs ${origin} ${point}
			sudo mount -v -o 'rw,auto,nobrowse' -t ntfs ${origin} ${point}
			;;
	esac
}

### LNMP config
lnmp()
{
    case $1 in
        'y'|'Y'|'yes'|'Yes'|'YES')
            echo apt-get update
            apt-get update
            echo apt-get install nginx \
                php5 php5-fpm \
                mysql-server phpmyadmin \
                php5-mysql php5-gd php5-memcached php5-geoip memcached \
                libmysqlclient-dev
            apt-get install nginx \
                php5 php5-fpm \
                mysql-server phpmyadmin \
                php5-mysql php5-gd php5-memcached php5-geoip memcached \
                libmysqlclient-dev
            ;;
        *)
            echo '
                HOW TO CONFIG LNMP(Linux+Nginx+Mysql+Php)
===========================================================================
1. apt-get update
2. apt-get install nginx \
        php5 php5-fpm \
        mysql-server phpmyadmin \
        php5-mysql php5-gd php5-memcached php5-geoip memcached \
        libmysqlclient-dev
---------------------------------------------------------------------------'
            ;;
    esac
}
### end
### Docker
mdocker()
{
    op=$1
    case $op in
        'lnmp')
            docker run -p 8080:443 -v ~/mnt:/mnt -i -t lnmp.htop /bin/bash
            ;;
        'use'|'help'|'h')
            echo '
                            HOW TO USE DOCKER
============================================================================
1. create lnmp, verbinden local folder ~/tmp to virtual folder /home/sites
`docker run --name lnmp -v ~/tmp:/home/sites:ro -i -t ubuntu:14.04 /bin/bash`

2. bind local port with container port
2.1. local port 8080 verbinden mit container port 80
docker run -p 8080:80 -v ~/tmp:/home/sites -i -t ubuntu:lnmps /bin/bash
2.2. local port 8080 verbinden mit container port 443
docker run -p 8080:443 -v ~/mnt:/mnt -i -t lnmp.htop /bin/bash
2.3. container port 80,443 auto bind with local port
docker run -P --expose 80 --expose 443 -v ~:/root -i -t ubuntu:14.04 /bin/bash
2.4. bind local ports 80, 443 with container ports 80, 443
docker run -p 127.0.0.1:80:80 -p 127.0.0.1:443:443 -v ~:/root -i -t ubuntu:14.04 /bin/bash

3. commit a status
`docker commit -m "lnmp" e61884a17a10 ubuntu:lnmp`'
                ;;

        'install'|'i')
            echo '
                        HOW TO INSTALL DOCKER
============================================================================
4. install docker
4.1. 安装 apt-transport-https 包支持 https 协议的源
    apt-get install apt-transport-https ca-certificates

4.2. 添加源的 gpg 密钥
    apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
        --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

4.3. 获取当前操作系统的代号
    lsb_release -c

4.4. 接下来就可以添加 Docker 的官方 apt 软件源了
    echo deb https://apt.dockerproject.org/repo ubuntu-trusty main > /etc/apt/sources.list.d/docker.list

4.5. 更新 apt 软件包缓存
    apt-get update
    1. 为了让 Docker 使用 aufs 存储，推荐安装 linux-image-extra 软件包
        apt-get install -y linux-image-extra-$(uname -r)
    2. 在 Ubuntu 14.04 或者 12.04上安装Docker，需要安装apparmor（apparmor是Linux内核的一个安全模块，新版本的Ubuntu已经被整合到内核）:
        apt-get install apparmor
12.04 LTS版本
    linux-image-generic-lts-trusty （必备）
    linux-headers-generic-lts-trusty （必备）
    xserver-xorg-lts-trusty （带图形界面时必备）
    libgl1-mesa-glx-lts-trusty（带图形界面时必备）
    安装命令(根据环境和要求不同，选择安装上述软件包)，如：
    apt-get install linux-image-generic-lts-trusty
    apt-get install linux-headers-generic-lts-trusty

4.6. 安装 Docker
    在成功添加源之后，就可以安装最新版本的 Docker 了，软件包名称为 docker-engine
    apt-get install -y docker-engine

4.7. Quick Start
4.7.1. Start the docker daemon.
    sudo service docker start
4.7.2. Verify docker is installed correctly.
    sudo docker run hello-world
----------------------------------------------------------------------------'
            ;;
        *)
            echo '
                                DOCKER
============================================================================
1. use|help|h - userguide
2. install|i - quick install
----------------------------------------------------------------------------'
            ;;
    esac
}
### end

# revalue mac.command
re-bashrc()
{
	source ~/.bash_profile
}
# end
