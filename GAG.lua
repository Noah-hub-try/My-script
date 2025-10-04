--// Grow a Garden Script (Non-Visual, Giftable)
--// Works with KRNL
--// Made by Noah_1230302

-- Settings
Giftable = true        -- can gift to players
NonVisual = true       -- no UI, background only
AutoFarm = true        -- toggle autofarm
TargetPlayer = "PlayerNameHere" -- put the exact username

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Function: Collect plants
function CollectPlants()
    for _, plant in pairs(workspace:GetDescendants()) do
        if plant:IsA("Part") and plant.Name == "Plant" then
            firetouchinterest(LocalPlayer.Character.HumanoidRootPart, plant, 0)
            wait(0.1)
            firetouchinterest(LocalPlayer.Character.HumanoidRootPart, plant, 1)
        end
    end
end

-- Function: Gift items to target player
function GiftItems()
    local target = Players:FindFirstChild(TargetPlayer)
    if target and target.Character then
        for _, item in pairs(LocalPlayer.Backpack:GetChildren()) do
            if item:IsA("Tool") then
                item.Parent = target.Backpack
            end
        end
    end
end

-- Main autofarm loop
spawn(function()
    while AutoFarm do
        pcall(function()
            CollectPlants()
            wait(2)
            if Giftable then
                GiftItems()
            end
        end)
        wait(1)
    end
end)

print("[Grow a Garden Script Loaded] Non-Visual Giftable Active!")
