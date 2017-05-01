#! /bin/bash
# shell command
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias llh='ls -lh'
alias dir='dir --color=auto'
# end

# self setting commands
#alias findmnt='findmnt -m'
# end

# revalue mac.command
m.bashrc()
{
	m.import ~/.bashrc
}
# end m.bashrc()

## self define
### histoty command config
m.history()
{
    op=$1
    case $op in
        'h'|'H'|*)
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
    esac
}
### end m.history()

### LNMP config
m.lnmp()
{
    case $1 in
        '1'|'install'|'i')
            echo ${APT} update
            ${APT} update
            echo ${APT} install nginx \
                php5 php5-fpm \
                mysql-server phpmyadmin \
                php5-mysql php5-gd php5-memcached php5-geoip memcached \
                libmysqlclient-dev
            ${APT} install nginx \
                php5 php5-fpm \
                mysql-server phpmyadmin \
                php5-mysql php5-gd php5-memcached php5-geoip memcached \
                libmysqlclient-dev
            ;;
        '2'|'info')
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
        '3'|'h'|'help'|*)
			echo "
			HOW TO CONFIG LNMP
================================================
1. instal|i - install lnmp
2. info - display install information
3. h|help - display help information
------------------------------------------------"
            ;;
    esac
}
### end m.lnmp()

### LNMP config
m.lamp()
{
    case $1 in
        '1'|'install'|'i')
            echo ${APT} update
            ${APT} update
            echo ${APT} install apache2 \
                php5 php5-fpm libapache2-mod-php5 \
                mysql-server phpmyadmin \
                php5-mysql php5-gd php5-memcached php5-geoip memcached \
                libmysqlclient-dev
            ${APT} install apache2 \
                php5 php5-fpm libapache2-mod-php5 \
                mysql-server phpmyadmin \
                php5-mysql php5-gd php5-memcached php5-geoip memcached \
                libmysqlclient-dev
            ;;
        '2'|'info')
            echo '
                HOW TO CONFIG LNMP(Linux+Nginx+Mysql+Php)
===========================================================================
1. apt-get update
2. apt-get install apache2 \
        php5 php5-fpm libapache2-mod-php5 \
        mysql-server phpmyadmin \
        php5-mysql php5-gd php5-memcached php5-geoip memcached \
        libmysqlclient-dev
---------------------------------------------------------------------------'
			;;
        '3'|'h'|'help'|*)
			echo "
			HOW TO CONFIG LAMP
================================================
1. instal|i - install lnmp
2. info - display install information
3. h|help - display help information
------------------------------------------------"
            ;;
    esac
}
### end m.lamp()

### Docker
m.docker()
{
    op=$1
    case $op in
        'use'|'help'|'h'|'1')
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
2.5. run uni-module robotik
docker run -v /media/self/develop/branch.git/works/uni/private/fachrichtung/ma/robotics:/home/sites -it ubuntu:14.04 bash

3. commit a status
`docker commit -m "lnmp" e61884a17a10 ubuntu:lnmp`'
                ;;

        'install'|'i'|'2')
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

4.6.1. 安装docker-machine
    curl -L https://github.com/docker/machine/releases/download/v0.8.2/docker-machine-`uname -s`-`uname -m`
    sudo mv docker-machine* /usr/local/bin/docker-machine
    sudo chmod +x /usr/local/bin/docker-machine
    docker-machine version
4.6.2. 创建一个本地VM
    docker-machine create --driver virtualbox default
    docker-machine ls
4.6.3. 获取配置
    docker-machine env default
4.6.4. 添加docker组
    sudo groupadd docker
4.6.5. 添加用户到docker组
    sudo usermod -aG docker $USER

4.7. Quick Start
4.7.1. Start the docker daemon.
    sudo service docker start
4.7.2. Verify docker is installed correctly.
    sudo docker run hello-world
