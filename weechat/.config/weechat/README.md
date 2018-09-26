# Instructions

> Steps

### Install scripts

 * colorize_lines.pl
 * colorize_nicks.py
 * [vimode.py](https://github.com/GermainZ/weechat-vimode)
 * [notify_send.py](https://github.com/s3rvac/weechat-notify-send)
 
```bash
$ mkdir -pv $WEECHAT_HOME/python/autoload/
$ cd $WEECHAT_HOME/python
$ curl -O https://raw.githubusercontent.com/s3rvac/weechat-notify-send/master/notify_send.py
$ ln -s ../notify_send.py autoload/
```

```bash
weechat> /script install colorize_lines.pl colorize_nicks.py vimode.py`
```

### Restore sensitive data configs example

```bash
$ pass weechat-files/irc.conf > irc.conf
```

Files to restore
 * irc.conf
 * sec.conf
 * certs/*.pem


---
#### Backup sensitive data configs example

```bash
$ cat irc.conf | pass instert -m -f weechat-files/irc.conf
```
