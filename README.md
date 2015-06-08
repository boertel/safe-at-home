## Installation

Edit `safe-at-home.sh` to fit your settings:
- `*_ENABLE=1`: ask for password (`0` to disable)
- `*_SECONDS=N`: number of seconds before asking for password after computer goes to sleep
- `HOME_SSID="..."`: SSID

And then run (it will download and install [pymacadmin](https://github.com/MacSysadmin/pymacadmin), and then copy files where they need to be)
```
./install.sh
```
