
all: build

build:
	docker build -t lukaspustina/bosun_server .

start: hbase_data
	docker run -d -p 4242:4242 -p 8070:8070 --volume=`pwd`/hbase_data:/hbase/data --name=bosun_server lukaspustina/bosun_server

hbase_data:
	mkdir $@

stop:
	docker stop bosun_server
	docker rm bosun_server

status:
	docker ps | grep bosun_server