----------------------------------------------------------------------------'
            ;;
		'start'|'up'|'3')
			echo sudo ${SERV} ${DOCKER} start
			sudo ${SERV} ${DOCKER} start
			;;
		'stop'|'down'|'close'|'4')
			echo sudo ${SERV} ${DOCKER} stop
			sudo ${SERV} ${DOCKER} stop
			;;
		'lnmp'|'5')
            # docker run -p 8080:443 -v ~/mnt:/mnt -i -t lnmp.htop /bin/bash
			echo ${DOCKER} run -d -p 80:80 -p 8080:8080 -p 443:443 -v ~/tmp:/home/sites -i -t ubuntu:lnmp /bin/bash
			${DOCKER} run -d -p 80:80 -p 8080:8080 -p 443:443 -v ~/tmp:/home/sites -i -t ubuntu:lnmp /bin/bash
            ;;
		'ubuntu'|'6')
			echo ${DOCKER} run -d -v ~/works:/var/tmp/sites -i -t ubuntu:16.04 /bin/bash
			${DOCKER} run -d -v ~/works:/var/tmp/sites -i -t ubuntu:16.04 /bin/bash
			;;
        'caffe'|'7')
            echo docker run -d -ti bvlc/caffe:cpu caffe --version
            docker run -d -ti bvlc/caffe:cpu caffe --version
            ;;
        '0'|'info')
            docker version
            docker images
            docker ps
            ;;
        *)
            echo '
                                DOCKER
============================================================================
1. use|help|h - userguide
2. install|i - quick install
3. start|up - start docker
4. stop|down|close - stop docker
5. lnmp - runing lnmp
6. ubuntu - start ubuntu(80,443)
7. caffe - caffe.berkeleyvision.org(machine learning)
0. info - display info
----------------------------------------------------------------------------'
            ;;
    esac
}
### end m.docker()

### my usefully command
m.env()
{
    op=$1
    case $op in
        '1'|'t'|'tools')
            echo apt update
            sudo apt update
            echo apt -y install vim git axel wget htop ssh sshfs \
                    wine
            sudo apt -y install vim git axel wget htop ssh sshfs \
                    wine
            ;;
        '2'|'deb'|'p')
            cd ~/hinterladen/tools/
            sudo dpkg -i \
                    google-chrome-stable_current_amd64.deb \
                    virtualbox-5.1_5.1.8-111374~Ubuntu~xenial_amd64.deb \
                    teamviewer_11.0.57095_i386.deb \
                    dropbox_2015.10.28_amd64.deb \
                    sublime-text_build-3114_amd64.deb \
                    bcompare-4.1.1.20615_amd64.deb \
                    wps-office*.deb \
                    AdbeRdr9.5.5-1_i386linux_enu.deb \
                    FoxitReader_1.1.0_i386.deb \
                    picasa-3.0.0-build-57.4402.deb \
                    netease-cloud-music_0.9.0-2_amd64.deb
            ;;
        '4'|'docker')
            sudo ${APT} install apt-transport-https ca-certificates
            sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
                        --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
            sudo touch /etc/apt/sources.list.d/docker.list
            sudo echo "deb https://apt.dockerproject.org/repo ubuntu-`lsb_release -c | awk '{print $2}' | sed s/[[:space:]]//g` main" > /etc/apt/sources.list.d/docker.list
            sudo apt update
            sudo ${APT} install -y linux-image-extra-$(uname -r)
            sudo ${APT} install -y docker-engine
            curl -L https://github.com/docker/machine/releases/download/v0.8.2/docker-machine-`uname -s`-`uname -m` > docker-machine
            sudo mv docker-machine* /usr/local/bin/docker-machine
            sudo chmod +x /usr/local/bin/docker-machine
            docker-machine version
			#docker-machine create --driver virtualbox default
			docker-machine ls
			#docker-machine env default
			sudo groupadd docker
			sudo usermod -aG docker $USER
			#sudo ${SERV} docker start
			#sudo docker run hello-world
            ;;
        '5'|'h'|'help'|*)
            echo "
            HOW TO CONFIG MY ENV
