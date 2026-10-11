local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local DISCORD_LINK = "https://discord.gg/uqhEpzXy9q"
local SCRIPT_LIST_URL = "https://raw.githubusercontent.com/bn130189-lgtm/Tong-hop-script/main/script.json"

local function CopyDiscord()
    local fn = setclipboard or toclipboard
    return fn and pcall(fn, DISCORD_LINK)
end
task.spawn(CopyDiscord)

-- Avatar
local CUSTOM_AVATAR = "rbxassetid://97608172188347"

-- 📱 Tính kích thước tự động theo màn hình
local Screen = workspace.CurrentCamera.ViewportSize
local SCREEN_WIDTH = Screen.X

-- Kích thước cho màn hình nhỏ (360dp)
local MAIN_WIDTH = if SCREEN_WIDTH < 400 then 330 else 400
local MAIN_HEIGHT = if SCREEN_WIDTH < 400 then 400 else 450
local SIDEBAR_WIDTH = if SCREEN_WIDTH < 400 then 110 else 130
local PADDING_SIDE = if SCREEN_WIDTH < 400 then 10 else 20

local CurrentThemeColor = Color3.fromRGB(220, 70, 85)

-- Xóa giao diện cũ
local oldUI = PlayerGui:FindFirstChild("AtrasGiaBinhUI")
if oldUI then oldUI:Destroy() end

local Gui = Instance.new("ScreenGui")
Gui.Name = "AtrasGiaBinhUI"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.DisplayOrder = 100
Gui.Parent = PlayerGui

-- === KHUNG CHÍNH ===
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(MAIN_WIDTH, MAIN_HEIGHT)
Main.Position = UDim2.new(0.5, -MAIN_WIDTH/2, 0.5, -MAIN_HEIGHT/2) -- Luôn chính giữa
Main.BackgroundColor3 = Color3.fromRGB(5, 5, 10)
Main.BackgroundTransparency = 0.55
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Active = true
Main.Parent = Gui

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 20)
local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Color = Color3.fromRGB(75, 35, 40)
MainStroke.Thickness = 1

-- === THANH TIÊU ĐỀ ===
local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1, 0, 0, 46)
TopBar.BackgroundColor3 = Color3.fromRGB(3, 3, 8)
TopBar.BackgroundTransparency = 0.6

local HubTitle = Instance.new("TextLabel", TopBar)
HubTitle.Size = UDim2.new(1, -50, 1, 0)
HubTitle.Position = UDim2.new(0, 12, 0, 0)
HubTitle.BackgroundTransparency = 1
HubTitle.Text = "ATRAS | GIABÌNH"
HubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
HubTitle.TextSize = SCREEN_WIDTH < 400 and 15 or 17
HubTitle.Font = Enum.Font.GothamBold
HubTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Nút đóng
local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.Size = UDim2.fromOffset(32, 32)
CloseBtn.Position = UDim2.new(1, -36, 0, 7)
CloseBtn.BackgroundColor3 = Color3.fromRGB(40, 20, 25)
CloseBtn.BackgroundTransparency = 0.65
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 18
CloseBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 8)

CloseBtn.MouseButton1Click:Connect(function()
    Gui:Destroy()
end)

-- === THANH BÊN TRÁI ===
local Sidebar = Instance.new("Frame", Main)
Sidebar.Size = UDim2.fromOffset(SIDEBAR_WIDTH, -46)
Sidebar.Position = UDim2.new(0, 0, 0, 46)
Sidebar.BackgroundColor3 = Color3.fromRGB(6, 7, 14)
Sidebar.BackgroundTransparency = 0.58
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 12)

-- Thông tin người dùng
local UserBox = Instance.new("Frame", Sidebar)
UserBox.Size = UDim2.new(1, -8, 0, 50)
UserBox.Position = UDim2.new(0, 4, 0, 6)
UserBox.BackgroundColor3 = Color3.fromRGB(3, 3, 8)
UserBox.BackgroundTransparency = 0.62
Instance.new("UICorner", UserBox).CornerRadius = UDim.new(0, 10)

-- Avatar
local Avatar = Instance.new("ImageLabel", UserBox)
Avatar.Size = UDim2.fromOffset(32, 32)
Avatar.Position = UDim2.new(0, 6, 0.5, -16)
Avatar.BackgroundTransparency = 1
Avatar.Image = CUSTOM_AVATAR
Instance.new("UICorner", Avatar).CornerRadius = UDim.new(1, 0)

local DisplayName = Instance.new("TextLabel", UserBox)
DisplayName.Size = UDim2.new(1, -44, 0, 16)
DisplayName.Position = UDim2.new(0, 44, 0, 7)
DisplayName.BackgroundTransparency = 1
DisplayName.Text = Player.Name
DisplayName.TextColor3 = Color3.fromRGB(255, 255, 255)
DisplayName.TextSize = 10
DisplayName.Font = Enum.Font.GothamBold
DisplayName.TextXAlignment = Enum.TextXAlignment.Left

