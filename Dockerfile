FROM drydock/u16all

ADD . /zephyr-docker

RUN /zephyr-docker/install.sh

RUN useradd -m -G plugdev buildslave \
 && echo 'buildslave ALL = NOPASSWD: ALL' > /etc/sudoers.d/buildslave \
 && chmod 0440 /etc/sudoers.d/buildslave
