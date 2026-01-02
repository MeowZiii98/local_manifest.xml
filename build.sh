#!/bin/bash
set -e

rm -rf .repo/local_manifests
rm -rf device/oneplus/aston
rm -rf vendor/oneplus/aston
rm -rf kernel/oneplus/sm8550
rm -rf hardware/oplus

repo init --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 16 -g default,-mips,-darwin,-notdefault

git clone https://github.com/MeowZiii98/aston_local_manifest --depth 1 -b main .repo/local_manifests

/opt/crave/resync.sh

source build/envsetup.sh
lunch infinity_aston-bp3a-userdebug
m bacon