local UserRole = Instance.new("TextLabel", UserBox)
UserRole.Size = UDim2.new(1, -44, 0, 12)
UserRole.Position = UDim2.new(0, 44, 0, 27)
UserRole.BackgroundTransparency = 1
UserRole.Text = "💎 Premium"
UserRole.TextColor3 = CurrentThemeColor
UserRole.TextSize = 8
UserRole.Font = Enum.Font.GothamSemibold
UserRole.TextXAlignment = Enum.TextXAlignment.Left

-- Danh sách menu
local MenuList = Instance.new("ScrollingFrame", Sidebar)
MenuList.Size = UDim2.new(1, 0, 1, -62)
MenuList.Position = UDim2.new(0, 0, 0, 56)
MenuList.BackgroundTransparency = 1
MenuList.ScrollBarThickness = 0
MenuList.CanvasSize = UDim2.new()

local MenuLayout = Instance.new("UIListLayout", MenuList)
MenuLayout.Padding = UDim.new(0, 5)
MenuLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- === KHU VỰC NỘI DUNG CHÍNH ===
local PagesContainer = Instance.new("Frame", Main)
PagesContainer.Size = UDim2.new(1, -SIDEBAR_WIDTH - PADDING_SIDE/2, 1, -52)
PagesContainer.Position = UDim2.new(0, SIDEBAR_WIDTH + PADDING_SIDE/2, 0, 48)
PagesContainer.BackgroundTransparency = 1
PagesContainer.ClipsDescendants = true

-- Tạo trang script
local function CreateScriptPage()
    local Page = Instance.new("Frame", PagesContainer)
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.Visible = false

    local SearchBox = Instance.new("TextBox", Page)
    SearchBox.Size = UDim2.new(1, 0, 0, 36)
    SearchBox.Position = UDim2.new(0, 0, 0, 0)
    SearchBox.BackgroundColor3 = Color3.fromRGB(3, 3, 8)
    SearchBox.BackgroundTransparency = 0.62
    SearchBox.PlaceholderText = "🔍 Tìm script..."
    SearchBox.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)
    SearchBox.Text = ""
    SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    SearchBox.TextSize = 12
    SearchBox.Font = Enum.Font.GothamSemibold
    SearchBox.ClearTextOnFocus = false
    Instance.new("UICorner", SearchBox).CornerRadius = UDim.new(0, 10)
    local SearchStroke = Instance.new("UIStroke", SearchBox)
    SearchStroke.Color = Color3.fromRGB(45, 25, 30)
    SearchStroke.Thickness = 1

    local StatusBadge = Instance.new("TextLabel", Page)
    StatusBadge.Size = UDim2.new(1, 0, 0, 14)
    StatusBadge.Position = UDim2.new(0, 0, 0, 44)
    StatusBadge.BackgroundTransparency = 1
    StatusBadge.Text = "✅ KHÔNG CẦN KEY"
    StatusBadge.TextColor3 = CurrentThemeColor
    StatusBadge.TextSize = 9
    StatusBadge.Font = Enum.Font.GothamBold
    StatusBadge.TextXAlignment = Enum.TextXAlignment.Left

    local ScriptScroll = Instance.new("ScrollingFrame", Page)
    ScriptScroll.Size = UDim2.new(1, 0, 1, -60)
    ScriptScroll.Position = UDim2.new(0, 0, 0, 58)
    ScriptScroll.BackgroundTransparency = 1
    ScriptScroll.ScrollBarThickness = 3
    ScriptScroll.ScrollBarImageColor3 = CurrentThemeColor
    ScriptScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    ScriptScroll.CanvasSize = UDim2.new()

    local ScriptLayout = Instance.new("UIListLayout", ScriptScroll)
    ScriptLayout.Padding = UDim.new(0, 6)

    local AllScriptButtons = {}

    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local query = SearchBox.Text:lower()
        for _, item in ipairs(AllScriptButtons) do
            item.Button.Visible = query == "" or item.Name:find(query)
        end
    end)

    return Page, ScriptScroll, AllScriptButtons
end

local StealPage, StealScroll, StealItems = CreateScriptPage()
local BloxFruitPage, BloxFruitScroll, BloxFruitItems = CreateScriptPage()
local MM2Page, MM2Scroll, MM2Items = CreateScriptPage()
local RidePetsPage, RidePetsScroll, RidePetsItems = CreateScriptPage()

StealPage.Visible = true

