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

-- 🖼️ Hình logo/icon của bạn
local CUSTOM_LOGO = "rbxassetid://97608172188347"

-- 📱 Kích thước cơ sở
local ScreenSize = workspace.CurrentCamera.ViewportSize
local IS_MOBILE = ScreenSize.X < 550 or UserInputService.TouchEnabled

local BASE_WIDTH = IS_MOBILE and 340 or 420
local BASE_HEIGHT = IS_MOBILE and math.min(420, ScreenSize.Y - 80) or 460
local MIN_SIDEBAR_WIDTH = 70
local MAX_SIDEBAR_WIDTH = 160
local DEFAULT_SIDEBAR_WIDTH = IS_MOBILE and 110 or 130
local DEFAULT_SCALE = IS_MOBILE and 0.85 or 0.95

-- Xóa giao diện cũ
for _, name in ipairs({"AtrasGiaBinhUI"}) do
    local old = PlayerGui:FindFirstChild(name)
    if old then old:Destroy() end
end

local CurrentThemeColor = Color3.fromRGB(220, 70, 85)

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
Main.Size = UDim2.fromOffset(BASE_WIDTH, BASE_HEIGHT)
Main.Position = UDim2.new(0.5, -BASE_WIDTH/2, 0.5, -BASE_HEIGHT/2)
Main.BackgroundColor3 = Color3.fromRGB(5, 5, 10)
Main.BackgroundTransparency = 0.55
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Active = true
Main.Parent = Gui

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 24)
local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Color = Color3.fromRGB(75, 35, 40)
MainStroke.Thickness = 1.2

local UIScale = Instance.new("UIScale", Main)
UIScale.Scale = DEFAULT_SCALE

-- === THANH TIÊU ĐỀ — KÉO DI CHUYỂN ===
local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1, 0, 0, 52)
TopBar.BackgroundColor3 = Color3.fromRGB(3, 3, 8)
TopBar.BackgroundTransparency = 0.6
TopBar.ClipsDescendants = true
TopBar.Active = true

-- 🖼️ Icon bên trái tiêu đề
local TitleIcon = Instance.new("ImageLabel", TopBar)
TitleIcon.Size = UDim2.fromOffset(26, 26)
TitleIcon.Position = UDim2.new(0, 12, 0.5, -13)
TitleIcon.BackgroundTransparency = 1
TitleIcon.Image = CUSTOM_LOGO
Instance.new("UICorner", TitleIcon).CornerRadius = UDim.new(0, 6)

local HubTitle = Instance.new("TextLabel", TopBar)
HubTitle.Size = UDim2.new(1, -60, 1, 0)
HubTitle.Position = UDim2.new(0, 48, 0, 0)
HubTitle.BackgroundTransparency = 1
HubTitle.Text = "ATRAS | GIABÌNH"
HubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
HubTitle.TextSize = 17
HubTitle.Font = Enum.Font.GothamBold
HubTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Nút đóng
local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.Size = UDim2.fromOffset(28, 28)
CloseBtn.Position = UDim2.new(1, -36, 0.5, -14)
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
local SidebarContainer = Instance.new("Frame", Main)
SidebarContainer.Name = "SidebarContainer"
SidebarContainer.Size = UDim2.fromOffset(DEFAULT_SIDEBAR_WIDTH, -52)
SidebarContainer.Position = UDim2.new(0, 0, 0, 52)
SidebarContainer.BackgroundTransparency = 1

local Sidebar = Instance.new("Frame", SidebarContainer)
Sidebar.Size = UDim2.new(1, 0, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(6, 7, 14)
Sidebar.BackgroundTransparency = 0.58
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 16)

-- Thông tin người dùng
local UserBox = Instance.new("Frame", Sidebar)
UserBox.Size = UDim2.new(1, -12, 0, 60)
UserBox.Position = UDim2.new(0, 6, 0, 8)
UserBox.BackgroundColor3 = Color3.fromRGB(3, 3, 8)
UserBox.BackgroundTransparency = 0.62
Instance.new("UICorner", UserBox).CornerRadius = UDim.new(0, 12)

-- 👤 Avatar game tự động lấy
local GameAvatar = Instance.new("ImageLabel", UserBox)
GameAvatar.Size = UDim2.fromOffset(40, 40)
GameAvatar.Position = UDim2.new(0, 8, 0.5, -20)
GameAvatar.BackgroundTransparency = 1
GameAvatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. Player.UserId .. "&w=150&h=150"
Instance.new("UICorner", GameAvatar).CornerRadius = UDim.new(1, 0)

local DisplayName = Instance.new("TextLabel", UserBox)
DisplayName.Size = UDim2.new(1, -58, 0, 20)
DisplayName.Position = UDim2.new(0, 56, 0, 8)
DisplayName.BackgroundTransparency = 1
DisplayName.Text = Player.Name
DisplayName.TextColor3 = Color3.fromRGB(255, 255, 255)
DisplayName.TextSize = 12
DisplayName.Font = Enum.Font.GothamBold
DisplayName.TextXAlignment = Enum.TextXAlignment.Left

