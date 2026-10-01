local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local DISCORD_LINK = "https://discord.gg/uqhEpzXy9q"
local SCRIPT_LIST_URL = "https://raw.githubusercontent.com/bn130189-lgtm/Tong-hop-script/main/script.json"

local function CopyDiscord()
    local fn = setclipboard or toclipboard
    return fn and pcall(fn, DISCORD_LINK)
end

-- Tự động copy link Discord ngay khi vừa bật script
task.spawn(CopyDiscord)

local successThumbnail, playerAvatarUrl = pcall(function()
    return Players:GetUserThumbnailAsync(Player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
end)
local CUSTOM_AVATAR = successThumbnail and playerAvatarUrl or "rbxassetid://0"

local MIN_SCALE, MAX_SCALE, DEFAULT_SCALE = 0.55, 1.15, 0.75

for _, name in ipairs({"AtrasGiaBinhSidebarV5", "AtrasIconSidebarV5"}) do
    local old = PlayerGui:FindFirstChild(name)
    if old then old:Destroy() end
end

local CurrentThemeColor = Color3.fromRGB(140, 100, 255)

local Gui = Instance.new("ScreenGui")
Gui.Name = "AtrasGiaBinhSidebarV5"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.DisplayOrder = 100
Gui.Parent = PlayerGui

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(640, 380)
Main.Position = UDim2.new(0.5, -320, 0.5, -190)
Main.BackgroundColor3 = Color3.fromRGB(18, 19, 26)
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Active = true
Main.Parent = Gui

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 16)
local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Color = Color3.fromRGB(55, 58, 75)
MainStroke.Thickness = 1.4

local UIScale = Instance.new("UIScale", Main)
UIScale.Scale = DEFAULT_SCALE

local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1, 0, 0, 38)
TopBar.BackgroundColor3 = Color3.fromRGB(13, 14, 20)
TopBar.BorderSizePixel = 0

local HubTitle = Instance.new("TextLabel", TopBar)
HubTitle.Size = UDim2.new(1, -60, 1, 0)
HubTitle.Position = UDim2.new(0, 16, 0, 0)
HubTitle.BackgroundTransparency = 1
HubTitle.Text = "Atras | GiaBìnhHub v1.0"
HubTitle.TextColor3 = Color3.fromRGB(220, 223, 240)
HubTitle.TextSize = 13
HubTitle.Font = Enum.Font.GothamBold
HubTitle.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.Size = UDim2.fromOffset(32, 32)
CloseBtn.Position = UDim2.new(1, -34, 0, 3)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(220, 223, 240)
CloseBtn.TextSize = 22
CloseBtn.Font = Enum.Font.GothamBold

CloseBtn.MouseButton1Click:Connect(function()
    Main.Visible = false
end)

local Sidebar = Instance.new("Frame", Main)
Sidebar.Size = UDim2.new(0, 200, 1, -38)
Sidebar.Position = UDim2.new(0, 0, 0, 38)
Sidebar.BackgroundColor3 = Color3.fromRGB(22, 23, 31)
Sidebar.BorderSizePixel = 0
Sidebar.ClipsDescendants = true

local UserBox = Instance.new("Frame", Sidebar)
UserBox.Size = UDim2.new(1, -16, 0, 52)
UserBox.Position = UDim2.new(0, 8, 0, 10)
UserBox.BackgroundColor3 = Color3.fromRGB(15, 16, 22)
Instance.new("UICorner", UserBox).CornerRadius = UDim.new(0, 12)

local Avatar = Instance.new("ImageLabel", UserBox)
Avatar.Size = UDim2.fromOffset(38, 38)
Avatar.Position = UDim2.new(0, 7, 0.5, -19)
Avatar.BackgroundTransparency = 1
Avatar.Image = CUSTOM_AVATAR
Instance.new("UICorner", Avatar).CornerRadius = UDim.new(1, 0)

