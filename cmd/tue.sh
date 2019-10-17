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
    TUE_DIR=${HOME}/working/tue
    SEMESTER=19ws
    case $(lsb_release -r|awk '{print $2}') in
        18.04 )
            ip=$(ifconfig | grep inet | grep -v inet6 | awk '{print $2}' | grep '172.20')
            # ip=127.0.0.1
            ;;
        16.04 )
            # ip=$(ifconfig | grep inet| cut -d':' -f 2| awk '{print $1}' | grep -v '127')
            ip=$(ifconfig |grep 172. | grep inet| cut -d':' -f 2| awk '{print $1}')
            ;;
    esac

    case $op in
        py )
            cd ${LOCAL_WORKS_DIR}/uni/publics/runtime
            m.log.d "source python/bin/activate"
            source python/bin/activate
            op_nb=$2
            case ${op_nb} in
                nb )
                    # cd ${TUE_DIR}/${SEMESTER}
                    jupyter notebook --ip ${pp} --no-browser --allow-root ${TUE_DIR}/${SEMESTER}
                    ;;
                * )
                    cd ${OLD_DIR}
                    ;;
            esac
            ;;
        py35 )
            cd ${LOCAL_WORKS_DIR}/uni/publics/runtime
            m.log.d "source python3.5/bin/activate"
            source python3.5/bin/activate
            op_nb=$2
            case ${op_nb} in
                nb )
                    # cd ${TUE_DIR}/${SEMESTER}
                    echo "jupyter notebook --ip ${pp} --no-browser --allow-root ${TUE_DIR}/${SEMESTER}"
                    jupyter notebook --ip ${ip} --no-browser --allow-root ${TUE_DIR}/${SEMESTER}
                    ;;
                * )
                    cd ${OLD_DIR}
                    ;;
            esac
            ;;
        py3 | py36 )
            cd ${LOCAL_WORKS_DIR}/uni/publics/runtime
            m.log.d "source python3.6/bin/activate"
            source python3.6/bin/activate
            op_nb=$2
            case ${op_nb} in
                nb )
                    # cd ${TUE_DIR}/${SEMESTER}
                    jupyter notebook --ip ${ip} --no-browser --allow-root ${TUE_DIR}/${SEMESTER}
                    ;;
                * )
                    cd ${OLD_DIR}
                    ;;
            esac
            ;;
        py37 )
            cd ${LOCAL_WORKS_DIR}/uni/publics/runtime
            m.log.d "source python3.7/bin/activate"
            source python3.7/bin/activate
            op_nb=$2
            case ${op_nb} in
                nb )
                    # cd ${TUE_DIR}/${SEMESTER}
                    jupyter notebook --ip ${ip} --no-browser --allow-root ${TUE_DIR}/${SEMESTER}
                    ;;
                * )
                    cd ${OLD_DIR}
                    ;;
            esac
            ;;
        base )
            echo conda activate base;
            conda activate base;
            ;;
        nb )
            op=$2
            work_dir=${TUE_DIR}/${SEMESTER}
            if [[ "abc${op}" != "abc" ]]; then
                work_dir=$op
            fi
            case $(whoami) in
                root )
                    for pp in ${ip};
                    do
                        echo "jupyter notebook --ip ${pp} --no-browser --allow-root ${work_dir}"
                        jupyter notebook --ip ${pp} --no-browser --allow-root ${work_dir}
                        break;
                    done
                    ;;
                self|zz )
                    echo "jupyter notebook --no-browser ${work_dir}"
                    jupyter notebook --no-browser  ${work_dir}
                    ;;
                * )
                    for pp in ${ip};
                    do
                        echo "jupyter notebook --ip ${pp} --no-browser ${work_dir}"
                        jupyter notebook --ip ${pp} --no-browser  ${work_dir}
                        break;
                    done
                    ;;
            esac
            ;;
        pdf|tex )
            type_files=$1
            jupyter_files=$2
            echo "jupyter nbconvert --to ${type_files} ${jupyter_files}"
            jupyter nbconvert --to ${type_files} ${jupyter_files}
            ;;
        pdfs )
            cmd=$2
            for i in $($cmd); do
                echo -e "\n[ jupyter nbconvert --to pdf $i ]"
                jupyter nbconvert --to pdf $i;
            done
            ;;
        db2 )
            op_db=$2
            case ${op_db} in
                on|up|start )
                    m.log.v "systemctl start monetdbd.service"
                    systemctl start monetdbd.service
                    m.log.v "systemctl start postgresql.service"
                    systemctl start postgresql.service
                    ;;
                off|down|stop|halt|poweroff )
                    m.log.v "systemctl stop monetdbd.service"
                    systemctl stop monetdbd.service
                    m.log.v "systemctl stop postgresql.service"
                    systemctl stop postgresql.service
                    ;;
                * )
                    ;;
            esac
            cd ${TUE_DIR}/${SEMESTER}/INF4141/db2-ss18-yzx-zgd-2
            ;;
        dnn )
            cd ${TUE_DIR}/${SEMESTER}/INF4182
            ;;
        statistik )
            cd ${TUE_DIR}/${SEMESTER}/INF4151
            ;;
        ml )
            cd ${TUE_DIR}/${SEMESTER}/INF4491
            ;;
        algorithmik )
            cd ${TUE_DIR}/${SEMESTER}/INF4419
            ;;
        mobile )
            cd ${TUE_DIR}/${SEMESTER}/INF4361
            ;;
        * )
            cd ${TUE_DIR}/${SEMESTER}
            ;;
    esac
}

