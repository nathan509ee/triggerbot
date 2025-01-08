-- Script para alterar a moeda do servidor para 10000

-- Função para encontrar e alterar a moeda
local function alterarMoedaPara10k()
    -- Verifica se o jogo possui uma moeda chamada "Coins"
    local moeda = game:GetService("DataStoreService"):GetDataStore("PlayerDataStore")

    -- Loop para verificar todas as moedas em jogadores
    for _, jogador in ipairs(game.Players:GetPlayers()) do
        -- Verifica se a chave de moeda existe para o jogador
        local sucesso, valorAtual = pcall(function()
            return moeda:GetAsync(jogador.UserId)
        end)

        -- Caso a moeda seja encontrada, altera o valor para 10000
        if sucesso then
            if valorAtual then
                -- Atualiza a moeda do jogador para 10000
                local sucessoAlteracao, erro = pcall(function()
                    moeda:SetAsync(jogador.UserId, 10000)
                end)

                if sucessoAlteracao then
                    print("Moeda de " .. jogador.Name .. " alterada para 10000.")
                else
                    warn("Erro ao alterar a moeda de " .. jogador.Name .. ": " .. erro)
                end
            else
                warn("Nenhuma moeda encontrada para o jogador " .. jogador.Name)
            end
        else
            warn("Erro ao obter dados do jogador " .. jogador.Name .. ": " .. valorAtual)
        end
    end
end

-- Chama a função para alterar a moeda
alterarMoedaPara10k()
