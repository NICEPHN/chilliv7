-- =========================================================================
-- ⚡ nicexchilli v7.2 - code to free key (thêm content-creatos) 🥚
-- =========================================================================

local coreGui = game:GetService("CoreGui")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local teleportService = game:GetService("TeleportService")
local httpService = game:GetService("HttpService")
local lighting = game:GetService("Lighting")
local terrain = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")
local placeId = game.PlaceId

local customImageId = "rbxassetid://137468238820595"
local keyLink = "https://nicephn.github.io/Keyv7chill/"

-- danh sách code hợp lệ bao gồm cả code độc quyền cho creator
local validCodes = {
    ["Nice_code"] = "Chiliiv7_",
    ["chilliv7promax"] = "Chiliiv7_",
    ["Content-creatos"] = "CreatorV7_VIP_"
}

-- hàm khởi chạy menu chính sau khi vượt key thành công
local function launchMainScript()
    pcall(function()
        getgenv().KeyAuthenticated = true
        getgenv().ChilliVenyx_Key_Passed = true
        getgenv().AutoSelectVenyx = true
        getgenv().ChilliSelectedMenu = "Venyx"
    end)

    pcall(function()
        loadstring(game:HttpGet("https://id.tomroblox.com/raw/kairoblox/chilli-x-venyx-viet-hoa-premium-v7-pro"))()
    end)

    local isAuthorizedAdmin = (localPlayer.Name == "Monkeynicehihi" or localPlayer.DisplayName == "Monkeynicehihi")

    task.spawn(function()
        task.wait(1.5)
        
        if coreGui:FindFirstChild("NiceUpdateLogGui") then
            coreGui.NiceUpdateLogGui:Destroy()
        end

        local screenGui = Instance.new("ScreenGui", coreGui)
        screenGui.Name = "NiceUpdateLogGui"
        screenGui.ResetOnSpawn = false

        local mainFrame = Instance.new("Frame", screenGui)
        mainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
        mainFrame.BorderSizePixel = 0
        mainFrame.Position = UDim2.new(0.5, -185, 0.5, -150)
        mainFrame.Size = UDim2.new(0, 370, 0, 280)
        mainFrame.Active = true
        mainFrame.Draggable = true
        Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 16)
        
        local stroke = Instance.new("UIStroke", mainFrame)
        stroke.Color = Color3.fromRGB(255, 80, 120)
        stroke.Thickness = 2.5

        local title = Instance.new("TextLabel", mainFrame)
        title.Size = UDim2.new(1, 0, 0, 42)
        title.BackgroundColor3 = Color3.fromRGB(35, 20, 30)
        title.BorderSizePixel = 0
        title.Font = Enum.Font.GothamBold
        title.Text = "cập nhật 4k 4d - nicexchilli v7.2"
        title.TextColor3 = Color3.fromRGB(255, 140, 160)
        title.TextSize = 13
        Instance.new("UICorner", title).CornerRadius = UDim.new(0, 16)

        local contentLabel = Instance.new("TextLabel", mainFrame)
        contentLabel.Position = UDim2.new(0, 15, 0, 52)
        contentLabel.Size = UDim2.new(1, -30, 0, 115)
        contentLabel.BackgroundTransparency = 1
        contentLabel.Font = Enum.Font.Gotham
        contentLabel.TextXAlignment = Enum.TextXAlignment.Left
        contentLabel.TextYAlignment = Enum.TextYAlignment.Top
        contentLabel.Text = "• đã cập nhật!\n• tính năng tìm trứng mới\n  ( tele vào server có trứng khi spam có giá tiền nhiều hơn)\n• tự động chọn venyx & xóa bảng discord"
        contentLabel.TextColor3 = Color3.fromRGB(235, 235, 245)
        contentLabel.TextSize = 12
        contentLabel.TextWrapped = true

        local infoHolder = Instance.new("Frame", mainFrame)
        infoHolder.Position = UDim2.new(0, 15, 0, 172)
        infoHolder.Size = UDim2.new(1, -30, 0, 42)
        infoHolder.BackgroundColor3 = Color3.fromRGB(22, 18, 25)
        infoHolder.BorderSizePixel = 0
        Instance.new("UICorner", infoHolder).CornerRadius = UDim.new(0, 10)

        local adminText = Instance.new("TextLabel", infoHolder)
        adminText.Position = UDim2.new(0, 12, 0, 0)
        adminText.Size = UDim2.new(1, -24, 1, 0)
        adminText.BackgroundTransparency = 1
        adminText.Font = Enum.Font.GothamBold
        adminText.TextXAlignment = Enum.TextXAlignment.Left
        adminText.Text = "admin: nice"
        adminText.TextColor3 = Color3.fromRGB(255, 210, 100)
        adminText.TextSize = 12

        local closeBtn = Instance.new("TextButton", mainFrame)
        closeBtn.Position = UDim2.new(0.5, -80, 1, -45)
        closeBtn.Size = UDim2.new(0, 160, 0, 32)
        closeBtn.BackgroundColor3 = Color3.fromRGB(210, 50, 70)
        closeBtn.BorderSizePixel = 0
        closeBtn.Font = Enum.Font.GothamBold
        closeBtn.Text = "trải nghiệm ngay"
        closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        closeBtn.TextSize = 12
        Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 10)

        closeBtn.MouseButton1Click:Connect(function()
            screenGui:Destroy()
        end)
    end)

    task.spawn(function()
        while task.wait(0.05) do
            local containers = { coreGui, localPlayer:FindFirstChild("PlayerGui") }
            for _, container in ipairs(containers) do
                if container then
                    for _, gui in ipairs(container:GetDescendants()) do
                        if gui:IsA("TextLabel") or gui:IsA("TextButton") then
                            local text = gui.Text
                            if text then
                                if text:find("Venyx") and (text:find("Nhẹ, mượt") or text:find("Chọn menu") or text:find("Tự vào Venyx sau")) then
                                    local btn = gui
                                    while btn and not btn:IsA("TextButton") and not btn:IsA("ImageButton") do
                                        btn = btn.Parent
                                    end
                                    if btn and (btn:IsA("TextButton") or btn:IsA("ImageButton")) then
                                        pcall(function()
                                            for _, conn in ipairs(getconnections(btn.MouseButton1Click)) do
                                                conn:Fire()
                                            end
                                        end)
                                    end
                                end

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

                                if text:find("CHILLI") or text:find("Venyx") or text:find("Chilli") then
                                    if text ~= "nicexchilli v7.2" and not text:find("nicexchilli") and not text:find("Chilli Hub") then
                                        if text:find("/") then
                                            local parts = {}
                                            for part in string.gmatch(text, "[^/]+") do
                                                table.insert(parts, part:match("^%s*(.-)%s*$"))
                                            end
                                            if #parts > 1 then
                                                gui.Text = "nicexchilli v7.2 / " .. parts[2]
                                            else
                                                gui.Text = "nicexchilli v7.2"
                                            end
                                        else
                                            gui.Text = "nicexchilli v7.2"
                                        end
                                    end
                                end

                                if text:find("CONFIG VENYX") or text:find("Config Venyx") or text:find("Venyx V2.1") then
                                    gui.Text = "bật config nice v7.2"
                                end
                                
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

    local function createServerHopGUI()
        if coreGui:FindFirstChild("NicePrimeServerHop") then
            coreGui.NicePrimeServerHop:Destroy()
        end

        local screenGui = Instance.new("ScreenGui", coreGui)
        screenGui.Name = "NicePrimeServerHop"
        screenGui.ResetOnSpawn = false

        local mainFrame = Instance.new("Frame", screenGui)
        mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
        mainFrame.BorderSizePixel = 0
        mainFrame.Position = UDim2.new(0.5, -150, 0.5, -130)
        mainFrame.Size = UDim2.new(0, 300, 0, 260)
        mainFrame.Active = true
        mainFrame.Draggable = true
        Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8)
        
        local stroke = Instance.new("UIStroke", mainFrame)
        stroke.Color = Color3.fromRGB(255, 100, 100)
        stroke.Thickness = 1.5 

        local title = Instance.new("TextLabel", mainFrame)
        title.Size = UDim2.new(1, 0, 0, 36)
        title.BackgroundColor3 = Color3.fromRGB(45, 30, 30)
        title.BorderSizePixel = 0
        title.Font = Enum.Font.GothamBold
        title.Text = "nicexchilli v7.2"
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.TextSize = 13
        Instance.new("UICorner", title).CornerRadius = UDim.new(0, 8)

        local closeBtn = Instance.new("TextButton", mainFrame)
        closeBtn.BackgroundTransparency = 1
        closeBtn.Position = UDim2.new(1, -28, 0, 6)
        closeBtn.Size = UDim2.new(0, 22, 0, 22)
        closeBtn.Font = Enum.Font.GothamBold
        closeBtn.Text = "✕"
        closeBtn.TextColor3 = Color3.fromRGB(255, 70, 70)
        closeBtn.TextSize = 13
        
        local toggleButton = Instance.new("ImageButton", screenGui)
        toggleButton.Name = "ToggleHopButton"
        toggleButton.BackgroundColor3 = Color3.fromRGB(40, 30, 35)
        toggleButton.Position = UDim2.new(0, 20, 0.5, -25)
        toggleButton.Size = UDim2.new(0, 50, 0, 50)
        toggleButton.Image = customImageId
        toggleButton.Active = true
        toggleButton.Draggable = true
        Instance.new("UICorner", toggleButton).CornerRadius = UDim.new(1, 0)
        local tBtnStroke = Instance.new("UIStroke", toggleButton)
        tBtnStroke.Color = Color3.fromRGB(255, 100, 100)
        tBtnStroke.Thickness = 1.5

        closeBtn.MouseButton1Click:Connect(function()
            mainFrame.Visible = false
            toggleButton.Visible = true
        end)

        toggleButton.MouseButton1Click:Connect(function()
            mainFrame.Visible = true
            toggleButton.Visible = false
        end)

        local tabWidth = isAuthorizedAdmin and 90 or 135
        
        local tabHopBtn = Instance.new("TextButton", mainFrame)
        tabHopBtn.Position = UDim2.new(0, 8, 0, 45)
        tabHopBtn.Size = UDim2.new(0, tabWidth, 0, 28)
        tabHopBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
        tabHopBtn.BorderSizePixel = 0
        tabHopBtn.Font = Enum.Font.GothamBold
        tabHopBtn.Text = "đổi server"
        tabHopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabHopBtn.TextSize = 11
        Instance.new("UICorner", tabHopBtn).CornerRadius = UDim.new(0, 6)

        local tabLagBtn = Instance.new("TextButton", mainFrame)
        tabLagBtn.Position = UDim2.new(0, isAuthorizedAdmin and 103 or 148, 0, 45)
        tabLagBtn.Size = UDim2.new(0, tabWidth, 0, 28)
        tabLagBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
        tabLagBtn.BorderSizePixel = 0
        tabLagBtn.Font = Enum.Font.GothamBold
        tabLagBtn.Text = "fix lag"
        tabLagBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        tabLagBtn.TextSize = 11
        Instance.new("UICorner", tabLagBtn).CornerRadius = UDim.new(0, 6)

        local tabChatBtn = Instance.new("TextButton", mainFrame)
        tabChatBtn.Position = UDim2.new(0, 198, 0, 45)
        tabChatBtn.Size = UDim2.new(0, 90, 0, 28)
        tabChatBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
        tabChatBtn.BorderSizePixel = 0
        tabChatBtn.Font = Enum.Font.GothamBold
        tabChatBtn.Text = "admin chat"
        tabChatBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        tabChatBtn.TextSize = 11
        Instance.new("UICorner", tabChatBtn).CornerRadius = UDim.new(0, 6)
        
        if not isAuthorizedAdmin then
            tabChatBtn.Visible = false
            tabHopBtn.Size = UDim2.new(0, 138, 0, 28)
            tabLagBtn.Position = UDim2.new(0, 150, 0, 45)
            tabLagBtn.Size = UDim2.new(0, 138, 0, 28)
        end

        local hopContainer = Instance.new("Frame", mainFrame)
        hopContainer.Position = UDim2.new(0, 0, 0, 80)
        hopContainer.Size = UDim2.new(1, 0, 1, -80)
        hopContainer.BackgroundTransparency = 1
        hopContainer.Visible = true

        local nowLabel = Instance.new("TextLabel", hopContainer)
        nowLabel.Position = UDim2.new(0, 10, 0, 5)
        nowLabel.Size = UDim2.new(1, -20, 0, 22)
        nowLabel.BackgroundTransparency = 1
        nowLabel.Font = Enum.Font.GothamBold
        nowLabel.TextXAlignment = Enum.TextXAlignment.Left
        nowLabel.TextColor3 = Color3.fromRGB(100, 220, 100)
        nowLabel.TextSize = 12

        local statusLabel = Instance.new("TextLabel", hopContainer)
        statusLabel.Position = UDim2.new(0, 10, 0, 30)
        statusLabel.Size = UDim2.new(1, -20, 0, 25)
        statusLabel.BackgroundTransparency = 1
        statusLabel.Font = Enum.Font.Gotham
        statusLabel.TextXAlignment = Enum.TextXAlignment.Left
        statusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
        statusLabel.TextSize = 11
        statusLabel.TextWrapped = true

        local maxLabel = Instance.new("TextLabel", hopContainer)
        maxLabel.Position = UDim2.new(0, 10, 0, 60)
        maxLabel.Size = UDim2.new(1, -20, 0, 18)
        maxLabel.BackgroundTransparency = 1
        maxLabel.Font = Enum.Font.Gotham
        maxLabel.TextXAlignment = Enum.TextXAlignment.Left
        maxLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
        maxLabel.TextSize = 11
        maxLabel.Text = "đổi server nếu số người vượt quá:"

        local maxBox = Instance.new("TextBox", hopContainer)
        maxBox.Position = UDim2.new(0, 10, 0, 82)
        maxBox.Size = UDim2.new(1, -20, 0, 26)
        maxBox.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
        maxBox.BorderSizePixel = 0
        maxBox.Font = Enum.Font.GothamBold
        maxBox.Text = "1"
        maxBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        maxBox.TextSize = 13
        maxBox.ClearTextOnFocus = false
        Instance.new("UICorner", maxBox).CornerRadius = UDim.new(0, 6)

        local hopBtn = Instance.new("TextButton", hopContainer)
        hopBtn.Position = UDim2.new(0, 10, 0, 118)
        hopBtn.Size = UDim2.new(0, 130, 0, 38)
        hopBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
        hopBtn.BorderSizePixel = 0
        hopBtn.Font = Enum.Font.GothamBold
        hopBtn.Text = "đổi server ngay"
        hopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        hopBtn.TextSize = 12
        Instance.new("UICorner", hopBtn).CornerRadius = UDim.new(0, 6)

        local autoBtn = Instance.new("TextButton", hopContainer)
        autoBtn.Position = UDim2.new(0, 150, 0, 118)
        autoBtn.Size = UDim2.new(0, 140, 0, 38)
        autoBtn.BackgroundColor3 = Color3.fromRGB(40, 120, 70)
        autoBtn.BorderSizePixel = 0
        autoBtn.Font = Enum.Font.GothamBold
        autoBtn.Text = "tự động hop: tắt"
        autoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        autoBtn.TextSize = 11
        Instance.new("UICorner", autoBtn).CornerRadius = UDim.new(0, 6)

        local lagContainer = Instance.new("Frame", mainFrame)
        lagContainer.Position = UDim2.new(0, 0, 0, 80)
        lagContainer.Size = UDim2.new(1, 0, 1, -80)
        lagContainer.BackgroundTransparency = 1
        lagContainer.Visible = false

        local reduceGfxBtn = Instance.new("TextButton", lagContainer)
        reduceGfxBtn.Position = UDim2.new(0, 15, 0, 15)
        reduceGfxBtn.Size = UDim2.new(1, -30, 0, 42)
        reduceGfxBtn.BackgroundColor3 = Color3.fromRGB(40, 120, 180)
        reduceGfxBtn.BorderSizePixel = 0
        reduceGfxBtn.Font = Enum.Font.GothamBold
        reduceGfxBtn.Text = "⚡ giảm đồ họa & tắt đổ bóng"
        reduceGfxBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        reduceGfxBtn.TextSize = 12
        Instance.new("UICorner", reduceGfxBtn).CornerRadius = UDim.new(0, 6)

        local boostFpsBtn = Instance.new("TextButton", lagContainer)
        boostFpsBtn.Position = UDim2.new(0, 15, 0, 68)
        boostFpsBtn.Size = UDim2.new(1, -30, 0, 42)
        boostFpsBtn.BackgroundColor3 = Color3.fromRGB(50, 160, 90)
        boostFpsBtn.BorderSizePixel = 0
        boostFpsBtn.Font = Enum.Font.GothamBold
        boostFpsBtn.Text = "🚀 tối ưu hóa fps (boost game)"
        boostFpsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        boostFpsBtn.TextSize = 12
        Instance.new("UICorner", boostFpsBtn).CornerRadius = UDim.new(0, 6)

        reduceGfxBtn.MouseButton1Click:Connect(function()
            pcall(function()
                lighting.GlobalShadows = false
                lighting.FogEnd = 999999
                for _, v in ipairs(lighting:GetChildren()) do
                    if v:IsA("PostEffect") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") then
                        v.Enabled = false
                    end
                end
                if terrain then
                    terrain.WaterWaveSize = 0
                    terrain.WaterWaveSpeed = 0
                    terrain.WaterTransparency = 0
                    terrain.WaterReflectance = 0
                end
            end)
            reduceGfxBtn.Text = "✓ đã giảm đồ họa thành công!"
            task.wait(1.5)
            reduceGfxBtn.Text = "⚡ giảm đồ họa & tắt đổ bóng"
        end)

        boostFpsBtn.MouseButton1Click:Connect(function()
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
            boostFpsBtn.Text = "✓ đã tăng fps tối đa!"
            task.wait(1.5)
            boostFpsBtn.Text = "🚀 tối ưu hóa fps (boost game)"
        end)

        local chatContainer = Instance.new("Frame", mainFrame)
        chatContainer.Position = UDim2.new(0, 0, 0, 80)
        chatContainer.Size = UDim2.new(1, 0, 1, -80)
        chatContainer.BackgroundTransparency = 1
        chatContainer.Visible = false

        local chatScroll = Instance.new("ScrollingFrame", chatContainer)
        chatScroll.Position = UDim2.new(0, 10, 0, 5)
        chatScroll.Size = UDim2.new(1, -20, 0, 110)
        chatScroll.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
        chatScroll.BorderSizePixel = 0
        chatScroll.CanvasSize = UDim2.new(0, 0, 2, 0)
        Instance.new("UICorner", chatScroll).CornerRadius = UDim.new(0, 6)

        local uiList = Instance.new("UIListLayout", chatScroll)
        uiList.SortOrder = Enum.SortOrder.LayoutOrder
        uiList.Padding = UDim.new(0, 4)

        local chatBox = Instance.new("TextBox", chatContainer)
        chatBox.Position = UDim2.new(0, 10, 0, 122)
        chatBox.Size = UDim2.new(1, -85, 0, 32)
        chatBox.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
        chatBox.BorderSizePixel = 0
        chatBox.Font = Enum.Font.Gotham
        chatBox.PlaceholderText = "nhập nội dung thông điệp..."
        chatBox.Text = ""
        chatBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        chatBox.TextSize = 12
        Instance.new("UICorner", chatBox).CornerRadius = UDim.new(0, 6)

        local sendBtn = Instance.new("TextButton", chatContainer)
        sendBtn.Position = UDim2.new(1, -70, 0, 122)
        sendBtn.Size = UDim2.new(0, 60, 0, 32)
        sendBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
        sendBtn.BorderSizePixel = 0
        sendBtn.Font = Enum.Font.GothamBold
        sendBtn.Text = "gửi"
        sendBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        sendBtn.TextSize = 12
        Instance.new("UICorner", sendBtn).CornerRadius = UDim.new(0, 6)

        tabHopBtn.MouseButton1Click:Connect(function()
            hopContainer.Visible = true
            lagContainer.Visible = false
            chatContainer.Visible = false
            tabHopBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
            tabHopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            tabLagBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
            tabLagBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
            if isAuthorizedAdmin then
                tabChatBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
                tabChatBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
            end
        end)

        tabLagBtn.MouseButton1Click:Connect(function()
            hopContainer.Visible = false
            lagContainer.Visible = true
            chatContainer.Visible = false
            tabLagBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
            tabLagBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            tabHopBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
            tabHopBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
            if isAuthorizedAdmin then
                tabChatBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
                tabChatBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
            end
        end)

        if isAuthorizedAdmin then
            tabChatBtn.MouseButton1Click:Connect(function()
                hopContainer.Visible = false
                lagContainer.Visible = false
                chatContainer.Visible = true
                tabChatBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
                tabChatBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                tabHopBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
                tabHopBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
                tabLagBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
                tabLagBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
            end)

            local function addLogMessage(sender, msg)
                local msgLabel = Instance.new("TextLabel")
                msgLabel.Parent = chatScroll
                msgLabel.Size = UDim2.new(1, -5, 0, 20)
                msgLabel.BackgroundTransparency = 1
                msgLabel.Font = Enum.Font.GothamBold
                msgLabel.TextXAlignment = Enum.TextXAlignment.Left
                msgLabel.Text = "[" .. sender .. "]: " .. msg
                msgLabel.TextColor3 = Color3.fromRGB(255, 150, 150)
                msgLabel.TextSize = 11
                chatScroll.CanvasSize = UDim2.new(0, 0, 0, uiList.AbsoluteContentSize.Y + 10)
            end

            addLogMessage("hệ thống", "admin chat nicexchilli v7.2 đã sẵn sàng.")

            sendBtn.MouseButton1Click:Connect(function()
                if chatBox.Text ~= "" then
                    local content = chatBox.Text
                    local senderName = localPlayer.Name
                    
                    addLogMessage(senderName, content)
                    
                    pcall(function()
                        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(content, "All")
                    end)
                    
                    chatBox.Text = ""
                end
            end)
        end

        task.spawn(function()
            while screenGui.Parent do
                local count = #players:GetPlayers()
                nowLabel.Text = "số người ở server hiện tại: " .. count
                task.wait(1)
            end
        end)

        local function getRandomServer()
            local url = "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100"
            local ok, raw = pcall(function() return game:HttpGet(url) end)
            if not ok or not raw or raw == "" then return nil end
            local ok2, data = pcall(httpService.JSONDecode, httpService, raw)
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
            local threshold = math.max(1, math.floor(tonumber(maxBox.Text) or 1))
            local currentCount = #players:GetPlayers()
            if currentCount <= threshold then
                statusLabel.Text = "✓ server có " .. currentCount .. " người. không cần hop."
                statusLabel.TextColor3 = Color3.fromRGB(100, 220, 100)
                return false
            end
            statusLabel.Text = "đang tìm server khác..."
            statusLabel.TextColor3 = Color3.fromRGB(255, 200, 50)
            task.wait(0.5)
            local serverId = getRandomServer()
            if not serverId then
                statusLabel.Text = "lỗi lấy danh sách server!"
                statusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
                return false
            end
            statusLabel.Text = "đang chuyển server..."
            statusLabel.TextColor3 = Color3.fromRGB(120, 180, 255)
            task.wait(0.5)
            pcall(function()
                teleportService:TeleportToPlaceInstance(placeId, serverId, localPlayer)
            end)
            return true
        end

        hopBtn.MouseButton1Click:Connect(function()
            hopBtn.Active = false
            hopOnce()
            task.wait(2)
            hopBtn.Active = true
        end)

        local autoEnabled = false
        local autoThread = nil

        autoBtn.MouseButton1Click:Connect(function()
            autoEnabled = not autoEnabled
            if autoEnabled then
                autoBtn.Text = "tự động hop: bật"
                autoBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
                autoThread = task.spawn(function()
                    while autoEnabled and screenGui.Parent do
                        local threshold = math.max(1, math.floor(tonumber(maxBox.Text) or 1))
                        local count = #players:GetPlayers()
                        if count <= threshold then
                            statusLabel.Text = "✓ đang ở mức phù hợp (" .. count .. " người). chờ..."
                            statusLabel.TextColor3 = Color3.fromRGB(100, 220, 100)
                            task.wait(3)
                        else
                            hopOnce()
                            task.wait(5)
                        end
                    end
                end)
            else
                autoBtn.Text = "tự động hop: tắt"
                autoBtn.BackgroundColor3 = Color3.fromRGB(40, 120, 70)
                if autoThread then
                    task.cancel(autoThread)
                    autoThread = nil
                end
                statusLabel.Text = "đã tắt tự động hop."
                statusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
            end
        end)
    end

    task.spawn(function()
        task.wait(0.5)
        createServerHopGUI()
    end)
