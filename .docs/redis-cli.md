## ssh EC2

ssh -i /path/to/ssh-key ec2-user@xx.xxx.xxx.xxx

## Amazon Linux 2 へ redis-cli を Install

cf. https://docs.aws.amazon.com/ja_jp/AmazonElastiCache/latest/red-ug/in-transit-encryption.html#connect-tls

```
sudo yum -y install openssl-devel gcc
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make distclean
make redis-cli BUILD_TLS=yes
sudo install -m 755 src/redis-cli /usr/local/bin/
```

## EC2 -> Redis の接続テスト

cf. https://aws.amazon.com/jp/premiumsupport/knowledge-center/elasticache-redis-cluster-fix-connection/

```
redis-cli -h master.stg-terraform-ec2-redis-test.eaaeac.apne1.cache.amazonaws.com --tls -p 6379
```

```
set mykey1 "abc"
get mykey1
```

上手く接続できない場合は以下も試す

```
curl -v telnet://master.stg-terraform-ec2-redis-test.eaaeac.apne1.cache.amazonaws.com:6379
```

```
nslookup master.stg-terraform-ec2-redis-test.eaaeac.apne1.cache.amazonaws.com
```
