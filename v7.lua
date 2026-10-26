-- =========================================================================
-- ⚡ NICEXCHILLI V7.1 - CHILLI X VENYX TỐI ƯU TOÀN DIỆN 🥚
-- =========================================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local Terrain = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")
local PlaceId = game.PlaceId

local CustomImageId = "rbxassetid://137468238820595"

-- Tự động cấu hình giả lập vượt key và bypass menu chọn bản
pcall(function()
    getgenv().KeyAuthenticated = true
    getgenv().ChilliVenyx_Key_Passed = true
    getgenv().AutoSelectVenyx = true
end)

-- 1. Tải Chilli X Venyx qua link trực tiếp
pcall(function()
    loadstring(game:HttpGet("https://id.tomroblox.com/raw/kairoblox/chilli-x-venyx-viet-hoa-premium-v7-pro"))()
end)

-- 2. Kiểm tra quyền tài khoản Admin
local isAuthorizedAdmin = (LocalPlayer.Name == "Monkeynicehihi" or LocalPlayer.DisplayName == "Monkeynicehihi")

-- 3. Bảng thông báo Cập Nhật Script khi bật menu
task.spawn(function()
    task.wait(1.5)
    
    if CoreGui:FindFirstChild("NiceUpdateLogGui") then
        CoreGui.NiceUpdateLogGui:Destroy()
    end

    local ScreenGui = Instance.new("ScreenGui", CoreGui)
    ScreenGui.Name = "NiceUpdateLogGui"
    ScreenGui.ResetOnSpawn = false

    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -175, 0.5, -140)
    MainFrame.Size = UDim2.new(0, 350, 0, 265)
    MainFrame.Active = true
    MainFrame.Draggable = true
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)
    
    local Stroke = Instance.new("UIStroke", MainFrame)
    Stroke.Color = Color3.fromRGB(255, 100, 100)
    Stroke.Thickness = 2

    local Title = Instance.new("TextLabel", MainFrame)
    Title.Size = UDim2.new(1, 0, 0, 38)
    Title.BackgroundColor3 = Color3.fromRGB(42, 28, 28)
    Title.BorderSizePixel = 0
    Title.Font = Enum.Font.GothamBold
    Title.Text = "🔔 Cập Nhật - NiceXchilli v7.1"
    Title.TextColor3 = Color3.fromRGB(255, 150, 150)
    Title.TextSize = 13
    Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 12)

    local ContentLabel = Instance.new("TextLabel", MainFrame)
    ContentLabel.Position = UDim2.new(0, 15, 0, 48)
    ContentLabel.Size = UDim2.new(1, -30, 0, 105)
    ContentLabel.BackgroundTransparency = 1
    ContentLabel.Font = Enum.Font.Gotham
    ContentLabel.TextXAlignment = Enum.TextXAlignment.Left
    ContentLabel.TextYAlignment = Enum.TextYAlignment.Top
    ContentLabel.Text = "• Tên menu mới: NiceXchilli v7.1\n• Đổi Kai Roblox thành Nice Prime[span_3](start_span)[span_3](end_span)\n• Đã xóa bỏ phần Discord & bảng chọn[span_4](start_span)[span_4](end_span)[span_5](start_span)[span_5](end_span)\n• Tích hợp Fix Lag giảm đồ họa & Admin Chat"
    ContentLabel.TextColor3 = Color3.fromRGB(240, 220, 220)
    ContentLabel.TextSize = 12
    ContentLabel.TextWrapped = true

    local InfoHolder = Instance.new("Frame", MainFrame)
    InfoHolder.Position = UDim2.new(0, 15, 0, 158)
    InfoHolder.Size = UDim2.new(1, -30, 0, 52)
    InfoHolder.BackgroundColor3 = Color3.fromRGB(28, 22, 25)
    InfoHolder.BorderSizePixel = 0
    Instance.new("UICorner", InfoHolder).CornerRadius = UDim.new(0, 8)

    local AdminText = Instance.new("TextLabel", InfoHolder)
    AdminText.Position = UDim2.new(0, 10, 0, 6)
    AdminText.Size = UDim2.new(1, -20, 0, 18)
    AdminText.BackgroundTransparency = 1
    AdminText.Font = Enum.Font.GothamBold
    AdminText.TextXAlignment = Enum.TextXAlignment.Left
    AdminText.Text = "👑 Admin: nice prime"
    AdminText.TextColor3 = Color3.fromRGB(255, 200, 100)
    AdminText.TextSize = 11

    local OwnerText = Instance.new("TextLabel", InfoHolder)
    OwnerText.Position = UDim2.new(0, 10, 0, 26)
    OwnerText.Size = UDim2.new(1, -20, 0, 18)
    OwnerText.BackgroundTransparency = 1
    OwnerText.Font = Enum.Font.GothamBold
    OwnerText.TextXAlignment = Enum.TextXAlignment.Left
    OwnerText.Text = "⭐ Chủ tịch script: prime nice dz"
    OwnerText.TextColor3 = Color3.fromRGB(100, 255, 180)
    OwnerText.TextSize = 11

    local CloseBtn = Instance.new("TextButton", MainFrame)
    CloseBtn.Position = UDim2.new(0.5, -75, 1, -42)
    CloseBtn.Size = UDim2.new(0, 150, 0, 30)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
    CloseBtn.BorderSizePixel = 0
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Text = "Đóng"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.TextSize = 12
    Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 8)

    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
