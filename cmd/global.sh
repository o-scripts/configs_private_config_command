#! /bin/bash
# 11111111111111111111111111111111111111111111111
# normalweise Einstellungen
# die Einstellungen fuer alle Situationen
## version config
m.version()
{
    version="v17.04.02-01"
    author="zgd1348833@gmail.com"
    echo ${version}
    echo ${author}
}
## end m.version()
# end 1

# 111111111111111111111111111111111111111111111111
# some varables and alias
## language varables settings
alias LANGUAGE="zh_CN.UTF-8"
alias LC_ALL="zh_CN.UTF-8"
## end 2

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
# alias byobu='byobu-screen'
# end 2

# which platform
m.arch()
{
    uname
}
## end
## filter.sp()
m.filter.nosp()
{
    sed s/[[:space:]]//g
}
## end
# 1111111111111111111111111111111111111111111111
# function define area
# @2017.03.26
## some adb short cmd
alias adb.up="adb start-server"
alias adb.dw="adb kill-server"
alias adb.dev="adb devices"
### shell
alias adb.sh="adb shell"
alias adb.rbt="adb reboot"
alias adb.in="adb shell input"
alias adb.clc="adb logcat -c"

### self define function list
m.link()
{
    src=$1
    dest=$2
    m.log.d "list:$@, src: ${src}, dest: ${dest}"
    if [[ -e ${dest} ]]; then
        m.log.d "dest is exist..."
        rm -vf ${dest}
    else
        m.log.d "${dest} is not exist...."
    fi
    ln -s $@
}
adb.am()
{
    m.log.v "adb shell am $@"
    adb shell "am $@"
}
adb.pm()
{
    m.log.v "adb shell pm $@"
    adb shell "pm $@"
}

### log setting
adb.log()
{
    logcat_log=logcat_${USER}_`date +%Y%m%d_%H%M`.log
    m.log.v "adb logcat -v threadtime | tee ${logcat_log}"
    adb logcat -v threadtime > ${logcat_log}
    m.link ${logcat_log} logcat.log
}
adb.report()
{
    bugreport_log=bugreport_${USER}_`date +%Y%m%d_%H%M`.log
    m.log.v "adb shell bugreport | tee ${bugreport_log}"
    adb shell bugreport | tee ${bugreport_log}
    m.link ${bugreport_log} bugreport.log
}
adb.kmsg()
{
    op=$(adb shell 'cat /proc/kmsg > /data/local/tmp/kmgs; echo $?' | grep -v 'Permission denied' | filter.sp)
    m.log.v "op: ,${op},"
    kmsg_log=kmsg_${USER}_`date +%Y%m%d_%H%M`.log
    case $op in
        1|'1')
            m.log.v "adb.sh 'dmesg' > ${kmsg_log}"
            adb.sh 'dmesg' > ${kmsg_log}
            ;;
        *)
            m.log.v adb pull /data/local/tmp/kmgs ${kmsg_log}
            adb pull /data/local/tmp/kmgs ${kmsg_log}
            ;;
    esac
    m.link ${kmsg_log} kmsg.log
}

### some git short cmd
alias git.ref="git reflog"
alias git.rv="git remote -v"
alias git.l="git log --color=auto --graph"
alias git.lf="git log --color=auto --graph --name-status"
alias git.a="git add"
alias git.ap="git add -p"
alias git.cl='git clone'
alias git.cm="git commit"
alias git.cmr="git commit --amend"
alias git.df="git diff --color=auto"
alias git.sb="git status -sb"
alias git.ss="git status -s"
alias git.st="git status"
alias git.wc="git whatchanged"
alias git.sw="git show"
alias git.mo="git submodule"
alias git.mo.a="git submodule add"
alias git.mo.up="git submodule update"
alias git.b="git branch"
alias git.br="git branch -r"
alias git.ba="git branch -a"
alias git.ck="git checkout"
alias git.cfg="git config -l"
alias git.cls="git status -s | grep \"??\" | awk '{print $2}' | xargs rm -rvf"
alias cyanogenmodsync="cat .repo/manifest.xml | grep CyanogenMod | awk '{print $2}' | cut -d'\"' -f2 | xargs -n 16 ./repo sync -j16"

git.pl()
{
    for i in $(git remote); do
        m.log.v "git pull $i"
        git pull $i
        case $i in
            assignments )
                m.log.v "git pull assignments master"
                git pull assignments master
                ;;
        esac
    done
}

