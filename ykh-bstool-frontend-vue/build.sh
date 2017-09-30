./stop.sh
cnpm install --cache-min Infinity
npm run build
docker build --force-rm -t ykh-bstfe-vue .
