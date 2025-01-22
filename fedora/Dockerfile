# Dockerfile
FROM fedora:latest

# Install necessary packages including SSH server
RUN dnf update -y && dnf install -y \
    sudo \
    gdb \
    openssh-server \
    xorg-x11-xauth \
    which \
    vim \
    git \
    gcc \
    make \
    && dnf clean all

# Create user with sudo access
RUN useradd -m -s /bin/bash vimkim && \
    echo "vimkim ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Set password for vimkim (change 'password' to your desired password)
RUN echo 'vimkim:password' | chpasswd

# Configure SSH
RUN sed -i 's/#X11Forwarding no/X11Forwarding yes/' /etc/ssh/sshd_config && \
    echo 'X11UseLocalhost no' >> /etc/ssh/sshd_config && \
    echo 'PermitRootLogin no' >> /etc/ssh/sshd_config && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config

# Set up GDB for debugging
RUN echo "kernel.yama.ptrace_scope = 0" >> /etc/sysctl.d/10-ptrace.conf

# Generate SSH host keys
RUN ssh-keygen -A

# Set working directory
WORKDIR /home/vimkim

# Start SSH server
CMD ["/usr/sbin/sshd", "-D"]
