#!/bin/bash
m.import ${LOCAL_COMMAND_DIR}/cmd/global.sh

### import command
case `uname` in
    'Darwin')
        m.import ${LOCAL_COMMAND_DIR}/cmd/mac.sh
        ;;
    'Linux')
        m.import ${LOCAL_COMMAND_DIR}/cmd/linux.sh
        ;;
esac

## some self defined modules
m.import ${LOCAL_COMMAND_DIR}/cmd/android.sh
m.import ${LOCAL_COMMAND_DIR}/cmd/security.sh
m.import ${LOCAL_COMMAND_DIR}/cmd/python.sh
m.import ${LOCAL_COMMAND_DIR}/cmd/docker.sh
m.import ${LOCAL_COMMAND_DIR}/cmd/scan.sh
m.import ${LOCAL_COMMAND_DIR}/cmd/private.sh

### this is only for docker cli
m.import ${LOCAL_COMMAND_DIR}/cmd/docker/websrv.sh
### end

### opencv
m.import ${LOCAL_COMMAND_DIR}/cmd/opencv.sh
### end

### rtsp video
m.import ${LOCAL_COMMAND_DIR}/cmd/rtsp/video.sh
### end

### tue uebungen
m.import ${LOCAL_COMMAND_DIR}/cmd/tue.sh
### end

### vagrant virtual machine manager
m.import ${LOCAL_COMMAND_DIR}/cmd/vagrant.sh
### end

### cmus
m.import ${LOCAL_COMMAND_DIR}/cmd/cmus.sh
### end

## end