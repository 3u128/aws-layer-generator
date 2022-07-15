# Base for AWS Glue
FROM amazonlinux:2
ENV package=couchbase
RUN yum update -y
RUN amazon-linux-extras enable python3.8
RUN yum install -y python3.8
RUN yum install -y zip
# Additional components needed for grpcio
WORKDIR /root
RUN mkdir -p python/lib/python3.8/site-packages
RUN python3.8 -m pip install --upgrade pip
RUN python3.8 -m pip install $package -t python/lib/python3.8/site-packages
RUN echo $(python3 --version)
RUN zip -r $package.zip python/lib/python3.8/site-packages

# docker ps
# docker cp CONTAINER:/root/python/ .
# sudo docker cp ada6d58acf4e:/root/couchbase.zip .

# sudo docker run -dit packages 
# sudo docker ps
# sudo docker cp 7c72e48def54:/root/couchbase.zip .