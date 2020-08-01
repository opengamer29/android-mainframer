# android-mainframer
Just an experiment with Android mainframer for home desktop

**In fact, this repo is only my personal readme and shouldn't be used by anyone :D.**

And it's work. With i7-9700 - 6 CPUs and 8 GB of RAM avaliable for docker - it descrease time of clean build for application with pretty huge database and 20 modules it takes less than 5 minutes instead of 20 on my 2,9 GHz Dual-Core Intel Core i5, 16 GB RAM macbook.

Mainframer repository - https://github.com/buildfoundation/mainframer

I've used the second version of mainframer. But this docker image can be used for 3 version too.

Image is build based on runmymind/docker-android-sdk docker images and it's pretty huge, better to rework to use only openjdk. But we use runmymind/docker-android-sdk inside our CI, so it's more familiar.

Take attention to this part of docs: https://github.com/buildfoundation/mainframer/blob/2.x/docs/SETUP_REMOTE.md#environment
I've spent some time trying to understand why it doesn't work and only after that added env to start of ~/.bashrc inside Dockerimage.

Also, it's a personal mainframe that's why I use only one user inside docker and `ssh-copy-id` tools (available via homebrew).

This article was extremely helpful to understand the concept https://medium.com/@balachandarkm/speed-up-android-builds-with-mainframer-docker-container-in-a-powerful-remote-machine-ce7b9e122a49 

But Image from this article haven't worked for me from the first try, and my purpose was to understand how exactly it works, that's why I build my own image.
