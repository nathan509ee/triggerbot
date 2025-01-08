-- Obter o jogador
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Função para permitir atravessar paredes
local function atravessarParedes()
    -- Definir uma distância de proximidade da parede
    local distanciaMaxima = 5
    
    -- Loop para verificar colisões constantemente
    while true do
        wait(0.1) -- Espera um pouco para não travar o jogo
        local posicao = character.HumanoidRootPart.Position
        local raio = 5 -- Raio para verificar as paredes ao redor

        -- Encontrar todos os objetos ao redor usando um raio
        local partes = workspace:FindPartsInRegion3(workspace.CurrentCamera.CFrame:PointToWorldSpace(posicao), Vector3.new(raio, raio, raio), nil)

        -- Checar se há colisões com as paredes
        for _, parte in ipairs(partes) do
            -- Se a parte for uma parede ou objeto sólido
            if parte and parte:IsA("BasePart") then
                -- Desabilitar a colisão com a parte
                parte.CanCollide = false
            end
        end
    end
end

-- Iniciar a função para atravessar paredes
atravessarParedes()
