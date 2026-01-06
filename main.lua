-- [[ ZENO HUB - PRO DARK EDITION ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🌪️ زينو هب | ZENO HUB",
   LoadingTitle = "جاري تحميل النظام الاحترافي...",
   LoadingSubtitle = "بواسطة زينو - ZENO",
   ConfigurationSaving = { Enabled = true, FolderName = "ZenoPro" },
   KeySystem = false,
   Theme = "Ocean" -- هذا يخلي اللون غامق وفخم زي اللي في الصورة
})

-- [[ القسم الرئيسي - Main ]] --
local MainTab = Window:CreateTab("🏠 الرئيسية", 4483362458)

MainTab:CreateSection("التحكم في اللاعب")

MainTab:CreateSlider({
   Name = "سرعة الجري",
   Range = {16, 400},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value end,
})

MainTab:CreateToggle({
   Name = "تفعيل الطيران",
   CurrentValue = false,
   Callback = function(Value)
       _G.Flying = Value
       local p = game.Players.LocalPlayer
       local char = p.Character
       local mouse = p:GetMouse()
       task.spawn(function()
           while _G.Flying do
               task.wait()
               if char:FindFirstChild("HumanoidRootPart") then
                   char.HumanoidRootPart.Velocity = mouse.Hit.lookVector * 100
               end
           end
       end)
   end,
})

-- [[ القسم البصري - Visuals ]] --
local VisualsTab = Window:CreateTab("👁️ بصريات", 4483362458)

VisualsTab:CreateToggle({
   Name = "كشف أماكن اللاعبين (ESP)",
   CurrentValue = false,
   Callback = function(state)
      for _, player in pairs(game.Players:GetPlayers()) do
         if player ~= game.Players.LocalPlayer and player.Character then
            if state then
               local hl = Instance.new("Highlight", player.Character)
               hl.Name = "ZenoESP"
               hl.FillColor = Color3.fromRGB(0, 255, 255)
            else
               if player.Character:FindFirstChild("ZenoESP") then player.Character.ZenoESP:Destroy() end
            end
         end
      end
   end,
})

-- [[ قسم الأدمن الداخلي - Admin ]] --
local AdminTab = Window:CreateTab("🛡️ الأدمن", 4483362458)

AdminTab:CreateButton({
   Name = "اختراق الجدران (Noclip)",
   Callback = function()
      game:GetService("RunService").Stepped:Connect(function()
         for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
         end
      end)
   end,
})

AdminTab:CreateButton({
   Name = "قفزة خارقة",
   Callback = function() game.Players.LocalPlayer.Character.Humanoid.JumpPower = 200 end,
})
