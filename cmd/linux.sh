#! /bin/bash
# shell command
alias ls='ls --color=auto'
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
        1|install)
            case $(grep 'setting_history' ${HOME}/.bashrc | wc -l) in
                0)
                    echo "#======================================" >> ${HOME}/.bashrc
                    echo "# setting_history begin" >> ${HOME}/.bashrc
                    echo "unset HISTSIZE" >> ${HOME}/.bashrc
                    echo "unset HISTFILESIZE" >> ${HOME}/.bashrc
                    echo "export HISTSIZE=100000000" >> ${HOME}/.bashrc
                    echo "export HISTFILESIZE=200000000" >> ${HOME}/.bashrc
                    echo "export HISTTIMEFORMAT='[%F %T] '" >> ${HOME}/.bashrc
                    echo "export HISTCONTROL=ignorespace" >> ${HOME}/.bashrc
                    echo "# setting history end" >> ${HOME}/.bashrc
                    ;;
                *)
                    m.log.v "history setting have installed...."
                    ;;
            esac
            ;;
        'h'|'H'|*)
            m.log.v '
                HOW TO CONFIG HISTORY COMMOND
====================================================================
m.history [option]
1|install - to install settings
h|H|* - to display this help information

samples:
------------------------
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
            m.log.v "${APT} update"
            m.log.v ${APT} install nginx \
                        php php-fpm \
                        php-mysql php-gd php-memcached php-geoip memcached \
                        mysql-server phpmyadmin \
                        libmysqlclient-dev
            ;;
        '2'|'info')
            m.log.v '
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
			m.log.v "
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
            m.log.v ${APT} update
            m.log.v ${APT} install apache2 \
                php php-fpm libapache2-mod-php \
                php-mysql php-gd php-memcached php-geoip memcached \
                mysql-server phpmyadmin \
                libmysqlclient-dev
            ;;
        '2'|'info')
            m.log.v '
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
			m.log.v "
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

### my usefully command
m.env()
{
    op=$1
    case $op in
        '1'|'t'|'tools')
            m.log.v apt update
            sudo apt update
            m.log.v apt -y install vim git axel wget htop ssh sshfs \
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
            m.log.v sudo ${APT} install apt-transport-https ca-certificates
            m.log.v sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
                        --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
            m.log.v sudo touch /etc/apt/sources.list.d/docker.list
            m.log.v sudo echo "deb https://apt.dockerproject.org/repo ubuntu-`lsb_release -c | awk '{print $2}' | sed s/[[:space:]]//g` main" > /etc/apt/sources.list.d/docker.list
            m.log.v sudo apt update
            m.log.v sudo ${APT} install -y linux-image-extra-$(uname -r)
            m.log.v sudo ${APT} install -y docker-engine
            m.log.v curl -L https://github.com/docker/machine/releases/download/v0.8.2/docker-machine-`uname -s`-`uname -m` > docker-machine
            m.log.v sudo mv docker-machine* /usr/local/bin/docker-machine
            m.log.v sudo chmod +x /usr/local/bin/docker-machine
            m.log.v docker-machine version
			#docker-machine create --driver virtualbox default
			m.log.v docker-machine ls
			#docker-machine env default
			m.log.v sudo groupadd docker
			m.log.v sudo usermod -aG docker $USER
			#sudo ${SERV} docker start
			#sudo docker run hello-world
            ;;
        '5'|'h'|'help'|*)
            m.log.v "
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
			m.log.v '
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
			m.log.v '
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
		'0'|'help'|'h'|*)
			m.log.v "
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
			m.log.v '
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
			m.log.v "
===============================================

-----------------------------------------------"
			;;
		'1'|'i'|'install')
			m.log.v "
===============================================
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins
-----------------------------------------------"
			;;
		'0'|'h'|'help'|'HELP'|*)
			m.log.v "
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
            m.log.v sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
            m.log.v sudo apt-get install --no-install-recommends libboost-all-dev
            ;;
        '0'|'h'|'help'|*)
            m.log.v "
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
            m.log.d make BOARD=nrf52_pca10040
            make BOARD=nrf52_pca10040
            ;;
        '5'|'clean')
            m.log.d make BOARD=nrf52_pca10040 clean
            make BOARD=nrf52_pca10040 clean
            ;;
        '0'|'h'|'help'|*)
            m.log.v "
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

