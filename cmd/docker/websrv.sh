### self define
gl_app=''
v.was()
{
	case `ifconfig | grep -E "^e" |grep HWaddr | awk '{print $5}'` in
		'02:42:ac:11:00:03')
			m.log.v "nginx";
			gl_app='nginx';
			;;
		'02:42:ac:11:00:04')
			m.log.v "mysql";
			gl_app='mysql';
			;;
		'02:42:ac:11:00:02')
			m.log.v "apache2";
			gl_app='apache2';
			;;
		*)
			m.log.v "host os";
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

function v.start()
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
	case $(cat /etc/hosts | grep websrv.com | grep -v grep | wc -l) in
		0)
			cat >> /etc/hosts << EOF
## *.websrv.com
172.17.0.2  apache.websrv.com
172.17.0.3  nginx.websrv.com
172.17.0.4  mysql.websrv.com
EOF
			;;
		*)
			m.log.v "hosts is ready";
			;;
	esac
}
### end
