### Docker
m.docker()
{
    op=$1
    pa=$2
    case $op in
		## ------------------------------------------------------
        '1'|'start'|'up')
            case `uname` in
                'Darwin')
                    m.log.v "boot2docker start"
                    boot2docker start
                    m.log.v "docker version"
                    docker version
                    ;;
                'Linux')
                    m.log.v sudo ${SERV} ${DOCKER} start
                    sudo ${SERV} ${DOCKER} start
                    ;;
            esac
			;;
        ## ------------------------------------------------------
        '2'|'stop'|'down'|'close')
            case `uname` in
                'Darwin')
                    m.log.v "boot2docker down"
                    boot2docker down
                    m.log.v "docker version"
                    docker version
                    ;;
                'Linux')
                    m.log.v sudo ${SERV} ${DOCKER} stop
                    sudo ${SERV} ${DOCKER} stop
                    ;;
            esac
            ;;
        ## ------------------------------------------------------
        '3'|'lnmp')
            #docker run -p 8080:443 -v ~/mnt:/mnt -i -t lnmp.htop /bin/bash
			m.log.v "docker run -p 80:80 -p 8080:8080 -p 443:443 -v ~/tmp:/home/sites -d -i -t ubuntu:lnmp /bin/bash"
            read -p "Press to continue...."
			docker run -p 80:80 -p 8080:8080 -p 443:443 -v ~/tmp:/home/sites -d -i -t ubuntu:lnmp /bin/bash
            ;;
        ## ------------------------------------------------------
		'4'|'ubuntu')
			m.log.v "docker run -p 80:80 -p 8080:8080 -p 443:443 -v ~/tmp:/home/sites -d -i -t ubuntu:14.04 /bin/bash"
            read -p "Press to continue...."
			docker run -p 80:80 -p 8080:8080 -p 443:443 -v ~/tmp:/home/sites -d -i -t ubuntu:14.04 /bin/bash
			;;
        ## ------------------------------------------------------
        '5'|'zephyr')
            m.log.v "docker run -p 80:80 -p 8080:8080 -p 443:443 -v ~/works:/tmp/works -d -i -t zephyr:works su test"
            read -p "Press to continue...."
            docker run -p 80:80 -p 8080:8080 -p 443:443 -v ~/works:/tmp/works -d -i -t zephyr:works su test
            ;;
        ## ------------------------------------------------------
        '6'|'ps'|'info')
            m.log.v "=========================================================
 docker version
---------------------------------------------------------"
            docker version
            m.log.v "=========================================================
docker images
---------------------------------------------------------"
            docker images
            m.log.v "=========================================================
docker ps
---------------------------------------------------------"
            docker ps
            ;;
        ## ------------------------------------------------------
        '7'|'commit'|'cm')
            m.log.v "docker ps"
            docker ps
            cId=`docker ps | grep -v 'COMMAND' | awk '{print $1}'`
            cName=`docker ps | grep -v 'COMMAND' | awk '{print $2}'`
            #msg="update status"
            #read -p "input commit id: " cId
            #read -p "input name: " cName
            read -p "input commit message: " msg
            m.log.v docker commit -m "\"${msg}\"" ${cId} ${cName}
            docker commit -m "${msg}" ${cId} ${cName}
            ;;
        ## ------------------------------------------------------
        ## =====================================================================
        'clear'|'del'|'a')
            m.log.v "delete all not active container"
            m.log.v "docker rm $(docker -a -q)"
            docker rm $(docker -a -q)
            ;;
        ## ------------------------------------------------------
        'use'|'help'|'h')
            case `uname` in
                'Darwin')
                    m.log.v '
                            HOW TO USE DOCKER
============================================================================
1. create lnmp, verbinden local folder ~/tmp to virtual folder /home/sites
`docker run --name lnmp -v ~/tmp:/home/sites:ro -i -t ubuntu:14.04 /bin/bash`
`docker run -v ~/tmp:/home/sites:rw -i -t ubuntu:14.04 /bin/bash`

2. bind local port with container port
2.1. local port 8080 verbinden mit container port 80
docker run -p 8080:80 -v ~/tmp:/home/sites -i -t ubuntu:lnmps /bin/bash

2.2. local port 8080 verbinden mit container port 443
docker run -p 8080:443 -v ~/mnt:/mnt -i -t lnmp.htop /bin/bash

2.3. container port 80,443 auto bind with local port
docker run -P --expose 80 --expose 443 -v ~:/root -i -t ubuntu:14.04 /bin/bash

2.4. bind local ports 80, 443 with container ports 80, 443
docker run -p 127.0.0.1:80:80 -p 127.0.0.1:443:443 -v ~:/root -i -t ubuntu:14.04 /bin/bash

