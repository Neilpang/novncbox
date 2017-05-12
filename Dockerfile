FROM debian:8
RUN apt-get update -qqy && apt-get install -qqy \
psmisc \
net-tools \
openbox \
x11vnc \
xvfb \
python \
firefox-esr \
menu \
git \
ttf-wqy-zenhei \
&& apt-get -y autoremove && apt-get clean all && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
&& cd /root && git clone https://github.com/Neilpang/noVNC.git \
&& cd /root/noVNC && ln -s vnc_auto.html index.html


RUN mkdir -p /root/.config/openbox/
ADD autostart.sh /root/.config/openbox/autostart.sh
RUN chmod +x /root/.config/openbox/autostart.sh

ADD rc.xml /root/.config/openbox/rc.xml

ADD startup.sh /startup.sh
RUN chmod 0755 /startup.sh


CMD /startup.sh
