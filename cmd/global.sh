#! /bin/bash
# normalweise Einstellungen
# die Einstellungen fuer alle Situationen
## language varables settings
alias LANGUAGE="zh_CN.UTF-8"
alias LC_ALL="zh_CN.UTF-8"
## end

# ALL PLATFORM COMMAND
## system command
UNAME=uname
HEAD=head
## safe command
case `${UNAME}` in
    'Darwin')
        MD5=md5;
        NRFJPROG=nrfjprog
        ;;
    'Linux')
        MD5=md5sum;
        APT=apt
        SERV=service
        ;;
esac
OPENSSL=openssl
## end
## android command
ADB=adb
## end
## docker
DOCKER=docker
DOCKER_MACHINE=docker-machine
## end
# end

## some usefull command
alias byobu='byobu-screen'
## end

## which platform
m.arch()
{
    uname
}
## end

## some adb short cmd
alias m.adbs="adb shell"
alias m.adbd="adb devices"
alias m.adbr="adb reboot"
alias m.adbcls="adb logcat -c"
alias m.adblog="adb logcat -v threadtime"
alias m.adbreport="adb shell bugreport"

### bsdiff file
m.ota()
{
    op=$1
    case $op in
        'diff')
            m.log.v '
            HOW CREATE OTA DIFF FILE
===============================================
1. install bsdiff package
    sudo apt-get install bsdiff
2. create diff file
    bsdiff old new xx.patch
3. update old to new
    bspatch old new_file xx.patch
-----------------------------------------------'
            ;;
        'h'|'help'|*)
            m.log.v "
            HOW TO USE OTA
================================================
1. diff - create diff file
2. h|help - display help
------------------------------------------------"
            ;;
    esac
}
### end m.ota()

### spf13-vim short-key
m.vim()
{
    op=$1
    case $op in
        '1')
            m.log.v '
1. Leader/命令前缀:
    [,]
-----------------------------------------------'
            ;;
        '2')
            m.log.v '
2. Vundle: The best plugin manager
-----------------------------------------------'
            ;;
        '3')
            m.log.v '
3. NERDTree/目录树:
    [, e]/[, nt] 跳转到打开的文件所在位置
    [Ctrl+e] 打开目录树
-----------------------------------------------'
            ;;
        '4')
            m.log.v '
===============================================
-----------------------------------------------'
            ;;
        '5')
            m.log.v '
===============================================
-----------------------------------------------'
            ;;
        '6'|'key'|'shortkey')
            m.log.v '
            SPF13-VIM SHORTKEY
===============================================
1. Leader/命令前缀:
    [,]

2. Vundle: The best plugin manager

3. NERDTree/目录树:
    [, e]/[, nt] 跳转到打开的文件所在位置
    [Ctrl+e] 打开目录树

4. ctrlp/快速查找文件:
    [^c-p]

5. Surround/添加括号: managing all the "[{}]" etc.
    Old text                  Command     New text
----------------------------------------------------------------------
5.1.  "Hello *world!"           ds"         Hello world!"
5.2.  [123+4*56]/2              cs])        (123+456)/2
5.3. "Look ma, I am *HTML!"     cs"<q>      <q>Look ma, I am HTML!</q>"
5.4. if *x>3 {                 ysW(        if ( x>3  ) {
5.5. my $str = *whee!;         vllllS""     my $str = "whee!";

6. NERDCommenter/注释:
    [, c space] 添加注释
    [, c i] 切换注释

7. Fugitive/Git管理: deep git integration
    [, gs] Gstatus
    [, gd] Gdiff
    [, gc] Gcommit
    [, gb] Gblame
    [, gl] Glog
    [, gp] Git push

8. 代码折叠
    [, f0]
    [, f1]
    [, f2]
    [, f3]
    [, f4]
    [, f5]
    [, f6]
    [, f7]
    [, f8]
    [, f9]
-----------------------------------------------'
            ;;
        '7'|'h'|'help'|*)
            m.log.v "
================================================
1.
2.
3.
4.
5.
6. key|shortkey - display shortkey
7. h|help - display help
------------------------------------------------"
            ;;
    esac
}
### end m.vim()

### pm self define
m.pm()
{
    op=$1
    pkg=$2
    case $op in
        'all'|'a'|'A')
            adb shell 'pm list package -f'
            ;;
        'name'|'n'|'N')
            adb shell 'pm list package'
            ;;
        'path')
            adb shell "pm path $pkg"
            ;;
        'cur')
            adb shell dumpsys window w | grep '\/' | grep name
            ;;
        *)
            m.log.v "
            HOW TO USE PM GET APK INFO
===============================================
1. 列出系统已经安装的所有的包名
adb shell 'pm list package'
2. 找系统已经安装的包位置和包名
adb shell 'pm list package -f'
3. 找指定包名
adb shell 'pm path pkg'
4. 找当前窗口的应用
adb shell dumpsys window w | grep '\/' | grep name
-----------------------------------------------"
    esac
}
### end
## end

