FROM kalilinux/kali-rolling
LABEL maintainer="Rutger"

COPY init /usr/local/bin/init

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y apt-transport-https ca-certificates

RUN echo "deb https://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list

RUN apt-get clean && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  inetutils-ping \
  kali-linux-large \
  openssh-server \
  nano 

RUN chmod +x /usr/local/bin/init 

EXPOSE 22
CMD ["init"]
