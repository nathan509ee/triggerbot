local args = {
    [1] = "HUD",
    [2] = "Inventory",
    [3] = "Drop",
    [4] = "Prancha de Madeira",
    [5] = 100
}

game:GetService("ReplicatedStorage").Remotes.Sync:InvokeServer(unpack(args))
