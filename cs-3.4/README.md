# 3.4 Operator Packages

The Dockerfile and script will build a docker image that only contains 3.4 operator packages which are downloaded from quay.io.

In future release we should switch to fetch operator packages from github.com.


```
docker build -t quay.io/opencloudio/ibm-common-service-catalog:3.4.0-operator-package -f Dockerfile.operator-package .
```
