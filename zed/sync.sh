#!/bin/bash

# Use rsync para monitorar e sincronizar os arquivos
rsync -avz --delete ~/.config/zed/settings.json ~/dotfiles/zed/settings.json &

rsync -avz --delete ~/.config/zed/keymap.json ~/dotfiles/zed/keymap.json &
