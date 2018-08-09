# wpscan-installer
It is a script that installs wpscan on your computer.

**Run with:**
```
sh wpscan-installer.sh
```

## What does the script do?

**Updating the index of packages and packages:**
```
sudo apt-get update
sudo apt-get upgrade
```

**Installing all necessary packages and the latest version of ruby:**
```
sudo apt-get install git ruby-dev `apt-cache search ruby | grep -E -o -m 1 '^ruby[0-9]{1}.[0-9]{1}(|.[0-9]{1})'` libxml2 libxml2-dev libxslt1-dev libcurl4-gnutls-dev
```

**Creating the directory /opt, if it does not exist:**
```
if ![ -d ~/opt ]; then
    mkdir ~/opt/
fi

cd ~/opt
```

**Clonning wpscan repo:**
```
git clone https://github.com/wpscanteam/wpscan.git
cd wpscan
```

**Installing the required ruby gems using bundler:**
```
sudo gem install bundler && bundle install --without test
```