local DisplayName = Instance.new("TextLabel", UserBox)
DisplayName.Size = UDim2.new(1, -52, 0, 20)
DisplayName.Position = UDim2.new(0, 50, 0, 8)
DisplayName.BackgroundTransparency = 1
DisplayName.Text = Player.Name
DisplayName.TextColor3 = Color3.fromRGB(255, 255, 255)
DisplayName.TextSize = 13
DisplayName.Font = Enum.Font.GothamBold
DisplayName.TextXAlignment = Enum.TextXAlignment.Left
DisplayName.TextTruncate = Enum.TextTruncate.AtEnd

local UserRole = Instance.new("TextLabel", UserBox)
UserRole.Size = UDim2.new(1, -52, 0, 16)
UserRole.Position = UDim2.new(0, 50, 0, 28)
UserRole.BackgroundTransparency = 1
UserRole.Text = "Atras User"
UserRole.TextColor3 = Color3.fromRGB(130, 245, 135)
UserRole.TextSize = 11
UserRole.Font = Enum.Font.GothamBold
UserRole.TextXAlignment = Enum.TextXAlignment.Left

local MenuList = Instance.new("ScrollingFrame", Sidebar)
MenuList.Size = UDim2.new(1, 0, 1, -72)
MenuList.Position = UDim2.new(0, 0, 0, 70)
MenuList.BackgroundTransparency = 1
MenuList.BorderSizePixel = 0
MenuList.ScrollBarThickness = 0
MenuList.AutomaticCanvasSize = Enum.AutomaticSize.Y
MenuList.CanvasSize = UDim2.new()

local MenuLayout = Instance.new("UIListLayout", MenuList)
MenuLayout.Padding = UDim.new(0, 6)
MenuLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
local PagesContainer = Instance.new("Frame", Main)
PagesContainer.Size = UDim2.new(1, -200, 1, -38)
PagesContainer.Position = UDim2.new(0, 200, 0, 38)
PagesContainer.BackgroundTransparency = 1
PagesContainer.ClipsDescendants = true

local function CreateScriptPage()
    local Page = Instance.new("Frame", PagesContainer)
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.Visible = false

    local SearchBox = Instance.new("TextBox", Page)
    SearchBox.Size = UDim2.new(1, -24, 0, 36)
    SearchBox.Position = UDim2.new(0, 12, 0, 14)
    SearchBox.BackgroundColor3 = Color3.fromRGB(14, 15, 21)
    SearchBox.PlaceholderText = "Search scripts..."
    SearchBox.PlaceholderColor3 = Color3.fromRGB(130, 135, 155)
    SearchBox.Text = ""
    SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    SearchBox.TextSize = 13
    SearchBox.Font = Enum.Font.GothamSemibold
    SearchBox.ClearTextOnFocus = false
    Instance.new("UICorner", SearchBox).CornerRadius = UDim.new(0, 12)

    local SearchPadding = Instance.new("UIPadding", SearchBox)
    SearchPadding.PaddingLeft = UDim.new(0, 14)

    local StatusBadge = Instance.new("TextLabel", Page)
    StatusBadge.Size = UDim2.new(1, -24, 0, 18)
    StatusBadge.Position = UDim2.new(0, 12, 0, 56)
    StatusBadge.BackgroundTransparency = 1
    StatusBadge.Text = "🟢 NO KEY REQUIRED / MULTI-SCRIPTS"
    StatusBadge.TextColor3 = Color3.fromRGB(130, 245, 135)
    StatusBadge.TextSize = 11
    StatusBadge.Font = Enum.Font.GothamBold
    StatusBadge.TextXAlignment = Enum.TextXAlignment.Left

    local ScriptScroll = Instance.new("ScrollingFrame", Page)
    ScriptScroll.Size = UDim2.new(1, -16, 1, -86)
    ScriptScroll.Position = UDim2.new(0, 12, 0, 78)
    ScriptScroll.BackgroundTransparency = 1
    ScriptScroll.BorderSizePixel = 0
    ScriptScroll.ScrollBarThickness = 3
    ScriptScroll.ScrollBarImageColor3 = CurrentThemeColor
    ScriptScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    ScriptScroll.CanvasSize = UDim2.new()

    local ScriptLayout = Instance.new("UIListLayout", ScriptScroll)
    ScriptLayout.Padding = UDim.new(0, 8)
    ScriptLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local AllScriptButtons = {}

    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local query = SearchBox.Text:lower()
        for _, item in ipairs(AllScriptButtons) do
            if query == "" or item.Name:find(query) then
                item.Button.Visible = true
            else
                item.Button.Visible = false
            end
        end
    end)

    return Page, ScriptScroll, AllScriptButtons
