# Fedora Docker Container for CUBRID Development

After following the instructions on

https://github.com/vimkim/dotfiles

```bash
cd $HOME
git clone https://github.com/vimkim/my-cubrid

sudo apt -y update && sudo apt -y upgrade

sudo apt -y install g++ # gcc 8 - 14 all works. clang also works with a few tweaks.
sudo apt -y install cmake
sudo apt -y install ninja
sudo apt -y install openjdk-8-jdk # 11 also works.
sudo apt -y install flex
sudo apt -y install bison # better 3.0.5
sudo apt -y install ncurses-dev
sudo apt -y install systemtap-sdt-dev
sudo apt -y install libelf-dev # if nlist.h is missing, this is the problem.
sudo apt -y install build-essential
```

Then,

```sh
docker compose up --build -d
```

If something goes wrong with cdef.h or whatever error that requires g++multilib or lib6,
Do not forget to run sudo apt -y update && sudo apt -y upgrade.
