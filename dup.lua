-- Script para duplicar um item em Roblox

-- Referência ao item que será duplicado
local itemOriginal = script.Parent -- Assumindo que o script está dentro do item que será duplicado

-- Função para duplicar o item
local function duplicarItem()
    -- Cria uma cópia do item original
    local itemDuplicado = itemOriginal:Clone()
    
    -- Define a posição do item duplicado (aqui está sendo colocado levemente ao lado do original)
    itemDuplicado.Position = itemOriginal.Position + Vector3.new(5, 0, 0)
    
    -- Define o item duplicado como um filho do Workspace (ou onde preferir)
    itemDuplicado.Parent = game.Workspace
end

-- Detecta quando o jogador clica no item
itemOriginal.Touched:Connect(function(hit)
    -- Verifica se o jogador tocou no item (pode ser ajustado dependendo do seu uso)
    local player = game:GetService("Players"):GetPlayerFromCharacter(hit.Parent)
    if player then
        -- Chama a função de duplicação
        duplicarItem()
    end
end)
