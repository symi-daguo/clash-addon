# Home Assistant 代理服务插件仓库

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fsymi-daguo%2Fclash-addon)

## 关于

这个仓库包含了Home Assistant的代理服务插件，提供临时代理服务用于远程升级和访问。

### 插件

- [代理服务](./proxy-service/README.md): 提供基于Clash的HTTP和SOCKS5代理服务，支持多种订阅格式。

## 安装

1. 在Home Assistant中点击上方的"添加到Home Assistant"按钮，或手动添加仓库URL: `https://github.com/symi-daguo/clash-addon`
2. 在"插件商店"中找到"代理服务"插件并安装
3. 配置您的订阅信息
4. 启动插件 