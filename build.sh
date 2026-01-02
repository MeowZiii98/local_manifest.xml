#!/bin/bash
set -e

rm -rf .repo/local_manifests

repo init --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 16 -g default,-mips,-darwin,-notdefault

git clone https://github.com/MeowZiii98/aston_local_manifest --depth 1 -b main .repo/local_manifests

/opt/crave/resync.sh

source build/envsetup.sh

lunch infinity_aston-bp3a-userdebug

m bacon