## git tools configuration
### help menu
m.git()
{
    m.log.v git.l="git log --name-status --color=auto --graph"
    m.log.v git.a="git add"
    m.log.v git.ap="git add -p"
    m.log.v git.cm="git commit"
    m.log.v git.d="git diff --color=auto"
    m.log.v git.down="git pull"
    m.log.v git.up="git pull; git push"
    m.log.v git.sb="git status -sb"
    m.log.v git.ss="git status -s"
    m.log.v git.st="git status"
    m.log.v git.w="git whatchanged"
    m.log.v git.md="git submodule"
    m.log.v git.md.a="git submodule add"
    m.log.v git.md.up="git submodule update"
    m.log.v git.b="git branch"
    m.log.v git.br="git branch -r"
    m.log.v git.ba="git branch -a"
    m.log.v git.ck="git checkout"
    m.log.v git.cfg="git config -l"
    m.log.v git.cls="git status -s | grep \"??\" | awk '{print $2}' | xargs rm -rvf"
    m.log.v cyanogenmodsync="cat .repo/manifest.xml | grep CyanogenMod | awk '{print $2}' | cut -d'\"' -f2 | xargs -n 16 ./repo sync -j16"
}
### end

### some git short cmd
alias git.l="git log --name-status --color=auto --graph"
alias git.a="git add"
alias git.ap="git add -p"
alias git.cm="git commit"
alias git.d="git diff --color=auto"
alias git.down="git pull"
alias git.up="git pull; git push"
alias git.sb="git status -sb"
alias git.ss="git status -s"
alias git.st="git status"
alias git.w="git whatchanged"
alias git.md="git submodule"
alias git.md.a="git submodule add"
alias git.md.up="git submodule update"
alias git.b="git branch"
alias git.br="git branch -r"
alias git.ba="git branch -a"
alias git.ck="git checkout"
alias git.cfg="git config -l"
alias git.cls="git status -s | grep \"??\" | awk '{print $2}' | xargs rm -rvf"
alias cyanogenmodsync="cat .repo/manifest.xml | grep CyanogenMod | awk '{print $2}' | cut -d'\"' -f2 | xargs -n 16 ./repo sync -j16"
### end
## end

## avalible for enviorment
m.datestr()
{
    m.log.v "`date +%Y.%m.%d.%H.%M.%S`"
}
m.zipstr()
{
    m.log.v "_gdz_`date +%Y.%m.%d_%H%M`"
}
m.strlog()
{
    m.log.v "fatal|low mem|has died|activitymanager|keycode="
}
## end

## goto
m.branch()
{
    cd ${BRANCH_GIT}
}
m.works()
{
    cd ${LOCAL_WORKS_DIR}
}
m.shell()
{
    cd ${MSHELL}
}
m.soft()
{
    cd ${MSOFT}
}
m.matlab()
{
    cd ${MATLAB_HOME}
}
m.config()
{
    cd ${LOCAL_CONFIG_DIR}
}
m.command()
{
    cd ${LOCAL_CONFIG_DIR}/command
}
m.enviorment()
{
    cd ${LOCAL_CONFIG_DIR}/env
}
## end

## self define command
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
### end

### gollum for wiki page
m.wiki()
{
    op=$1
    case $op in
        'fad')
            ;;
        *)
            m.log.v "
                        WIKI CONFIG INSTALL
============================================================================
1. install ruby
    apt install ruby ruby-dev libicu-dev
2. install gollum
    gem install gollum
3. clone Wiki
    git clone http://git.oschina.net/mr.z/webService.wiki.git
    cd webService.wiki
4. start Gollum and edit locally
    gollum
    == Sinatra/1.3.5 has taken the stage on 4567 for development with backup from Thin
    >> Thin web server (v1.5.0 codename Knife)
    >> Maximum connections set to 1024
    >> Listening on 0.0.0.0:4567, CTRL+C to stop
----------------------------------------------------------------------------"
            ;;
    esac
}
### end

### wps need fonts
m.wps()
{
    op=$1
    case $op in
        '1'|'fonts')
            m.log.v '
              WPS NEED FONTS LIST
=================================================
MTCORSVA.TTF
WINGDNG2.TTF
courbi.ttf
couri.ttf
cour.ttf
courbd.ttf
monotypesorts.ttf
Mt Extra Tiger.ttf
mtextra_01.ttf
Symbol Tiger Expert.ttf
symbol.ttf
Symbol Tiger.ttf
wingding.ttf
-------------------------------------------------'
            ;;
        'h'|'help'|*)
            m.log.v "
            HOW TO CONFIG WPS
=================================================
1. fonts - config fonts
2. h|help - display infomation
-------------------------------------------------"
            ;;
    esac
}
### end

### timestamp
m.timestamp()
{
    op=$1
    case $op in
        '1'|'sec')
            str="`date +%Y-%m-%d\ %H:%M:%S`"
            m.log.v \[$str\] `date -d "${str}" +%s`
            ;;
        '2'|'mil')
            str="`date +%Y-%m-%d\ %H:%M:%S`.000"
            m.log.v \[$str\] `date -d "${str}" +%s`"000"
            ;;
        '3'|'h'|'help'|*)
            m.log.v "
            HOW TO CREATE TIMESTAMP
==================================================
1. sec - create timestamp with seconds
2. mil - create timestamp with million seconds
3. h|help - display infomation
--------------------------------------------------"
            ;;
    esac
}
### end
m.log.d "source ${COMMAND_DIR}/cmd/android.sh"
source ${COMMAND_DIR}/cmd/android.sh
## end
# end