end

local StealPage, StealScroll, StealItems = CreateScriptPage()
local BloxFruitPage, BloxFruitScroll, BloxFruitItems = CreateScriptPage()
local MM2Page, MM2Scroll, MM2Items = CreateScriptPage()
local RidePetsPage, RidePetsScroll, RidePetsItems = CreateScriptPage()

StealPage.Visible = true

local function PopulateScriptItems(ScrollFrame, ItemTable, ListData)
    if type(ListData) ~= "table" then return end
    for _, item in ipairs(ListData) do
        if item.Name and item.Url then
            local Btn = Instance.new("TextButton", ScrollFrame)
            Btn.Size = UDim2.new(1, -8, 0, 42)
            Btn.BackgroundColor3 = Color3.fromRGB(24, 25, 34)
            Btn.Text = ""
            Btn.AutoButtonColor = false
            Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 12)

            local NameLabel = Instance.new("TextLabel", Btn)
            NameLabel.Size = UDim2.new(1, -44, 1, 0)
            NameLabel.Position = UDim2.new(0, 14, 0, 0)
            NameLabel.BackgroundTransparency = 1
            NameLabel.Text = item.Name
            NameLabel.TextColor3 = Color3.fromRGB(245, 247, 250)
            NameLabel.TextSize = 14
            NameLabel.Font = Enum.Font.GothamBold
            NameLabel.TextXAlignment = Enum.TextXAlignment.Left
            NameLabel.TextTruncate = Enum.TextTruncate.AtEnd

            local PlayIcon = Instance.new("TextLabel", Btn)
            PlayIcon.Size = UDim2.fromOffset(26, 26)
            PlayIcon.Position = UDim2.new(1, -34, 0.5, -13)
            PlayIcon.BackgroundTransparency = 1
            PlayIcon.Text = "▶"
            PlayIcon.TextColor3 = Color3.fromRGB(180, 185, 205)
            PlayIcon.TextSize = 14
            PlayIcon.Font = Enum.Font.GothamBold

            Btn.MouseEnter:Connect(function()
                TweenService:Create(Btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(38, 40, 55)}):Play()
                PlayIcon.TextColor3 = CurrentThemeColor
            end)
            Btn.MouseLeave:Connect(function()
                TweenService:Create(Btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(24, 25, 34)}):Play()
                PlayIcon.TextColor3 = Color3.fromRGB(180, 185, 205)
            end)

            Btn.MouseButton1Click:Connect(function()
                NameLabel.Text = "Loading..."
                NameLabel.TextColor3 = CurrentThemeColor
                local Success, Error = pcall(function() loadstring(game:HttpGet(item.Url))() end)
                if Success then
                    NameLabel.Text = "✓ Loaded: " .. item.Name
                    NameLabel.TextColor3 = Color3.fromRGB(130, 245, 135)
                    task.spawn(CopyDiscord)
                else
                    NameLabel.Text = "✕ Failed to load"
                    NameLabel.TextColor3 = Color3.fromRGB(255, 90, 100)
                    warn("[Atras] " .. tostring(Error))
                end
            end)

            table.insert(ItemTable, {Button = Btn, Name = item.Name:lower()})
        end
    end
end

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

local MenuButtons = {}
local function CreateMenuButton(Text, IsActive, OnClick)
    local Btn = Instance.new("TextButton", MenuList)
    Btn.Size = UDim2.new(1, -16, 0, 40)
    Btn.BackgroundColor3 = IsActive and Color3.fromRGB(35, 38, 50) or Color3.fromRGB(22, 23, 31)
    Btn.Text = Text
    Btn.TextColor3 = IsActive and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(170, 175, 195)
    Btn.TextSize = 13
    Btn.Font = Enum.Font.GothamBold
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.AutoButtonColor = false
    
    local Padding = Instance.new("UIPadding", Btn)
    Padding.PaddingLeft = UDim.new(0, 16)
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 12)

    Btn.MouseButton1Click:Connect(function()
        for _, b in ipairs(MenuButtons) do
            b.BackgroundColor3 = Color3.fromRGB(22, 23, 31)
            b.TextColor3 = Color3.fromRGB(170, 175, 195)
        end
        Btn.BackgroundColor3 = Color3.fromRGB(35, 38, 50)
        Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        OnClick()
    end)

    table.insert(MenuButtons, Btn)
    return Btn
