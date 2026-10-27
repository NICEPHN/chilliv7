-- // Chilli v7 - Get Key & Verification System
-- // Designed for Roblox (Executor Luau)

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- Xóa UI cũ nếu có để tránh trùng lặp
if CoreGui:FindFirstChild("ChilliV7KeySystem") then
    CoreGui.ChilliV7KeySystem:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ChilliV7KeySystem"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Frame (Hiệu ứng 4K/Gradient Modern)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 420, 0, 260)

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 16)
UICorner.Parent = MainFrame

-- Gradient viền hoặc hiệu ứng sáng 4D
local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = MainFrame
UIStroke.Color = Color3.fromRGB(120, 80, 255)
UIStroke.Thickness = 2
UIStroke.Transparency = 0.3

-- Tiêu đề
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 20)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "🌶️ Chilli v7 Get Key"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 22

-- Phụ đề / Mô tả
local SubTitle = Instance.new("TextLabel")
SubTitle.Parent = MainFrame
SubTitle.BackgroundTransparency = 1
SubTitle.Position = UDim2.new(0, 0, 0, 60)
SubTitle.Size = UDim2.new(1, 0, 0, 25)
SubTitle.Font = Enum.Font.Gotham
SubTitle.Text = "Nhập Key bên dưới để tiếp tục sử dụng script"
SubTitle.TextColor3 = Color3.fromRGB(170, 170, 190)
SubTitle.TextSize = 13

-- Ô nhập Key (Textbox)
local KeyBox = Instance.new("TextBox")
KeyBox.Name = "KeyBox"
KeyBox.Parent = MainFrame
KeyBox.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
KeyBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
KeyBox.BorderSizePixel = 0
KeyBox.Position = UDim2.new(0.1, 0, 0, 105)
KeyBox.Size = UDim2.new(0.8, 0, 0, 45)
KeyBox.Font = Enum.Font.GothamMedium
KeyBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 130)
KeyBox.PlaceholderText = "Nhập key của bạn vào đây..."
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.TextSize = 14
KeyBox.ClearTextOnFocus = false

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 10)
BoxCorner.Parent = KeyBox

-- Nút Xác Nhận Key
local ConfirmBtn = Instance.new("TextButton")
ConfirmBtn.Name = "ConfirmBtn"
ConfirmBtn.Parent = MainFrame
ConfirmBtn.BackgroundColor3 = Color3.fromRGB(90, 50, 230)
ConfirmBtn.Position = UDim2.new(0.1, 0, 0, 165)
ConfirmBtn.Size = UDim2.new(0.38, 0, 0, 42)
ConfirmBtn.Font = Enum.Font.GothamBold
ConfirmBtn.Text = "Xác Nhận Key"
ConfirmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ConfirmBtn.TextSize = 14

local ConfirmCorner = Instance.new("UICorner")
ConfirmCorner.CornerRadius = UDim.new(0, 10)
ConfirmCorner.Parent = ConfirmBtn

-- Nút Get Key (Link vượt/lấy key)
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Name = "GetKeyBtn"
GetKeyBtn.Parent = MainFrame
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
GetKeyBtn.Position = UDim2.new(0.52, 0, 0, 165)
GetKeyBtn.Size = UDim2.new(0.38, 0, 0, 42)
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.Text = "Lấy Key (Get Key)"
GetKeyBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
GetKeyBtn.TextSize = 14

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 10)
GetKeyCorner.Parent = GetKeyBtn

-- Thông báo trạng thái (Sai/Đúng key)
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 0, 0, 215)
StatusLabel.Size = UDim2.new(1, 0, 0, 20)
StatusLabel.Font = Enum.Font.GothamMedium
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
StatusLabel.TextSize = 12

-- Xử lý logic nút Xác Nhận
ConfirmBtn.MouseButton1Click:Connect(function()
    local enteredKey = KeyBox.Text
    local correctKey = "Khagayvcl_free"
    
    if enteredKey == correctKey then
        StatusLabel.TextColor3 = Color3.fromRGB(70, 255, 120)
        StatusLabel.Text = "✨ Xác nhận thành công! Đang tải script..."
        task.wait(1)
        
        -- Xóa bảng UI Get Key
        ScreenGui:Destroy()
        
        -- Chạy script chính theo yêu cầu
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/napun87/stealanegg/refs/heads/main/chillibakhi.lua"))()
        end)
        
        if not success then
            warn("Lỗi khi load script chính: " .. tostring(err))
        end
    else
        StatusLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
        StatusLabel.Text = "❌ Key không chính xác! Vui lòng kiểm tra lại."
    end
end)

-- Xử lý nút Lấy Key (Copy link hoặc thông báo)
GetKeyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://link-to-get-key-here.com") -- Thay link lấy key của bạn vào đây nếu có
        StatusLabel.TextColor3 = Color3.fromRGB(70, 180, 255)
        StatusLabel.Text = "📋 Đã copy link lấy key vào bộ nhớ tạm!"
    else
        StatusLabel.TextColor3 = Color3.fromRGB(255, 200, 70)
        StatusLabel.Text = "⚠️ Executor của bạn không hỗ trợ tự copy link."
    end
end)

