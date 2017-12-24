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
            m.log.v "ssh -v cabox@host15.codeanyhost.com -p ${port}"
            ssh -v cabox@host15.codeanyhost.com -p $port
            ;;
    esac
}
