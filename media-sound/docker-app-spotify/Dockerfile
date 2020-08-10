FROM archlinux:latest

RUN pacman -Syu --noconfirm \
    && pacman -S --noconfirm git base-devel sudo \
    && rm -rf /var/cache/pacman/pkg/*

RUN echo "Defaults         lecture = never" > /etc/sudoers.d/privacy \
    && echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel

RUN useradd -u 2001 -m -G wheel -s /bin/bash builder \
    && useradd -u 2002 -m -G audio,video -s /bin/bash docker

USER builder
WORKDIR /home/builder

RUN git clone https://aur.archlinux.org/yay.git \
    && cd yay \
    && makepkg -si --noconfirm \
    && sudo rm -rf /var/cache/pacman/pkg/*

RUN yay --noconfirm -S spotify

USER docker
ENV HOME /home/docker
ENV PULSE_SERVER /run/pulse/native
CMD /usr/bin/spotify

