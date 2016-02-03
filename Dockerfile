FROM ubuntu:15.10
MAINTAINER Uwe Dauernheim <uwe@dauernheim.net>

WORKDIR /root

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
            curl \
            libcurl3 \
            libgl1-mesa-glx \
            libgl1 \
            libpng12-0 \
            libpython2.7 \
            libqt4-opengl \
            libqtcore4 \
            libqtgui4 \
            libsdl1.2debian \
            libssl1.0.0 \
            libvpx2 \
            libx11-6 \
            libxcursor1 \
            libxext6 \
            libxinerama1 \
            libxml2 \
            libxmu6 \
            libxt6 \
            psmisc \
            module-init-tools

ENV VIRTUALBOX=virtualbox-5.0_5.0.10-104061~Ubuntu~wily_amd64.deb
RUN curl -s -O http://download.virtualbox.org/virtualbox/5.0.14/$VIRTUALBOX && \
    dpkg -i $VIRTUALBOX && \
    rm $VIRTUALBOX
ENTRYPOINT ["vbox-img"]
