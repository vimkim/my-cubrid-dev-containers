FROM local/r8-systemd

# Default environment variables (can be overridden at container runtime)
ENV USERNAME=youmustspecifyusername
ENV USER_PASSWORD=password
ENV container=docker

# Add these lines for locale
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
RUN dnf install -y glibc-langpack-en

# Install necessary packages including those for SSH and system tools
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

# Configure SSH (if you plan to use it later)
RUN sed -i 's/#X11Forwarding no/X11Forwarding yes/' /etc/ssh/sshd_config && \
    echo 'X11UseLocalhost no' >> /etc/ssh/sshd_config && \
    echo 'PermitRootLogin no' >> /etc/ssh/sshd_config && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config

# Set up GDB for debugging
RUN echo "kernel.yama.ptrace_scope = 0" >> /etc/sysctl.d/10-ptrace.conf

# Generate SSH host keys
RUN ssh-keygen -A

# Copy the entrypoint script that handles user creation and starts init
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose SSH port if needed (optional)
EXPOSE 22

# Use the entrypoint script to create user and start init system
ENTRYPOINT ["/entrypoint.sh"]
