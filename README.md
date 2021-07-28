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

Transferring a file:
* Check if pscp is working
```bash
cd \windows\system32
c:\pscp
```
* To transfer a file to Linux machine, make sure to load Command Prompt (`cmd`) using Run (`CTRL+R`) or through searching it.
* Ensure that you know the following: username, hostname (for now, the machine's IP address will suffice), file_path, new_file_path
```bash
C:\Windows\System32> c:\pscp C:\{file_path} {username}@{hostname}:/home/{username}/{new_file_path}
```
* If this is the first transfer, it needs to cache your Linux machine's host key, so check if the key fingerprint matches.
* Usually, it'll try to display the `ssh-ed25519`, so consult that fingerprint first.
* Type `y` if it does match, or `return` if it doesn't.

* If you want to copy directories, append the recursive flag `-r`.

## Notification Monitoring
For Ubuntu(20.04):
Use `inotifywait` to monitor files added to directory from `pscp`:
```bash
sudo apt-get install inotifywait-tools
```
See `watch-example.sh` for a template script for usage of `inotifywait`.*

Ensure it's executable, and run as such:

```bash
sudo chmod u+x watch-example.sh
./watch-example.sh
```

If on `openbox`, add this to your `autostart` so it can run on startup:
```bash
sh ~/path/to/script/watch-example.sh &
```

*Note: It's preferable to use `dunst` for notifications, but `notify-send` works decently too.
