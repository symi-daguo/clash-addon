# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM

# 设置环境变量
ENV LANG C.UTF-8
ENV PATH="/usr/local/bin:${PATH}"

# 安装依赖
RUN apk add --no-cache \
    curl \
    jq \
    wget \
    tar \
    unzip \
    ca-certificates \
    nginx \
    bash \
    grep \
    sed \
    coreutils

# 安装Clash核心 (更新到2025年3月的版本)
RUN mkdir -p /opt/clash \
    && curl -L -o /tmp/clash.gz https://github.com/Dreamacro/clash/releases/download/v2.3.8/clash-linux-amd64-v2.3.8.gz \
    && gzip -d /tmp/clash.gz \
    && mv /tmp/clash /opt/clash/clash \
    && chmod +x /opt/clash/clash

# 安装Clash管理面板 (更新到最新版本)
RUN mkdir -p /opt/clash/dashboard \
    && curl -L -o /tmp/dashboard.zip https://github.com/Dreamacro/clash-dashboard/archive/refs/heads/gh-pages.zip \
    && unzip -d /tmp /tmp/dashboard.zip \
    && cp -r /tmp/clash-dashboard-gh-pages/* /opt/clash/dashboard/ \
    && rm -rf /tmp/dashboard.zip /tmp/clash-dashboard-gh-pages

# 执行在构建镜像期间的命令
ARG TEMPIO_VERSION BUILD_ARCH
RUN \
    curl -sSLf -o /usr/bin/tempio \
    "https://github.com/home-assistant/tempio/releases/download/${TEMPIO_VERSION}/tempio_${BUILD_ARCH}" \
    && chmod +x /usr/bin/tempio

# 复制根文件系统
COPY rootfs /

# 创建必要的目录
RUN mkdir -p /var/log/nginx /data /share \
    && chmod -R 755 /var/log/nginx /data /share

# 为命令文件添加可执行权限
RUN find /etc/services.d -type f -name run -exec chmod a+x {} \; \
    && find /etc/services.d -type f -name finish -exec chmod a+x {} \; \
    && find /etc/cont-init.d -type f -exec chmod a+x {} \; \
    && chmod a+x /usr/bin/proxy-service

# 添加标签
LABEL \
    io.hass.name="代理服务" \
    io.hass.description="提供Clash代理服务，支持多种订阅格式" \
    io.hass.version="${BUILD_VERSION}" \
    io.hass.type="addon" \
    io.hass.arch="${BUILD_ARCH}" \
    maintainer="symi-daguo <303316404@qq.com>"

WORKDIR /
ENTRYPOINT ["/init"]
