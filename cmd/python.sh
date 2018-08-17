#!/bin/bash
## m.py()
m.py(){
	op=$1
	case $op in
		'1'|'virtualenv'|'venv')
			m.log.v sudo apt-get install python-virtualenv
			sudo apt-get install python-virtualenv
			;;
	esac
}
## end

## m.venv()
m.venv(){
	op=$1
	python=$2
	case ${python} in
		'python3')
			python='python3'
			;;
	esac

	case $op in
		'1'|'create')
			m.log.v "virtualenv -p $(which ${python}) ${python}"
			virtualenv -p $(which ${python}) ${python}
			;;
		'2'|'active')
			m.log.v "source $(pwd)/runtime/bin/activate"
			source $(pwd)/runtime/bin/activate
			;;
		'3'|'requirement')
			m.log.v "pip freeze > requirements.txt"
			pip freeze > requirements.txt
			;;
		*)
			m.log.v "
			HOT TO USE virtualenv
----------------------------------------------------
1. create - create a virtualenv to local
2. active - active a local virtualenv
3. requirement - create a requirements.txt file
*. help|h - display help info
===================================================="
			;;
	esac
}
## end