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
# revalue mac.command
re-bashrc()
{
    source ~/.bash_profile
}
# end
# mac
## self define
### mac osx Finder config
finder.cfg()
{
    op=$1
    case $op in
        *|'h'|'H'|'help'|'HELP')
            echo '
                HOW TO CONFIG FINDER COMMOND
====================================================================
1. 设置默认打开为主目录
    defaults write com.apple.finder PathBarRootAtHome -bool TRUE
    killall Finder
2. Finder标题栏显示完整路径
    defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES
    killall Finder
3. Finder显示隐藏文件
    defaults write com.apple.finder AppleShowAllFiles -boolean true
    killall Finder
4. Finder不显示隐藏文件
    defaults write com.apple.finder AppleShowAllFiles -boolean false
    killall Finder
5. Space键可以任意文件预览
--------------------------------------------------------------------'
            ;;
    esac
}
### end
### histoty command config
history.cfg()
{
    op=$1
    case $op in
        'h'|'H')
            echo '
                HOW TO CONFIG HISTORY COMMOND
====================================================================
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000000
HISTFILESIZE=2000000000
HISTTIMEFORMAT="[%F %T] "
HISTCONTROL=ignoreboth
---------------------------------------------------------------------'
            ;;
        *)
            ;;
    esac
}
### end
### mount ntfs disk
ntfs.mount()
{
	code='0'
	msg=
	origin=$1
	point=$2

	# tmp=`diskutil info ${origin} | grep 'Type ' | cut -d':' -f2 | sed s/[[:space:]]//g`
	# type=${tmp}
	# echo ":$tmp:"
	# case ${type} in
	# 	'ntfs')
	# 		echo "type ist ntfs............."
	# 		;;
	# 	*)
	# 		echo "type ist andere............."
	# 		code='-1'
	# 		msg="ERROR:\n\tdisk: ${origin} ist ${type}"
	# 		origin=${code}
	# 		;;
	# esac

    case ${origin} in
		'-1')
			echo -e ${msg}
			;;
		'h'|'-h'|'--help'|'?'|'-?')
			echo -e "USEAGE:\n\tntfs.mount origin point\nSamples:\n\tntfs.mount /dev/disk2s1 ~/zgd_cs701\nATTENTION:\n\tPLEASE UMOUNT YOUR OLDPOINT"
			mount
			;;
		*)
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

			is_dir=`file ${point}  | awk '{print $2}'`
            case ${is_dir} in
                'directory')
        			echo sudo mount -v -o 'rw,auto,nobrowse' -t ntfs ${origin} ${point}
		        	sudo mount -v -o 'rw,auto,nobrowse' -t ntfs ${origin} ${point}
                    ;;
                *)
                    ;;
            esac
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
		'start'|'up')
			echo boot2docker start
			boot2docker start
			echo docker version
			docker version
			;;
        'stop')
            echo boot2docker down
            boot2docker down
            echo docker version
            docker version
            ;;
        'lnmp')
            #docker run -p 8080:443 -v ~/mnt:/mnt -i -t lnmp.htop /bin/bash
			echo docker run -p 80:80 -p 8080:8080 -p 443:443 -v ~/tmp:/home/sites -i -t ubuntu:lnmp /bin/bash
			docker run -p 80:80 -p 8080:8080 -p 443:443 -v ~/tmp:/home/sites -i -t ubuntu:lnmp /bin/bash
            ;;
		'ubuntu')
			echo docker run -p 80:80 -p 8080:8080 -p 443:443 -v ~/tmp:/home/sites -i -t ubuntu:14.04 /bin/bash
			docker run -p 80:80 -p 8080:8080 -p 443:443 -v ~/tmp:/home/sites -i -t ubuntu:14.04 /bin/bash
			;;
        'zephyr')
            echo docker run -v ~/works:/tmp/works -i -t zephyr:works su test
            docker run -v ~/works:/tmp/works -i -t zephyr:works su test
            ;;
        'use'|'help'|'h')
            echo '
                            HOW TO USE DOCKER