git.pu()
{
    br=$(git branch | grep '*' | awk '{print $2}')
    git.pl
    for i in $(git remote); do
        case ${i} in
            origin)
                m.log.v git push origin ${br}:${br}
                git push origin ${br}:${br}
                ;;
            github)
                m.log.v git push github ${br}:${br}
                git push github ${br}:${br}
                ;;
            wangshub)
                m.log.v this is wangshub, and will not push
                ;;
            assignments)
                m.log.v "assignments will not push"
                ;;
            *)
                m.log.v this branch is ${i} .....
                ;;
        esac
    done
}
### end

### mkdir
alias mkdir.p='mkdir -p'
### end
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
## end 2

## Editor command
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
## end 2

## android command
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
            adb shell "pm $@"
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
### end m.pm()

### android ActivityManage command
m.am()
{
    op=$1
    act=$2
    case $op in
        *)
            ;;
    esac
}
### end m.am()
## end 2

## git tools configuration
### help menu
m.git()
{
    m.log.v git.l="git log --name-status --color=auto --graph"
    m.log.v git.a="git add"
    m.log.v git.ap="git add -p"
    m.log.v git.cm="git commit"
    m.log.v git.df="git diff --color=auto"
    m.log.v git.pl="git pull"
    m.log.v git.pu="git pull; git push"
    m.log.v git.sb="git status -sb"
    m.log.v git.sts="git status -s"
    m.log.v git.st="git status"
    m.log.v git.wc="git whatchanged"
    m.log.v git.sw="git show"
    m.log.v git.mo="git submodule"
    m.log.v git.mo.a="git submodule add"
    m.log.v git.mo.up="git submodule update"
    m.log.v git.b="git branch"
    m.log.v git.br="git branch -r"
    m.log.v git.ba="git branch -a"
    m.log.v git.ck="git checkout"
    m.log.v git.cfg="git config -l"
    m.log.v git.cls="git status -s | grep \"??\" | awk '{print $2}' | xargs rm -rvf"
    m.log.v cyanogenmodsync="cat .repo/manifest.xml | grep CyanogenMod | awk '{print $2}' | cut -d'\"' -f2 | xargs -n 16 ./repo sync -j16"
}
### end m.git()
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
m.alllog()
{
    cd ${LOCAL_WORKS_DIR}/alllog
}
m.tmp()
{
    cd ${LOCAL_WORKS_DIR}/alllog/tmp
}
## end

## self define command
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
### end m.wiki()

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
### end m.wps()

### m.running()
m.running()
{
    ret=-1
    m.log.d "param: $#"
    case $# in
        0)
            m.log.e "Have not filter!!"
            return $ret;
            ;;
    esac
    ct=`ps aux | grep -v ps | egrep "$@" | wc -l`
    case $ct in
        0)
            m.log.v "$@ is not running.";
            ret=0;
            ;;
        *)
            m.log.v "$@ is running";
            ret=$ct
            ;;
    esac
    return $ret;
}
### end

### m.testing()
m.testing()
{
    op=$1
    case $op in
        stop)
            cd
            m.log.v umount /Volumes/testing
            umount /Volumes/testing
            ;;
        *)
            open ${HOME}/Desktop/testing.dmg
            m.log.v $?
            sleep 1
            if [[ -d /Volumes/testing ]];
            then
                m.log.v cd /Volumes/testing;
                cd /Volumes/testing;
            else
                m.log.v "not have /Volumes/testing"
            fi
            ;;
    esac
}
### end

### m.composer()
m.composer()
{
    op=$1
    proj=$2
    case $op in
        0|h|help)
            m.log.v ""
            ;;
        1|create)
            m.log.v "composer create-project --prefer-dist laravel/laravel ${proj}"
            composer create-project --prefer-dist laravel/laravel ${proj}
            ;;
        *)
            m.log.v "php ${LOCAL_WORKS_DIR}/tool-kit/publics/php/composer/composer.phar $@"
            php ${LOCAL_WORKS_DIR}/tool-kit/publics/php/composer/composer.phar $@
            ;;
    esac
}
### end
m.zotero()
{
    trash=$(find * -name *.png -or -name *.js -or -name *.css -or -name *.html -or -name *.svg -or -name *loaded_? -or -name *.xml -or -name *.cgi -or -name *.gif )
    echo $trash
}
## end
# end
