#!/usr/bin/with-contenv bashio
# ==============================================================================
# 初始化代理服务环境
# ==============================================================================

# 创建必要的目录
mkdir -p /var/log/nginx
mkdir -p /opt/clash/config

# 确保权限正确
chmod -R 755 /opt/clash
chmod -R 755 /etc/nginx

# 记录版本信息
CLASH_VERSION=$(/opt/clash/clash -v | grep version | cut -d' ' -f3)
bashio::log.info "初始化Clash代理服务 v${CLASH_VERSION}"

# 检查订阅配置
if ! bashio::config.has_value 'subscription_url'; then
    bashio::log.warning "未提供订阅URL，将使用默认配置。请在配置中添加您的订阅URL以获得更好的体验。"
fi

# 检查网络连接
if bashio::var.true "$(bashio::network.is_connected)"; then
    bashio::log.info "网络连接正常，可以下载订阅"
else
    bashio::log.warning "网络连接不可用，可能无法下载订阅"
fi

bashio::log.info "环境初始化完成" 