#!/bin/bash
source ${COMMAND_DIR}/cmd/global.sh
### import command
case `uname` in
    'Darwin')
        m.log.d source ${COMMAND_DIR}/cmd/mac.sh
        source ${COMMAND_DIR}/cmd/mac.sh
        ;;
    'Linux')
        m.log.d source ${COMMAND_DIR}/cmd/linux.sh
        source ${COMMAND_DIR}/cmd/linux.sh
        ;;
esac
### end
