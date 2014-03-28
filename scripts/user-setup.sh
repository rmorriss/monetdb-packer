#!/bin/sh

if [ -f ~/.setupdone ]; then
	exit
fi

echo "User Setup"
pw=a
pw2=b

until [ $pw = $pw2 ]
do
	echo
	echo "Please set a password for the MonetDB and R login now"
	read -s -p "(Password will not be shown)?" pw
	echo
	read -s -p "(Enter Password again)" pw2
	echo

	if   [ $pw != $pw2 ]
	then
		echo "Passwords did not match, restarting"
	fi
done

echo "rstats:$pw" | sudo chpasswd
echo "monetdb:$pw" | sudo chpasswd

# allowing password ssh logins
sed "s/PasswordAuthentication no/PasswordAuthentication yes/" /etc/ssh/sshd_config > ~/sshd_config
sudo mv /etc/ssh/sshd_config /etc/ssh/sshd_config.backup
sudo mv ~/sshd_config /etc/ssh/sshd_config
sudo service sshd restart

# create new user and set password
mclient db -s "DROP USER \"monetdbuser\""
mclient db -s "CREATE USER \"monetdbuser\" WITH PASSWORD '$pw' NAME 'monetdbuser' SCHEMA \"voc\""
# create the 'monetdbuser' the 'user' role
mclient db -s "GRANT \"user\" TO \"monetdbuser\";"

echo -e "user=monetdbuser\npassword=$pw" > ~/.monetdbuser
sudo cp  ~/.monetdbuser /home/monetdb/.monetdb
sudo cp  ~/.monetdbuser /home/rstats/.monetdb

echo "All done, now login with the monetdb or rstats username and the password you just set."

touch ~/.setupdone
