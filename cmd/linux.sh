#! /bin/bash
# shell command
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias llh='ls -lh'
alias dir='dir --color=auto'
# end

# self setting commands
#alias findmnt='findmnt -m'
# end

# revalue mac.command
re-bashrc()
{
	source ~/.bashrc
}
## eqplay
eqplay.sign()
{
    nonce=`random.cli date`
    ts=`timestamp | awk '{print $3}'`
    key='9YetVl8hlD+mG/pEzPGtUcfr'
    signature=`echo "$nonce
$ts
$key" | sort | xargs echo |awk '{print $1$2$3}' | sha1sum`
    echo nonce: $nonce
    echo timestamp: $ts
    echo signature: $signature
}
## end
# end
