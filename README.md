# Flipnote-ppa-signer
This is a simple shell script (sorry windows users) for signing Flipnote ppm's

# How to get the private key

Note: There's multiple, probably easier ways to do this but this is the only way I found that works (for example just hex editing a decrypted flipnote nds rom gives the key, but there's weird 0x00's all over the place.)

Stuff needed:

no$gba debug version set up for dsiware. (search it up)

Flipnote running on said emulator.

A hex editor, any one should do. 

1. Launch Flipnote in the emulator, create and save a Flipnote to make sure the key is in memory. 

2. Follow this guide up to step 6 to dump the memory to a hex file: https://nsmbhd.net/thread/983-making-a-ram-dump-and-importing-it-in-ida-pro-tutorial/

3. Open the memory dump in a hex editor and search for the string "30 82 02 5C" (This is the key header)

4. Copy from the start of that said string all the way to the bottom and paste it into a new file or something. 
(This is because I couldn't find out where it ends but luckily it doesn't matter for openssl)

5. run "openssl rsa -inform DER -in [FILE] -out ppm-privkey.pem" on the file that starts with that string (30 82 02 5C) that you made somehow. 

6. There's the key!

# Credits 

This one form post with vague answers I had the misfortune of figuring out:

https://gbatemp.net/threads/help-with-laying-my-own-encoded-flipnotes-on-the-dsi.577897/