================================================
1. t|tools - install normaly tools
2. deb|p - install some usefull deb package
4. docker - install docker
5. h|help|* - display this help information
------------------------------------------------"
            ;;
    esac
}
### end m.env()

### install ros
m.ros()
{
	op=$1
	case $op in
		'1'|'i'|'install')
			echo '
			HOW TO INSTALL ROS
============================================
1. add source to source.list
	sudo sh -c "echo \"deb http://packages.ros.org/ros/ubuntu \$(lsb_release -sc) main\" > /etc/apt/sources.list.d/ros-latest.list"
2. add keys
	sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 0xB01FA116
3. install
	3.1. sudo apt-get update
	3.2. Install ROS
		3.2.1. Desktop-Full Install: (Recommended) : ROS, rqt, rviz, robot-generic libraries, 2D/3D simulators, navigation and 2D/3D perception
			sudo apt-get install ros-kinetic-desktop-full
		3.2.2. Desktop Install: ROS, rqt, rviz, and robot-generic libraries
			sudo apt-get install ros-kinetic-desktop
		3.2.3. ROS-Base: (Bare Bones) ROS package, build, and communication libraries. No GUI tools.
			sudo apt-get install ros-kinetic-ros-base
		3.2.4. Individual Package: You can also install a specific ROS package (replace underscores with dashes of the package name):
			sudo apt-get install ros-kinetic-PACKAGE
			eg.
			sudo apt-get install ros-kinetic-slam-gmapping
			to find avaiable package can use
				apt-cache search ros-kinetic
	3.3. Initialize rosdep
		sudo rosdep init
		rosdep update
	3.4. Environment setup
		echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
		source ~/.bashrc
	3.5. Getting rosinstall
		sudo apt install python-rosinstall
--------------------------------------------'
			;;
		'2'|'h'|'help'|'HELP'|*)
			echo '
		[HELP] HOW TO INSTALL ROS
============================================
1. i|install - install information
2. h|help|HELP - help menu
--------------------------------------------'
			;;
	esac
}
### end m.ros()

### ranger
m.ranger()
{
	op=$1
	case $op in
		'help'|'h'|*)
			echo "
			HOWTO FOR RANGER
==============================================
1. config
1.1.显然，键绑定是可以修改的，首先，需要一个
rc.conf 配置文件（ranger 1.5 版本后）：
ranger --copy-config=rc
这样会在 ～/.config/ranger/ 下生成一个 rc.conf
文件，里面可以看到许多 map，类似 Vim 的键映射，
可以根据需要进行修改。

1.2.文件的打开程序列表也可以通过配置文件修改：
ranger --copy-config=rifle
以上命令在复制了一份 rifle.conf 到
~/.config/ranger/ 目录，打开即可以编辑。

2. keybinding
f3 - 显示文件
f4 - 编辑文件
f5 - 复制文件
f6 - 剪切文件

----------------------------------------------"
			;;
	esac
}
### end m.ranger()

### sort and count
m.counter()
{
	op=$1
	case $op in
		'h'|*)
			echo '
			HOWTO COUNT STRING TIMES
===============================================
sort | uniq -c
-----------------------------------------------'
			;;
	esac
}
### end m.counter()

### jenkins
m.jenkins()
{
	op=$1
	case $op in
		'2'|'config')
			echo "
===============================================

-----------------------------------------------"
			;;
		'1'|'i'|'install')
			echo "
===============================================
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins
-----------------------------------------------"
			;;
		'0'|'h'|'help'|'HELP'|*)
			echo "
			HOW TO INSTALL JENKINS
===============================================
0. h|help|HELP - display help information
1. i|install - display install deploy
-----------------------------------------------"
			;;
	esac
}
### end m.jenkins()
## end

## machine learning area
### caffe install
m.caffe()
{
    op=$1
    case $op in
        '1'|'install')
            echo sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
            echo sudo apt-get install --no-install-recommends libboost-all-dev
            ;;
        '0'|'h'|'help'|*)
            echo "
            HOW TO INSTALL CAFFE
