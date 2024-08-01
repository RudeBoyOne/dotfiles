#!/bin/sh

# Atualiza os repositórios em segundo plano
yay -Sy

# Espera um pouco para garantir que a atualização dos repositórios tenha concluído
sleep 5

# Verifica as atualizações disponíveis usando yay
echo "Verificando atualizações disponíveis..."
updates=$(yay -Qu | wc -l)

if [ $updates -gt 0 ]; then
    echo "Atualizações disponíveis: $updates"
    echo "Listando pacotes desatualizados:"
    yay -Qu

    # Confirma se o usuário deseja iniciar a atualização
    if gum confirm "VOCÊ DESEJA INICIAR A ATUALIZAÇÃO AGORA?"; then
        echo
        echo ":: Atualização iniciada."
        yay -Syu
    elif [ $? -eq 130 ]; then
        exit 130
    else
        echo
        echo ":: Atualização cancelada."
        exit
    fi
else
    echo 
    echo ":: Nenhuma atualização disponível."
    sleep 3
fi