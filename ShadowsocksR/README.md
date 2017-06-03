
## ShadowsocksR
### 作为客户端  
参考https://github.com/breakwa11/shadowsocks-rss/wiki/config.json  

```
git 
cd ShadowsocksR
vim docker-compose.yml
docker-compose up -d
```

### dnsmasq-ipset
如果需要ipset和gfwlist翻墙，设置iptables!
```
ipset -N gfwlist iphash
iptables -t nat -A PREROUTING -p tcp -m set --match-set gfwlist dst -j REDIRECT --to-port 1080
iptables -t nat -A OUTPUT -p tcp -m set --match-set gfwlist dst -j REDIRECT --to-port 1080
``` 
