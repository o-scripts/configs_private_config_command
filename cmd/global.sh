#! /bin/bash
# normalweise Einstellungen
# die Einstellungen fuer alle Situationen
## language varables settings
alias LANGUAGE="zh_CN.UTF-8"
alias LC_ALL="zh_CN.UTF-8"
## end

## some usefull command
alias byobu='byobu-screen'
## end

## some adb short cmd
alias adbs="adb shell"
alias adbd="adb devices"
alias adbr="adb reboot"
alias adbcls="adb logcat -c"
alias adblog="adb logcat -v threadtime"
alias adbreport="adb shell bugreport"
### pm self define
pm.get()
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
            echo '
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
-----------------------------------------------'
    esac
}
### end
## end

## git tools configuration
### help menu
git.help()
{
	echo -e "    gl\t: git log --name-status --color=auto --graph"
	echo -e "    ga\t: git add"
	echo -e "    gap\t: git add -p"
	echo -e "    gd\t: git diff --color=auto"
	echo -e "    gup\t: git pull; git push"
	echo -e "    gsb\t: git status -sb"
	echo -e "    gss\t: git status -s"
	echo -e "    gst\t: git status"
	echo -e "    gw\t: git whatchanged"
	echo -e "    gb\t: git branch"
	echo -e "    gbr\t: git branch -r"
	echo -e "    gba\t: git branch -a"
	echo -e "    gc\t: git checkout"
	echo -e "    gdown\t: git pull"
	echo -e "    gcfg\t: git config -l"
	echo -e "    gcls\t: git status -s | grep \"??\" | awk '{print $2}' | xargs rm -rvf"
	echo -e "    cyanogenmodsync\t: cat .repo/manifest.xml | grep CyanogenMod | awk '{print $2}' | cut -d'\"' -f2 | xargs -n 16 ./repo sync -j16"
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
timestamp()
{
    str="`date +%Y-%m-%d\ %H:%M:%S`"
    echo \[$str\] `date -d "${str}" +%s`
}
datestr()
{
	echo "`date +%Y.%m.%d.%H.%M.%S`"
}
zipstr()
{
	echo "_gdz_`date +%Y.%m.%d_%H%M`"
}
strlog()
{
	echo "fatal|low mem|has died|activitymanager|keycode="
}
## end

## goto
cd.branch()
{
	cd ${BRANCH_GIT}
}
cd.works()
{
    cd ${LOCAL_WORKS_DIR}
}
cd.shell()
{
	cd ${MSHELL}
}
cd.soft()
{
	cd ${MSOFT}
}
cd.matlab()
{
	cd ${MATLAB_HOME}
}
cd.config()
{
	cd ${LOCAL_CONFIG_DIR}
}
## end

## self define command
ssh.nopwd()
{
     op=$1
     case $op in
         *)
             echo '
        HOW LOGIN SSH WITHOUT PWD
==============================================
1. cat id_rsa.pub > authorized_keys
----------------------------------------------'
            ;;
    esac
}
### use openssl rand to create random string
function random.cli {
    seed=$1
    case $seed in
        'ssl'|'openssl')
        	openssl rand -base64 8 | md5sum
            ;;
        'uuid')
            cat /proc/sys/kernel/random/uuid
            ;;
        'date')
            date +%s%N | md5sum | head -c 10
            echo ""
            ;;
        'urandom')
            cat /dev/urandom | head -n 10 | md5sum | head -c 10
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
### reset password of mysql
reset.mysql()
{
    case $1 in
        'y'|'Y'|'yes'|'Yes'|'YES')
            echo mysqld_safe --skip-grant-tables &
            mysqld_safe --skip-grant-tables &
            echo mysql -uroot
            mysql -uroot
            ;;
        *)
            echo '
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
    esac
}
### end
### android
# this is setting for config of android
#-------------------------------------------------------------------------
android.set()
{
    op=$1
    case $op in
        'hardware'|'hw')
            echo "
[HARDWARE]
- A 64-bit environment is required for Gingerbread (2.3.x) and newer versions,
  including the master branch. You can compile older versions on 32-bit systems.
- At least 100GB of free disk space for a checkout, 150GB for a single build,
  and 200GB or more for multiple builds. If you employ ccache, you will need
  even more space.
- If you are running Linux in a virtual machine, you need at least 16GB of
  RAM/swap."
            ;;
        'soft'|'software'|'sw')
            echo "
[Software requirements]
====================================
    The Android Open Source Project (AOSP) master branch is traditionally
developed and tested on Ubuntu Long Term Support (LTS) releases, but other
distributions may be used. See the list below for recommended versions.

    You workstation must have the software listed below. See Establishing
a Build Environment for additional required packages and the commands to
install them.

GNU/Linux
------------------------------------
- Android 6.0 (Marshmallow) - AOSP master:
    Ubuntu 14.04 (Trusty)
