# Dockerfile
FROM ubuntu:latest

# Install necessary packages including SSH server
RUN apt update -y && apt upgrade -y
RUN apt install -y \
    sudo \
    gdb \
    openssh-server \
    which \
    vim \
    git \
    gcc \
    make \
    g++

RUN apt install -y cmake ninja-build make
RUN apt install -y openjdk-8-jdk # 11 also works.
RUN apt install -y flex
RUN apt install -y bison # better 3.0.5
RUN apt install -y ncurses-dev systemtap-sdt-dev libelf-dev build-essential

# Create user with sudo access
RUN useradd -m -s /bin/bash vimkim && \
    echo "vimkim ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Set password for vimkim (change 'password' to your desired password)
RUN echo 'vimkim:password' | chpasswd


# Set up GDB for debugging
# RUN echo "kernel.yama.ptrace_scope = 0" >> /etc/sysctl.d/10-ptrace.conf

# Generate SSH host keys
RUN ssh-keygen -A

# Set working directory
WORKDIR /home/vimkim

CMD ["/bin/bash"]
