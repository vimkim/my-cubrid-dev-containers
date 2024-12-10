FROM rockylinux:9.3

# Update and install essential packages
RUN dnf install -y openssh-server sudo git vim gcc make zsh tmux \
    && dnf clean all

# Configure SSH
RUN mkdir /var/run/sshd \
    && echo 'PermitRootLogin no' >> /etc/ssh/sshd_config \
    && echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config \
    && echo 'Port 2222' >> /etc/ssh/sshd_config

# Create a non-root user 'vimkim' with sudo privileges
RUN useradd -m -s /bin/bash vimkim \
    && echo 'vimkim:password' | chpasswd \
    && echo 'vimkim ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Set up workspace directory for the user
RUN mkdir -p /home/vimkim/workspace \
    && chown -R vimkim:vimkim /home/vimkim/workspace

# Expose SSH port
EXPOSE 2222


USER vimkim
WORKDIR /home/vimkim

