./stop.sh
mvn package
docker build --force-rm -t ykh-ledger-service .
