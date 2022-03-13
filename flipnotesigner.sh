#!/bin/bash

echo "Welcome to this over done flipnote signer no one will ever use"
echo " "
echo "What's the filename of the flipnote ppm?"
read -r -p "[*]: " ppm
echo " "
echo "What's the filename of the flipnote private key?"
read -r -p "[*]: " key
echo " "
echo "Stripping last 0x90 bytes...."
echo " "
mkdir out
cp $ppm out
truncate -s -144 out/$ppm
echo "Signing...."
echo " "
openssl dgst -sha1 -sign $key -out out/sha1.sign out/$ppm
cat out/sha1.sign >> out/$ppm
echo "Apending last 0x10 bytes"
echo " "
echo -n -e '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' >> out/$ppm
echo "Cleaning out that single file"
echo " "
rm out/sha1.sign
echo "Your Signed flipnote ppm is in out/$ppm"
echo " "
echo "All done :)"
exit 0
