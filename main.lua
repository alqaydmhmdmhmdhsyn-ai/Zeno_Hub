-- [[ ZENO HUB - GHOST STEAL EDITION ]] --
-- نسخة الاختفاء والسرقة الاحترافية

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local GhostBtn = Instance.new("TextButton")
local FarmBtn = Instance.new("TextButton")
local FOVBtn = Instance.new("TextButton")

-- إعدادات الواجهة
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "ZenoGhostHub"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(150, 0, 255) -- لون بنفسجي شبحي
MainFrame.Position = UDim2.new(0.05, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 160, 0, 220)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Parent = MainFrame
Title.Text = "ZENO GHOST VIP"
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(80, 0, 150)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16

-- 1. زر وضع الشبح (Invisibility/Ghost)
GhostBtn.Parent = MainFrame
GhostBtn.Text = "وضع الشبح: OFF"
GhostBtn.Position = UDim2.new(0.1, 0, 0.25, 0)
GhostBtn.Size = UDim2.new(0.8, 0, 0, 40)
GhostBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
GhostBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local ghostOn = false
GhostBtn.MouseButton1Click:Connect(function()
    ghostOn = not ghostOn
    local char = game.Players.LocalPlayer.Character
    if ghostOn then
        GhostBtn.Text = "وضع الشبح: ON"
        GhostBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
        -- كود الاختفاء (يجعل جسمك شفاف جداً ويخفي اسمك من فوق رأسك)
        pcall(function()
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("Decal") then
                    part.Transparency = 0.8 -- شفافية عالية
                end
            end
            if char:FindFirstChild("Head") and char.Head:FindFirstChild("NameTag") then
                char.Head.NameTag.Enabled = false
            end
        end)
    else
        GhostBtn.Text = "وضع الشبح: OFF"
        GhostBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        -- إرجاع الشكل الطبيعي
        pcall(function()
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("Decal") then
                    part.Transparency = 0
                end
            end
        end)
    end
end)

-- 2. زر التجميع التلقائي (Auto Farm)
FarmBtn.Parent = MainFrame
FarmBtn.Text = "تجميع: OFF"
FarmBtn.Position = UDim2.new(0.1, 0, 0.5, 0)
FarmBtn.Size = UDim2.new(0.8, 0, 0, 40)
FarmBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
FarmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local farmOn = false
FarmBtn.MouseButton1Click:Connect(function()
    farmOn = not farmOn
    FarmBtn.Text = farmOn and "تجميع: ON" or "تجميع: OFF"
    FarmBtn.BackgroundColor3 = farmOn and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(40, 40, 40)
end)

-- 3. زر منظور الآيباد (iPad View)
FOVBtn.Parent = MainFrame
FOVBtn.Text = "منظور: عادي"
FOVBtn.Position = UDim2.new(0.1, 0, 0.75, 0)
FOVBtn.Size = UDim2.new(0.8, 0, 0, 40)
FOVBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
FOVBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

FOVBtn.MouseButton1Click:Connect(function()
    if workspace.CurrentCamera.FieldOfView == 70 then
        workspace.CurrentCamera.FieldOfView = 120
        FOVBtn.Text = "منظور: آيباد"
        FOVBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    else
        workspace.CurrentCamera.FieldOfView = 70
        FOVBtn.Text = "منظور: عادي"
        FOVBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    end
end)

-- حلقة التجميع التلقائي
task.spawn(function()
    while true do
        task.wait(0.2)
        if farmOn then
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                for _, obj in pairs(workspace:GetDescendants()) do
                    if (obj.Name == "Brain" or obj.Name == "Money") and obj:IsA("BasePart") then
                        char.HumanoidRootPart.CFrame = obj.CFrame
                        task.wait(0.1)
                    end
                end
            end)
        end
    end
end)
