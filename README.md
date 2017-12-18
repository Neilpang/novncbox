# novncbox
noVNC with openbox


# 1. Run in docker
### 1. build
```sh
docker build -t mynovncbox novncbox

```


### 2. run
```sh
docker run -d -it -p 6080:6080 mynovncbox:latest
```

### 3. access

```
http://ip:6080
```

### 4. access via ssl

combine the fullchain certs and the key into one file: `~/all_in_one.pem`

```sh

docker run -d -it -v ~:/cert -e SSLONLY=1 -e CERT=/cert/all_in_one.pem   -p 6080:6080 mynovncbox:latest 

```

# 2. Run standalone

### 1. Install in Debian 8

```sh
apt-get update -qqy && apt-get upgrade -qqy

apt-get install -qqy ca-certificates

chmod +x install.sh

./install.sh
```

### 2. Start openbox

```sh
chmod +x startup.sh
./startup.sh &
```

