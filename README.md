# docker-2048

simple is better

a smaller docker version of 2048

Base on nginx

# run the docker container with your own build

    git clone https://github.com/tekstac-github/ecslab.git
    docker build -t "2048" .
    docker run -d -p 80:80 2048

# run the docker container by pulling the image directly

    docker run -d -p 80:80 2048

# Access the game

    http://127.0.0.1

If you run docker with boot2docker on Mac or Windows, the URL should be:
 
    http://192.168.59.103
