docker build -t my-mysql:8.0 .

docker run -d -p 3306:3306 -it --name my-mysql my-mysql:8.0