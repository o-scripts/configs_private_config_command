m.vagrant()
{
	op=$1
	case $op in
		1|'init')
			m.log.v vagrant add box base https://github.com/sepetrov/trusty64/releases/download/v0.0.5/trusty64.box
			vagrant add box base https://github.com/sepetrov/trusty64/releases/download/v0.0.5/trusty64.box
			;;
		2|'start')
			m.log.v vagrant up --provider=virtualbox
			vagrant up --provider=virtualbox
			;;
		*)
			m.log.v "
			HOW TO USE VAGRANT
=====================================================
1. init 	- init virtual machine by vagrant image
2. start 	- start vagrant machine
3. ssh 		- use ssh to login to the machine
*. help 	- display this help information
"
			;;
	esac
}