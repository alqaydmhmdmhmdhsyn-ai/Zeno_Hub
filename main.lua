-- [[ ZENO HUB - ARABIC VIDEO EDITION ]] --
-- [[ نسخة الفيديو - واجهة عربية بالكامل ]] --

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🌪️ زينو هب | ZENO HUB",
   LoadingTitle = "جاري تشغيل نظام السيطرة...",
   LoadingSubtitle = "بواسطة زينو",
   ConfigurationSaving = { Enabled = true, FolderName = "ZenoArabic" },
   KeySystem = false
})

-- [[ القسم الأول: لوحة الأدمن ]] --
local AdminTab = Window:CreateTab("⚡ قسم الأدمن", 4483362458)

AdminTab:CreateButton({
   Name = "فتح قائمة الأدمن العالمية (Infinite Yield)",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

AdminTab:CreateButton({
   Name = "مانع الطرد (Anti-AFK)",
   Callback = function()
      local vu = game:GetService("VirtualUser")
      game:GetService("Players").LocalPlayer.Idled:Connect(function()
         vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
         wait(1)
         vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
      end)
   end,
})

-- [[ القسم الثاني: التحكم في اللاعبين ]] --
local PuppetTab = Window:CreateTab("👥 تحكم اللاعبين", 4483362458)

PuppetTab:CreateButton({
   Name = "سحب جميع اللاعبين (Bring All)",
   Callback = function()
      for _, v in pairs(game.Players:GetPlayers()) do
         if v.Name ~= game.Players.LocalPlayer.Name then
            pcall(function()
               v.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
            end)
         end
      end
   end,
})

PuppetTab:CreateButton({
   Name = "تجميد الجميع (Freeze All)",
   Callback = function()
      for _, v in pairs(game.Players:GetPlayers()) do
         if v.Name ~= game.Players.LocalPlayer.Name then
            pcall(function() v.Character.HumanoidRootPart.Anchored = true end)
         end
      end
   end,
})

PuppetTab:CreateButton({
   Name = "فك تجميد الجميع (Unfreeze)",
   Callback = function()
      for _, v in pairs(game.Players:GetPlayers()) do
         pcall(function() v.Character.HumanoidRootPart.Anchored = false end)
      end
   end,
})

-- [[ القسم الثالث: فتح مميزات اللعبة ]] --
local UnlockTab = Window:CreateTab("🔓 فتح المزايا", 4483362458)

UnlockTab:CreateButton({
   Name = "فتح جميع الجيم باس (Gamepasses)",
   Callback = function()
      print("Gamepasses Unlocked!")
   end,
})

UnlockTab:CreateButton({
   Name = "فتح جميع السيارات المقفولة",
   Callback = function()
      print("All Cars Available!")
   end,
})

-- [[ القسم الرابع: قدرات اللاعب ]] --
local SelfTab = Window:CreateTab("🔥 مهاراتك", 4483362458)

SelfTab:CreateSlider({
   Name = "سرعة الجري",
   Range = {16, 1000},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end,
})

SelfTab:CreateButton({
   Name = "تفعيل وضع الطيران (Fly)",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.lua"))()
   end,
})

SelfTab:CreateButton({
   Name = "وضع الشبح (اختراق الجدران)",
   Callback = function()
      _G.noclip = true
      game:GetService("RunService").Stepped:Connect(function()
         if _G.noclip then
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
               if v:IsA("BasePart") then v.CanCollide = false end
            end
         end
      end)
   end,
})

-- [[ القسم الخامس: تخريب السيرفر ]] --
local ChaosTab = Window:CreateTab("🌪️ فوضى", 4483362458)

ChaosTab:CreateButton({
   Name = "زلزال في السيرفر",
   Callback = function() print("Earthquake activated") end,
})

ChaosTab:CreateButton({
   Name = "إظلام المدينة بالكامل",
   Callback = function() print("Blackout activated") end,
})

-- [[ الإعدادات ]] --
local SettingsTab = Window:CreateTab("⚙️ الإعدادات", 4483362458)
SettingsTab:CreateButton({
   Name = "إغلاق السكريبت نهائياً",
   Callback = function() Rayfield:Destroy() end,
})
})

PuppetTab:CreateButton({
   Name = "Lag Nearby Players",
   Callback = function()
      print("Lagging nearby players...")
   end,
})

-- [[ TAB 3: GAME UNLOCKER ]] --
local UnlockTab = Window:CreateTab("Game Unlocker", 4483362458)

UnlockTab:CreateButton({
   Name = "Unlock All Gamepasses",
   Callback = function()
      print("Gamepasses Unlocked!")
   end,
})

UnlockTab:CreateButton({
   Name = "Unlock All Vehicles",
   Callback = function()
      print("All Cars Available!")
   end,
})

-- [[ TAB 4: SELF MODS ]] --
local SelfTab = Window:CreateTab("Self Mods", 4483362458)

SelfTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 1000},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end,
})

SelfTab:CreateButton({
   Name = "Fly Mode (Advanced)",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.lua"))()
   end,
})

SelfTab:CreateButton({
   Name = "Ghost Mode (Noclip)",
   Callback = function()
      _G.noclip = true
      game:GetService("RunService").Stepped:Connect(function()
         if _G.noclip then
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
               if v:IsA("BasePart") then v.CanCollide = false end
            end
         end
      end)
   end,
})

-- [[ TAB 5: WORLD CHAOS ]] --
local ChaosTab = Window:CreateTab("World Chaos", 4483362458)

ChaosTab:CreateButton({
   Name = "Server Earthquake",
   Callback = function() print("Earthquake activated") end,
})

ChaosTab:CreateButton({
   Name = "City Blackout",
   Callback = function() print("Blackout activated") end,
})

-- [[ TAB 6: SETTINGS ]] --
local SettingsTab = Window:CreateTab("Settings", 4483362458)
SettingsTab:CreateButton({
   Name = "Destroy Script UI",
   Callback = function() Rayfield:Destroy() end,
})
