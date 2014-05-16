# open port 50000
sudo iptables -A INPUT -m state --state NEW -p tcp --dport 50000 -j ACCEPT
sudo /etc/init.d/iptables restart
