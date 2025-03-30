# Home Assistant代理服务插件

这个Home Assistant插件提供临时代理服务，用于Home Assistant远程升级和访问。

## 功能

- 支持Clash和Shadowrocket格式的代理订阅
- 提供HTTP(7890)和SOCKS5(7891)代理服务
- 通过Home Assistant界面直接访问代理控制面板
- 自动清理配置选项，确保安全

## 使用方法

1. 在Home Assistant中添加此插件仓库：`https://github.com/symi-daguo/clash-addon`
2. 安装"Proxy Service"插件
3. 配置你的订阅地址（支持Clash和Shadowrocket格式）
4. 启动服务

## 配置选项

| 选项 | 描述 |
|------|------|
| `subscription_type` | 订阅类型（clash或shadowrocket） |
| `subscription_url` | 订阅地址URL |
| `auto_cleanup` | 停止服务时自动清理配置 |

## 注意事项

- 此插件仅用于临时代理服务，不建议长期运行
- 请确保使用合法的代理服务
- 2025年3月版本，使用Clash v2.3.8内核
