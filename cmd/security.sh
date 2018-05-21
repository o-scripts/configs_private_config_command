#!/bin/bash
### ssh login with no pw
m.ssh()
{
     op=$1
     case $op in
        '1'|'rsa')
            m.log.v '
        HOW TO USE SSH WITH RSA KEY
==============================================
1. 创建rsa证书
ssh-keygen -t rsa -C "commit"
2. 配置登录
在~/.ssh/config添加如下内容：
Host pc.host.de
    HostName pc.host.de
    User user
    IdentityFile ~/.ssh/path/id_rsa
3. 登录
ssh -v user@pc.host.de
----------------------------------------------'
            ;;
        '2'|'pem')
            m.log.v '
        HOW TO USE SSH WITH PEM KEY
==============================================
1. rsa证书转换为pem证书
openssl req -x509 -key path/to/key/id_rsa -nodes -days 365 -newkey rsa:2048 -out myCert.pem
2. 使用证书登录
ssh -i path/to/key.pem -v user@pc.host.de
----------------------------------------------'
            ;;
        '3'|'nopwd')
             m.log.v '
        HOW LOGIN SSH WITHOUT PWD
==============================================
1. 添加信任证书
cat id_rsa.pub > authorized_keys
2. 配置登录
在~/.ssh/config添加如下内容：
Host pc.host.de
    HostName pc.host.de
    User user
    IdentityFile ~/.ssh/path/id_rsa
3. 登录
ssh -v user@pc.host.de
----------------------------------------------'
            ;;
        *)
            m.log.v '
            HOW LOGIN SSH LOGIN
==============================================
1. rsa
ssh login with rsa key
2. pem
ssh login with pem key
3. nopwd
ssh login without pwd
----------------------------------------------'
    esac
}
### end m.ssh()

### reset password of mysql
m.reset()
{
    case $1 in
        '1'|'mysql')
            m.log.v '
               HOW TO RESET PASSWORD OF MYSQL
================================================================
1. mysqld_safe --skip-grant-tables &
2. mysql -uroot
3. use mysql
4. update user set password=PASSWORD("newpwd") where user="root";
5. flush privileges;
6. quit
----------------------------------------------------------------'
            ;;
        '2'|'h'|'help'|*)
            m.log.v "
            HOW TO RESET CONFIG
==========================================
1. mysql - reset mysql password
2. h|help - display help infomation
------------------------------------------"
            ;;
    esac
}
### end m.reset()

### use openssl rand to create random string
m.randomMac()
{
    seed=$1
	# mac osx -----
    case $seed in
        '1'|'ssl'|'openssl')
            ${OPENSSL} rand -base64 8 | ${MD5}
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
3. date
4. urandom
----------------------------------------------------------------'
            ;;
    esac
    # mac osx ----- end
}
### end m.random()

### use openssl rand to create random string
m.randomLinux()
{
    seed=$1
    case $seed in
        '1'|'ssl'|'openssl')
            m.log.d "openssl rand -base64 8 | ${MD5}"
            openssl rand -base64 8 | ${MD5}
            ;;
        '2'|'uuid')
            m.log.d "cat /proc/sys/kernel/random/uuid"
            cat /proc/sys/kernel/random/uuid
            ;;
        '3'|'date')
            m.log.d date +%s%N | ${MD5} | ${HEAD} -c 10
            date +%s%N | ${MD5} | ${HEAD} -c 10
            echo ""
            ;;
        '4'|'urandom')
            m.log.d "cat /dev/urandom | ${HEAD} -n 10 | ${MD5} | ${HEAD} -c 10"
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
m.random()
{
	m.log.v "m.random: $@"
	case `uname` in
		'Darwin')
			m.randomMac $@
			;;
		'Linux')
			m.randomLinux $@
			;;
	esac
}
### end m.random()
