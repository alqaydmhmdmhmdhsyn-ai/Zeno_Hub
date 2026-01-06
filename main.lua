-- [[ ZENO HUB - ARABIC ULTIMATE ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🌪️ زينو هب | ZENO HUB",
   LoadingTitle = "جاري تفعيل المميزات...",
   LoadingSubtitle = "بواسطة زينو - ZENO",
   ConfigurationSaving = { Enabled = true, FolderName = "ZenoHub" },
   KeySystem = false
})

-- [[ قائمة اللاعب ]] --
local PlayerTab = Window:CreateTab("🏃 قائمة اللاعب", 4483362458)

PlayerTab:CreateSlider({
   Name = "سرعة الجري (Speed)",
   Range = {16, 500},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

PlayerTab:CreateSlider({
   Name = "قوة القفز (Jump)",
   Range = {50, 500},
   Increment = 1,
   CurrentValue = 50,
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

PlayerTab:CreateToggle({
   Name = "طيران (Fly)",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
          _G.Flying = true
          local p = game.Players.LocalPlayer
          local char = p.Character
          local mouse = p:GetMouse()
          while _G.Flying do
              task.wait()
              if char:FindFirstChild("HumanoidRootPart") then
                  char.HumanoidRootPart.Velocity = mouse.Hit.lookVector * 100
              end
          end
      else
          _G.Flying = false
      end
   end,
})

-- [[ قائمة كشف الأماكن ]] --
local ESPTab = Window:CreateTab("👁️ كشف الأماكن (ESP)", 4483362458)

ESPTab:CreateToggle({
   Name = "تفعيل كشف اللاعبين (Boxes)",
   CurrentValue = false,
   Callback = function(state)
      _G.ESP_Enabled = state
      for _, player in pairs(game.Players:GetPlayers()) do
         if player ~= game.Players.LocalPlayer and player.Character then
            if state then
               local highlight = Instance.new("Highlight", player.Character)
               highlight.Name = "ZenoESP"
               highlight.FillColor = Color3.fromRGB(255, 0, 0)
            else
               if player.Character:FindFirstChild("ZenoESP") then
                  player.Character.ZenoESP:Destroy()
               end
            end
         end
      end
   end,
})

-- [[ قائمة الأدمن الداخلية ]] --
local AdminTab = Window:CreateTab("🛡️ أدمن داخلي", 4483362458)

AdminTab:CreateButton({
   Name = "درع الحماية (God Mode)",
   Callback = function()
      game.Players.LocalPlayer.Character.Humanoid.MaxHealth = math.huge
      game.Players.LocalPlayer.Character.Humanoid.Health = math.huge
   end,
})

AdminTab:CreateButton({
   Name = "تدمير الجاذبية (No Gravity)",
   Callback = function()
      game.Workspace.Gravity = 0
   end,
})

AdminTab:CreateButton({
   Name = "إعادة الجاذبية (Reset Gravity)",
   Callback = function()
      game.Workspace.Gravity = 196.2
   end,
})

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

local CreditsTab = Window:CreateTab("📜 حقوق", 4483362458)
CreditsTab:CreateParagraph({Title = "ZENO HUB", Content = "هذا السكريبت صنع خصيصاً لزينو - استمتع بالتصوير!"})
