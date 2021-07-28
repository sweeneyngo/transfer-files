# transfer-files

## Windows to Linux

For Windows:
* Download `PuTTY` and `pscp.exe` (an SCP client, i.e. command-line secure file copy).[1](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)
* Move `pscp.exe` to root of drive (for most, it's C:).
* Install `PuTTY` by running the install executable (default settings will work fine).

For Linux (Ubuntu 20.04):
* Install `openssh-server`
```bash
sudo apt update && \
sudo apt upgrade && \
sudo apt install openssh-server && \
sudo service ssh service
```

* Check IP address
```bash
ip addr
# or
nmcli -p device show
```
* Check ssh key fingeprint (ecdsa, ed25519, RSA):
```bash
for i in /etc/ssh/*.pub; do echo; echo $i; ssh-keygen -lf $i; done; echo
```

* To transfer a file to Linux machine, make sure to load Command Prompt (`cmd`) using Run (`CTRL+R`) or through searching it.
```bash
C:\Windows\System32> c:\pscp C:\path\to\file username@hostname:/home/username/path/to/file
```
* If this is the first transfer, it needs to cache your Linux machine's host key, so check if the key fingerprint matches.
* Usually, it'll try to display the `ssh-ed25519`, so consult that fingerprint first.
* Type `y` if it does match, or `return` if it doesn't.
