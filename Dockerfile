FROM debian:11
USER root
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list  && \
  sed -i 's|security.debian.org/debian-security|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yfqq tzdata aria2 nginx unzip && rm -rf /var/lib/apt/lists/*
ADD aria2.conf entrypoint.sh /
ADD nginx.conf /etc/nginx/
ADD https://github.com/mayswind/AriaNg/releases/download/1.2.4/AriaNg-1.2.4-AllInOne.zip /app/AriaNg/
RUN cd /app/AriaNg && unzip AriaNg-1.2.4-AllInOne.zip && rm -f AriaNg-1.2.4-AllInOne.zip
WORKDIR /data
EXPOSE 80
ENTRYPOINT /entrypoint.sh
