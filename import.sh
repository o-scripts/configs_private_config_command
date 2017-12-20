#!/bin/bash
m.import ${COMMAND_DIR}/cmd/global.sh

### import command
case `uname` in
    'Darwin')
        m.import ${COMMAND_DIR}/cmd/mac.sh
        ;;
    'Linux')
        m.import ${COMMAND_DIR}/cmd/linux.sh
        ;;
esac

## some self defined modules
m.import ${COMMAND_DIR}/cmd/android.sh
m.import ${COMMAND_DIR}/cmd/security.sh
m.import ${COMMAND_DIR}/cmd/python.sh
m.import ${COMMAND_DIR}/cmd/docker.sh
m.import ${COMMAND_DIR}/cmd/scan.sh
m.import ${COMMAND_DIR}/cmd/private.sh

### this is only for docker cli
m.import ${COMMAND_DIR}/cmd/docker/websrv.sh
### end

### rtsp video
m.import ${COMMAND_DIR}/cmd/rtsp/video.sh
### end

### tue uebungen
m.import ${COMMAND_DIR}/cmd/tue.sh
### end
## end