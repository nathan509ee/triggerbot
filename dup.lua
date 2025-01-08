-- Obtém o jogador
local player = game.Players.LocalPlayer

-- A função para prevenir a morte
local function preventDeath(character)
    -- Aguardar até que o personagem seja carregado
    if character == nil then return end

    -- Desativar os danos que poderiam matar o personagem
    local humanoide = character:WaitForChild("Humanoid")
    
    -- Previne a morte do personagem
    humanoide.Died:Connect(function()
        humanoide.Health = humanoide.MaxHealth -- Sempre mantém o personagem com a vida cheia
    end)
    
    -- Previne qualquer dano ao personagem
    humanoide.HealthChanged:Connect(function()
        if humanoide.Health < humanoide.MaxHealth then
            humanoide.Health = humanoide.MaxHealth -- Restaura a saúde automaticamente
        end
    end)
end

-- Quando o personagem do jogador for carregado, aplicamos a prevenção
player.CharacterAdded:Connect(preventDeath)