local UserRole = Instance.new("TextLabel", UserBox)
UserRole.Size = UDim2.new(1, -58, 0, 14)
UserRole.Position = UDim2.new(0, 56, 0, 32)
UserRole.BackgroundTransparency = 1
UserRole.Text = "💎 Premium"
UserRole.TextColor3 = CurrentThemeColor
UserRole.TextSize = 9
UserRole.Font = Enum.Font.GothamSemibold
UserRole.TextXAlignment = Enum.TextXAlignment.Left

-- Danh sách menu
local MenuList = Instance.new("ScrollingFrame", Sidebar)
MenuList.Size = UDim2.new(1, 0, 1, -76)
MenuList.Position = UDim2.new(0, 0, 0, 68)
MenuList.BackgroundTransparency = 1
MenuList.ScrollBarThickness = 0
MenuList.AutomaticCanvasSize = Enum.AutomaticSize.Y
MenuList.CanvasSize = UDim2.new()

local MenuLayout = Instance.new("UIListLayout", MenuList)
MenuLayout.Padding = UDim.new(0, 6)
MenuLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- === NÚT KÉO ĐIỀU CHỈNH RỘNG MENU ===
local ResizeHandle = Instance.new("TextButton", Main)
ResizeHandle.Name = "ResizeHandle"
ResizeHandle.Size = UDim2.fromOffset(8, 60)
ResizeHandle.Position = UDim2.new(0, DEFAULT_SIDEBAR_WIDTH - 4, 0, BASE_HEIGHT/2 - 30)
ResizeHandle.BackgroundColor3 = CurrentThemeColor
ResizeHandle.BackgroundTransparency = 0.5
ResizeHandle.Text = "|||"
ResizeHandle.TextColor3 = Color3.fromRGB(255, 255, 255)
ResizeHandle.TextSize = 9
ResizeHandle.Font = Enum.Font.GothamBold
ResizeHandle.AutoButtonColor = false
ResizeHandle.ZIndex = 10
Instance.new("UICorner", ResizeHandle).CornerRadius = UDim.new(0, 4)

-- === KHU VỰC NỘI DUNG CHÍNH ===
local PagesContainer = Instance.new("Frame", Main)
PagesContainer.Name = "PagesContainer"
PagesContainer.Size = UDim2.new(1, -DEFAULT_SIDEBAR_WIDTH, 1, -52)
PagesContainer.Position = UDim2.new(0, DEFAULT_SIDEBAR_WIDTH, 0, 52)
PagesContainer.BackgroundTransparency = 1
PagesContainer.ClipsDescendants = true

-- Hàm cập nhật kích thước menu
local function UpdateSidebarWidth(newWidth)
    newWidth = math.clamp(newWidth, MIN_SIDEBAR_WIDTH, MAX_SIDEBAR_WIDTH)
    SidebarContainer.Size = UDim2.fromOffset(newWidth, -52)
    PagesContainer.Size = UDim2.new(1, -newWidth, 1, -52)
    PagesContainer.Position = UDim2.new(0, newWidth, 0, 52)
    ResizeHandle.Position = UDim2.new(0, newWidth - 4, 0, BASE_HEIGHT/2 - 30)
    
    -- Ẩn hiện chữ khi thu nhỏ menu
    local IsNarrow = newWidth < 100
    DisplayName.Visible = not IsNarrow
    UserRole.Visible = not IsNarrow
    for _, btn in ipairs(MenuButtons) do
        btn.TextSize = IsNarrow and 9 or 11
    end
end

-- Kéo điều chỉnh độ rộng menu
local Resizing = false
ResizeHandle.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
        Resizing = true
    end
end)

UserInputService.InputChanged:Connect(function(Input)
    if Resizing and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
        local LocalX = Input.Position - Main.AbsolutePosition
        UpdateSidebarWidth(LocalX.X)
    end
end)

UserInputService.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
        Resizing = false
    end
end)

