#!/usr/bin/env bash
# Fail immediately if any errors occur
set -e
function show_help() {
    cat << EOF
Usage: ${0#*/}
    [-h show help]
    [-u user ex: mmmmXXXX]
Easy cntlm config scripts
    -u                      User to USE in CNTLM
    -h                      display this help and exit
EOF
    exit $1
}

if [[ $# -eq 0 ]] ; then
    show_help 0
fi
MY_DIR="$(dirname "$0")"
USER_CNTLM=mmmmXXXX

while getopts h:u: opt; do
    case $opt in
        h)
            show_help 0
        ;;
        u)
            USER_CNTLM="$OPTARG"
        ;;
        *)
            show_help 1 >&2
        ;;
    esac
done

echo "Installing cntlm"
sudo apt install cntlm
echo "Stopping CNTLM service"
sudo service cntlm stop
cat > ${MY_DIR}/config.cntlm <<EOL
Username	    ${USER_CNTLM}
Domain		    AD
Auth            NTLMv2
EOL

echo "Hashing with user please enter your password"
cntlm -u ${USER_CNTLM}@ad -H | sed -n '1!p' >> ${MY_DIR}/config.cntlm

echo "added minima config in config file"
cat >> ${MY_DIR}/config.cntlm <<EOL
Proxy		proxy.madness.com:8080
NoProxy		localhost, 192.168.* , *corporate.*
Listen		3128
EOL
cat ${MY_DIR}/config.cntlm

echo "Now we will test the config"
cntlm -c ${MY_DIR}/config.cntlm -v &
pid=$!
curl -x localhost:3128 https://wttr.in/
kill -9 ${pid}

echo "Now copy the file config.cntlm to /etc/cntlm.config with this commande"
echo "sudo cp config.cntlm /etc/cntlm.config"
echo "then start cntlm service to continue the installation"
sudo cp ${MY_DIR}/config.cntlm /etc/cntlm.config
sudo service cntlm start
exit