#!/bin/bash

# Script to automate the signatures creation for all files within /boot loaded by GRUB.
# For use with GRUB's 'check_signatures' feature:
# https://www.gnu.org/software/grub/manual/grub/html_node/Using-digital-signatures.html
#
# Inspired by https://github.com/Bandie/grub2-signing-extension

# Generate GRUB specific GPG key with:
# gpg --homedir /etc/grub.d/.gnupg --gen-key
# gpg --homedir /etc/grub.d/.gnupg --output /etc/grub.d/.gnupg/public.gpg --armor --export

cp /etc/grub.d/.gnupg/public.gpg /boot/grub/

grub-install /dev/nvme0n1 \
             --pubkey=/boot/grub/public.gpg \
             --boot-directory=/boot \
             --efi-directory=/boot/efi \
             --removable \
             --modules="pgp gcry_sha256 gcry_sha512 gcry_dsa gcry_rsa"

grub-mkconfig -o /boot/grub/grub.cfg

export GPG_TTY=$(tty)

for i in `find /boot -iname "efi" -prune -o -type f -print | grep -vP "\.sig$"`;
do
  rm $i.sig
  echo "Signing $i"
  gpg --homedir /etc/grub.d/.gnupg --batch --detach-sign $i
done
