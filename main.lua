-- [[ ZENO HUB - THE ULTIMATE UNIVERSAL SCRIPT ]] --
-- النسخة النهائية لزينو: منظور آيباد + تجميع + سيطرة + حماية
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🌪️ زينو هب | ZENO HUB VIP",
   LoadingTitle = "جاري تفعيل أقوى نظام سيطرة وحماية...",
   LoadingSubtitle = "بواسطة زينو - ZENO",
   ConfigurationSaving = { Enabled = true, FolderName = "ZenoFinalAll" },
   KeySystem = false, 
   Theme = "Ocean",
   ImageId = 1000103770 
})

-- [[ 📺 قائمة العرض والمنظور (iPad View) ]] --
local ViewTab = Window:CreateTab("📺 المنظور والعرض", 4483362458)

ViewTab:CreateSection("إعدادات منظور الآيباد (iPad View)")

_G.FieldOfView = 70
ViewTab:CreateSlider({
   Name = "توسيع الشاشة (منظور الآيباد)",
   Range = {70, 150},
   Increment = 1,
   CurrentValue = 70,
   Callback = function(Value)
      _G.FieldOfView = Value
   end,
})

-- كود تثبيت المنظور في كل المابات
task.spawn(function()
    while true do
        task.wait(0.1)
        pcall(function()
            workspace.CurrentCamera.FieldOfView = _G.FieldOfView
        end)
    end
end)

-- [[ 🏙️ قائمة السيطرة والمترو (Metro Life) ]] --
local ControlTab = Window:CreateTab("👤 السيطرة والمدن", 4483362458)

ControlTab:CreateSection("اختراق البيوت والسرقة")

_G.HouseNoclip = false
ControlTab:CreateToggle({
   Name = "اختراق جدران البيوت (Noclip Houses)",
   CurrentValue = false,
   Callback = function(v) _G.HouseNoclip = v end,
})

ControlTab:CreateButton({
   Name = "سرقة الخزنات تلقائياً (Auto Rob Safe)",
   Callback = function()
       pcall(function()
           for _, v in pairs(workspace:GetDescendants()) do
               if v.Name == "Safe" or v.Name == "MoneySafe" then
                   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                   if v:FindFirstChild("ClickDetector") then fireclickdetector(v.ClickDetector) end
               end
           end
       end)
   end,
})

ControlTab:CreateSection("التحكم في اللاعبين")

local SelectedPlayer = ""
local PlayerList = {}
for _, v in pairs(game.Players:GetPlayers()) do table.insert(PlayerList, v.Name) end

local PlayerDropdown = ControlTab:CreateDropdown({
   Name = "اختر لاعب من السيرفر",
   Options = PlayerList,
   CurrentOption = "",
   Callback = function(Option) SelectedPlayer = Option end,
})

ControlTab:CreateButton({
   Name = "نسخ ملابس اللاعب (Copy Outfit)",
   Callback = function()
       local target = game.Players:FindFirstChild(SelectedPlayer)
       if target and target.Character then
           pcall(function()
               for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                   if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") then v:Destroy() end
               end
               for _, v in pairs(target.Character:GetChildren()) do
                   if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") then
                       v:Clone().Parent = game.Players.LocalPlayer.Character
                   end
               end
           end)
       end
   end,
})

-- [[ 💰 قائمة السرقة (Brainrot Steal) ]] --
local StealTab = Window:CreateTab("💰 هكر السرقة", 4483362458)

_G.AutoFarm = false
StealTab:CreateToggle({
   Name = "تجميع الفلوس/البرين (Auto Farm)",
   CurrentValue = false,
   Callback = function(v) _G.AutoFarm = v end,
})

task.spawn(function()
    while true do
        task.wait(0.4)
        if _G.AutoFarm then
            pcall(function()
                for _, obj in pairs(workspace:GetDescendants()) do
                    if (obj.Name == "Brain" or obj.Name == "Money") and obj:IsA("BasePart") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = obj.CFrame
                        task.wait(0.1)
                    end
                end
            end)
        end
    end
end)

-- [[ ⚡ قسم السرعة (Speed Hub Style) ]] --
local SpeedTab = Window:CreateTab("⚡ السرعة والحركة", 4483362458)

_G.SpeedEnabled = false
_G.WalkSpeedValue = 16

SpeedTab:CreateToggle({
   Name = "تفعيل السرعة القوية",
   CurrentValue = false,
   Callback = function(v) _G.SpeedEnabled = v end,
})

SpeedTab:CreateSlider({
   Name = "تحديد سرعة الجري",
   Range = {16, 500},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(v) _G.WalkSpeedValue = v end,
})

-- [[ ⚙️ محرك التشغيل المستمر (تثبيت المميزات) ]] --
game:GetService("RunService").Stepped:Connect(function()
    pcall(function()
        local char = game.Players.LocalPlayer.Character
        -- تثبيت النوكليب
        if _G.HouseNoclip and char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end
        -- تثبيت السرعة عند الحركة فقط
        if _G.SpeedEnabled and char and char:FindFirstChild("Humanoid") then
            local hum = char.Humanoid
            hum.WalkSpeed = hum.MoveDirection.Magnitude > 0 and _G.WalkSpeedValue or 16
        end
    end)
end)

-- تحديث قائمة اللاعبين تلقائياً
task.spawn(function()
    while true do
        task.wait(10)
        local newList = {}
        for _, v in pairs(game.Players:GetPlayers()) do table.insert(newList, v.Name) end
        PlayerDropdown:Refresh(newList)
    end
end)
