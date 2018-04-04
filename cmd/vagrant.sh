m.vtest()
{
	op=$1
	vagrant_path=${LOCAL_WORKS_DIR}/uni/private
	cd ${vagrant_path}

	case $op in
		1|'init')
			m.log.v vagrant box add base https://github.com/sepetrov/trusty64/releases/download/v0.0.5/trusty64.box
			vagrant box add base https://github.com/sepetrov/trusty64/releases/download/v0.0.5/trusty64.box
			m.log.v vagrant init
			vagrant init
			m.log.v "vagrant machine is initialized ....."
			;;
		2|'start')
			m.log.v vagrant up --provider=virtualbox --color
			vagrant up --provider=virtualbox --color
			m.log.v "vagrant machine is started....."
			;;
		3|ssh|login)
			m.log.v vagrant ssh
			vagrant ssh
			;;
		4|halt|stop)
			m.log.v vagrant halt
			vagrant halt
			m.log.v "halt finished....."
			;;
		5|requirements)
			m.log.v "
安装的软件包：
--------------------------------------------------------------------------------------------------
// apache2
ii  apache2                            2.4.7-1ubuntu4.18                       amd64        Apache HTTP Server
ii  apache2-bin                        2.4.7-1ubuntu4.18                       amd64        Apache HTTP Server (binary files and modules)
ii  apache2-data                       2.4.7-1ubuntu4.18                       all          Apache HTTP Server (common files)
ii  libapache2-mod-php5.6              5.6.33-1+ubuntu14.04.1+deb.sury.org+1   amd64        server-side, HTML-embedded scripting language (Apache 2 module)

// mysql
ii  libdbd-mysql-perl                  4.025-1ubuntu0.1                        amd64        Perl5 database interface to the MySQL database
ii  libmysqlclient18:amd64             5.5.58-0ubuntu0.14.04.1                 amd64        MySQL database client library
ii  mysql-client-5.5                   5.5.58-0ubuntu0.14.04.1                 amd64        MySQL database client binaries
ii  mysql-client-core-5.5              5.5.58-0ubuntu0.14.04.1                 amd64        MySQL database core client binaries
ii  mysql-common                       5.5.58-0ubuntu0.14.04.1                 all          MySQL database common files, e.g. /etc/mysql/my.cnf
ii  mysql-server                       5.5.58-0ubuntu0.14.04.1                 all          MySQL database server (metapackage depending on the latest version)
ii  mysql-server-5.5                   5.5.58-0ubuntu0.14.04.1                 amd64        MySQL database server binaries and system database setup
ii  mysql-server-core-5.5              5.5.58-0ubuntu0.14.04.1                 amd64        MySQL database server binaries

// php
ii  php-common                         1:58+ubuntu14.04.1+deb.sury.org+1       all          Common files for PHP packages
ii  php-zmq                            1.1.3-6+ubuntu14.04.1+deb.sury.org+2    amd64        ZeroMQ messaging bindings for PHP
ii  php5.6                             5.6.33-1+ubuntu14.04.1+deb.sury.org+1   all          server-side, HTML-embedded scripting language (metapackage)
ii  php5.6-bcmath                      5.6.33-1+ubuntu14.04.1+deb.sury.org+1   amd64        Bcmath module for PHP
ii  php5.6-cli                         5.6.33-1+ubuntu14.04.1+deb.sury.org+1   amd64        command-line interpreter for the PHP scripting language
ii  php5.6-common                      5.6.33-1+ubuntu14.04.1+deb.sury.org+1   amd64        documentation, examples and common module for PHP
ii  php5.6-gd                          5.6.33-1+ubuntu14.04.1+deb.sury.org+1   amd64        GD module for PHP
ii  php5.6-json                        5.6.33-1+ubuntu14.04.1+deb.sury.org+1   amd64        JSON module for PHP
ii  php5.6-opcache                     5.6.33-1+ubuntu14.04.1+deb.sury.org+1   amd64        Zend OpCache module for PHP
ii  php5.6-readline                    5.6.33-1+ubuntu14.04.1+deb.sury.org+1   amd64        readline module for PHP

