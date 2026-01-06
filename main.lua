-- [[ ZENO HUB VIP - HIGH PERFORMANCE EDITION ]] --
-- New Venyx Library: Better Look, More Power, No Lag

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/Venyx-UI-Library/main/source.lua"))()
local Venyx = Library.new("🌪️ ZENO HUB VIP", 5013109572)

-- [[ THEMES ]] --
local themes = {
    Background = Color3.fromRGB(24, 24, 24),
    Accent = Color3.fromRGB(255, 0, 0), -- Red Theme for Power
    Section = Color3.fromRGB(33, 33, 33),
    Text = Color3.fromRGB(255, 255, 255)
}

-- [[ TABS ]] --
local MainTab = Venyx:addPage("Main Controls", 5012544693)
local CombatTab = Venyx:addPage("Combat VIP", 5012544693)
local VisualsTab = Venyx:addPage("Visuals", 5012544693)

-- [[ MAIN CONTROLS ]] --
local MainSection = MainTab:addSection("Movement")
MainSection:addSlider("Super Speed", 16, 16, 500, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)

MainSection:addSlider("Super Jump", 50, 50, 500, function(v)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end)

local MetroSection = MainTab:addSection("Metro Life Exploits")
MetroSection:addButton("Rob All Safes (Teleport)", function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v.Name == "Safe" or v.Name == "MoneySafe" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            wait(0.3)
        end
    end
end)

-- [[ COMBAT VIP (THE POWER) ]] --
local KillSection = CombatTab:addSection("Kill Features")
_G.FlingAll = false
KillSection:addToggle("Super Fling Aura (Kill All)", false, function(v)
    _G.FlingAll = v
end)

_G.Invis = false
KillSection:addToggle("Ghost Mode (Invisible)", false, function(v)
    _G.Invis = v
    if v then
        game.Players.LocalPlayer.Character.LowerTorso:Destroy() -- Glitch to go invisible
    end
end)

-- [[ VISUALS ]] --
local CameraSection = VisualsTab:addSection("Camera Settings")
CameraSection:addSlider("iPad View FOV", 70, 70, 150, function(v)
    workspace.CurrentCamera.FieldOfView = v
end)

-- [[ LOGIC ]] --
game:GetService("RunService").Stepped:Connect(function()
    if _G.FlingAll then
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= game.Players.LocalPlayer and p.Character then
                local d = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude
                if d < 25 then
                    p.Character.HumanoidRootPart.Velocity = Vector3.new(999999, 999999, 999999)
                end
            end
        end
    end
end)

Venyx:SelectPage(MainTab, true)
