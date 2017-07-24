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
#### this is only for docker cli
m.import ${COMMAND_DIR}/cmd/docker/websrv.sh
#### end
### end
