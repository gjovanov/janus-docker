docker run -tid \
-p 7889:7889 -p 7089:7089 -p 8089:8889 -p 7088:7088 -p 8088:8088 -p 8000:8000 \
-p 8081:8080 -p 7777:7777 -p 10000-10200:10000-10200 \
gjovanov/janus-docker --name janus
