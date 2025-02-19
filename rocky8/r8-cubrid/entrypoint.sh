#!/bin/bash
set -e

# Create the user if not already present
if ! id -u "${USERNAME}" &>/dev/null; then
    echo "Creating user ${USERNAME}..."
    useradd -m -s /bin/bash "${USERNAME}"
    echo "${USERNAME}:${USER_PASSWORD}" | chpasswd
    echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers
fi

# Ensure the user owns their home directory
chown -R "${USERNAME}:${USERNAME}" "/home/${USERNAME}"

# Change to the user's home directory
cd "/home/${USERNAME}" || cd /

echo "Starting init system..."
# Start the init system (systemd)
exec /sbin/init
