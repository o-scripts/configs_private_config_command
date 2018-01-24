m.vagrant()
{
	op=$1
	case $op in
		1|'init')
			m.log.v vagrant box add base https://github.com/sepetrov/trusty64/releases/download/v0.0.5/trusty64.box
			vagrant box add base https://github.com/sepetrov/trusty64/releases/download/v0.0.5/trusty64.box
			m.log.v vagrant init
			vagrant init
			;;
		2|'start')
			m.log.v vagrant up --provider=virtualbox --color
			vagrant up --provider=virtualbox --color
			;;
		3|ssh|login)
			m.log.v vagrant ssh
			vagrant ssh
			;;
		4|halt|stop)
			m.log.v vagrant halt
			vagrant halt
			;;
		0|h|help|*)
			m.log.v "
			HOW TO USE VAGRANT
=====================================================
0. help 	- display this help information
1. init 	- init virtual machine by vagrant image
2. start 	- start vagrant machine
3. ssh 		- use ssh to login to the machine
4. halt|stop - stop this machine
"
			m.log.v vagrant $@
			vagrant $@
			;;
	esac
}