local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🌪️ ZENO HUB VIP",
   LoadingTitle = "ZENO HUB IS LOADING...",
   LoadingSubtitle = "By Zeno",
   ConfigurationSaving = { Enabled = false },
   -- المفتاح ده عشان يظهر لك الزرار العائم اللي بيصغر ويفتح القائمة
   KeySystem = false, 
   KeySettings = {
      Title = "Zeno Hub",
      Subtitle = "Key System",
      Note = "No Key Needed",
      FileName = "ZenoKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"ZENO"}
   }
})

-- [[ 👤 PLAYER TAB ]] --
local PlayerTab = Window:CreateTab("👤 Player", 4483362458)

PlayerTab:CreateSlider({
   Name = "WalkSpeed (Speed)",
   Range = {16, 500},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

PlayerTab:CreateSlider({
   Name = "JumpPower",
   Range = {50, 500},
   Increment = 1,
   Suffix = "Power",
   CurrentValue = 50,
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

-- [[ 🏙️ METRO LIFE ]] --
local CityTab = Window:CreateTab("🏙️ Metro City", 4483362458)

CityTab:CreateButton({
   Name = "Auto Rob All Safes (TP)",
   Callback = function()
       for _, v in pairs(workspace:GetDescendants()) do
           if v.Name == "Safe" or v.Name == "MoneySafe" then
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
               task.wait(0.5)
           end
       end
   end,
})

_G.Noclip = false
CityTab:CreateToggle({
   Name = "Noclip (Walk Through Walls)",
   CurrentValue = false,
   Callback = function(Value) _G.Noclip = Value end,
})

-- [[ ⚔️ COMBAT VIP ]] --
local CombatTab = Window:CreateTab("⚔️ Combat", 4483362458)

_G.Fling = false
CombatTab:CreateToggle({
   Name = "Super Fling Aura (Kill Players)",
   CurrentValue = false,
   Callback = function(Value) _G.Fling = Value end,
})

-- [[ 📺 VISUALS ]] --
local ViewTab = Window:CreateTab("📺 Visuals", 4483362458)

ViewTab:CreateSlider({
   Name = "iPad View (FOV)",
   Range = {70, 150},
   Increment = 1,
   CurrentValue = 70,
   Callback = function(Value)
      workspace.CurrentCamera.FieldOfView = Value
   end,
})

-- [[ ننهي نظام التثبيت الخلفي ]] --
task.spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            if _G.Noclip and game.Players.LocalPlayer.Character then
                for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
            if _G.Fling then
                for _, p in pairs(game.Players:GetPlayers()) do
                    if p ~= game.Players.LocalPlayer and p.Character then
                        local d = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude
                        if d < 20 then
                            p.Character.HumanoidRootPart.Velocity = Vector3.new(500000, 500000, 500000)
                        end
                    end
                end
            end
        end)
    end)
end)

Rayfield:Notify({Title = "ZENO HUB", Content = "Script Loaded! Use the Button to Minimize", Duration = 5})
