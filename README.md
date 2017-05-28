# HomeServer
all in docker

## ShadowsocksR
### 作为客户端  
参考https://github.com/breakwa11/shadowsocks-rss/wiki/config.json  
`cd ShadowsocksR`  
`vim config.json`  
填写上服务器IP和密码。  
运行
`docker-compose up -d`  
### 作为服务器  
`cd ShadowsocksR`  
`vim config.json`    
填写密码。  
`vim docker-compose.yml`  
注释8388以外的一切端口  
`docker-compose up -d`   
