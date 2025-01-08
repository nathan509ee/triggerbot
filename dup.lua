-- Acesse o jogador
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Defina a velocidade desejada
local speed = 100 -- Aumente esse número para mais velocidade

-- Aguarde o carregamento da parte do Humanoid
local humanoid = character:WaitForChild("Humanoid")

-- Modifique a velocidade
humanoid.WalkSpeed = speed