- Android 2.3.x (Gingerbread) - Android 5.x (Lollipop):
    Ubuntu 12.04 (Precise)
- Android 1.5 (Cupcake) - Android 2.2.x (Froyo):
    Ubuntu 10.04 (Lucid)

Mac OS (Intel/x86)
------------------------------------
- Android 6.0 (Marshmallow) - AOSP master:
    Mac OS v10.10 (Yosemite) or later with Xcode 4.5.2 and Command Line Tools
- Android 5.x (Lollipop):
    Mac OS v10.8 (Mountain Lion) with Xcode 4.5.2 and Command Line Tools
- Android 4.1.x-4.3.x (Jelly Bean) - Android 4.4.x (KitKat):
    Mac OS v10.6 (Snow Leopard) or Mac OS X v10.7 (Lion) and Xcode 4.2 (Apple's
    Developer Tools)
- Android 1.5 (Cupcake) - Android 4.0.x (Ice Cream Sandwich):
    Mac OS v10.5 (Leopard) or Mac OS X v10.6 (Snow Leopard) and the Mac OS X
    v10.5 SDK

Java Development Kit (JDK)
------------------------------------
* Please note, since there are no available supported OpenJDK 8 packages for
  Ubuntu 14.04, the Ubuntu 15.04 packages must be installed manually. See JDK
  for Ubuntu LTS 14.04 for precise instructions.
- The master branch of Android in AOSP:
    Ubuntu - OpenJDK 8
    Mac OS - jdk 8u45 or newer
- Android 5.x (Lollipop) - Android 6.0 (Marshmallow):
    Ubuntu - OpenJDK 7
    Mac OS - jdk-7u71-macosx-x64.dmg
- Android 2.3.x (Gingerbread) - Android 4.4.x (KitKat):
    Ubuntu - Java JDK 6
    Mac OS - Java JDK 6
- Android 1.5 (Cupcake) - Android 2.2.x (Froyo):
    Ubuntu - Java JDK 5

Key packages
------------------------------------
- Python 2.6 -- 2.7 from python.org
- GNU Make 3.81 -- 3.82 from gnu.org; Android 3.2.x (Honeycomb) and earlier
  will need to revert from make 3.82 to avoid build errors
- Git 1.7 or newer from git-scm.com"
            ;;

        'jdk'|'java')
            echo "
[Installing the JDK]
------------------------------------
- For Ubuntu >= 15.04
    sudo apt-get update
    sudo apt-get install openjdk-8-jdk

- For Ubuntu LTS 14.04
------------------------------------
1. Download the .deb packages for 64-bit architecture from archive.ubuntu.com:
    openjdk-8-jre-headless_8u45-b14-1_amd64.deb
        SHA256 0f5aba8db39088283b51e00054813063173a4d8809f70033976f83e214ab56c0
        axel -an 10 http://archive.ubuntu.com/ubuntu/pool/universe/o/openjdk-8/openjdk-8-jre-headless_8u45-b14-1_amd64.deb
    openjdk-8-jre_8u45-b14-1_amd64.deb
        SHA256 9ef76c4562d39432b69baf6c18f199707c5c56a5b4566847df908b7d74e15849
        axel -an 10 http://archive.ubuntu.com/ubuntu/pool/universe/o/openjdk-8/openjdk-8-jre_8u45-b14-1_amd64.deb
    openjdk-8-jdk_8u45-b14-1_amd64.deb
        SHA256 6e47215cf6205aa829e6a0a64985075bd29d1f428a4006a80c9db371c2fc3c4c
        axel -an 10 http://archive.ubuntu.com/ubuntu/pool/universe/o/openjdk-8/openjdk-8-jdk_8u45-b14-1_amd64.deb

2. check file
    sha256sum {downloaded.deb file}

3. Install the packages
    sudo apt-get update
    sudo dpkg -i {downloaded.deb file}
    sudo apt-get -f install

4. Update the default Java version - optional
    sudo update-alternatives --config java
    sudo update-alternatives --config javac"
            ;;

        'packages'|'pkg')
            echo "
- Installing required packages (Ubuntu 14.04)
You will need a 64-bit version of Ubuntu. Ubuntu 14.04 is recommended.
-----------------------------------
    sudo apt-get install git-core gnupg flex bison gperf build-essential \\
    zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \\
    lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \\
    libgl1-mesa-dev libxml2-utils xsltproc unzip

- Installing required packages (Ubuntu 12.04)
-----------------------------------
    sudo apt-get install git gnupg flex bison gperf build-essential \\
    zip curl libc6-dev libncurses5-dev:i386 x11proto-core-dev \\
    libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 \\
    libgl1-mesa-dev g++-multilib mingw32 tofrodos \\
    python-markdown libxml2-utils xsltproc zlib1g-dev:i386

    sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so

