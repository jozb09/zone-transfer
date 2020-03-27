#Simple Zone transfer bash Script

if [ -z "$1" ]; then
    echo "[*] Simple Zone transfer Script"
    echo "[*] Usage     :  $0 <domain name> "
    exit 0
fi

for server in $(host -t ns $1 | cut -d " " -f4); do
    #For each servers, perform zone transfer
    host -l $1 $server |grep "has address"
done
