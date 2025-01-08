-- Referências
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local camera = workspace.CurrentCamera

-- Variáveis de configuração
local crosshair = script.Parent -- A mira (GUI)
local defaultPosition = crosshair.Position -- Posição inicial da mira

-- Função para garantir que a mira não suba
local function estabilizarMira()
    -- Sempre reseta a posição da mira para o valor original
    crosshair.Position = defaultPosition
end

-- Evento de disparo (aqui você deve personalizar conforme a mecânica de armas)
local function onShoot()
    -- Chama a função para estabilizar a mira sempre que atirar
    estabilizarMira()
end

-- Conectar a função de disparo ao evento de tiro (exemplo genérico)
-- Aqui você deve conectar com seu sistema de disparo, exemplo:
player.Character:WaitForChild("Humanoid").Died:Connect(function()
    -- Aqui você pode resetar a mira se necessário
    crosshair.Position = defaultPosition
end)

-- Caso você queira conectar a algo específico no disparo, você pode
-- Adicionar um evento para quando a arma for disparada. Exemplo de conexão:
game:GetService("ReplicatedStorage").OnShootEvent.OnClientEvent:Connect(onShoot)

-- Ou se você tem uma função customizada de disparo no seu jogo, é só chamar onShoot() dentro dela
