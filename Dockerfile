FROM drydock/u16all

ADD . /zephyr-docker

RUN /zephyr-docker/install.sh