end

-- =========================================================================
-- 🔑 key system 4k 4d (v7.2 code to free key - có content-creatos)
-- =========================================================================
local function showKeySystem()
    if coreGui:FindFirstChild("NiceKeySystemGui") then
        coreGui.NiceKeySystemGui:Destroy()
    end

    local screenGui = Instance.new("ScreenGui", coreGui)
    screenGui.Name = "NiceKeySystemGui"
    screenGui.ResetOnSpawn = false

    local mainFrame = Instance.new("Frame", screenGui)
    mainFrame.BackgroundColor3 = Color3.fromRGB(14, 14, 22)
    mainFrame.BorderSizePixel = 0
    mainFrame.Position = UDim2.new(0.5, -190, 0.5, -150)
    mainFrame.Size = UDim2.new(0, 380, 0, 300)
    mainFrame.Active = true
    mainFrame.Draggable = true
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 16)
    
    local stroke = Instance.new("UIStroke", mainFrame)
    stroke.Color = Color3.fromRGB(255, 90, 130)
    stroke.Thickness = 2.5

    local title = Instance.new("TextLabel", mainFrame)
    title.Size = UDim2.new(1, 0, 0, 38)
    title.BackgroundColor3 = Color3.fromRGB(35, 20, 32)
    title.BorderSizePixel = 0
    title.Font = Enum.Font.GothamBold
    title.Text = "🔐 key system - nice chilli v7.2"
    title.TextColor3 = Color3.fromRGB(255, 140, 165)
    title.TextSize = 13
    Instance.new("UICorner", title).CornerRadius = UDim.new(0, 16)

    local keyBox = Instance.new("TextBox", mainFrame)
    keyBox.Position = UDim2.new(0, 15, 0, 48)
    keyBox.Size = UDim2.new(1, -30, 0, 34)
    keyBox.BackgroundColor3 = Color3.fromRGB(25, 25, 38)
    keyBox.BorderSizePixel = 0
    keyBox.Font = Enum.Font.Gotham
    keyBox.PlaceholderText = "nhập key..."
    keyBox.Text = ""
    keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyBox.TextSize = 12
    keyBox.ClearTextOnFocus = false
    Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0, 8)
    local boxStroke = Instance.new("UIStroke", keyBox)
    boxStroke.Color = Color3.fromRGB(80, 80, 110)
    boxStroke.Thickness = 1.5

    local getKeyBtn = Instance.new("TextButton", mainFrame)
    getKeyBtn.Position = UDim2.new(0, 15, 0, 90)
    getKeyBtn.Size = UDim2.new(0, 170, 0, 34)
    getKeyBtn.BackgroundColor3 = Color3.fromRGB(50, 120, 190)
    getKeyBtn.BorderSizePixel = 0
    getKeyBtn.Font = Enum.Font.GothamBold
    getKeyBtn.Text = "🌐 lấy key (get key)"
    getKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    getKeyBtn.TextSize = 12
    Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0, 8)

    local checkKeyBtn = Instance.new("TextButton", mainFrame)
    checkKeyBtn.Position = UDim2.new(1, -185, 0, 90)
    checkKeyBtn.Size = UDim2.new(0, 170, 0, 34)
    checkKeyBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 90)
    checkKeyBtn.BorderSizePixel = 0
    checkKeyBtn.Font = Enum.Font.GothamBold
    checkKeyBtn.Text = "✓ xác nhận (check key)"
    checkKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    checkKeyBtn.TextSize = 12
    Instance.new("UICorner", checkKeyBtn).CornerRadius = UDim.new(0, 8)

    local codeTitle = Instance.new("TextLabel", mainFrame)
    codeTitle.Position = UDim2.new(0, 15, 0, 132)
    codeTitle.Size = UDim2.new(1, -30, 0, 18)
    codeTitle.BackgroundTransparency = 1
    codeTitle.Font = Enum.Font.GothamBold
    codeTitle.Text = "🎁 code to free key"
    codeTitle.TextColor3 = Color3.fromRGB(255, 210, 100)
    codeTitle.TextSize = 12

    local codeBox = Instance.new("TextBox", mainFrame)
    codeBox.Position = UDim2.new(0, 15, 0, 156)
    codeBox.Size = UDim2.new(1, -115, 0, 34)
    codeBox.BackgroundColor3 = Color3.fromRGB(25, 25, 38)
    codeBox.BorderSizePixel = 0
    codeBox.Font = Enum.Font.Gotham
    codeBox.PlaceholderText = "nhập code..."
    codeBox.Text = ""
    codeBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    codeBox.TextSize = 12
    codeBox.ClearTextOnFocus = false
    Instance.new("UICorner", codeBox).CornerRadius = UDim.new(0, 8)
    local cBoxStroke = Instance.new("UIStroke", codeBox)
    cBoxStroke.Color = Color3.fromRGB(150, 100, 200)
    cBoxStroke.Thickness = 1.5

    local submitCodeBtn = Instance.new("TextButton", mainFrame)
    submitCodeBtn.Position = UDim2.new(1, -95, 0, 156)
    submitCodeBtn.Size = UDim2.new(0, 80, 0, 34)
    submitCodeBtn.BackgroundColor3 = Color3.fromRGB(180, 80, 140)
    submitCodeBtn.BorderSizePixel = 0
    submitCodeBtn.Font = Enum.Font.GothamBold
    submitCodeBtn.Text = "nhập code"
    submitCodeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    submitCodeBtn.TextSize = 11
    Instance.new("UICorner", submitCodeBtn).CornerRadius = UDim.new(0, 8)

    local keyDisplayLabel = Instance.new("TextLabel", mainFrame)
    keyDisplayLabel.Position = UDim2.new(0, 15, 0, 200)
    keyDisplayLabel.Size = UDim2.new(1, -30, 0, 32)
    keyDisplayLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    keyDisplayLabel.BorderSizePixel = 0
    keyDisplayLabel.Font = Enum.Font.GothamBold
    keyDisplayLabel.Text = "key của bạn: [chưa nhập code]"
    keyDisplayLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
    keyDisplayLabel.TextSize = 11
    Instance.new("UICorner", keyDisplayLabel).CornerRadius = UDim.new(0, 8)
    local kdStroke = Instance.new("UIStroke", keyDisplayLabel)
    kdStroke.Color = Color3.fromRGB(70, 70, 100)
    kdStroke.Thickness = 1

    local statusText = Instance.new("TextLabel", mainFrame)
    statusText.Position = UDim2.new(0, 15, 0, 246)
    statusText.Size = UDim2.new(1, -30, 0, 24)
    statusText.BackgroundTransparency = 1
    statusText.Font = Enum.Font.GothamBold
    statusText.Text = "⭐ nhập code nhận key miễn phí ngay!"
    statusText.TextColor3 = Color3.fromRGB(150, 220, 255)
    statusText.TextSize = 11

    getKeyBtn.MouseButton1Click:Connect(function()
        pcall(function()
            setclipboard(keyLink)
        end)
    end)

    checkKeyBtn.MouseButton1Click:Connect(function()
        local inputVal = keyBox.Text
        if inputVal ~= "" then
            screenGui:Destroy()
            launchMainScript()
        end
    end)

    submitCodeBtn.MouseButton1Click:Connect(function()
        local enteredCode = codeBox.Text
        local prefix = validCodes[enteredCode]
        
        if prefix then
            local generatedKey = prefix .. math.random(1000, 9999)
            
            keyDisplayLabel.Text = "key của bạn: " .. generatedKey
            keyDisplayLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
            keyBox.Text = generatedKey
            statusText.Text = "✓ nhập code thành công! đã tạo key."
            statusText.TextColor3 = Color3.fromRGB(100, 255, 100)
            
            pcall(function()
                setclipboard(generatedKey)
            end)
        else
            keyDisplayLabel.Text = "key của bạn: [code không hợp lệ]"
            keyDisplayLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
            statusText.Text = "❌ code sai hoặc không tồn tại!"
            statusText.TextColor3 = Color3.fromRGB(255, 80, 80)
        end
    end)
end

showKeySystem()