============================================================================
1. create lnmp, verbinden local folder ~/tmp to virtual folder /home/sites
`docker run --name lnmp -v ~/tmp:/home/sites:ro -i -t ubuntu:14.04 /bin/bash`
`docker run -v ~/tmp:/home/sites:rw -i -t ubuntu:14.04 /bin/bash`

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
4.1. 安装docker依赖包
    brew install docker docker-machine docker-compose boot2docker

4.2. 配置启动Docker
在安装完毕后boot2docker后，就可以直接使用boot2docerk这个client command来操作vm中Images了。
4.2.1. boot2docker init 命令进行初始化
从日志可以看出，初始化的过程是下载一个boot2docer.iso，然后会用ssh生成用于docker的ssh的公钥和私钥对，用于远程。
---------------------------------------------------------
    shengli-mac$ boot2docker init
    Latest release for boot2docker/boot2docker is v1.3.2
    Downloading boot2docker ISO image...
    Success: downloaded https://github.com/boot2docker/boot2docker/releases/download/v1.3.2/boot2docker.iso
    to /Users/shengli/.boot2docker/boot2docker.iso
    Generating public/private rsa key pair.
    Your identification has been saved in /Users/shengli/.ssh/id_boot2docker.
    Your public key has been saved in /Users/shengli/.ssh/id_boot2docker.pub.
    The key fingerprint is:
    ff:7a:53:95:e6:44:27:70:e1:ac:0a:b5:02:35:72:29 shengli@192.168.2.101
    The key randomart image is:
    +--[ RSA 2048]----+
    |      . +.  ..o. |
    |      E+..   +...|
    |      ..  .   +.o|
    |       . . . . +.|
    |        S . . +. |
    |         + .  .. |
    |          o  .   |
    |           .o    |
    |          .o..   |
    +-----------------+
---------------------------------------------------------
4.2.2. boot2docerk start/up命令来启动
---------------------------------------------------------
    shengli-mac$ boot2docker start
    Waiting for VM and Docker daemon to start...
    .......................ooooooooooooooooooo
    Started.
    Writing /Users/shengli/.boot2docker/certs/boot2docker-vm/ca.pem
    Writing /Users/shengli/.boot2docker/certs/boot2docker-vm/cert.pem
    Writing /Users/shengli/.boot2docker/certs/boot2docker-vm/key.pem

    To connect the Docker client to the Docker daemon, please set:
        export DOCKER_HOST=tcp://192.168.59.103:2376
        export DOCKER_CERT_PATH=/Users/shengli/.boot2docker/certs/boot2docker-vm
        export DOCKER_TLS_VERIFY=1
---------------------------------------------------------
4.2.3. 执行$(boot2docker shellinit)
---------------------------------------------------------
    shengli-mac$ $(/usr/local/bin/boot2docker shellinit)
    Writing /Users/shengli/.boot2docker/certs/boot2docker-vm/ca.pem
    Writing /Users/shengli/.boot2docker/certs/boot2docker-vm/cert.pem
    Writing /Users/shengli/.boot2docker/certs/boot2docker-vm/key.pem
    shengli-mac$ docker version
    Client version: 1.3.2
    Client API version: 1.15
    Go version (client): go1.3.3
    Git commit (client): 39fa2fa
    OS/Arch (client): darwin/amd64
    Server version: 1.3.2
    Server API version: 1.15
    Go version (server): go1.3.3
    Git commit (server): 39fa2fa
---------------------------------------------------------
4.2.4. 如果想进入到虚拟机的控制台，可以使用boot2docker ssh命令
    zhanggd@zhanggd-mini:~$ boot2docker ssh
    Boot2Docker version 1.11.2, build HEAD : a6645c3 - Wed Jun  1 22:59:51 UTC 2016
    Docker version 1.11.2, build b9f10c9
