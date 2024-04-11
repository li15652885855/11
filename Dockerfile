来自 nginx:mainline-alpine-slim
维护者 ifeng <https://t.me/HiaiFeng>
曝光80
用户根

跑步 apk update && apk add --no-cache Supervisor wget unzip curl

#定义UUID及伪装路径，请自行修改。（注意：伪装路径以 / 符号开始，为避免不必要的麻烦，请不要使用特殊符号。）
环境电压 UUID 556b388c-aace-4428-8a16-738ae6cfc566
环境电压 VMESS_WSPATH /lcmss
环境电压 VLESS_WSPATH /lcmss

复制supervisord.conf /etc/supervisor/conf.d/supervisord.conf
复制 nginx.conf /etc/nginx/nginx.conf

运行 mkdir /etc/v2ray /usr/local/v2ray
复制 config.json /etc/v2ray/
复制entrypoint.sh /usr/local/v2ray/

#感谢fscarmen大佬提供Dockerfile层优化方案
运行 wget -q -O /tmp/v2ray-linux-64.zip https://github.com/v2fly/v2ray-core/releases/download/v4.45.0/v2ray-linux-64.zip && \
    解压 -d /usr/local/v2ray /tmp/v2ray-linux-64.zip v2ray && \
    wget -q -O /usr/local/v2ray/geosite.dat https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat && \
    wget -q -O /usr/local/v2ray/geoip.dat https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat && \
    chmod a+x /usr/local/v2ray/entrypoint.sh && \
    apk del wget 解压缩 && \
    rm -rf /tmp/v2ray-linux-64.zip && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*
    
入口点  [ “/usr/local/v2ray/entrypoint.sh” ]
