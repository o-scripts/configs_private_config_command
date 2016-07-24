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

# mount ntfs disk
ntfs.mount()
{
	code='0'
	msg=
	origin=$1
	point=$2

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

	case ${origin} in
		'-1')
			echo -e ${msg}
			;;
		'h'|'-h'|'--help'|'?'|'-?')
			echo -e "USEAGE:\n\tntfs.mount origin point\nSamples:\n\tntfsmount /dev/disk2s1 ~/zgd_cs701"
			;;
		*)
			echo sudo mount -v -o 'rw,auto,nobrowse' -t ntfs ${origin} ${point}
			sudo mount -v -o 'rw,auto,nobrowse' -t ntfs ${origin} ${point}
			;;
	esac
}

# revalue mac.command
re-bashrc()
{
	source ~/.bash_profile
}
# end
