# Fedora Docker Container for CUBRID Development

After following the instructions on

https://github.com/vimkim/dotfiles

```bash
cd $HOME
git clone https://github.com/vimkim/my-cubrid

sudo dnf install g++ # might install g++14.2
sudo dnf install gcc-13 g++-13 # this works.

nix profile install nixpkgs#gnum4

sudo dnf install ncurses-devel
sudo dnf install systemtap-devel
sudo dnf install perl-FindBin
sudo dnf install flex
sudo dnf install libstdc++-static

sudo dnf install glibc-locale-source # for iconv euckr
sudo localedef -f EUC-KR -i ko_KR /usr/lib/locale/ko_KR.euckr # does not work..
nix  profile install nixpkgs#iconv

asdf plugin add java

asdf install java openjdk-11

asdf global java openjdk-11
```