#!/usr/bin/env sh

[ -e id_rsa.pub ] && xclip -sel clip <~/.ssh/id_rsa.pub \
  && echo "Copied existing cert to clipboard" \
  && exit 0 \
  || cat ~/.ssh/id_rsa.pub && echo "Could not copy, existing printed" && exit 1

ssh-keygen -t rsa -b 4096 -C `read -p 'Email: ' && echo $REPLY`

pid = "$(ssh-agent -s)"

ssh-add ~/.ssh/id_rsa

kill pid

xclip -sel clip <~/.ssh/id_rsa.pub && echo "Copied generated cert to clipboard" && exit 0 \
  || cat ~/.ssh/id_rsa.pub && echo "Could not copy, printed instead" && exit 1
