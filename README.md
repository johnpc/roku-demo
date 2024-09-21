# @johnpc Roku Development

This is a repo I am using as I learn roku development. It's based on [learnroku/crash-course](https://github.com/learnroku/crash-course).

# Enable developer mode on Roku

Using roku remote:

```bash
🏠🏠🏠+⬆️⬆️+➡️⬅️+➡️⬅️+➡️
```

Now find your Roku IP address from `Settings > Network > About` on your Roku device.

# Enable debugger

```bash
telnet <roku ip> 8085 # eg telnet 192.168.4.177 8085
```

# Deploy roku app

```bash
export ROKU_DEV_PASSWORD=<roku password> # eg export ROKU_DEV_PASSWORD=rokudev
export ROKU_DEV_TARGET=<roku ip> # eg export ROKU_DEV_TARGET=192.168.4.177
./build.sh <directory> # eg. ./build.sh lesson_1
```