// apache2, mysql-server, php5.6
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update && sudo apt install php5.6
sudo apt-get install apache2 mysql-server php5.6-zmq php5.6-gd php5.6-bcmath php5.6-xml

// git, zip, unzip
sudo apt install git zip unzip
"
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

m.vagrant()
{
	op=$1
	vagrant_path=${LOCAL_WORKS_DIR}/uni/company/dehua/dehuaDev
	cd ${vagrant_path}

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
		5|requirements)
			m.log.v "
安装的软件包：
--------------------------------------------------------------------------------------------------
// apache2
ii  apache2                            2.4.7-1ubuntu4.18                       amd64        Apache HTTP Server
ii  apache2-bin                        2.4.7-1ubuntu4.18                       amd64        Apache HTTP Server (binary files and modules)
ii  apache2-data                       2.4.7-1ubuntu4.18                       all          Apache HTTP Server (common files)
ii  libapache2-mod-php5.6              5.6.33-1+ubuntu14.04.1+deb.sury.org+1   amd64        server-side, HTML-embedded scripting language (Apache 2 module)

// mysql
ii  libdbd-mysql-perl                  4.025-1ubuntu0.1                        amd64        Perl5 database interface to the MySQL database
ii  libmysqlclient18:amd64             5.5.58-0ubuntu0.14.04.1                 amd64        MySQL database client library
ii  mysql-client-5.5                   5.5.58-0ubuntu0.14.04.1                 amd64        MySQL database client binaries
ii  mysql-client-core-5.5              5.5.58-0ubuntu0.14.04.1                 amd64        MySQL database core client binaries
ii  mysql-common                       5.5.58-0ubuntu0.14.04.1                 all          MySQL database common files, e.g. /etc/mysql/my.cnf
ii  mysql-server                       5.5.58-0ubuntu0.14.04.1                 all          MySQL database server (metapackage depending on the latest version)
ii  mysql-server-5.5                   5.5.58-0ubuntu0.14.04.1                 amd64        MySQL database server binaries and system database setup
ii  mysql-server-core-5.5              5.5.58-0ubuntu0.14.04.1                 amd64        MySQL database server binaries

// php
ii  php-common                         1:58+ubuntu14.04.1+deb.sury.org+1       all          Common files for PHP packages
ii  php-zmq                            1.1.3-6+ubuntu14.04.1+deb.sury.org+2    amd64        ZeroMQ messaging bindings for PHP
ii  php5.6                             5.6.33-1+ubuntu14.04.1+deb.sury.org+1   all          server-side, HTML-embedded scripting language (metapackage)
ii  php5.6-bcmath                      5.6.33-1+ubuntu14.04.1+deb.sury.org+1   amd64        Bcmath module for PHP
ii  php5.6-cli                         5.6.33-1+ubuntu14.04.1+deb.sury.org+1   amd64        command-line interpreter for the PHP scripting language
ii  php5.6-common                      5.6.33-1+ubuntu14.04.1+deb.sury.org+1   amd64        documentation, examples and common module for PHP
ii  php5.6-gd                          5.6.33-1+ubuntu14.04.1+deb.sury.org+1   amd64        GD module for PHP
ii  php5.6-json                        5.6.33-1+ubuntu14.04.1+deb.sury.org+1   amd64        JSON module for PHP
ii  php5.6-opcache                     5.6.33-1+ubuntu14.04.1+deb.sury.org+1   amd64        Zend OpCache module for PHP
ii  php5.6-readline                    5.6.33-1+ubuntu14.04.1+deb.sury.org+1   amd64        readline module for PHP

// apache2, mysql-server, php5.6
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update && sudo apt install php5.6
sudo apt-get install apache2 mysql-server php5.6-zmq php5.6-gd php5.6-bcmath php5.6-xml

// git, zip, unzip
sudo apt install git zip unzip
"
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