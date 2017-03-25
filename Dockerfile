FROM debian:8
RUN apt-get update -qqy && \
apt-get install -qqy \
net-tools \
openbox \
x11vnc \
xvfb \
python \
firefox-esr \
menu \
git \
ttf-wqy-zenhei && \
cd /root && git clone https://github.com/novnc/noVNC.git && \
cd /root/noVNC && ln -s vnc_auto.html index.html && \
cd utils && git clone https://github.com/novnc/websockify

ADD startup.sh /startup.sh
RUN chmod 0755 /startup.sh

CMD /startup.sh
