-- [[ ZENO HUB - ARABIC EDITION ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🌪️ زينو هب | ZENO HUB",
   LoadingTitle = "جاري التشغيل...",
   LoadingSubtitle = "بواسطة زينو",
   ConfigurationSaving = { Enabled = true, FolderName = "ZenoArabic" },
   KeySystem = false
})

local AdminTab = Window:CreateTab("⚡ قسم الأدمن", 4483362458)
AdminTab:CreateButton({
   Name = "فتح قائمة الأدمن (Infinite Yield)",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local PuppetTab = Window:CreateTab("👥 تحكم اللاعبين", 4483362458)
PuppetTab:CreateButton({
   Name = "سحب الجميع (Bring All)",
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

local SelfTab = Window:CreateTab("🔥 مهاراتك", 4483362458)
SelfTab:CreateSlider({
   Name = "سرعة الجري",
   Range = {16, 500},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end,
})

SelfTab:CreateButton({
   Name = "طيران (Fly)",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.lua"))()
   end,
})

local CreditsTab = Window:CreateTab("📜 معلومات", 4483362458)
CreditsTab:CreateParagraph({Title = "صنع بواسطة:", Content = "ZENO - زينو"})