- Installing required packages (Ubuntu 10.04 -- 11.10)
-----------------------------------
    sudo apt-get install git gnupg flex bison gperf build-essential \\
    zip curl zlib1g-dev libc6-dev lib32ncurses5-dev ia32-libs \\
    x11proto-core-dev libx11-dev lib32readline5-dev lib32z-dev \\
    libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown \\
    libxml2-utils xsltproc

- On Ubuntu 10.10:
------------------------------------
    sudo ln -s /usr/lib32/mesa/libGL.so.1 /usr/lib32/mesa/libGL.so

- On Ubuntu 11.10:
------------------------------------
    sudo apt-get install libx11-dev:i386"
            ;;

        'usb')
            echo "
[Configuring USB Access]
====================================
    Under GNU/Linux systems (and specifically under Ubuntu systems), regular
users can\'t directly access USB devices by default. The system needs to be
configured to allow such access.

    The recommended approach is to create a file at
/etc/udev/rules.d/51-android.rules (as the root user).

    To do this, run the following command to download the 51-android.rules
file attached to this site, modify it to include your username, and place it
in the correct location:
    wget -S -O - http://source.android.com/source/51-android.rules \\
    | sed \"s/<username>/$USER/\" | sudo tee >/dev/null \\
    /etc/udev/rules.d/51-android.rules;

    sudo udevadm control --reload-rules"
            ;;

        'out')
            echo "
[Using a separate output directory]
====================================
    By default, the output of each build is stored in the out/ subdirectory of
the matching source tree.

    On some machines with multiple storage devices, builds are faster when
storing the source files and the output on separate volumes. For additional
performance, the output can be stored on a filesystem optimized for speed
instead of crash robustness, since all files can be re-generated in case of
filesystem corruption.

    To set this up, export the OUT_DIR_COMMON_BASE variable to point to the
location where your output directories will be stored.

    export OUT_DIR_COMMON_BASE=<path-to-your-out-directory>

    The output directory for each separate source tree will be named after the
directory holding the source tree.
    For instance, if you have source trees as /source/master1 and /source/master2
and OUT_DIR_COMMON_BASE is set to /output, the output directories will be
/output/master1 and /output/master2.

    It is important in that case to not have multiple source trees stored in
directories that have the same name, as those would end up sharing an output
directory, with unpredictable results.

    This is only supported on Jelly Bean (4.1) and newer, including the master
branch."
            ;;

        'mac'|'osx')
            echo "
[Setting up a MAC OS build environment]
------------------------------------
- Creating a case-sensitive disk image
------------------------------------
    hdiutil create -type SPARSE -fs 'Case-sensitive Journaled HFS+' -size 40g ~/android.dmg

    This will create a .dmg (or possibly a .dmg.sparseimage) file which, once
mounted, acts as a drive with the required formatting for Android development.

    If you need a larger volume later, you can also resize the sparse image
with the following command:

    hdiutil resize -size <new-size-you-want>g ~/android.dmg.sparseimage

    For a disk image named android.dmg stored in your home directory, you can
add helper functions to your ~/.bash_profile:

1. To mount the image when you execute mountAndroid:

# mount the android file image
function mountAndroid { hdiutil attach ~/android.dmg -mountpoint /Volumes/android; }

Note: If your system created a .dmg.sparseimage file, replace ~/android.dmg
with ~/android.dmg.sparseimage.

2. To unmount it when you execute umountAndroid:

# unmount the android file image
function umountAndroid() { hdiutil detach /Volumes/android; }"
            ;;

        'repo')
            echo "
[download source]
    curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
    chmod a+x ~/bin/repo
For version 1.17, the SHA-1 checksum for repo is ddd79b6d5a7807e911b524cb223bc3544b661c28
For version 1.19, the SHA-1 checksum for repo is 92cbad8c880f697b58ed83e348d06619f8098e6c
For version 1.20, the SHA-1 checksum for repo is e197cb48ff4ddda4d11f23940d316e323b29671c
For version 1.21, the SHA-1 checksum for repo is b8bd1804f432ecf1bab730949c82b93b0fc5fede
For version 1.22, the SHA-1 checksum for repo is da0514e484f74648a890c0467d61ca415379f791
----------------------------------------------------------------------------"
            ;;
        *)
            echo "
                       ANDROID COMPILE CONFIG SETUP
============================================================================
1. 'hardware'|'hw'
2. 'soft'|'software'|'sw'
3. 'jdk'|'java'
4. 'packages'|'pkg'
5. 'usb'
6. 'out'
7. 'mac'|'osx'
8. 'repo'
----------------------------------------------------------------------------"
            ;;
    esac
}
### end
### gollum for wiki page
wiki.config()
{
    op=$1
    case $op in
        'fad')
            ;;
        *)
            echo "
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
wps.fonts()
{
    op=$1
    case $op in
        *)
            echo '
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
    esac
}
### end
## end
# end