4.3. Quick Start
4.3.1. Verify docker is installed correctly.
---------------------------------------------------------
    zhanggd@zhanggd-mini:~$ docker run hello-world
    Unable to find image 'hello-world:latest' locally
    latest: Pulling from library/hello-world
    c04b14da8d14: Pull complete
    Digest: sha256:0256e8a36e2070f7bf2d0b0763dbabdd67798512411de4cdcf9431a1feb60fd9
    Status: Downloaded newer image for hello-world:latest

    Hello from Docker!
    This message shows that your installation appears to be working correctly.

    To generate this message, Docker took the following steps:
     1. The Docker client contacted the Docker daemon.
     2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
     3. The Docker daemon created a new container from that image which runs the
        executable that produces the output you are currently reading.
     4. The Docker daemon streamed that output to the Docker client, which sent it
        to your terminal.

    To try something more ambitious, you can run an Ubuntu container with:
     $ docker run -it ubuntu bash

    Share images, automate workflows, and more with a free Docker Hub account:
     https://hub.docker.com

    For more examples and ideas, visit:
     https://docs.docker.com/engine/userguide/
---------------------------------------------------------
----------------------------------------------------------------------------'
            ;;
        *)
            echo '
                                DOCKER
============================================================================
1. start|up - start docker-machine
2. stop - stop docker-machine
3. lnmp - start bash in Linux+Nging+Mysql+Php
4. use|help|h - userguide
5. install|i - quick install
6. ubuntu - run ubuntu 14.04
7 zephyr - run to zephyr development env
----------------------------------------------------------------------------'
            ;;
    esac
}
### end
### curl.h
curl.h()
{
    echo -e "/usr/bin/curl\n\t--fail \n\t--progress-bar \n\t--remote-time \n\t--location \n\t--user-agent Homebrew/1.0.9 (Macintosh; Intel macOS 10.12.1) curl/7.49.1 \n\thttps://download3.vmware.com/software/fusion/file/VMware-Fusion-8.5.0-4352717.dmg \n\t-C 140956438 \n\t-o /Users/zhanggd/Library/Caches/Homebrew/Cask/vmware-fusion--8.5.0-4352717.dmg.incomplete
    "
}
### end
### renew beyond compare
bc.new()
{
    old_file="registry.dat"
    bc_config_dir="/Users/zhanggd/Library/Application Support/Beyond Compare/"
    new_file="."${old_file}"_`datestr`"
    cd "${bc_config_dir}"
    mv ${old_file} ${new_file}
    cd -
}
### end
### influxdb
m.influx()
{
    op=$1
    case $op in
        'auto')
            echo brew services start influxdb
            ;;
        'start'|'up')
            influxd -config /Users/zhanggd/develop/branch.git/works/tool-kit/publics/homebrew/etc/influxdb.conf
            ;;
        'help'|'HELP'|'h'|*)
            echo "
            HOWTO for InfluxDB
=============================================
auto - lanuch by poweroff
To have launchd start influxdb now and restart at login:
  brew services start influxdb

start|up - start with config file
Or, if you don't want/need a background service you can just run:
  influxd -config /Users/zhanggd/develop/branch.git/works/tool-kit/publics/homebrew/etc/influxdb.conf
---------------------------------------------"
            ;;
    esac
}
### end
### zephyr config
zephyr.cfg()
{
    op=$1
    case $op in
        'i'|'install')
            echo brew install gettext qemu help2man mpfr gmp coreutils wget python3
            brew install gettext qemu help2man mpfr gmp coreutils wget python3
            echo brew tap homebrew/dupes
            brew tap homebrew/dupes
            echo brew install grep --with-default-names
            brew install grep --with-default-names
            echo pip3 install ply
            pip3 install ply
            echo brew install crosstool-ng
            brew install crosstool-ng
            ;;
        'h'|'help'|*)
            echo "
            HOW TO CONFIG ZEPHYR
=============================================
 i|install - install all dependence packages
 h|help|* - display this help
---------------------------------------------
            "
            ;;
    esac
}
### end
## end
# end
