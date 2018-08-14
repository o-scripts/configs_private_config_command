m.scan()
{
	## global config
	old=pwd
	ipdomain=$1
	out_tail="`date +%Y%m%d_%H%M`.log"

	## steps
	## 0. create a folder named ipdomain
	mkdir -p ${ipdomain}; cd ${ipdomain};

	## nmap
	m.log.v "nmap -v -A ${ipdomain} | tee ${ipdomain}_nmap${out_tail}"
	nmap -v -A ${ipdomain} | tee "${ipdomain}_nmap_${out_tail}" &

	## whois
	m.log.v "whois ${ipdomain} | tee ${ipdomain}_whois_${out_tail}"
	whois ${ipdomain} | tee "${ipdomain}_whois_${out_tail}" &

	## dig
	m.log.v "dig ${ipdomain} | tee ${ipdomain}_dig_${out_tail}"
	dig ${ipdomain} | tee "${ipdomain}_dig_${out_tail}" &

	## ping
	m.log.v "ping -c 4 ${ipdomain} | tee ${ipdomain}_ping_${out_tail}"
	ping -c 4 ${ipdomain} | tee "${ipdomain}_ping_${out_tail}" &

	## tracepath
	case $(m.arch) in
		'Linux'|Linux)
			alias traceroute='/usr/sbin/tracepath'
			;;
		'Darwin'|Darwin)
			alias traceroute='/usr/sbin/traceroute'
			;;
	esac
	m.log.v "traceroute -m 20 ${ipdomain} | tee ${ipdomain}_trace_${out_tail}"
	traceroute -m 20 ${ipdomain} | tee ${ipdomain}_trace_${out_tail} &
}

m.noscan()
{
	case $(m.arch) in
		'Linux'|Linux)
			alias traceroute='/usr/sbin/tracepath'
			;;
		'Darwin'|Darwin)
			alias traceroute='/usr/sbin/traceroute'
			;;
	esac
	pkill nmap whois dig traceroute
}
