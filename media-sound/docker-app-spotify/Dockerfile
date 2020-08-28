FROM archlinux:latest

RUN pacman -Syu --noconfirm \
    && pacman -S --noconfirm git base-devel sudo mesa-demos \
    && rm -rf /var/cache/pacman/pkg/*

RUN echo "Defaults         lecture = never" > /etc/sudoers.d/privacy \
    && echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel

RUN useradd -u 2001 -m -G wheel -s /bin/bash builder

USER builder
WORKDIR /home/builder

RUN git clone https://aur.archlinux.org/yay.git \
    && cd yay \
    && makepkg -si --noconfirm \
    && sudo rm -rf /var/cache/pacman/pkg/* /home/builder/yay /home/builder/.cache

RUN gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90 2EBF997C15BDA244B6EBF5D84773BD5E130D1D45
RUN yay -Syu --noconfirm && yay --noconfirm -S spotify libcanberra gtk3 \
    && sudo rm -rf /var/cache/pacman/pkg/* /home/builder/yay /home/builder/.cache

USER root

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
