#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# Add luci-app-ssr-plus
#pushd package/lean
#git clone --depth=1 https://github.com/fw876/helloworld
#popd

# Clone community packages to package/community
mkdir package/community
pushd package/community

# Add Kenzok8 Packages?
#git clone --depth=1 https://github.com/kenzok8/openwrt-packages openwrtpackages
#git clone --depth=1 https://github.com/garypang13/openwrt-packages openwrtpackages
git clone --depth=1 https://github.com/garypang13/smartdns-le
git clone --depth=1 https://github.com/SuLingGG/default-settings
# Modify bypass
#rm -rf luci-app-bypass
#git clone --depth=1 https://github.com/hepsontam/luci-app-bypass

# Add mentohust & luci-app-mentohust.
#git clone --depth=1 https://github.com/BoringCat/luci-app-mentohust
#git clone --depth=1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

# Add ServerChan
git clone --depth=1 https://github.com/tty228/luci-app-serverchan

# Add OpenClash
#git clone --depth=1 -b master https://github.com/vernesong/OpenClash

# Add luci-app-onliner (need luci-app-nlbwmon)
#git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner

# Add luci-app-adguardhome
#git clone --depth=1 https://github.com/rufengsuixing/luci-app-adguardhome

# Add Rclone-OpenWrt
#git clone --depth=1 https://github.com/ElonH/Rclone-OpenWrt

# Add luci-app-diskman
#git clone --depth=1 https://github.com/lisaac/luci-app-diskman
#mkdir parted
#cp luci-app-diskman/Parted.Makefile parted/Makefile

# Add luci-app-dockerman
# git clone --depth=1 https://github.com/KFERMercer/luci-app-dockerman
# mkdir luci-lib-docker
# curl -s -o ./luci-lib-docker/Makefile https://raw.githubusercontent.com/lisaac/luci-lib-docker/master/Makefile
# rm -rf ../lean/luci-app-docker

# Add luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon
rm -rf ../lean/luci-theme-argon

# Add luci-theme-rosy/purple
git clone --depth=1 https://github.com/rosywrt/luci-theme-rosy
git clone --depth=1 https://github.com/rosywrt/luci-theme-purple

# Add tmate (lack 21.02)
#svn co https://github.com/immortalwrt/immortalwrt/tree/openwrt-19.07/package/ctcgfw/tmate
#svn co https://github.com/immortalwrt/immortalwrt/tree/openwrt-19.07/package/ctcgfw/msgpack-c

# Add gotop
#svn co https://github.com/immortalwrt/immortalwrt/tree/openwrt-19.07/package/ctcgfw/gotop

# Subscribe converters
#svn co https://github.com/immortalwrt/immortalwrt/tree/openwrt-19.07/package/ctcgfw/subconverter
#svn co https://github.com/immortalwrt/immortalwrt/tree/openwrt-19.07/package/ctcgfw/jpcre2
#svn co https://github.com/immortalwrt/immortalwrt/tree/openwrt-19.07/package/ctcgfw/rapidjson

# Add smartdns
svn co https://github.com/pymumu/smartdns/trunk/package/openwrt ../smartdns
svn co https://github.com/project-openwrt/openwrt/trunk/package/ntlf9t/luci-app-smartdns ../luci-app-smartdns

# Add udptools
git clone --depth=1 https://github.com/sensec/openwrt-udp2raw
git clone --depth=1 https://github.com/pexcn/openwrt-udpspeeder
git clone --depth=1 https://github.com/luckypoem/luci-udptools

# Add OpenAppFilter
git clone --depth=1 https://github.com/destan19/OpenAppFilter
popd

# Fix libssh
pushd feeds/packages/libs
rm -rf libssh
svn co https://github.com/openwrt/packages/trunk/libs/libssh
popd

# Remove orig kcptun
rm -rf ./feeds/packages/net/kcptun

# Enable irqbalance
sed -i 's/0/1/g' feeds/packages/utils/irqbalance/files/irqbalance.config

# Max connections
sed -i 's/16384/65536/g' package/kernel/linux/files/sysctl-nf-conntrack.conf

# Remove IPV6
#sed -i 's/ip6tables //g' include/target.mk
#sed -i 's/odhcpd-ipv6only odhcp6c //g' include/target.mk

# Change dnsmasq to dnsmasq-full
sed -i 's/dnsmasq i/dnsmasq-full i/g' include/target.mk

# Convert Translation
#cp ../scripts/convert-translation.sh .
#chmod +x ./convert-translation.sh
#./convert-translation.sh || true

# Remove upx
#cp ../scripts/remove-upx.sh .
#chmod +x ./remove-upx.sh
#./remove-upx.sh || true
