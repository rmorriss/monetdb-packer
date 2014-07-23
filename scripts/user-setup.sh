#!/bin/sh

if [ -f ~/.setupdone ]; then
    echo "User setup was already done."
	exit
fi

echo "User Setup"
pw=a
pw2=b

until [ $pw = $pw2 ]
do
	echo
	echo "Please set a password for the MonetDB and R login/users now"
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

echo "Create non-admin MonetDB user (monetdbuser)"
# drop user and voc schema
mclient db -s "DROP USER \"monetdbuser\""
# create new user and set password
mclient db -s "CREATE USER \"monetdbuser\" WITH PASSWORD '$pw' NAME 'monetdbuser' SCHEMA \"sys\""

# Store the password for the user
echo -e "user=monetdbuser\npassword=$pw" > ~/.monetdbuser
sudo cp  ~/.monetdbuser /home/monetdb/.monetdb
sudo cp  ~/.monetdbuser /home/rstats/.monetdb

echo "All done, now login with the monetdb or rstats username and the password you just set."

touch ~/.setupdone