end

CreateMenuButton("Steal an egg", true, function()
    StealPage.Visible = true
    BloxFruitPage.Visible = false
    MM2Page.Visible = false
    RidePetsPage.Visible = false
end)

CreateMenuButton("Blox Fruit", false, function()
    StealPage.Visible = false
    BloxFruitPage.Visible = true
    MM2Page.Visible = false
    RidePetsPage.Visible = false
end)

CreateMenuButton("MM2", false, function()
    StealPage.Visible = false
    BloxFruitPage.Visible = false
    MM2Page.Visible = true
    RidePetsPage.Visible = false
end)

CreateMenuButton("Ride a pets", false, function()
    StealPage.Visible = false
    BloxFruitPage.Visible = false
    MM2Page.Visible = false
    RidePetsPage.Visible = true
end)
local ResizeBtn = Instance.new("TextButton", Main)
ResizeBtn.Name = "Resize"
ResizeBtn.Size = UDim2.fromOffset(26, 26)
ResizeBtn.Position = UDim2.new(1, -30, 1, -30)
ResizeBtn.BackgroundTransparency = 1
ResizeBtn.Text = "◢"
ResizeBtn.TextColor3 = Color3.fromRGB(160, 165, 185)
ResizeBtn.TextSize = 14
ResizeBtn.Font = Enum.Font.GothamBold
ResizeBtn.ZIndex = 50

local Resizing, ResizeStart, ResizeStartScale, ResizeTarget = false, nil, DEFAULT_SCALE, DEFAULT_SCALE
ResizeBtn.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
        Resizing, ResizeStart, ResizeStartScale, ResizeTarget = true, Input.Position, UIScale.Scale, UIScale.Scale
        Input.Changed:Connect(function() if Input.UserInputState == Enum.UserInputState.End then Resizing = false end end)
    end
end)

UserInputService.InputChanged:Connect(function(Input)
    if Resizing and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
        local Delta = Input.Position - ResizeStart
        ResizeTarget = math.clamp(ResizeStartScale + ((Delta.X + Delta.Y) / 900), MIN_SCALE, MAX_SCALE)
        UIScale.Scale = ResizeTarget
    end
end)

local Dragging, DragInput, DragStart, StartPos
TopBar.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
        Dragging, DragStart, StartPos = true, Input.Position, Main.Position
        Input.Changed:Connect(function()
            if Input.UserInputState == Enum.UserInputState.End then Dragging = false end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(Input)
    if Dragging and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
        local Delta = Input.Position - DragStart
        Main.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
    end
end)

local IconGui = Instance.new("ScreenGui")
IconGui.Name = "AtrasIconSidebarV5"
IconGui.ResetOnSpawn = false
IconGui.IgnoreGuiInset = true
IconGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
IconGui.DisplayOrder = 99
IconGui.Parent = PlayerGui

local FloatIcon = Instance.new("TextButton", IconGui)
FloatIcon.Size = UDim2.fromOffset(46, 46)
FloatIcon.Position = UDim2.new(0, 20, 0.4, 0)
FloatIcon.BackgroundColor3 = Color3.fromRGB(18, 19, 26)
FloatIcon.Text = "A"
FloatIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
FloatIcon.TextSize = 18
FloatIcon.Font = Enum.Font.GothamBold
FloatIcon.AutoButtonColor = false
Instance.new("UICorner", FloatIcon).CornerRadius = UDim.new(1, 0)

local FloatStrokeRef = Instance.new("UIStroke", FloatIcon)
FloatStrokeRef.Color = CurrentThemeColor
FloatStrokeRef.Thickness = 1.6

FloatIcon.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
end)
