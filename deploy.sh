echo "Start"
date --date='0 days ago' "+%Y-%m-%d %H:%M:%S"
rm -rf GPT-WEB-JAVA
git clone -b mine https://github.com/853270563/GPT-WEB-JAVA.git
cd GPT-WEB-JAVA
echo "停止容器"
docker stop gptserver
docker rm gptserver
echo "删除镜像"
docker rmi gptserver:latest
echo "构建镜像"
docker build -t  gptserver .
echo "启动镜像"
docker run -id --name=gptserver -v /home/www/logs:/home/www/logs  -p  8000:8000  gptserver
echo "启动成功"