#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
# sed '2s/src/#src/g'
# 注释掉原luci

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
echo "src-git packages https://github.com/Lienol/openwrt-packages.git;19.07" > feeds.conf.default
echo "src-git luci https://github.com/openwrt/luci.git;openwrt-19.07" >> feeds.conf.default
echo "src-git routing https://git.openwrt.org/feed/routing.git;openwrt-19.07" >> feeds.conf.default
echo "src-git telephony https://git.openwrt.org/feed/telephony.git;openwrt-19.07" >> feeds.conf.default
echo "src-git lienol https://github.com/Lienol/openwrt-package.git;main" >> feeds.conf.default
echo "src-git freifunk https://github.com/freifunk/openwrt-packages.git;openwrt-19.07" >> feeds.conf.default
echo "src-git openwrtpackages https://github.com/garypang13/openwrt-packages" >> feeds.conf.default 
echo "src-git small https://github.com/hepsontam/small">> feeds.conf.default
#sed -i '$a src-git small https://github.com/hepsontam/small' feeds.conf.default