-- Tạo trang script
local function CreateScriptPage()
    local Page = Instance.new("Frame", PagesContainer)
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.Visible = false

    local SearchBox = Instance.new("TextBox", Page)
    SearchBox.Size = UDim2.new(1, -32, 0, 40)
    SearchBox.Position = UDim2.new(0, 16, 0, 12)
    SearchBox.BackgroundColor3 = Color3.fromRGB(3, 3, 8)
    SearchBox.BackgroundTransparency = 0.62
    SearchBox.PlaceholderText = "🔍 Tìm script..."
    SearchBox.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)
    SearchBox.Text = ""
    SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    SearchBox.TextSize = 13
    SearchBox.Font = Enum.Font.GothamSemibold
    SearchBox.ClearTextOnFocus = false
    Instance.new("UICorner", SearchBox).CornerRadius = UDim.new(0, 12)
    local SearchStroke = Instance.new("UIStroke", SearchBox)
    SearchStroke.Color = Color3.fromRGB(45, 25, 30)
    SearchStroke.Thickness = 1

    local StatusBadge = Instance.new("TextLabel", Page)
    StatusBadge.Size = UDim2.new(1, -32, 0, 16)
    StatusBadge.Position = UDim2.new(0, 16, 0, 64)
    StatusBadge.BackgroundTransparency = 1
    StatusBadge.Text = "✅ KHÔNG CẦN KEY | TẬP SCRIPT"
    StatusBadge.TextColor3 = CurrentThemeColor
    StatusBadge.TextSize = 10
    StatusBadge.Font = Enum.Font.GothamBold
    StatusBadge.TextXAlignment = Enum.TextXAlignment.Left

    local ScriptScroll = Instance.new("ScrollingFrame", Page)
    ScriptScroll.Size = UDim2.new(1, -20, 1, -88)
    ScriptScroll.Position = UDim2.new(0, 10, 0, 80)
    ScriptScroll.BackgroundTransparency = 1
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
            Btn.Size = UDim2.new(1, -8, 0, 44)
            Btn.BackgroundColor3 = Color3.fromRGB(5, 5, 12)
            Btn.BackgroundTransparency = 0.65
            Btn.Text = ""
            Btn.AutoButtonColor = false
            Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 12)
            local BtnStroke = Instance.new("UIStroke", Btn)
            BtnStroke.Color = Color3.fromRGB(35, 20, 25)
            BtnStroke.Thickness = 1

            local NameLabel = Instance.new("TextLabel", Btn)
            NameLabel.Size = UDim2.new(1, -42, 1, 0)
            NameLabel.Position = UDim2.new(0, 12, 0, 0)
            NameLabel.BackgroundTransparency = 1
            NameLabel.Text = item.Name
            NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            NameLabel.TextSize = 12
            NameLabel.Font = Enum.Font.GothamSemibold
            NameLabel.TextXAlignment = Enum.TextXAlignment.Left
            NameLabel.TextTruncate = Enum.TextTruncate.AtEnd

            local PlayIcon = Instance.new("TextLabel", Btn)
            PlayIcon.Size = UDim2.fromOffset(24, 24)
            PlayIcon.Position = UDim2.new(1, -34, 0.5, -12)
            PlayIcon.BackgroundTransparency = 1
            PlayIcon.Text = "▶"
            PlayIcon.TextColor3 = Color3.fromRGB(200, 200, 200)
            PlayIcon.TextSize = 14
            PlayIcon.Font = Enum.Font.GothamBold

            Btn.MouseEnter:Connect(function()
                TweenService:Create(Btn, TweenInfo.new(0.18), {BackgroundColor3 = Color3.fromRGB(35, 22, 28), BackgroundTransparency = 0.45}):Play()
                PlayIcon.TextColor3 = CurrentThemeColor
                BtnStroke.Color = CurrentThemeColor
            end)
            Btn.MouseLeave:Connect(function()
                TweenService:Create(Btn, TweenInfo.new(0.18), {BackgroundColor3 = Color3.fromRGB(5, 5, 12), BackgroundTransparency = 0.65}):Play()
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
                    NameLabel.Text = "❌ Lỗi tải"
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
    Btn.Size = UDim2.new(1, -10, 0, 40)
    Btn.BackgroundColor3 = IsActive and Color3.fromRGB(45, 22, 28) or Color3.fromRGB(8, 8, 16)
    Btn.BackgroundTransparency = IsActive and 0.45 or 0.65
    Btn.Text = Text
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.TextSize = 11
    Btn.Font = Enum.Font.GothamBold
    Btn.AutoButtonColor = false
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 10)

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

-- === KÉO DI CHUYỂN TOÀN BỘ CỬA SỔ ===
local Dragging = false
local DragStartPos = Vector2.new()
local StartMainPos = UDim2.new()

TopBar.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
        Dragging = true
        DragStartPos = Input.Position
        StartMainPos = Main.Position
        Input.Changed:Connect(function()
            if Input.UserInputState == Enum.UserInputState.End then
                Dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(Input)
    if Dragging and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
        local Delta = Input.Position - DragStartPos
        Main.Position = UDim2.new(
            StartMainPos.X.Scale,
            StartMainPos.X.Offset + Delta.X,
            StartMainPos.Y.Scale,
            StartMainPos.Y.Offset + Delta.Y
        )
    end
end)

-- Cập nhật vị trí khi đổi kích thước màn hình
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
    if not Dragging then
        Main.Position = UDim2.new(0.5, -Main.AbsoluteSize.X/2, 0.5, -Main.AbsoluteSize.Y/2)
    end
end)