============================================
0. h|help|* - display help
1. install - install command
--------------------------------------------"
            ;;
    esac
}
### end m.caffe()

### zephyr config
m.zephyr()
{
    op=$1
    case $op in
        '4'|'m'|'build'|'make')
            echo make BOARD=nrf52_pca10040
            make BOARD=nrf52_pca10040
            ;;
        '5'|'clean')
            echo make BOARD=nrf52_pca10040 clean
            make BOARD=nrf52_pca10040 clean
            ;;
        '0'|'h'|'help'|*)
            echo "
            HOW TO CONFIG ZEPHYR
=============================================
 4. m|build|make - make current application
 5. clean - clean current application
 ---
 0. h|help|* - display this help
---------------------------------------------
            "
            ;;
    esac
}
### end m.zephyr()

### use openssl rand to create random string
m.random()
{
    seed=$1
    case $seed in
        '1'|'ssl'|'openssl')
            openssl rand -base64 8 | ${MD5}
            ;;
        '2'|'uuid')
            cat /proc/sys/kernel/random/uuid
            ;;
        '3'|'date')
            date +%s%N | ${MD5} | ${HEAD} -c 10
            echo ""
            ;;
        '4'|'urandom')
            cat /dev/urandom | ${HEAD} -n 10 | ${MD5} | ${HEAD} -c 10
            echo ""
            ;;
        *)
            echo '
                    CREATE RANDOM NUMMBER
================================================================
1. ssl|openssl
2. uuid
3. date
4. urandom
----------------------------------------------------------------'
            ;;
    esac
}
### end m.random()
### m.opencv()
m.opencv()
{
    op=$1
    case $op in
        1|install|i)
            echo "sudo apt-get install --assume-yes build-essential cmake git \\
            build-essential pkg-config unzip ffmpeg qtbase5-dev python-dev python3-dev python-numpy python3-numpy \\
            libopencv-dev libgtk-3-dev libdc1394-22 libdc1394-22-dev libjpeg-dev libpng12-dev libtiff5-dev libjasper-dev \\
            libavcodec-dev libavformat-dev libswscale-dev libxine2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev \\
            libv4l-dev libtbb-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev \\
            libvorbis-dev libxvidcore-dev v4l-utils"
            ;;
        0|help|h|*)
            echo "
            HOWTO INSTALL OPENCV
=========================================
0. help|h - display help
1. install|i - install opencv
-----------------------------------------"
            ;;
    esac
}
### end
### m.mnt()
m.mnt()
{
    op=$1
    case $op in
        '1'|'code')
            m.log.d sudo mount /dev/sda6 ${LOCAL_WORKS_DIR}/module/code
            sudo mount /dev/sda6 ${LOCAL_WORKS_DIR}/module/code
            ;;
        '2'|'pro')
            m.log.d sudo mount /dev/sda8 ${LOCAL_WORKS_DIR}/module/pro
            sudo mount /dev/sda8 ${LOCAL_WORKS_DIR}/module/pro
            ;;
        0|h|help|*)
            echo "
            HOW TO MOUNT POINT
=============================================
0. h|help - display this help menu
1. code - mount module/code point
2. pro - mount module/pro
---------------------------------------------"
            ;;
    esac
}
### end
### m.json()
##! @brief : parse json data
##! @params: [$1] => param1,param2
##! @return: see the return code list
##! @stdin : json_data and every line has a json_data
##! @stdout: json_ans_data
# function parse_json_py()
function m.json()
{
    local parse_param=""
    if [ $# -eq 1 ]; then
        parse_param=$1
    else
        log_fatal "Must input params that you want to parse!"
        return ${RET_PARAMS_ERROR}
    fi
    python -c 'import sys; import json; \
    j = json.loads(sys.stdin.read()); \
    print j["'${parse_param}'"]'
    return ${RET_RUNNING_OK}
}
### end
## end
# end
