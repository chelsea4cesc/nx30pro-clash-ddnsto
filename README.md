# H3C Magic NX30 Pro 112M 大分区 ImmortalWrt 编译模板

目标：把原厂 64M `ubi` 分区扩大到 112M，并将以下插件编进固件：

- `luci-app-openclash`
- `luci-app-ddnsto`
- 中文语言包

## 使用方式

1. 把本目录上传到你的 GitHub 仓库。
2. 打开仓库的 `Actions` 页面。
3. 选择 `Build NX30 Pro 112M`，点 `Run workflow`。
4. 编译完成后在 `Artifacts` 里下载固件。

输出文件通常在：

```text
bin/targets/mediatek/filogic/
```

其中：

- `*h3c_magic-nx30-pro-nmbm-112m-squashfs-factory.bin` 用于首次刷入。
- `*h3c_magic-nx30-pro-nmbm-112m-squashfs-sysupgrade.bin` 用于以后升级。

## 刷入提醒

- 第一次应从 U-Boot 或原厂恢复环境刷 `factory.bin`。
- 刷之前确认已有原厂分区备份。
- 本模板基于 `hanwckf/immortalwrt-mt798x` 的 `openwrt-21.02` 分支。

