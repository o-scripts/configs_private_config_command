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
	source ~/.bashrc
}
## self define
### histoty command config
m.history()
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
### end

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
### end

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
### end

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
### end

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
### m.ranger end

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
### m.counter end

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
### end

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
### end

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
m.log.d "source ${COMMAND_DIR}/cmd/docker.sh"
source ${COMMAND_DIR}/cmd/docker.sh
## end
# end
