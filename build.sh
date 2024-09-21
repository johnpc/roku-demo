# Enable developer mode on Roku via 🏠🏠🏠+⬆️⬆️+➡️⬅️+➡️⬅️+➡️
# Roku ip from Settings > Network > About
# ROKU_DEV_PASSWORD=rokudev ROKU_DEV_TARGET=192.168.4.177 ./build.sh lesson_1

# wake up/interrupt Roku - workaround for fw5.4 crash
curl -sS -d '' http://$ROKU_DEV_TARGET:8060/keypress/Home
curl -sS -d '' http://$ROKU_DEV_TARGET:8060/keypress/Home

# build. zip _must_ change for Roku to accept re-deploy (grr!)
DIR="$(pwd)/$1"
cd $DIR
touch $DIR/timestamp
zip -FS -9 -r bundle * -x run extras

# deploy
curl -f -sS --user rokudev:$ROKU_DEV_PASSWORD --anyauth -F "mysubmit=Install" -F "archive=@bundle.zip" -F "passwd=" http://$ROKU_DEV_TARGET/plugin_install  \
| python3 -c 'import sys, re; print("\n".join(re.findall("<font color=\"red\">(.*?)</font>", sys.stdin.read(), re.DOTALL)))'
