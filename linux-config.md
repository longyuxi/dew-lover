```
sudo visudo
$USER ALL=(ALL) NOPASSWD: ALL

sudo apt-get install openssh-server
sudo systemctl enable ssh --now

sudo update-alternatives --config editor



sudo apt install net-tools
ifconfig

sudo apt install zsh curl git vim
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Edit zsh theme to duellj


## Mambaforge

```
wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh
chmod +x Mambaforge-Linux-x86_64.sh
./Mambaforge-Linux-x86_64.sh
```

## GHC

```
sudo apt install build-essential curl libffi-dev libffi7 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```
