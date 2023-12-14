#!/bin/bash

# INSTALAÇÃO DE PROGRAMAS UTILITÁRIOS

# atualizando lista de pacotes antes da instalação do programas
sudo nala update && sudo nala upgrade -y

# Baixa os arquivos .deb
echo "Baixando arquivos .deb..."
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.4.12/obsidian_1.4.12_amd64.deb
wget https://dl.discordapp.net/apps/linux/0.0.32/discord-0.0.32.deb
wget https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_118.0.2088.61-1_amd64.deb
wget https://az764295.vo.msecnd.net/stable/6509174151d557a81c9d0b5f8a5a1e9274db5585/code_1.82.1-1694163687_amd64.deb
wget https://github.com/notion-enhancer/notion-repackaged/releases/download/v2.0.18-1/notion-app_2.0.18-1_amd64.deb
wget https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb

# Instala os programas
for file in obsidian_1.4.12_amd64.deb discord-0.0.32.deb microsoft-edge-stable_118.0.2088.61-1_amd64.deb code_1.82.1-1694163687_amd64.deb notion-app_2.0.18-1_amd64.deb appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb; do
  echo "Instalando $file..."
  sudo nala install $file -y
done

# Tratamento de erros
if [ $? -ne 0 ]; then
  echo "Ocorreu um erro ao instalar um ou mais programas."
  exit 1
fi

# INSTALANDO SPOTIFY
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
echo "Instalando Spotify"
sudo nala update && sudo nala install spotify-client -y


# INSTALANDO BRAVE BROWSER
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo nala update
echo "Instalando Brave Browser"
sudo nala install brave-browser -y

#INSTALANDO LIBREOFFICE
sudo nala install libreoffice -y

sudo nala install libreoffice-l10n-pt-br -y

echo "Instalando LibreOffice"

echo "----------------------------------------------------"

echo "Todos os programas foram instalados com sucesso!"