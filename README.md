# novncbox
noVNC with openbox


# build
```sh
docker build -t mynovncbox novncbox

```


# run
```sh
docker run -d -it -p 6080:6080 mynovncbox:latest
```

# access

```
http://ip:6080
```

# access via ssl

combine the fullchain certs and the key into one file: `~/all_in_one.pem`

```sh

docker run -d -it -v ~:/cert -e SSLONLY=1 -e CERT=/cert/all_in_one.pem   -p 6080:6080 mynovncbox:latest 


```