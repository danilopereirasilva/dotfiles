#!/bin/bash

# Caminho para os arquivos que você deseja atualizar
SOURCE_FILE="/home/danilo/.vimrc"
TARGET_FILE="/home/danilo/dotfiles/.vimrc"

# Verificar se os arquivos existem
if [ -f "$SOURCE_FILE" ] && [ -f "$TARGET_FILE" ]; then
    # Copiar o conteúdo do arquivo de origem para o arquivo de destino
    cat "$SOURCE_FILE" > "$TARGET_FILE"
else
    echo "Um ou ambos os arquivos (vimrc) não foram encontrados."
fi
