m.codeanwhere()
{
    op=$1
    case $op in
        h|'h')
            m.log.v "
        HOW TO USE SSH CONNECT TO CODEANYWHERE
===================================================
1. h        display this information
2. *        connect to container on codeanwhere

-----
1. cat ~/.ssh/id_rsa
2. copy ~/.ssh/id_rsa to local mykey.pem
3. set it to ssh client
4. user cabox
5. port
-----
sample:
Host xxx.codeanyhost.com
    HostName xxxx.codeanyhost.com
    Port xxxx
    User cabox
    IdentityFile ~/.ssh/codeanywhere/id_rsa.pem
---------------------------------------------------
"
            ;;
        *)
            read -p "input the port: " port
            read -p "input the host: " host_name
            m.log.v "ssh -v cabox@${host_name}.codeanyhost.com -p ${port}"
            ssh -v cabox@${host_name}.codeanyhost.com -p ${port}
            ;;
    esac
}

m.tue()
{
    op=$1

    # goto work dir
    OLD_DIR=$(pwd)
    TUE_DIR=${LOCAL_WORKS_DIR}/uni/private/fachrichtung/ma/uni_tue_exercise

    case $op in
        py )
            m.log.v "cd ${TUE_DIR}"
            cd ${TUE_DIR}
            m.log.d "source python/bin/activate"
            source python/bin/activate
            cd ${OLD_DIR}
            ;;
        py3 )
            m.log.v "cd ${TUE_DIR}"
            cd ${TUE_DIR}
            m.log.d "source python3/bin/activate"
            source python3/bin/activate
            cd ${OLD_DIR}
            ;;
        db2 )
            cd ${TUE_DIR}/INF4141/db2-ss18-yzx-zgd-2
            m.log.v "systemctl start monetdbd.service"
            systemctl start monetdbd.service
            m.log.v "systemctl start postgresql.service"
            systemctl start postgresql.service
            ;;
        dnn )
            cd ${TUE_DIR}/INF4182
            ;;
        statistik )
            cd ${TUE_DIR}/INF4151
            ;;
        ml )
            cd ${TUE_DIR}/INF4491
            ;;
        algorithmik )
            cd ${TUE_DIR}/INF4419
            ;;
        mobile )
            cd ${TUE_DIR}/INF4361
            ;;
        * )
            ;;
    esac
}
