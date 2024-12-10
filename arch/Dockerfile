# Use Arch Linux as base image
FROM archlinux:latest

# Install SSH server and other utilities
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm openssh && \
    mkdir /var/run/sshd

# Set root password for SSH (change 'rootpassword' to a secure password)
RUN echo "root:rootpassword" | chpasswd

# Allow root login and fix ownership
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    mkdir -p /root/.ssh && chmod 700 /root/.ssh

# Keep the container running by default
CMD ["/bin/bash"]

FROM archlinux:latest

# Install required packages
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm sudo vim git openssh

# Create user 'vimkim' and add to sudoers
RUN useradd -m -s /bin/bash vimkim && \
    echo 'vimkim ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Configure SSH
RUN mkdir /run/sshd && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    echo "AllowUsers vimkim" >> /etc/ssh/sshd_config

# Set a password for user 'vimkim'
RUN echo "vimkim:password" | chpasswd

CMD ["/bin/bash"]

