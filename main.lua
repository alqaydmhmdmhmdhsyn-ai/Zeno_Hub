-- تأكد إنك ماسح كل الكود القديم وحاطط ده مكانه بالظبط
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🌪️ زينو هب | ZENO HUB VIP",
   LoadingTitle = "جاري الاختراق.. ماب مترو لايف",
   LoadingSubtitle = "بواسطة ZENO",
   ConfigurationSaving = { Enabled = false }, -- قفلناها مؤقتاً عشان نضمن التشغيل
   KeySystem = false,
   Theme = "Ocean"
})

-- [[ 📺 منظور الآيباد - شغال لكل المابات ]] --
local MainTab = Window:CreateTab("📺 العرض", 4483362458)
_G.FOV = 70
MainTab:CreateSlider({
   Name = "منظور الآيباد (iPad View)",
   Range = {70, 150},
   Increment = 1,
   CurrentValue = 70,
   Callback = function(v) _G.FOV = v end,
})

-- [[ 🏙️ ميزات مترو لايف VIP ]] --
local MetroTab = Window:CreateTab("🏙️ مترو لايف", 4483362458)

_G.Noclip = false
MetroTab:CreateToggle({
   Name = "اختراق الجدران والبيوت",
   CurrentValue = false,
   Callback = function(v) _G.Noclip = v end,
})

MetroTab:CreateButton({
   Name = "سرقة خزنة البيت (Safe)",
   Callback = function()
       pcall(function()
           for _, v in pairs(workspace:GetDescendants()) do
               if v.Name == "Safe" or v.Name == "MoneySafe" then
                   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
               end
           end
       end)
   end,
})

-- [[ ⚡ السرعة (نظام الثبات) ]] --
local SpeedTab = Window:CreateTab("⚡ السرعة", 4483362458)
_G.Speed = 16
SpeedTab:CreateSlider({
   Name = "سرعة الجري",
   Range = {16, 300},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(v) _G.Speed = v end,
})

-- [[ ⚙️ محرك التشغيل (القلب النابض) ]] --
task.spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function()
            local char = game.Players.LocalPlayer.Character
            if char then
                -- تشغيل السرعة
                char.Humanoid.WalkSpeed = _G.Speed
                -- تشغيل المنظور
                workspace.CurrentCamera.FieldOfView = _G.FOV
                -- تشغيل النوكليب
                if _G.Noclip then
                    for _, part in pairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then part.CanCollide = false end
                    end
                end
            end
        end)
    end)
end)