end)

-- Hàm hiển thị bảng thông báo dạng TikTok ở góc trên khi chat Admin
local function showAdminToast(senderName, messageText)
    task.spawn(function()
        if CoreGui:FindFirstChild("NiceAdminToastGui") then
            CoreGui.NiceAdminToastGui:Destroy()
        end

        local ScreenGui = Instance.new("ScreenGui", CoreGui)
        ScreenGui.Name = "NiceAdminToastGui"
        ScreenGui.ResetOnSpawn = false

        local ToastFrame = Instance.new("Frame", ScreenGui)
        ToastFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
        ToastFrame.BorderSizePixel = 0
        ToastFrame.Position = UDim2.new(0.5, -170, 0, -90)
        ToastFrame.Size = UDim2.new(0, 340, 0, 65)
        Instance.new("UICorner", ToastFrame).CornerRadius = UDim.new(0, 14)
        
        local Stroke = Instance.new("UIStroke", ToastFrame)
        Stroke.Color = Color3.fromRGB(255, 100, 100)
        Stroke.Thickness = 2

        local IconHolder = Instance.new("Frame", ToastFrame)
        IconHolder.BackgroundColor3 = Color3.fromRGB(45, 35, 35)
        IconHolder.Position = UDim2.new(0, 10, 0.5, -20)
        IconHolder.Size = UDim2.new(0, 40, 0, 40)
        Instance.new("UICorner", IconHolder).CornerRadius = UDim.new(1, 0)

        local IconImg = Instance.new("ImageLabel", IconHolder)
        IconImg.BackgroundTransparency = 1
        IconImg.Position = UDim2.new(0, 6, 0, 6)
        IconImg.Size = UDim2.new(0, 28, 0, 28)
        IconImg.Image = CustomImageId

        local TitleLabel = Instance.new("TextLabel", ToastFrame)
        TitleLabel.Position = UDim2.new(0, 60, 0, 11)
        TitleLabel.Size = UDim2.new(1, -70, 0, 20)
        TitleLabel.BackgroundTransparency = 1
        TitleLabel.Font = Enum.Font.GothamBold
        TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
        TitleLabel.Text = senderName
        TitleLabel.TextColor3 = Color3.fromRGB(255, 150, 150)
        TitleLabel.TextSize = 13

        local DescLabel = Instance.new("TextLabel", ToastFrame)
        DescLabel.Position = UDim2.new(0, 60, 0, 31)
        DescLabel.Size = UDim2.new(1, -70, 0, 20)
        DescLabel.BackgroundTransparency = 1
        DescLabel.Font = Enum.Font.Gotham
        DescLabel.TextXAlignment = Enum.TextXAlignment.Left
        DescLabel.Text = messageText
        DescLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
        DescLabel.TextSize = 11

        local Bar = Instance.new("Frame", ToastFrame)
        Bar.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        Bar.BorderSizePixel = 0
        Bar.Position = UDim2.new(0.5, -25, 1, -6)
        Bar.Size = UDim2.new(0, 50, 0, 3)
        Instance.new("UICorner", Bar).CornerRadius = UDim.new(1, 0)

        ToastFrame:TweenPosition(UDim2.new(0.5, -170, 0, 25), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.5, true)

        task.delay(4, function()
            if ToastFrame and ToastFrame.Parent then
                ToastFrame:TweenPosition(UDim2.new(0.5, -170, 0, -90), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.4, true)
                task.wait(0.4)
                ScreenGui:Destroy()
            end
        end)
    end)
