./stop.sh
cd aaa
npm install
cd ..
docker build --force-rm -t ykh-aaa-service .
