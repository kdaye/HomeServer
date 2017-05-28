# HomeServer
all in docker

## ShadowsocksR
### 作为客户端  
参考https://github.com/breakwa11/shadowsocks-rss/wiki/config.json  
```
docker run -d --name ssr --restart-always \
kdaye@shadowsocksr \
ss-redir -s your_server_ip -p 8388 \
-k passwd -b 0.0.0.0 -l 1080 \
-m aes-256-cfb -o tls1.2_ticket_auth \
-O auth_aes128_md5 -u
```
or
```
git 
cd ShadowsocksR
vim docker-compose.yml
docker-compose up -d
```
 
