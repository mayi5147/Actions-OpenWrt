#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# 说明：
# 除了第一行的#!/bin/bash不要动，其他的设置，前面带#表示不起作用，不带的表示起作用了（根据你自己需要打开或者关闭）
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# 删除lede自带argon主题
rm -rf package/feeds/luci/luci-theme-argon

# 克隆新的argon主题及主题设置
git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon package/feeds/luci/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/feeds/luci/luci-app-argon-config

# 修改argon为默认主题
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile 
sed -i 's /bootstrap/argon/g ' feeds/luci/collections/luci/Makefile

# 修改openwrt登陆地址,把下面的192.168.31.1修改成你想要的就可以了
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# 修改主机名字，把OpenWrt修改你喜欢的就行（不能纯数字或者使用中文）
#sed -i 's/OpenWrt/OpenWrt/g' package/base-files/files/bin/config_generate

# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
#sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' ./package/lean/default-settings/files/zzz-default-settings

# 修改banne文件（banne文件在根目录）（不要修改此行代码,怕弄的diy-lede.sh文件全失效,不需要的话前面加#，或者全行代码删除了）
#rm -rf ./package/base-files/files/etc/banne && cd .. && cp -f ./banner openwrt/package/base-files/files/etc/ && cd openwrt

# 修改内核版本为5.10
#sed -i 's/5.4/5.10/g' target/linux/ramips/Makefile
