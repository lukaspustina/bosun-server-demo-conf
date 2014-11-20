
all: build

build:
	docker build -t lukaspustina/bosun_server .

start: hbase_data
	docker run -d -p 4242:4242 -p 8070:8070 --volume=`pwd`/hbase_data:/hbase/data --name=bosun_server lukaspustina/bosun_server
#	docker run -d -p 4242:4242 -p 8070:8070  --name=bosun_server lukaspustina/bosun_server
	ip route add 172.17.0.0/16 dev docker0 table baremetal

hbase_data:
	mkdir $@

stop:
	docker stop bosun_server
	docker rm bosun_server
	ip route del 172.17.0.0/16 dev docker0 table baremetal

status:
	docker ps | grep bosun_server

