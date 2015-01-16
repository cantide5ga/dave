FROM dockerfile/java:oracle-java8
MAINTAINER Michael N Payne <cantide5ga@users.sourceforge.net>

RUN apt-get update && apt-get install xvfb build-essential -y

RUN wget http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/luna/SR1/eclipse-java-luna-SR1-linux-gtk-x86_64.tar.gz \
    -O /tmp/eclipse.tar.gz \
    && tar -xf /tmp/eclipse.tar.gz -C /opt \
    && rm /tmp/eclipse.tar.gz

RUN curl -O http://heanet.dl.sourceforge.net/project/eclim/eclim/2.2.5/eclim_2.2.5.jar

RUN java -Dvim.files=/home/.vim -Declipse.home=/opt/eclipse \
    -jar eclim_2.2.5.jar install

VOLUME ["/home"]

CMD Xvfb :1 -screen 0 1024x768x24 & DISPLAY=:1 /opt/eclipse/eclimd -b
