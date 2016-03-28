# docker-python-app
A python flask webapp using redis - Dockerfile and compose file included


## requirements to run on multiple nodes
Create an overlay network on each of your nodes you want to run this on
to be able to link them and have them communicate

( make sure docker-engine is started with the --cluster-store=consul://IP:PORT options) 

and that you have a running K/V store for example consul.

```docker network create -d overlay webapp```

## Instructions
```
git clone https://github.com/kamigerami/docker-python-app.git 
cd docker-python-app
# if you are using compose
docker-compose up -d
# if you want to start everything manually
docker -H :3375 run -dit -P --name redis -h redis -p 6379:6379 --net=webapp redis
docker -H :3375 run -tid -P -p 5000:5000 --link redis --net=webapp kamigerami/python-app
```

<img src="https://raw.githubusercontent.com/kamigerami/assets/master/docker-python-app.url.png" width="512">

go to your host on port :5000