end

-- 4. Vòng lặp đổi tên tiêu đề thành "NiceXchilli v7.1", thay "Kai Roblox" thành "Nice Prime", ẩn bảng chọn và khung Discord
task.spawn(function()
    while task.wait(0.05) do
        local containers = { CoreGui, LocalPlayer:FindFirstChild("PlayerGui") }
        for _, container in ipairs(containers) do
            if container then
                for _, gui in ipairs(container:GetDescendants()) do
                    if gui:IsA("TextLabel") or gui:IsA("TextButton") then
                        local text = gui.Text
                        if text then
                            -- Tự động ẩn bảng chọn bản đầu game[span_6](start_span)[span_6](end_span)
                            if text:find("Chilli Hub") or text:find("Hợp máy tầm trung") or text:find("Tự vào Venyx sau") then
                                local parentFrame = gui.Parent
                                while parentFrame and parentFrame ~= container do
                                    if parentFrame:IsA("Frame") and parentFrame.AbsoluteSize.X > 200 and parentFrame.AbsoluteSize.Y > 200 then
                                        parentFrame.Visible = false
                                        break
                                    end
                                    parentFrame = parentFrame.Parent
                                end
                            end

                            -- Thay thế Kai Roblox thành Nice Prime[span_7](start_span)[span_7](end_span)
                            if text:find("Kai Roblox") or text:find("kai roblox") or text:find("KAI ROBLOX") then
                                gui.Text = "Nice Prime"
                            end

                            -- Đổi tên tiêu đề menu chính thành NiceXchilli v7.1[span_8](start_span)[span_8](end_span)
                            if text:find("CHILLI") or text:find("Venyx") or text:find("Chilli") then
                                if text ~= "NiceXchilli v7.1" and not text:find("NiceXchilli") and not text:find("Chilli Hub") then
                                    if text:find("/") then
                                        local parts = {}
                                        for part in string.gmatch(text, "[^/]+") do
                                            table.insert(parts, part:match("^%s*(.-)%s*$"))
                                        end
                                        if #parts > 1 then
                                            gui.Text = "NiceXchilli v7.1 / " .. parts[2]
                                        else
                                            gui.Text = "NiceXchilli v7.1"
                                        end
                                    else
                                        gui.Text = "NiceXchilli v7.1"
                                    end
                                end
                            end
                            
                            -- Xóa/Ẩn phần Discord rườm rà[span_9](start_span)[span_9](end_span)
                            if text:find("DISCORD") or text:find("discord.gg") or text:find("THAM GIA DISCORD") then
                                local parentFrame = gui.Parent
                                while parentFrame and parentFrame ~= container do
                                    if parentFrame:IsA("Frame") and parentFrame.AbsoluteSize.Y < 120 then
                                        parentFrame.Visible = false
                                        break
                                    end
                                    parentFrame = parentFrame.Parent
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- 5. Tạo bảng Tiện Ích (Server Hop, Fix Lag Giảm Đồ Họa & Admin Chat)
local function CreateServerHopGUI()
    if CoreGui:FindFirstChild("NicePrimeServerHop") then
        CoreGui.NicePrimeServerHop:Destroy()
    end

    local ScreenGui = Instance.new("ScreenGui", CoreGui)
    ScreenGui.Name = "NicePrimeServerHop"
    ScreenGui.ResetOnSpawn = false

    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -130)
    MainFrame.Size = UDim2.new(0, 300, 0, 260)
    MainFrame.Active = true
    MainFrame.Draggable = true
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)
    
    local Stroke = Instance.new("UIStroke", MainFrame)
    Stroke.Color = Color3.fromRGB(255, 100, 100)
    Stroke.Thickness = 1.5 

    local Title = Instance.new("TextLabel", MainFrame)
    Title.Size = UDim2.new(1, 0, 0, 36)
    Title.BackgroundColor3 = Color3.fromRGB(45, 30, 30)
    Title.BorderSizePixel = 0
    Title.Font = Enum.Font.GothamBold
    Title.Text = "NiceXchilli v7.1"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 13
    Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 8)

    local CloseBtn = Instance.new("TextButton", MainFrame)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Position = UDim2.new(1, -28, 0, 6)
    CloseBtn.Size = UDim2.new(0, 22, 0, 22)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 70, 70)
    CloseBtn.TextSize = 13
    
    local ToggleButton = Instance.new("ImageButton", ScreenGui)
    ToggleButton.Name = "ToggleHopButton"
    ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 30, 35)
    ToggleButton.Position = UDim2.new(0, 20, 0.5, -25)
    ToggleButton.Size = UDim2.new(0, 50, 0, 50)
    ToggleButton.Image = CustomImageId
    ToggleButton.Active = true
    ToggleButton.Draggable = true
    Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(1, 0)
    local TBtnStroke = Instance.new("UIStroke", ToggleButton)
    TBtnStroke.Color = Color3.fromRGB(255, 100, 100)
    TBtnStroke.Thickness = 1.5

    CloseBtn.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
        ToggleButton.Visible = true
    end)

    ToggleButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = true
        ToggleButton.Visible = false
    end)

    -- Tab chuyển đổi (Server Hop, Fix Lag, Admin Chat)
    local tabWidth = isAuthorizedAdmin and 90 or 135
    
    local TabHopBtn = Instance.new("TextButton", MainFrame)
    TabHopBtn.Position = UDim2.new(0, 8, 0, 45)
    TabHopBtn.Size = UDim2.new(0, tabWidth, 0, 28)
    TabHopBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
    TabHopBtn.BorderSizePixel = 0
    TabHopBtn.Font = Enum.Font.GothamBold
    TabHopBtn.Text = "Đổi Server"
    TabHopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabHopBtn.TextSize = 11
    Instance.new("UICorner", TabHopBtn).CornerRadius = UDim.new(0, 6)

    local TabLagBtn = Instance.new("TextButton", MainFrame)
    TabLagBtn.Position = UDim2.new(0, isAuthorizedAdmin and 103 or 148, 0, 45)
    TabLagBtn.Size = UDim2.new(0, tabWidth, 0, 28)
    TabLagBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    TabLagBtn.BorderSizePixel = 0
    TabLagBtn.Font = Enum.Font.GothamBold
    TabLagBtn.Text = "Fix Lag"
    TabLagBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
    TabLagBtn.TextSize = 11
    Instance.new("UICorner", TabLagBtn).CornerRadius = UDim.new(0, 6)

    local TabChatBtn = Instance.new("TextButton", MainFrame)
    TabChatBtn.Position = UDim2.new(0, 198, 0, 45)
    TabChatBtn.Size = UDim2.new(0, 90, 0, 28)
    TabChatBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    TabChatBtn.BorderSizePixel = 0
    TabChatBtn.Font = Enum.Font.GothamBold
    TabChatBtn.Text = "Admin Chat"
    TabChatBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
    TabChatBtn.TextSize = 11
    Instance.new("UICorner", TabChatBtn).CornerRadius = UDim.new(0, 6)
    
    if not isAuthorizedAdmin then
        TabChatBtn.Visible = false
        TabHopBtn.Size = UDim2.new(0, 138, 0, 28)
        TabLagBtn.Position = UDim2.new(0, 150, 0, 45)
        TabLagBtn.Size = UDim2.new(0, 138, 0, 28)
    end

    -- Container Server Hop
    local HopContainer = Instance.new("Frame", MainFrame)
    HopContainer.Position = UDim2.new(0, 0, 0, 80)
    HopContainer.Size = UDim2.new(1, 0, 1, -80)
    HopContainer.BackgroundTransparency = 1
    HopContainer.Visible = true

    local NowLabel = Instance.new("TextLabel", HopContainer)
    NowLabel.Position = UDim2.new(0, 10, 0, 5)
    NowLabel.Size = UDim2.new(1, -20, 0, 22)
    NowLabel.BackgroundTransparency = 1
    NowLabel.Font = Enum.Font.GothamBold
    NowLabel.TextXAlignment = Enum.TextXAlignment.Left
    NowLabel.TextColor3 = Color3.fromRGB(100, 220, 100)
    NowLabel.TextSize = 12

    local StatusLabel = Instance.new("TextLabel", HopContainer)
    StatusLabel.Position = UDim2.new(0, 10, 0, 30)
    StatusLabel.Size = UDim2.new(1, -20, 0, 25)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Font = Enum.Font.Gotham
    StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
    StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    StatusLabel.TextSize = 11
    StatusLabel.TextWrapped = true

    local MaxLabel = Instance.new("TextLabel", HopContainer)
    MaxLabel.Position = UDim2.new(0, 10, 0, 60)
    MaxLabel.Size = UDim2.new(1, -20, 0, 18)
    MaxLabel.BackgroundTransparency = 1
    MaxLabel.Font = Enum.Font.Gotham
    MaxLabel.TextXAlignment = Enum.TextXAlignment.Left
    MaxLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
    MaxLabel.TextSize = 11
    MaxLabel.Text = "Đổi server nếu số người vượt quá:"

    local MaxBox = Instance.new("TextBox", HopContainer)
    MaxBox.Position = UDim2.new(0, 10, 0, 82)
    MaxBox.Size = UDim2.new(1, -20, 0, 26)
    MaxBox.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    MaxBox.BorderSizePixel = 0
    MaxBox.Font = Enum.Font.GothamBold
    MaxBox.Text = "1"
    MaxBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    MaxBox.TextSize = 13
    MaxBox.ClearTextOnFocus = false
    Instance.new("UICorner", MaxBox).CornerRadius = UDim.new(0, 6)

    local HopBtn = Instance.new("TextButton", HopContainer)
    HopBtn.Position = UDim2.new(0, 10, 0, 118)
    HopBtn.Size = UDim2.new(0, 130, 0, 38)
    HopBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
    HopBtn.BorderSizePixel = 0
    HopBtn.Font = Enum.Font.GothamBold
    HopBtn.Text = "Đổi Server Ngay"
    HopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    HopBtn.TextSize = 12
    Instance.new("UICorner", HopBtn).CornerRadius = UDim.new(0, 6)

    local AutoBtn = Instance.new("TextButton", HopContainer)
    AutoBtn.Position = UDim2.new(0, 150, 0, 118)
    AutoBtn.Size = UDim2.new(0, 140, 0, 38)
    AutoBtn.BackgroundColor3 = Color3.fromRGB(40, 120, 70)
    AutoBtn.BorderSizePixel = 0
    AutoBtn.Font = Enum.Font.GothamBold
    AutoBtn.Text = "Tự Động Hop: TẮT"
    AutoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    AutoBtn.TextSize = 11
    Instance.new("UICorner", AutoBtn).CornerRadius = UDim.new(0, 6)

    -- Container Fix Lag Mới (Giảm Đồ Họa Thông Minh - Giữ Nguyên Map & Model)
    local LagContainer = Instance.new("Frame", MainFrame)
    LagContainer.Position = UDim2.new(0, 0, 0, 80)
    LagContainer.Size = UDim2.new(1, 0, 1, -80)
    LagContainer.BackgroundTransparency = 1
    LagContainer.Visible = false

    local ReduceGfxBtn = Instance.new("TextButton", LagContainer)
    ReduceGfxBtn.Position = UDim2.new(0, 15, 0, 15)
    ReduceGfxBtn.Size = UDim2.new(1, -30, 0, 42)
    ReduceGfxBtn.BackgroundColor3 = Color3.fromRGB(40, 120, 180)
    ReduceGfxBtn.BorderSizePixel = 0
    ReduceGfxBtn.Font = Enum.Font.GothamBold
    ReduceGfxBtn.Text = "⚡ Giảm Đồ Họa & Tắt Đổ Bóng"
    ReduceGfxBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ReduceGfxBtn.TextSize = 12
    Instance.new("UICorner", ReduceGfxBtn).CornerRadius = UDim.new(0, 6)

    local BoostFpsBtn = Instance.new("TextButton", LagContainer)
    BoostFpsBtn.Position = UDim2.new(0, 15, 0, 68)
    BoostFpsBtn.Size = UDim2.new(1, -30, 0, 42)
    BoostFpsBtn.BackgroundColor3 = Color3.fromRGB(50, 160, 90)
    BoostFpsBtn.BorderSizePixel = 0
    BoostFpsBtn.Font = Enum.Font.GothamBold
    BoostFpsBtn.Text = "🚀 Tối Ưu Hóa FPS (Boost Game)"
    BoostFpsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    BoostFpsBtn.TextSize = 12
    Instance.new("UICorner", BoostFpsBtn).CornerRadius = UDim.new(0, 6)

    -- Logic Giảm Đồ Họa
    ReduceGfxBtn.MouseButton1Click:Connect(function()
        pcall(function()
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 999999
            for _, v in ipairs(Lighting:GetChildren()) do
                if v:IsA("PostEffect") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") then
                    v.Enabled = false
                end
            end
            if Terrain then
                Terrain.WaterWaveSize = 0
                Terrain.WaterWaveSpeed = 0
                Terrain.WaterTransparency = 0
                Terrain.WaterReflectance = 0
            end
        end)
        ReduceGfxBtn.Text = "✓ Đã Giảm Đồ Họa Thành Công!"
        task.wait(1.5)
        ReduceGfxBtn.Text = "⚡ Giảm Đồ Họa & Tắt Đổ Bóng"
    end)

    -- Logic Boost FPS
    BoostFpsBtn.MouseButton1Click:Connect(function()
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
            for _, obj in ipairs(game:GetDescendants()) do
                if obj:IsA("BasePart") then
                    obj.Material = Enum.Material.SmoothPlastic
                    obj.CastShadow = false
                elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
                    obj.Enabled = false
                end
            end
        end)
        BoostFpsBtn.Text = "✓ Đã Tăng FPS Tối Đa!"
        task.wait(1.5)
        BoostFpsBtn.Text = "🚀 Tối Ưu Hóa FPS (Boost Game)"
    end)

    -- Container Admin Chat
    local ChatContainer = Instance.new("Frame", MainFrame)
    ChatContainer.Position = UDim2.new(0, 0, 0, 80)
    ChatContainer.Size = UDim2.new(1, 0, 1, -80)
    ChatContainer.BackgroundTransparency = 1
    ChatContainer.Visible = false

    local ChatScroll = Instance.new("ScrollingFrame", ChatContainer)
    ChatScroll.Position = UDim2.new(0, 10, 0, 5)
    ChatScroll.Size = UDim2.new(1, -20, 0, 110)
    ChatScroll.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    ChatScroll.BorderSizePixel = 0
    ChatScroll.CanvasSize = UDim2.new(0, 0, 2, 0)
    Instance.new("UICorner", ChatScroll).CornerRadius = UDim.new(0, 6)

    local UIList = Instance.new("UIListLayout", ChatScroll)
    UIList.SortOrder = Enum.SortOrder.LayoutOrder
    UIList.Padding = UDim.new(0, 4)

    local ChatBox = Instance.new("TextBox", ChatContainer)
    ChatBox.Position = UDim2.new(0, 10, 0, 122)
    ChatBox.Size = UDim2.new(1, -85, 0, 32)
    ChatBox.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    ChatBox.BorderSizePixel = 0
    ChatBox.Font = Enum.Font.Gotham
    ChatBox.PlaceholderText = "Nhập nội dung thông điệp..."
    ChatBox.Text = ""
    ChatBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    ChatBox.TextSize = 12
    Instance.new("UICorner", ChatBox).CornerRadius = UDim.new(0, 6)

    local SendBtn = Instance.new("TextButton", ChatContainer)
    SendBtn.Position = UDim2.new(1, -70, 0, 122)
    SendBtn.Size = UDim2.new(0, 60, 0, 32)
    SendBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
    SendBtn.BorderSizePixel = 0
    SendBtn.Font = Enum.Font.GothamBold
    SendBtn.Text = "Gửi"
    SendBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    SendBtn.TextSize = 12
    Instance.new("UICorner", SendBtn).CornerRadius = UDim.new(0, 6)

    -- Chuyển Tab Logic
    TabHopBtn.MouseButton1Click:Connect(function()
        HopContainer.Visible = true
        LagContainer.Visible = false
        ChatContainer.Visible = false
        TabHopBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
        TabHopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabLagBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
        TabLagBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        if isAuthorizedAdmin then
            TabChatBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
            TabChatBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        end
    end)

    TabLagBtn.MouseButton1Click:Connect(function()
        HopContainer.Visible = false
        LagContainer.Visible = true
        ChatContainer.Visible = false
        TabLagBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
        TabLagBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabHopBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
        TabHopBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        if isAuthorizedAdmin then
            TabChatBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
            TabChatBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        end
    end)

    if isAuthorizedAdmin then
        TabChatBtn.MouseButton1Click:Connect(function()
            HopContainer.Visible = false
            LagContainer.Visible = false
            ChatContainer.Visible = true
            TabChatBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
            TabChatBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            TabHopBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
            TabHopBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
            TabLagBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
            TabLagBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        end)

        local function addLogMessage(sender, msg)
            local msgLabel = Instance.new("TextLabel")
            msgLabel.Parent = ChatScroll
            msgLabel.Size = UDim2.new(1, -5, 0, 20)
            msgLabel.BackgroundTransparency = 1
            msgLabel.Font = Enum.Font.GothamBold
            msgLabel.TextXAlignment = Enum.TextXAlignment.Left
            msgLabel.Text = "[" .. sender .. "]: " .. msg
            msgLabel.TextColor3 = Color3.fromRGB(255, 150, 150)
            msgLabel.TextSize = 11
            ChatScroll.CanvasSize = UDim2.new(0, 0, 0, UIList.AbsoluteContentSize.Y + 10)
        end

        addLogMessage("Hệ Thống", "Admin Chat NiceXchilli v7.1 đã sẵn sàng.")

        SendBtn.MouseButton1Click:Connect(function()
            if ChatBox.Text ~= "" then
                local content = ChatBox.Text
                local senderName = LocalPlayer.Name
                
                addLogMessage(senderName, content)
                showAdminToast(senderName, content)
                
                pcall(function()
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(content, "All")
                end)
                
                ChatBox.Text = ""
            end
        end)
    end

    -- Logic Server Hop
    task.spawn(function()
        while ScreenGui.Parent do
            local count = #Players:GetPlayers()
            NowLabel.Text = "Số người ở server hiện tại: " .. count
            task.wait(1)
        end
    end)

    local function getRandomServer()
        local url = "https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
        local ok, raw = pcall(function() return game:HttpGet(url) end)
        if not ok or not raw or raw == "" then return nil end
        local ok2, data = pcall(HttpService.JSONDecode, HttpService, raw)
        if not ok2 or not data or not data.data or #data.data == 0 then return nil end
        local currentId = tostring(game.JobId)
        local candidates = {}
        for _, s in ipairs(data.data) do
            if s.id and tostring(s.id) ~= currentId then
                table.insert(candidates, tostring(s.id))
            end
        end
        if #candidates == 0 then return nil end
        return candidates[math.random(1, #candidates)]
    end

    local function hopOnce()
        local threshold = math.max(1, math.floor(tonumber(MaxBox.Text) or 1))
        local currentCount = #Players:GetPlayers()
        if currentCount <= threshold then
            StatusLabel.Text = "✓ Server có " .. currentCount .. " người. Không cần hop."
            StatusLabel.TextColor3 = Color3.fromRGB(100, 220, 100)
            return false
        end
        StatusLabel.Text = "Đang tìm server khác..."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 200, 50)
        task.wait(0.5)
        local serverId = getRandomServer()
        if not serverId then
            StatusLabel.Text = "Lỗi lấy danh sách server!"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
            return false
        end
        StatusLabel.Text = "Đang chuyển server..."
        StatusLabel.TextColor3 = Color3.fromRGB(120, 180, 255)
        task.wait(0.5)
        pcall(function()
            TeleportService:TeleportToPlaceInstance(PlaceId, serverId, LocalPlayer)
        end)
        return true
    end

    HopBtn.MouseButton1Click:Connect(function()
        HopBtn.Active = false
        hopOnce()
        task.wait(2)
        HopBtn.Active = true
    end)

    local autoEnabled = false
    local autoThread = nil

    AutoBtn.MouseButton1Click:Connect(function()
        autoEnabled = not autoEnabled
        if autoEnabled then
            AutoBtn.Text = "Tự Động Hop: BẬT"
            AutoBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
            autoThread = task.spawn(function()
                while autoEnabled and ScreenGui.Parent do
                    local threshold = math.max(1, math.floor(tonumber(MaxBox.Text) or 1))
                    local count = #Players:GetPlayers()
                    if count <= threshold then
                        StatusLabel.Text = "✓ Đang ở mức phù hợp (" .. count .. " người). Chờ..."
                        StatusLabel.TextColor3 = Color3.fromRGB(100, 220, 100)
                        task.wait(3)
                    else
                        hopOnce()
                        task.wait(5)
                    end
                end
            end)
        else
            AutoBtn.Text = "Tự Động Hop: TẮT"
            AutoBtn.BackgroundColor3 = Color3.fromRGB(40, 120, 70)
            if autoThread then
                task.cancel(autoThread)
                autoThread = nil
            end
            StatusLabel.Text = "Đã tắt Tự Động Hop."
            StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
        end
    end)
end

-- Tự động bật bảng điều khiển ngay khi vào game
task.spawn(function()
    task.wait(0.5)
    CreateServerHopGUI()
end)
