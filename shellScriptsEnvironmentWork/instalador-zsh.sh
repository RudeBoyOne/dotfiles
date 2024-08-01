#!/bin/sh

# INSTALANDOR ZSH

sudo nala install zsh -y

# Instalar o complemento Oh-My-ZSH
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# define o zsh como shell padrão
chsh -s $(which zsh)

# ZSH Highlight
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# ZSH Suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# adiciona os plugins no arquivo ~/.zshrc
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc

# recarrega o arquivo ~/.zshrc
source ~/.zshrc

echo "ZSH instalado com sucesso!"