-- Thêm mục script
local function PopulateScriptItems(ScrollFrame, ItemTable, ListData)
    if type(ListData) ~= "table" then return end
    for _, item in ipairs(ListData) do
        if item.Name and item.Url then
            local Btn = Instance.new("TextButton", ScrollFrame)
            Btn.Size = UDim2.new(1, 0, 0, 40)
            Btn.BackgroundColor3 = Color3.fromRGB(5, 5, 12)
            Btn.BackgroundTransparency = 0.65
            Btn.Text = ""
            Btn.AutoButtonColor = false
            Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 10)
            local BtnStroke = Instance.new("UIStroke", Btn)
            BtnStroke.Color = Color3.fromRGB(35, 20, 25)
            BtnStroke.Thickness = 1

            local NameLabel = Instance.new("TextLabel", Btn)
            NameLabel.Size = UDim2.new(1, -30, 1, 0)
            NameLabel.Position = UDim2.new(0, 10, 0, 0)
            NameLabel.BackgroundTransparency = 1
            NameLabel.Text = item.Name
            NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            NameLabel.TextSize = 11
            NameLabel.Font = Enum.Font.GothamSemibold
            NameLabel.TextXAlignment = Enum.TextXAlignment.Left

            local PlayIcon = Instance.new("TextLabel", Btn)
            PlayIcon.Size = UDim2.fromOffset(20, 20)
            PlayIcon.Position = UDim2.new(1, -26, 0.5, -10)
            PlayIcon.BackgroundTransparency = 1
            PlayIcon.Text = "▶"
            PlayIcon.TextColor3 = Color3.fromRGB(200, 200, 200)
            PlayIcon.TextSize = 12
            PlayIcon.Font = Enum.Font.GothamBold

            Btn.MouseEnter:Connect(function()
                TweenService:Create(Btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(35, 22, 28), BackgroundTransparency = 0.45}):Play()
                PlayIcon.TextColor3 = CurrentThemeColor
                BtnStroke.Color = CurrentThemeColor
            end)
            Btn.MouseLeave:Connect(function()
                TweenService:Create(Btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(5, 5, 12), BackgroundTransparency = 0.65}):Play()
                PlayIcon.TextColor3 = Color3.fromRGB(200, 200, 200)
                BtnStroke.Color = Color3.fromRGB(35, 20, 25)
            end)

            Btn.MouseButton1Click:Connect(function()
                NameLabel.Text = "⏳ Đang tải..."
                NameLabel.TextColor3 = CurrentThemeColor
                local Success, Error = pcall(function() loadstring(game:HttpGet(item.Url))() end)
                if Success then
                    NameLabel.Text = "✅ Thành công"
                    NameLabel.TextColor3 = Color3.fromRGB(90, 210, 130)
                    task.spawn(CopyDiscord)
                else
                    NameLabel.Text = "❌ Lỗi"
                    NameLabel.TextColor3 = Color3.fromRGB(255, 85, 95)
                    warn("[Atras] " .. tostring(Error))
                end
            end)

            table.insert(ItemTable, {Button = Btn, Name = item.Name:lower()})
        end
    end
end

-- Tải danh sách script
task.spawn(function()
    local Success, Response = pcall(function() return game:HttpGet(SCRIPT_LIST_URL) end)
    if Success then
        local DecodeSuccess, ScriptData = pcall(function() return HttpService:JSONDecode(Response) end)
        if DecodeSuccess and type(ScriptData) == "table" then
            local stealList = ScriptData["Steal an egg"] or ScriptData["Steal An Egg"]
            if stealList then PopulateScriptItems(StealScroll, StealItems, stealList) end

            local bloxList = ScriptData["Blox Fruit"] or ScriptData["Bloxfruit"] or ScriptData["Blox Fruits"]
            if bloxList then PopulateScriptItems(BloxFruitScroll, BloxFruitItems, bloxList) end

            local mm2List = ScriptData["MM2"] or ScriptData["Murder Mystery 2"]
            if mm2List then PopulateScriptItems(MM2Scroll, MM2Items, mm2List) end

            local ridePetsList = ScriptData["Ride a pets"] or ScriptData["Ride a Pets"] or ScriptData["RidePets"]
            if ridePetsList then PopulateScriptItems(RidePetsScroll, RidePetsItems, ridePetsList) end
        end
    end
end)

-- Tạo nút menu
local MenuButtons = {}
local CurrentPage = StealPage

local function SwitchPage(NewPage)
    CurrentPage.Visible = false
    NewPage.Visible = true
    CurrentPage = NewPage
end

local function CreateMenuButton(Text, TargetPage, IsActive)
    local Btn = Instance.new("TextButton", MenuList)
    Btn.Size = UDim2.new(1, -8, 0, 36)
    Btn.BackgroundColor3 = IsActive and Color3.fromRGB(45, 22, 28) or Color3.fromRGB(8, 8, 16)
    Btn.BackgroundTransparency = IsActive and 0.45 or 0.65
    Btn.Text = Text
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.TextSize = SCREEN_WIDTH < 400 and 9 or 10
    Btn.Font = Enum.Font.GothamBold
    Btn.AutoButtonColor = false
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)

    Btn.MouseButton1Click:Connect(function()
        for _, b in ipairs(MenuButtons) do
            b.BackgroundColor3 = Color3.fromRGB(8, 8, 16)
            b.BackgroundTransparency = 0.65
        end
        Btn.BackgroundColor3 = Color3.fromRGB(45, 22, 28)
        Btn.BackgroundTransparency = 0.45
        SwitchPage(TargetPage)
    end)

    table.insert(MenuButtons, Btn)
    return Btn
end

-- Các mục menu
CreateMenuButton("🥚 Trộm Trứng", StealPage, true)
CreateMenuButton("🍊 Blox Fruit", BloxFruitPage, false)
CreateMenuButton("🔪 MM2", MM2Page, false)
CreateMenuButton("🐾 Ride Pets", RidePetsPage, false)
                
