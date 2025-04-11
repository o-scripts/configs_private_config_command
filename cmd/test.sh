ver=a.b.c.d
cce=az2
author=a

# a
cd ${HOME}/zhang/deployment

! [[ -e $ver ]] && mkdir -p $ver
touch ${ver}/{internet,intranet}-${cce}-${author}.csv

k8s.tasks()
{
    cat <<EOF > ${ver}/intranet-${cce}-all.csv
...
EOF

    cat <<EOF > ${ver}/internet-${cce}-all.csv
...
EOF

    cat <<EOF > ${ver}/intranet-${cce}-a.csv
...
EOF

    cat <<EOF > ${ver}/internet-${cce}-a.csv
...
EOF

    cat <<EOF > ${ver}/intranet-${cce}-b.csv
...
EOF

    cat <<EOF > ${ver}/internet-${cce}-b.csv
...
EOF
}

# define a function
k8s.line()
{
    printf '|'
    printf '*%.0s' {1..52}
    printf '|'
    printf '*%.0s' {1..32}
    printf '|\n'
}

k8s.chk()
{
    k8s.tasks
    k8s.line
    for region in $(echo {internet,intranet}-${cce});
    do
        f=${region}-${author}.csv
        for i in $(cat ${ver}/$f);
        do
            printf "|%-52s|%-32s|\n" $i $(kubectl --context ${region} get deployment $i -o jsonpath='{.spec.template.spec.containers[0].image}' | cut -d':' -f 2)
        done
        k8s.line
    done
}
