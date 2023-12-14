#!/bin/bash

# INSTALAÇÃO DE FERRAMENTAS DE CUSTOMIZAÇÃO E CONFIGURAÇÃO DO SISTEMA

# Instala o gerenciador de pacotes nala
echo "deb [arch=amd64,arm64,armhf] http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
sudo apt update

sudo apt install nala -y

sudo nala upgrade -y

# INSTALANDO KONSAVE
# Verifica se o pip está instalado
if ! command -v pip &> /dev/null; then
  echo "O pip não está instalado. Instalando o pip..."
  sudo nala install python3-pip -y
fi

# Verifica se o python3 está instalado
if ! command -v python3 &> /dev/null; then
  echo "O python3 não está instalado. Instalando o python3..."
  sudo nala install python3
fi

# Instala o konsave
echo "Instalando o konsave..."
python3 -m pip install konsave

# Tratamento de erros
if [ $? -ne 0 ]; then
  echo "Ocorreu um erro ao instalar o konsave."
  exit 1
fi

echo "Konsave instalado com sucesso!"

# ----------------------------------------------------------
# INSTALANDO LIGHTLY

# Instalar dependências
sudo nala install cmake build-essential libkf5config-dev libkdecorations2-dev libqt5x11extras5-dev qtdeclarative5-dev extra-cmake-modules libkf5guiaddons-dev libkf5configwidgets-dev libkf5windowsystem-dev libkf5coreaddons-dev libkf5iconthemes-dev gettext qt3d5-dev -y

# Clonar o repositório
git clone --single-branch --depth=1 https://github.com/Luwx/Lightly.git

# Navegar para o diretório clonado e criar um diretório de construção
cd Lightly && mkdir build && cd build

# Configurar o projeto
cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_TESTING=OFF ..

# Construir o projeto
make

# Instalar o projeto
sudo make install

echo "Lightly instalado com sucesso!"

# ----------------------------------------------------------
# INSTALANDO BISMUTH - TILING

sudo nala install kwin-bismuth -y

echo "BISMUTH - TILING instalado com sucesso!"

# ----------------------------------------------------------
# INSTALANDO REMAPPER

# Instalar dependências
sudo nala install git python3-setuptools gettext -y

# Clonar o repositório
git clone https://github.com/sezanzeb/input-remapper.git

# Navegar para o diretório clonado e executar o script de construção
cd input-remapper && ./scripts/build.sh

# Instalar o pacote .deb
sudo nala install -f ./dist/input-remapper-2.0.1.deb -y

echo "REMAPPER instalado com sucesso!"

# ----------------------------------------------------------
# INSTALANDO ZSH

sudo nala install zsh -y

# Instalar o complemento Oh-My-ZSH
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# define o zsh como shell padrão
chsh -s $(which zsh)

# entrar no shell do zsh
zsh

# ZSH Highlight
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# ZSH Suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# adiciona os plugins no arquivo ~/.zshrc
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc

# recarrega o arquivo ~/.zshrc
source ~/.zshrc

echo "ZSH instalado com sucesso!"