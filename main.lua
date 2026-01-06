-- [[ ZENO HUB VIP - METRO LIFE RP ]] --
-- Stable English Version for Delta Executor

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("🌪️ ZENO HUB VIP", "Ocean")

-- [[ 📺 VIEW SECTION ]] --
local ViewTab = Window:NewTab("Display")
local ViewSection = ViewTab:NewSection("Camera Settings")

ViewSection:NewSlider("iPad View (FOV)", "Expand your screen view", 150, 70, function(s)
    workspace.CurrentCamera.FieldOfView = s
end)

-- [[ 🏙️ METRO LIFE SECTION ]] --
local CityTab = Window:NewTab("Metro City")
local CitySection = CityTab:NewSection("Steal & Access")

CitySection:NewButton("Auto Rob Safe", "TP to nearest safe and rob it", function()
    pcall(function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "Safe" or v.Name == "MoneySafe" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                break
            end
        end
    end)
end)

_G.Noclip = false
CitySection:NewToggle("Noclip (Walk Through Walls)", "Enter any locked house", function(state)
    _G.Noclip = state
end)

-- [[ ⚔️ COMBAT SECTION ]] --
local CombatTab = Window:NewTab("Combat")
local CombatSection = CombatTab:NewSection("Attack Features")

_G.KillAura = false
CombatSection:NewToggle("Kill/Fling Aura", "Fly away any nearby players", function(state)
    _G.KillAura = state
    task.spawn(function()
        while _G.KillAura do
            task.wait(0.1)
            pcall(function()
                local player = game.Players.LocalPlayer
                for _, target in pairs(game.Players:GetPlayers()) do
                    if target ~= player and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                        local dist = (player.Character.HumanoidRootPart.Position - target.Character.HumanoidRootPart.Position).Magnitude
                        if dist < 15 then
                            local velocity = Vector3.new(0, 1000, 0)
                            target.Character.HumanoidRootPart.Velocity = velocity
                        end
                    end
                end
            end)
        end
    end)
end)

-- [[ ⚡ PLAYER SECTION ]] --
local PlayerTab = Window:NewTab("Player")
local PlayerSection = PlayerTab:NewSection("Movement")

PlayerSection:NewSlider("WalkSpeed", "Increase your speed", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PlayerSection:NewSlider("JumpPower", "Jump higher", 500, 50, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

-- [[ SYSTEM SYNC ]] --
game:GetService("RunService").Stepped:Connect(function()
    pcall(function()
        if _G.Noclip and game.Players.LocalPlayer.Character then
            for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end
    end)
end)

print("ZENO HUB VIP: Loaded Successfully")