3. commit a status
`docker commit -m "lnmp" e61884a17a10 ubuntu:lnmp`'
                    ;;
                'Linux')
                    m.log.v '
                            HOW TO USE DOCKER
============================================================================
1. create lnmp, verbinden local folder ~/tmp to virtual folder /home/sites
`docker run --name lnmp -v ~/tmp:/home/sites:ro -i -t ubuntu:14.04 /bin/bash`

2. bind local port with container port
2.1. local port 8080 verbinden mit container port 80
docker run -p 8080:80 -v ~/tmp:/home/sites -i -t ubuntu:lnmps /bin/bash
2.2. local port 8080 verbinden mit container port 443
docker run -p 8080:443 -v ~/mnt:/mnt -i -t lnmp.htop /bin/bash
2.3. container port 80,443 auto bind with local port
docker run -P --expose 80 --expose 443 -v ~:/root -i -t ubuntu:14.04 /bin/bash
2.4. bind local ports 80, 443 with container ports 80, 443
docker run -p 127.0.0.1:80:80 -p 127.0.0.1:443:443 -v ~:/root -i -t ubuntu:14.04 /bin/bash
2.5. run uni-module robotik
docker run -v /media/self/develop/branch.git/works/uni/private/fachrichtung/ma/robotics:/home/sites -it ubuntu:14.04 bash

3. commit a status
`docker commit -m "lnmp" e61884a17a10 ubuntu:lnmp`'
                    ;;
            esac
            ;;

        'install'|'i')
            case `uname` in
                'Darwin')
                    m.log.v '
                        HOW TO INSTALL DOCKER
============================================================================
4. install docker
4.1. 安装docker依赖包
    brew install docker docker-machine docker-compose boot2docker

4.2. 配置启动Docker
在安装完毕后boot2docker后，就可以直接使用boot2docerk这个client command来操作vm中Images了。
4.2.1. boot2docker init 命令进行初始化
从日志可以看出，初始化的过程是下载一个boot2docer.iso，然后会用ssh生成用于docker的ssh的公钥和私钥对，用于远程。
---------------------------------------------------------
    shengli-mac$ boot2docker init
    Latest release for boot2docker/boot2docker is v1.3.2
    Downloading boot2docker ISO image...
    Success: downloaded https://github.com/boot2docker/boot2docker/releases/download/v1.3.2/boot2docker.iso
    to /Users/shengli/.boot2docker/boot2docker.iso
    Generating public/private rsa key pair.
    Your identification has been saved in /Users/shengli/.ssh/id_boot2docker.
    Your public key has been saved in /Users/shengli/.ssh/id_boot2docker.pub.
    The key fingerprint is:
    ff:7a:53:95:e6:44:27:70:e1:ac:0a:b5:02:35:72:29 shengli@192.168.2.101
    The key randomart image is:
    +--[ RSA 2048]----+
    |      . +.  ..o. |
    |      E+..   +...|
    |      ..  .   +.o|
    |       . . . . +.|
    |        S . . +. |
    |         + .  .. |
    |          o  .   |
    |           .o    |
    |          .o..   |
    +-----------------+
---------------------------------------------------------
4.2.2. boot2docerk start/up命令来启动
---------------------------------------------------------
    shengli-mac$ boot2docker start
    Waiting for VM and Docker daemon to start...
    .......................ooooooooooooooooooo
    Started.
    Writing /Users/shengli/.boot2docker/certs/boot2docker-vm/ca.pem
    Writing /Users/shengli/.boot2docker/certs/boot2docker-vm/cert.pem
    Writing /Users/shengli/.boot2docker/certs/boot2docker-vm/key.pem

    To connect the Docker client to the Docker daemon, please set:
        export DOCKER_HOST=tcp://192.168.59.103:2376
        export DOCKER_CERT_PATH=/Users/shengli/.boot2docker/certs/boot2docker-vm
        export DOCKER_TLS_VERIFY=1
---------------------------------------------------------
4.2.3. 执行$(boot2docker shellinit)
---------------------------------------------------------
    shengli-mac$ $(/usr/local/bin/boot2docker shellinit)
    Writing /Users/shengli/.boot2docker/certs/boot2docker-vm/ca.pem
    Writing /Users/shengli/.boot2docker/certs/boot2docker-vm/cert.pem
    Writing /Users/shengli/.boot2docker/certs/boot2docker-vm/key.pem
    shengli-mac$ docker version
    Client version: 1.3.2
    Client API version: 1.15
    Go version (client): go1.3.3
    Git commit (client): 39fa2fa
    OS/Arch (client): darwin/amd64
    Server version: 1.3.2
    Server API version: 1.15
    Go version (server): go1.3.3
    Git commit (server): 39fa2fa
