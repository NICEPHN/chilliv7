--// Dịch vụ cần thiết
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--// Xóa UI cũ nếu có để tránh bị trùng lặp
if playerGui:FindFirstChild("AdminNoticeGui") then
	playerGui.AdminNoticeGui:Destroy()
end

--// Tạo ScreenGui chính
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AdminNoticeGui"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

--// Lớp nền mờ (Blur / Overlay)
local overlay = Instance.new("Frame")
overlay.Name = "Overlay"
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
overlay.BackgroundTransparency = 1
overlay.Parent = screenGui

--// Khung chính của bảng thông báo (Căn giữa tuyệt đối)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 420, 0, 270)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
mainFrame.BackgroundTransparency = 1
mainFrame.Parent = screenGui

--// Bo góc cho bảng chính
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 16)
uiCorner.Parent = mainFrame

--// Viền phát sáng nổi bật (Hiệu ứng 4D/Gaming)
local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(255, 75, 75)
uiStroke.Transparency = 1
uiStroke.Thickness = 2.5
uiStroke.Parent = mainFrame

--// Tiêu đề thông báo
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 15)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Text = "🚨 THÔNG BÁO TỪ ADMIN 🚨"
titleLabel.TextColor3 = Color3.fromRGB(255, 85, 85)
titleLabel.TextSize = 19
titleLabel.TextTransparency = 1
titleLabel.Parent = mainFrame

--// Nội dung thông báo (Đã đổi thành 20:00)
local descLabel = Instance.new("TextLabel")
descLabel.Size = UDim2.new(1, -40, 0, 100)
descLabel.Position = UDim2.new(0, 20, 0, 70)
descLabel.BackgroundTransparency = 1
descLabel.Font = Enum.Font.GothamMedium
descLabel.Text = "Xin lỗi tất cả anh em hôm nay admin chilliv7 sẽ được bảo trì đến 20:00 để fix ban nha anh em\n\nKey bồi thường:\nAdmin_key_1111"
descLabel.TextColor3 = Color3.fromRGB(220, 220, 230)
descLabel.TextSize = 13.5
descLabel.TextWrapped = true
descLabel.TextTransparency = 1
descLabel.Parent = mainFrame

--// Nút bấm "Đã hiểu"
local okButton = Instance.new("TextButton")
okButton.Size = UDim2.new(0, 180, 0, 38)
okButton.Position = UDim2.new(0.5, -90, 1, -50)
okButton.BackgroundColor3 = Color3.fromRGB(255, 75, 75)
okButton.BackgroundTransparency = 1
okButton.Font = Enum.Font.GothamBold
okButton.Text = "ĐÃ HIỂU ✨"
okButton.TextColor3 = Color3.fromRGB(255, 255, 255)
okButton.TextSize = 14
okButton.TextTransparency = 1
okButton.Parent = mainFrame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 10)
btnCorner.Parent = okButton

--// Hiệu ứng xuất hiện mượt mà (Tween Animation)
task.spawn(function()
	-- Làm mờ nền ngoài
	TweenService:Create(overlay, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {BackgroundTransparency = 0.5}):Play()
	
	-- Phóng to từ tâm màn hình ra
	mainFrame.Size = UDim2.new(0, 0, 0, 0)
	TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, 420, 0, 270),
		BackgroundTransparency = 0.1
	}):Play()

	task.wait(0.2)
	-- Hiện dần chữ và viền
	TweenService:Create(uiStroke, TweenInfo.new(0.3), {Transparency = 0.2}):Play()
	TweenService:Create(titleLabel, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
	TweenService:Create(descLabel, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
	TweenService:Create(okButton, TweenInfo.new(0.3), {BackgroundTransparency = 0, TextTransparency = 0}):Play()
end)

--// Sự kiện khi bấm nút Đã hiểu để tắt bảng
okButton.MouseButton1Click:Connect(function()
	-- Hiệu ứng ẩn đi
	TweenService:Create(overlay, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
	TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
		Size = UDim2.new(0, 0, 0, 0),
		BackgroundTransparency = 1
	}):Play()
	TweenService:Create(uiStroke, TweenInfo.new(0.3), {Transparency = 1}):Play()
	TweenService:Create(titleLabel, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
	TweenService:Create(descLabel, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
	TweenService:Create(okButton, TweenInfo.new(0.3), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
	
	task.wait(0.35)
	screenGui:Destroy()
end)




