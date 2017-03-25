FROM debian:8
RUN apt-get update -qqy
RUN apt-get install -qqy net-tools
RUN apt-get install -qqy openbox
RUN apt-get install -qqy x11vnc
RUN apt-get install -qqy xvfb
RUN apt-get install -qqy python
RUN apt-get install -qqy firefox-esr
RUN apt-get install -qqy menu
RUN apt-get install -qqy git
RUN apt-get install -qqy ttf-wqy-zenhei

RUN cd /root && git clone https://github.com/Neilpang/noVNC.git
RUN cd /root/noVNC && ln -s vnc_auto.html index.html && \
RUN cd utils && git clone https://github.com/novnc/websockify

RUN mkdir -p /root/.config/openbox/
ADD autostart.sh /root/.config/openbox/autostart.sh
RUN chmod +x /root/.config/openbox/autostart.sh

ADD startup.sh /startup.sh
RUN chmod 0755 /startup.sh



CMD /startup.sh