### m.mnt()
m.mnt()
{
    op=$1
    case $op in
        '1'|'code')
            m.log.d sudo mount /dev/sda7 ${LOCAL_WORKS_DIR}/mnt/develop
            sudo mount /dev/sda7 ${LOCAL_WORKS_DIR}/mnt/develop
            m.log.d sudo mount /dev/sda8 ${LOCAL_WORKS_DIR}/mnt/code
            sudo mount /dev/sda8 ${LOCAL_WORKS_DIR}/mnt/code
            m.log.d sudo mount /dev/sda11 ${LOCAL_WORKS_DIR}/mnt/pro
            sudo mount /dev/sda11 ${LOCAL_WORKS_DIR}/mnt/pro
            m.log.d sudo mount /dev/sda6 ${LOCAL_WORKS_DIR}/mnt/osx
            sudo mount /dev/sda6 ${LOCAL_WORKS_DIR}/mnt/osx
            ;;
        0|h|help|*)
            m.log.v "
            HOW TO MOUNT POINT
=============================================
0. h|help - display this help menu
1. - mount works/mnt/code
	 mount works/mnt/pro
	 mount works/mnt/develop
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
        m.log.e "Must input params that you want to parse!"
        return ${RET_PARAMS_ERROR}
    fi
    python -c 'import sys; import json; \
    j = json.loads(sys.stdin.read()); \
    print j["'${parse_param}'"]'
    return ${RET_RUNNING_OK}
}
### end
### timestamp
m.timestamp()
{
    op=$1
    case $op in
        1 | sec )
            str="`date +%Y-%m-%d\ %H:%M:%S`"
            echo \[$str\] `date -d "${str}" +%s`
            ;;
        2 | mil )
            str="`date +%Y-%m-%d\ %H:%M:%S`.000"
            echo \[$str\] `date -d "${str}" +%s`"000"
            ;;
        3 | s2d )
            timestamp=`echo $2 | cut -c 1-10`
            str=`date -d "1970-01-01 ${timestamp} sec utc" +%Y-%m-%d\ %H:%M:%S`
            echo "[${str}] ${timestamp}"
            ;;
        4 | d2s )
            datestr=$2
            echo "[${datestr}] `date -d "${datestr}" +%s`"
            ;;
        0 | h | help | * )
            echo "
            HOW TO CREATE TIMESTAMP
==================================================
1. sec - create timestamp with seconds
        m.timestamp 1
2. mil - create timestamp with million seconds
        m.timestamp 2
3. s2d - timestamp to date
        m.timestamp 3 1421201515
4. d2s - date to timestamp
        m.timestamp 4 '2015-01-14 03:11:55'
0. h|help - display infomation
--------------------------------------------------"
            ;;
    esac
}
### end m.timestamp()
### m.vmnt()
m.vmnt()
{
    op=$1
    case $op in
        '1'|'mnt')
            m.log.v "mount.vboxsf works ~/works/mnt/share"
            ;;
        '0'|'help'|'h'|*)
            m.log.v "
            HOW TO MOUNT SHARE FOLDER IN VBOX
==================================================
0. h|help|* - display help info
1. mnt - mount from host os
            "
            ;;
    esac
}
### end m.vmnt()
### m.startup()
m.poweron()
{
    m.log.v systemd-analyze blame
    systemd-analyze blame
}
### end
### m.gerrit()
m.gerrit()
{
    op=$1
    case "${op}" in
        1|pull)
            m.log.v "git clone https://github.com/openfrontier/docker-gerrit.git gerrit"
            [ -e gerrit ] || git clone https://github.com/openfrontier/docker-gerrit.git gerrit
            m.log.v "git clone https://github.com/larrycai/docker-gerrit.git gerrit2"
            [ -e gerrit2 ] || git clone https://github.com/larrycai/docker-gerrit.git gerrit2
            ;;
        0|'help'|'h'|'Help')
            ;;
        *)
            ;;
    esac
}
### m.gerrit() end
### m.pencil()
m.pencil()
{
    cd ${WORK_BASE}/tool-kit/publics/ui/pencil
    npm start &
}
### m.pencil() end
### m.info()
m.info()
{
    op=$1
    case $op in
        *)
            m.log.v "
