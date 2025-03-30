# Home Assistant代理服务插件

## 概述

这个插件为Home Assistant提供临时代理服务，支持订阅Clash或Shadowrocket格式的配置。

## 安装

1. 在Supervisor面板中点击"插件商店"
2. 点击右上角的三点菜单，选择"仓库"
3. 添加仓库URL：`https://github.com/symi-daguo/clash-addon`
4. 找到"Proxy Service"插件并安装

## 配置

### 订阅类型（subscription_type）
- `clash`: Clash格式的订阅
- `shadowrocket`: Shadowrocket格式的订阅

### 订阅地址（subscription_url）
- 输入你的订阅链接URL

### 自动清理（auto_cleanup）
- 开启后，插件停止时会自动清理配置文件

## 使用方法

1. 配置好上述选项后，启动插件
2. 通过Home Assistant侧边栏的"代理服务"图标访问控制面板
3. 在需要代理的设备上配置HTTP代理（IP:端口7890）或SOCKS5代理（IP:端口7891）

## 故障排除

如果遇到问题，请查看插件日志以获取详细信息。常见问题：

- 订阅无法下载：检查URL是否正确，网络是否正常
- 代理无法连接：检查防火墙设置，确保端口7890和7891开放

## 注意事项

- 此插件仅用于临时代理服务，请勿长期运行
- 使用2025年3月最新的Clash v2.3.8内核
