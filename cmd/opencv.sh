### m.opencv()
m.opencv()
{
    op=$1
    case $op in
        1|install|i)
            case $(lsb_release -r | awk '{print $2}') in
                '16.04')
                    m.log.v "sudo apt-get install build-essential"
                    m.log.v "sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev"
                    m.log.v "sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev"
                    ;;
                *)
                    m.log.v "sudo apt-get install --assume-yes build-essential cmake git \\
                    build-essential pkg-config unzip ffmpeg qtbase5-dev python-dev python3-dev python-numpy python3-numpy \\
                    libopencv-dev libgtk-3-dev libdc1394-22 libdc1394-22-dev libjpeg-dev libpng12-dev libtiff5-dev libjasper-dev \\
                    libavcodec-dev libavformat-dev libswscale-dev libxine2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev \\
                    libv4l-dev libtbb-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev \\
                    libvorbis-dev libxvidcore-dev v4l-utils"
                    ;;
            esac
            ;;
        2|cdt|'cdt')
            m.log.v "
1. go to [Project] -> [Properties]
    in [C/C++ Build], click on [Settings]. At the right, choose the
    [Tool Settings] Tab. Here we will enter the headers and libraries info:

        a. In [GCC C++ Compiler], go to Includes. In Include paths(-l) you should
        include the path of the folder where opencv was installed. In our example,
        this is /usr/local/include/opencv.

            Note:
                If you do not know where your opencv files are, open the Terminal
                and type:
=========================================
pkg-config --cflags opencv2
-----------------------------------------
$(pkg-config --cflags opencv|xargs -n 1 echo)
"
            m.log.v "
        b. Now go to [GCC C++ Linker],there you have to fill two spaces:
            First in [Library search path (-L)] you have to write the path to where
            the opencv libraries reside, in my case the path is:
            [/usr/local/lib]

            Then in [Libraries(-l)] add the OpenCV libraries that you may need.
            Usually just the 3 first on the list below are enough (for simple
            applications) . In my case, I am putting all of them since I plan
            to use the whole bunch:

                opencv_core
                opencv_imgproc
                opencv_highgui
                opencv_ml
                opencv_video
                opencv_features2d
                opencv_calib3d
                opencv_objdetect
                opencv_contrib
                opencv_legacy
                opencv_flann

            If you don’t know where your libraries are (or you are just psychotic
            and want to make sure the path is fine), type in Terminal:
=========================================
pkg-config --libs opencv
-----------------------------------------
$(pkg-config --libs opencv|xargs -n 1 echo)
"

            ;;
        0|help|h|*)
            m.log.v "
            HOWTO INSTALL OPENCV
=========================================
0. help|h - display help
1. install|i - install opencv
-----------------------------------------"
            ;;
    esac
}
### end