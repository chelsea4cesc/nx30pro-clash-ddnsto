#!/bin/sh
set -e

ZT229_DIR="/tmp/h3c_nx30pro_225m_dts"

if [ ! -d "$ZT229_DIR" ]; then
    git clone --depth 1 https://github.com/ZT229/H3C_NX30pro_225M_dts.git "$ZT229_DIR"
fi

cp -f "$ZT229_DIR/mt7981b-h3c-magic-nx30-pro-112m.dts" \
    openwrt/target/linux/mediatek/dts/

# 只追加 112m 设备定义，避免覆盖上游已有的 NMBM/stock 定义。
awk '
/^define Device\/h3c_magic-nx30-pro-nmbm-112m$/ {
    print
    capture = 1
    next
}
capture {
    print
    if ($0 == "endef") {
        exit
    }
}
' "$ZT229_DIR/filogic.mk" >> openwrt/target/linux/mediatek/image/filogic.mk

echo "TARGET_DEVICES += h3c_magic-nx30-pro-nmbm-112m" \
    >> openwrt/target/linux/mediatek/image/filogic.mk

# 第三方插件源。
cat >> openwrt/feeds.conf.default <<'EOF'
src-git openclash https://github.com/vernesong/OpenClash.git
src-git ddnsto https://github.com/linkease/ddnsto-openwrt.git
EOF