1. 系统
--------------------------------------------------
# uname -a               # 查看内核/操作系统/CPU信息
# head -n 1 /etc/issue   # 查看操作系统版本
# cat /proc/cpuinfo      # 查看CPU信息
# hostname               # 查看计算机名
# lspci -tv              # 列出所有PCI设备
# lsusb -tv              # 列出所有USB设备
# lsmod                  # 列出加载的内核模块
# env                    # 查看环境变量

2. 资源
--------------------------------------------------
# free -m                # 查看内存使用量和交换区使用量
# df -h                  # 查看各分区使用情况
# du -sh <目录名>        # 查看指定目录的大小
# grep MemTotal /proc/meminfo   # 查看内存总量
# grep MemFree /proc/meminfo    # 查看空闲内存量
# uptime                 # 查看系统运行时间、用户数、负载
# cat /proc/loadavg      # 查看系统负载


3. 磁盘和分区
--------------------------------------------------
# mount | column -t      # 查看挂接的分区状态
# fdisk -l               # 查看所有分区
# swapon -s              # 查看所有交换分区
# hdparm -i /dev/hda     # 查看磁盘参数(仅适用于IDE设备)
# dmesg | grep IDE       # 查看启动时IDE设备检测状况

4. 网络
--------------------------------------------------
# ifconfig               # 查看所有网络接口的属性
# iptables -L            # 查看防火墙设置
# route -n               # 查看路由表
# netstat -lntp          # 查看所有监听端口
# netstat -antp          # 查看所有已经建立的连接
# netstat -s             # 查看网络统计信息

5. 进程
--------------------------------------------------
# ps -ef                 # 查看所有进程
# top                    # 实时显示进程状态

6. 用户
--------------------------------------------------
# w                         # 查看活动用户
# id <用户名>                # 查看指定用户信息
# last                      # 查看用户登录日志
# cut -d: -f1 /etc/passwd   # 查看系统所有用户
# cut -d: -f1 /etc/group    # 查看系统所有组
# crontab -l                # 查看当前用户的计划任务

7. 服务
--------------------------------------------------
# chkconfig --list       # 列出所有系统服务
# chkconfig --list | grep on    # 列出所有启动的系统服务

8. 程序
--------------------------------------------------
# rpm -qa                # 查看所有安装的软件包
"
            ;;
    esac
}
### end
### m.apt()
m.apt()
{
    op=$1
    m.log.v sudo apt update
    sudo apt update
    case $op in
        1|normal)
            m.log.v sudo apt install iputils-ping libnet-ifconfig-wrapper-perl \
                    vim htop git screen byobu ssh curl axel
            sudo apt install iputils-ping libnet-ifconfig-wrapper-perl \
                    vim htop git screen byobu ssh curl axel
            ;;
        2|dev)
            m.log.v sudo apt install python-virtualenv python python-pip
            sudo apt install python-virtualenv python python-pip
            ;;
        *)
            m.log.v sudo apt upgrade
            sudo apt upgrade
            m.log.v sudo apt autoremove
            sudo apt autoremove
            ;;
    esac
}
### end
### m.matlab
m.matlab()
{
    op=$1
    linkdir=${HOME}/code/tool-kit
    cd ${linkdir}

    case $op in
        2017 )
            rm matlab_cur;
            ln -s matlab_2017b matlab_cur;
            ;;
        2018 )
            rm matlab_cur;
            ln -s matlab_2018a matlab_cur;
            ;;
        * )
            m.log.v "
            HOWTO SETTING MATLAB
---------------------------------------
2017 - set to matlab_2017b
2018 - set to matlab_2018a
"
            ;;
    esac
}
### end
### m.mac()
m.mac()
{
    op=$1
    case $op in
        1)
            m.log.v 00-60-2F`dd bs=1 count=3 if=/dev/random 2>/dev/null |hexdump -v -e '/1 "-%02X"'`
            ;;
        2)
            MACADDR="52:54:$(dd if=/dev/urandom count=1 2>/dev/null | md5sum | sed 's/^\(..\)\(..\)\(..\)\(..\).*$/\1:\2:\3:\4/')"
            m.log.v $MACADDR
            ;;
    esac
}
### m.mac() end