---------------------------------------------------------
4.2.4. 如果想进入到虚拟机的控制台，可以使用boot2docker ssh命令
    zhanggd@zhanggd-mini:~$ boot2docker ssh
    Boot2Docker version 1.11.2, build HEAD : a6645c3 - Wed Jun  1 22:59:51 UTC 2016
    Docker version 1.11.2, build b9f10c9
4.3. Quick Start
4.3.1. Verify docker is installed correctly.
---------------------------------------------------------
    zhanggd@zhanggd-mini:~$ docker run hello-world
    Unable to find image "hello-world:latest" locally
    latest: Pulling from library/hello-world
    c04b14da8d14: Pull complete
    Digest: sha256:0256e8a36e2070f7bf2d0b0763dbabdd67798512411de4cdcf9431a1feb60fd9
    Status: Downloaded newer image for hello-world:latest

    Hello from Docker!
    This message shows that your installation appears to be working correctly.

    To generate this message, Docker took the following steps:
     1. The Docker client contacted the Docker daemon.
     2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
     3. The Docker daemon created a new container from that image which runs the
        executable that produces the output you are currently reading.
     4. The Docker daemon streamed that output to the Docker client, which sent it
        to your terminal.

    To try something more ambitious, you can run an Ubuntu container with:
     $ docker run -it ubuntu bash

    Share images, automate workflows, and more with a free Docker Hub account:
     https://hub.docker.com

    For more examples and ideas, visit:
     https://docs.docker.com/engine/userguide/
---------------------------------------------------------
----------------------------------------------------------------------------'
                    ;;
                'Linux')
                    m.log.v '
                        HOW TO INSTALL DOCKER
============================================================================
4. install docker
4.1. 安装 apt-transport-https 包支持 https 协议的源
    apt-get install apt-transport-https ca-certificates

4.2. 添加源的 gpg 密钥
    apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
        --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

4.3. 获取当前操作系统的代号
    lsb_release -c

4.4. 接下来就可以添加 Docker 的官方 apt 软件源了
    echo deb https://apt.dockerproject.org/repo ubuntu-trusty main > /etc/apt/sources.list.d/docker.list

4.5. 更新 apt 软件包缓存
    apt-get update
    1. 为了让 Docker 使用 aufs 存储，推荐安装 linux-image-extra 软件包
        apt-get install -y linux-image-extra-$(uname -r)
    2. 在 Ubuntu 14.04 或者 12.04上安装Docker，需要安装apparmor（apparmor是Linux内核的一个安全模块，新版本的Ubuntu已经被整合到内核）:
        apt-get install apparmor
12.04 LTS版本
    linux-image-generic-lts-trusty （必备）
    linux-headers-generic-lts-trusty （必备）
    xserver-xorg-lts-trusty （带图形界面时必备）
    libgl1-mesa-glx-lts-trusty（带图形界面时必备）
    安装命令(根据环境和要求不同，选择安装上述软件包)，如：
    apt-get install linux-image-generic-lts-trusty
    apt-get install linux-headers-generic-lts-trusty

4.6. 安装 Docker
    在成功添加源之后，就可以安装最新版本的 Docker 了，软件包名称为 docker-engine
    apt-get install -y docker-engine

4.6.1. 安装docker-machine
    curl -L https://github.com/docker/machine/releases/download/v0.8.2/docker-machine-`uname -s`-`uname -m`
    sudo mv docker-machine* /usr/local/bin/docker-machine
    sudo chmod +x /usr/local/bin/docker-machine
    docker-machine version
4.6.2. 创建一个本地VM
    docker-machine create --driver virtualbox default
    docker-machine ls
4.6.3. 获取配置
    docker-machine env default
4.6.4. 添加docker组
    sudo groupadd docker
4.6.5. 添加用户到docker组
    sudo usermod -aG docker $USER

4.7. Quick Start
4.7.1. Start the docker daemon.
    sudo service docker start
4.7.2. Verify docker is installed correctly.
    sudo docker run hello-world
----------------------------------------------------------------------------'
                    ;;
            esac
            ;;
        *)
            m.log.v '
                                DOCKER
============================================================================
1. start|up     - start docker-machine
2. stop         - stop docker-machine
3. lnmp         - start bash in Linux+Nging+Mysql+Php
4. ubuntu       - run ubuntu 14.04
5. zephyr       - run to zephyr development env
6. info|ps      - show info of docker
7. commit|cm    - commit this docker
8. clear|del    - clean all not active container
-----------------------------------------------
use|help|h  - userguide
install|i   - quick install
*           - display this menu
----------------------------------------------------------------------------'
            ;;
    esac
}
### end