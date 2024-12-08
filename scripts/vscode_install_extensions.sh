#!/bin/sh

while read extension; do
    code --install-extension "${extension}"
done < "$HOME"/.config/Code/User/extensions_list