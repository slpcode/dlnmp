# ldnmp

#### 项目介绍
使用docker搭建的可同时启动多个php版本的环境
每个php都在单独的容器内，互不干扰，通过共同的网络相连接
目前支持的有 mysql5.7,mysql8,php5.6,php7.1,php7.2,php7.3,nginx,redis,phpRedisAdmin,mongo,walle(瓦力部署工具),portainer

#### 使用说明
本软件只适合linux系统，而且里面固定了初始路径为 /srv/，如果需要可自行更改文件
```shell script
git clone https://gitee.com/last-order/lnmp.git
cd lnmp
cp .env.example .env
cp docker-compose-example.yml docker-compose.yml
docker-compose up -d [php73|php71|mysql8|redis4] 
// 例如 docker-compose up -d php73 nginx mysql8 redis4 代表只启动这几个

# 进入某个容器
docker exec -it php73 sh
docker exec -it nginx sh
docker exec -it mysql8 bash

#例如进入php73 
docker exec -it php73 sh
#然后在php73容器内
php --version  
#或
composer --version

####具体其它的可看对应的Dockerfile

```


