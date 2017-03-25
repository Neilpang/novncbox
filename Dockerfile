FROM debian:8
RUN apt-get update -qqy
RUN apt-get install -qqy net-tools \
openbox \
x11vnc \
xvfb \
python \
firefox-esr \
menu \
git \
ttf-wqy-zenhei

RUN cd /root && git clone https://github.com/Neilpang/noVNC.git
RUN cd /root/noVNC && ln -s vnc_auto.html index.html
RUN cd utils && git clone https://github.com/novnc/websockify

RUN mkdir -p /root/.config/openbox/
ADD autostart.sh /root/.config/openbox/autostart.sh
RUN chmod +x /root/.config/openbox/autostart.sh

ADD startup.sh /startup.sh
RUN chmod 0755 /startup.sh



CMD /startup.sh
