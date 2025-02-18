FROM archlinux:latest

# Update system and install required packages (including systemd)
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm sudo vim git openssh systemd && \
    pacman -Scc --noconfirm

# Configure systemd: Mask services that aren’t needed in a container
RUN systemctl mask \
    dev-mqueue.mount \
    sys-fs-fuse-connections.mount \
    systemd-remount-fs.service \
    systemd-logind.service

# Set environment variable for systemd in container
ENV container docker

# Expose port 22 if needed (for SSH, if you choose to run it too)
EXPOSE 22

# Use systemd as the entrypoint
CMD ["/sbin/init"]
