-- Obtém o jogador
local player = game.Players.LocalPlayer

-- Função para prevenir a perda de vida
local function preventHealthLoss(character)
    -- Aguardar até que o personagem seja carregado
    if character == nil then return end

    -- Desativar os danos que poderiam diminuir a vida do personagem
    local humanoide = character:WaitForChild("Humanoid")

    -- Previne que a saúde diminua
    humanoide.HealthChanged:Connect(function(health)
        if humanoide.Health < humanoide.MaxHealth then
            humanoide.Health = humanoide.MaxHealth -- Restaura a saúde automaticamente para o máximo
        end
    end)
end

-- Quando o personagem do jogador for carregado, aplicamos a prevenção
player.CharacterAdded:Connect(preventHealthLoss)
