#!/bin/bash
### android
# this is setting for config of android
#-------------------------------------------------------------------------
## m.tcpdump()
m.tcpdump()
{
    m.log.v "adb shell 'tcpdump -i any -p -s 0 -w /data/local/tmp/capture.cap'"
    # adb shell 'tcpdump -i any -p -s 0 -w /data/local/tmp/capture.cap'
    m.log.v "adb pull /data/local/tmp/capture.cap"
    # adb pull /data/local/tmp/capture.cap
}
## m.tcpdump
## m.android
m.android()
{
    op=$1
    case $op in
        '1'|'hardware'|'hw')
            m.log.v "
[HARDWARE]
- A 64-bit environment is required for Gingerbread (2.3.x) and newer versions,
  including the master branch. You can compile older versions on 32-bit systems.
- At least 100GB of free disk space for a checkout, 150GB for a single build,
  and 200GB or more for multiple builds. If you employ ccache, you will need
  even more space.
- If you are running Linux in a virtual machine, you need at least 16GB of
  RAM/swap."
            ;;
        '2'|'soft'|'software'|'sw')
            m.log.v "
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

        '3'|'jdk'|'java')
            m.log.v "
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

        '4'|'packages'|'pkg')
            m.log.v "
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

        '5'|'usb')
            m.log.v "
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

        '6'|'out')
            m.log.v "
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

        '7'|'mac'|'osx')
            m.log.v "
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

        '8'|'repo')
            m.log.v "
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
        '9'|'h'|'help'|*)
            m.log.v "
                       ANDROID COMPILE CONFIG SETUP
============================================================================
1. 'hardware'|'hw' - default
2. 'soft'|'software'|'sw' - function
3. 'jdk'|'java' - fdf
4. 'packages'|'pkg' - fd
5. 'usb'
6. 'out'
7. 'mac'|'osx'
8. 'repo'
9. h|help - display infomation
----------------------------------------------------------------------------"
            ;;
    esac
}
### end
