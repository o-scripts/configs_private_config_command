### self define
gl_app=''
v.was()
{
	# case `ifconfig | grep -E "^e" |grep HWaddr | awk '{print $5}'` in
	case $(ifconfig | grep -E "[*:*:*:*:*:]" | grep -v ': '|awk '{print $2}') in
		'02:42:ac:11:00:03')
			m.log.v "apache2";
			gl_app='apache2';
			;;
		'02:42:ac:11:00:04')
			m.log.v "mysql";
			gl_app='mysql';
			;;
		'02:42:ac:11:00:02')
			m.log.v "nginx";
			gl_app='nginx';
			;;
		'02:42:ac:11:00:05')
			# m.log.v "python";
			# gl_app='python';
			;;
		*)
			m.log.v "host os";
			gl_app="-1"
			;;
	esac
}

v.import()
{
	case $(cat ~/.bashrc | grep "import.sh" | grep -v grep | wc -l) in
		0)
			cat >> ~/.bashrc << EOF
source ${HOME}/works/configs/private/config/import.sh
EOF
			;;
		*)
			m.log.v "config is already import to bashrc";
			;;
	esac

	# running tasks
	v.start &
	v.hosts &
}

v.start()
{
	v.was
	case $(ps aux | grep -v grep | grep ${gl_app} | wc -l) in
		0)
			service ${gl_app} start;
			;;
		*)
			m.log.v "${gl_app} is running"
			;;
	esac
}

v.hosts()
{
	## import hosts info
	case $(cat /etc/hosts | grep betoptop.com | grep -v grep | wc -l | sed 's/^[\t| ]//g') in
		0)
			cat >> /etc/hosts << EOF
## *.betoptop.com
172.17.0.2  nginx.betoptop.com
172.17.0.3  apache.betoptop.com
172.17.0.4  mysql.betoptop.com
172.17.0.5  python.betoptop.com
EOF
			;;
		*)
			m.log.v "hosts is ready";
			;;
	esac
}
### end

v.app()
{
    op=$1
    case $op in
        ## ------------------------------------------------------
        'c1'|'apache')
            m.log.v "parm: "$@
            service apache2 $2
            ;;
        ## ------------------------------------------------------
        'c2'|'nginx')
            m.log.v "parm: "$@
            service nginx $2
            ;;
        ## ------------------------------------------------------
        'c3'|'mysql')
            m.log.v "parm: "$@
            service mysql $2
            ;;
        ## ------------------------------------------------------
        'c4'|'ssh')
            m.log.v "parm: "$@
            service ssh $2
            ;;
        *)
            m.log.v ""
            ;;
    esac
}

v.apt()
{
	echo apt update
	apt update
	echo apt -y install iputils-ping libnet-ifconfig-wrapper-perl vim htop git ssh
	apt -y install iputils-ping libnet-ifconfig-wrapper-perl vim htop git ssh
}

v.php()
{
	sudo apt-get install python-software-properties
	sudo add-apt-repository ppa:ondrej/php
	sudo apt-get update
	sudo apt-get install -y php5.6
}