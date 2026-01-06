-- [[ ZENO HUB - SIMPLE BUTTONS EDITION ]] --
-- نسخة الأزرار المباشرة لضمان التشغيل في مترو لايف

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SpeedBtn = Instance.new("TextButton")
local FOVBtn = Instance.new("TextButton")
local NoclipBtn = Instance.new("TextButton")

-- إعدادات الواجهة
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "ZenoHub"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.1, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 150, 0, 200)
MainFrame.Active = true
MainFrame.Draggable = true -- تقدر تحرك القائمة في أي مكان

Title.Parent = MainFrame
Title.Text = "ZENO HUB"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)

-- 1. زر السرعة (Speed)
SpeedBtn.Parent = MainFrame
SpeedBtn.Text = "سرعة: مطفأة"
SpeedBtn.Position = UDim2.new(0.1, 0, 0.25, 0)
SpeedBtn.Size = UDim2.new(0.8, 0, 0, 35)
SpeedBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local speedOn = false
SpeedBtn.MouseButton1Click:Connect(function()
    speedOn = not speedOn
    if speedOn then
        SpeedBtn.Text = "سرعة: تعمل (100)"
        SpeedBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    else
        SpeedBtn.Text = "سرعة: مطفأة"
        SpeedBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)

-- 2. زر منظور الآيباد (iPad View)
FOVBtn.Parent = MainFrame
FOVBtn.Text = "منظور: عادي"
FOVBtn.Position = UDim2.new(0.1, 0, 0.5, 0)
FOVBtn.Size = UDim2.new(0.8, 0, 0, 35)
FOVBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FOVBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local fovOn = false
FOVBtn.MouseButton1Click:Connect(function()
    fovOn = not fovOn
    if fovOn then
        workspace.CurrentCamera.FieldOfView = 120
        FOVBtn.Text = "منظور: آيباد"
        FOVBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    else
        workspace.CurrentCamera.FieldOfView = 70
        FOVBtn.Text = "منظور: عادي"
        FOVBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end
end)

-- 3. زر اختراق الجدران (Noclip)
NoclipBtn.Parent = MainFrame
NoclipBtn.Text = "جدران: مقفولة"
NoclipBtn.Position = UDim2.new(0.1, 0, 0.75, 0)
NoclipBtn.Size = UDim2.new(0.8, 0, 0, 35)
NoclipBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
NoclipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local noclipOn = false
NoclipBtn.MouseButton1Click:Connect(function()
    noclipOn = not noclipOn
    if noclipOn then
        NoclipBtn.Text = "جدران: مفتوحة"
        NoclipBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    else
        NoclipBtn.Text = "جدران: مقفولة"
        NoclipBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end
end)

-- تشغيل المميزات في الخلفية
game:GetService("RunService").Stepped:Connect(function()
    if speedOn then
        pcall(function() game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100 end)
    end
    if noclipOn then
        pcall(function()
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end)
    end
end)
