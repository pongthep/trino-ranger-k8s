# trino-k8s
## Version

362
## download trio and put it inside trino-server folder

wget https://repo1.maven.org/maven2/io/trino/trino-server/362/trino-server-362.tar.gz
## build trino coordinator

docker build -t pongthep/trino-coordinator:x.x.x -f Coordinator.Dockerfile .
## build trino worker

docker build -t pongthep/trino-worker:x.x.x -f Worker.Dockerfile .