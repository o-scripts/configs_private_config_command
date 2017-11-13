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
m.bashrc()
{
    m.import ~/.bash_profile
}
# end m.bashrc()

# mac
## self define
### mac osx Finder config
m.finder()
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
### end m.finder()

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

### mount ntfs disk
m.ntfs()
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
        			echo sudo mount -t ntfs -v -w -o 'rw,auto,nosuid,noexec,nobrowse' ${origin} ${point}
		        	# sudo mount -t ntfs -v -o 'rw,auto,nosuid,noexec' ${origin} ${point}
                    # sudo mount -t ntfs -v -o 'rw,auto,nobrowse,update' ${origin} ${point}
                    sudo mount -t ntfs -v -o 'rw,auto,nosuid,noexec,nobrowse' ${origin} ${point}
                    ;;
                *)
                    ;;
            esac
			;;
	esac
}
### end m.ntfs()

### LNMP config
m.lnmp()
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
### end m.lnmp()

### curl.h
m.curl()
{
    m.log.v "/usr/bin/curl\n\t--fail \n\t--progress-bar \n\t--remote-time \n\t--location \n\t--user-agent Homebrew/1.0.9 (Macintosh; Intel macOS 10.12.1) curl/7.49.1 \n\thttps://download3.vmware.com/software/fusion/file/VMware-Fusion-8.5.0-4352717.dmg \n\t-C 140956438 \n\t-o /Users/zhanggd/Library/Caches/Homebrew/Cask/vmware-fusion--8.5.0-4352717.dmg.incomplete"
}
### end m.curl()

### renew beyond compare
m.bc()
{
    old_file="registry.dat"
    bc_config_dir="/Users/zhanggd/Library/Application Support/Beyond Compare/"
    new_file="."${old_file}"_`m.datestr`"
    cd "${bc_config_dir}"
    mv ${old_file} ${new_file}
    cd -
}
### end m.bc()

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
### end m.influx()

### zephyr config
m.zephyr()
{
    op=$1
    case $op in
        '1'|'i'|'install')
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
        '2'|'blinky')
            echo nrfjprog --eraseall -f nrf52
            nrfjprog --eraseall -f nrf52
            sleep 1
            echo ${NRFJPROG} --program ${ZEPHYR_BASE}/samples/basic/blinky/outdir/nrf52_pca10040/zephyr.hex -f nrf52
            ${NRFJPROG} --program ${ZEPHYR_BASE}/samples/basic/blinky/outdir/nrf52_pca10040/zephyr.hex -f nrf52
            sleep 1
            echo ${NRFJPROG} --reset -f nrf52
            ${NRFJPROG} --reset -f nrf52
            ;;
        '2.1'|'btn'|'button')
            echo ${NRFJPROG} --eraseall -f nrf52
            ${NRFJPROG} --eraseall -f nrf52
            sleep 1
            echo ${NRFJPROG} --program ${ZEPHYR_BASE}/samples/basic/button/outdir/nrf52_pca10040/zephyr.hex -f nrf52
            ${NRFJPROG} --program ${ZEPHYR_BASE}/samples/basic/button/outdir/nrf52_pca10040/zephyr.hex -f nrf52
            sleep 1
            echo ${NRFJPROG} --reset -f nrf52
            ${NRFJPROG} --reset -f nrf52
            ;;
        '2.2'|'rgb')
            echo ${NRFJPROG} --eraseall -f nrf52
            ${NRFJPROG} --eraseall -f nrf52
            sleep 1
            echo ${NRFJPROG} --program ${ZEPHYR_BASE}/samples/basic/rgb_led/outdir/nrf52_pca10040/zephyr.hex -f nrf52
            ${NRFJPROG} --program ${ZEPHYR_BASE}/samples/basic/rgb_led/outdir/nrf52_pca10040/zephyr.hex -f nrf52
            sleep 1
            echo ${NRFJPROG} --reset -f nrf52
            ${NRFJPROG} --reset -f nrf52
            ;;
        '3'|'reset'|'reboot')
            echo ${NRFJPROG} --reset -f nrf52
            ${NRFJPROG} --reset -f nrf52
            ;;
        '4'|'mmm')
            make BOARD=nrf52_pca10040
            ;;
        '0'|'h'|'help'|*)
            echo "
            HOW TO CONFIG ZEPHYR
=============================================
 1. i|install - install all dependence packages
 2. blinky - flash blinky to board
 2.1 btn|button - button test
 2.2 rgb-led - disco led test
 3. reset - reboot board
 ---
 0. h|help|* - display this help
---------------------------------------------
            "
            ;;
    esac
}
### end m.zephyr()
### m.lsusb()
m.lsusb()
{
    # jlhonora/lsusb
    system_profiler SPUSBDataType
}
### end
### m.
m.sweethome()
{
    cd ${LOCAL_WORKS_DIR}/libs/publics/SweetHome3D
    java -jar SweetHome3D-5.4.jar &
}
## end
# end
