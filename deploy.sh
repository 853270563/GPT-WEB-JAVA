echo "Start"
date --date='0 days ago' "+%Y-%m-%d %H:%M:%S"
rm -rf GPT-WEB-JAVA
git clone -b mine https://github.com/853270563/GPT-WEB-JAVA.git
cd GPT-WEB-JAVA
echo "停止容器"
docker stop GPT
docker rm GPT
echo "删除镜像"
docker rmi GPT:latest
echo "构建镜像"
docker build -t  GPT .
echo "启动镜像"
docker run -id --name=GPT -v /home/www/logs:/home/www/logs  -p  8000:8000  GPT
echo "启动成功"