### display git branch in Terminal
function m.git()
{
    git branch 2>/dev/null | grep \* | awk '{print $2" *"}'
}
### end
### m.ecryptfs()
m.ecryptfs()
{
    m.log.v "update the ecryptfs wrapped-passphrase"
    ecryptfs-rewrap-passphrase /home/.ecryptfs/${USER}/.ecryptfs/wrapped-passphrase
}
### m.ecryptfs() end
### m.tracker()
m.tracker()
{
    echo -e "\nHidden=true\n" | sudo tee --append /etc/xdg/autostart/tracker-extract.desktop > /dev/null
    echo -e "\nHidden=true\n" | sudo tee --append /etc/xdg/autostart/tracker-miner-apps.desktop > /dev/null
    echo -e "\nHidden=true\n" | sudo tee --append /etc/xdg/autostart/tracker-miner-fs.desktop > /dev/null
    echo -e "\nHidden=true\n" | sudo tee --append /etc/xdg/autostart/tracker-miner-user-guides.desktop > /dev/null
    echo -e "\nHidden=true\n" | sudo tee --append /etc/xdg/autostart/tracker-store.desktop > /dev/null
    # old
    #gsettings set org.freedesktop.Tracker.Miner.Files crawling-interval -1
    #gsettings set org.freedesktop.Tracker.Miner.Files enable-monitors true
    # new
    gsettings set org.freedesktop.Tracker.Miner.Files crawling-interval -2
    gsettings set org.freedesktop.Tracker.Miner.Files enable-monitors false
    tracker reset --hard
}
### m.tracker() end
### m.pdftk()
m.pdftk()
{
    # author: abu
    # date:   May 12 2018
    # description: bash script to install pdftk on Ubuntu 18.04 for amd64 machines
    ##############################################################################
    #
    # change to /tmp directory
    cd /tmp
    # download packages
    wget http://mirrors.kernel.org/ubuntu/pool/main/g/gcc-6/libgcj17_6.4.0-8ubuntu1_amd64.deb \
        http://mirrors.kernel.org/ubuntu/pool/main/g/gcc-defaults/libgcj-common_6.4-3ubuntu1_all.deb \
        http://mirrors.kernel.org/ubuntu/pool/universe/p/pdftk/pdftk_2.02-4build1_amd64.deb \
        http://mirrors.kernel.org/ubuntu/pool/universe/p/pdftk/pdftk-dbg_2.02-4build1_amd64.deb
    echo -e "Packages for pdftk downloaded\n\n"
    # install packages
    echo -e "\n\n Installing pdftk: \n\n"
    sudo apt install ./libgcj17_6.4.0-8ubuntu1_amd64.deb \
        ./libgcj-common_6.4-3ubuntu1_all.deb \
        ./pdftk_2.02-4build1_amd64.deb \
        ./pdftk-dbg_2.02-4build1_amd64.deb
    echo -e "\n\n pdftk installed\n"
    echo -e "   try it in shell with: > pdftk \n"
    # delete deb files in /tmp directory
    rm ./libgcj17_6.4.0-8ubuntu1_amd64.deb
    rm ./libgcj-common_6.4-3ubuntu1_all.deb
    rm ./pdftk_2.02-4build1_amd64.deb
    rm ./pdftk-dbg_2.02-4build1_amd64.deb
}
### end
### m.emma()
m.emma()
{
    in=$1
    cd ${LOCAL_WORKS_DIR}/libs/publics/jar/emma
    java -cp maven-emma-plugin-0.6.jar emmarun -r html -jar ${in}
}
m.dex2jar()
{
    in=$1
    cd ${HOME}/shell/sh
    ./dex2jar.sh
}
### end
### m.monkeyrunner
m.monkeyrunner()
{
    #export JAVA_HOME=/usr/lib/jvm/java-6-sun
    export JAVA_HOME=/usr/lib/jvm/default-java
    #export JAVA_HOME=/usr/lib/jvm/openjdk-7-amd64
    # JRE, classpath
    export JRE_HOME=${JAVA_HOME}/jre
    export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
    export PATH=${JAVA_HOME}/bin:${PATH}
    monkeyrunner $@
}
### end
## end
# end
