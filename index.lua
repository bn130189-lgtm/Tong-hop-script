local v8 = game:GetService("Players");
local v9 = game:GetService("UserInputService");
local v10 = game:GetService("TweenService");
local v11 = game:GetService("HttpService");
local v12 = v8.LocalPlayer;
local v13 = v12:WaitForChild("PlayerGui");
local v14 = "https://discord.gg/uqhEpzXy9q";
local v15 = "https://raw.githubusercontent.com/bn130189-lgtm/Tong-hop-script/main/script.json";

-- Tự động copy link Discord an toàn
task.spawn(function()
    pcall(function()
        local clipboardFunc = setclipboard or toclipboard;
        if clipboardFunc then
            clipboardFunc(v14);
        end
    end)
end);

local v17 = "rbxassetid://106041745164419";
local v17_bg = "rbxassetid://109985707374094";

local v18 = workspace.CurrentCamera.ViewportSize;
local v19 = (v18.X < 550) or v9.TouchEnabled;
local v20 = (v19 and 340) or 420;
local v21 = (v19 and math.min(420, v18.Y - 80)) or 460;
local v22 = (v19 and 120) or 140;
local v23 = (v19 and 0.85) or 0.95;

-- Xóa UI cũ nếu có
pcall(function()
    if v13:FindFirstChild("HiroseUI") then
        v13.HiroseUI:Destroy();
    end
end);

local v24 = Color3.fromRGB(220, 70, 85);
local v25 = Instance.new("ScreenGui");
v25.Name = "HiroseUI";
v25.ResetOnSpawn = false;
v25.IgnoreGuiInset = true;
v25.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
v25.DisplayOrder = 100;
v25.Parent = v13;

local v33 = Instance.new("Frame");
v33.Name = "Chinh";
v33.Size = UDim2.fromOffset(v20, v21);
v33.Position = UDim2.new(0.5, -v20 / 2, 0.5, -v21 / 2);
v33.BackgroundColor3 = Color3.fromRGB(5, 5, 10);
v33.BackgroundTransparency = 0.1; -- Giảm độ trong suốt của khung chính cho rõ hình nền
v33.BorderSizePixel = 0;
v33.ClipsDescendants = true;
v33.Active = true;
v33.Parent = v25;
Instance.new("UICorner", v33).CornerRadius = UDim.new(0, 24);

-- Hình nền rõ nét hơn (ImageTransparency = 0.1)
local bgImage = Instance.new("ImageLabel", v33);
bgImage.Name = "BackgroundImage";
bgImage.Size = UDim2.new(1, 0, 1, 0);
bgImage.BackgroundTransparency = 1;
bgImage.Image = v17_bg;
bgImage.ImageTransparency = 0.1; 
bgImage.ZIndex = 0;

local v44 = Instance.new("UIStroke", v33);
v44.Color = Color3.fromRGB(75, 35, 40);
v44.Thickness = 1.2;

local v47 = Instance.new("UIScale", v33);
v47.Scale = v23;

local v49 = Instance.new("Frame", v33);
v49.Size = UDim2.new(1, 0, 0, 52);
v49.BackgroundColor3 = Color3.fromRGB(3, 3, 8);
v49.BackgroundTransparency = 0.3;
v49.ClipsDescendants = true;
v49.Active = true;
v49.ZIndex = 2;

local v55 = Instance.new("ImageLabel", v49);
v55.Size = UDim2.fromOffset(26, 26);
v55.Position = UDim2.new(0, 12, 0.5, -13);
v55.BackgroundTransparency = 1;
v55.Image = v17;
Instance.new("UICorner", v55).CornerRadius = UDim.new(0, 6);

local v61 = Instance.new("TextLabel", v49);
v61.Size = UDim2.new(1, -80, 1, 0);
v61.Position = UDim2.new(0, 44, 0, 0);
v61.BackgroundTransparency = 1;
v61.Text = "HIROSE"; -- Đổi tên tiêu đề thành Hirose
v61.TextColor3 = Color3.fromRGB(255, 255, 255);
v61.TextSize = 17;
v61.Font = Enum.Font.GothamBold;
v61.TextXAlignment = Enum.TextXAlignment.Left;

local v72 = Instance.new("ImageLabel", v49);
v72.Size = UDim2.fromOffset(28, 28);
v72.Position = UDim2.new(1, -68, 0.5, -14);
v72.BackgroundTransparency = 1;
v72.Image = v17;
Instance.new("UICorner", v72).CornerRadius = UDim.new(1, 0);

local v78 = Instance.new("TextButton", v49);
v78.Size = UDim2.fromOffset(28, 28);
v78.Position = UDim2.new(1, -34, 0.5, -14);
v78.BackgroundColor3 = Color3.fromRGB(40, 20, 25);
v78.BackgroundTransparency = 0.65;
v78.Text = "×";
v78.TextColor3 = Color3.fromRGB(255, 255, 255);
v78.TextSize = 18;
v78.Font = Enum.Font.GothamBold;
Instance.new("UICorner", v78).CornerRadius = UDim.new(0, 8);
v78.MouseButton1Click:Connect(function()
    v25:Destroy();
end);

local v88 = Instance.new("Frame", v33);
v88.Size = UDim2.new(0, v22, 1, -52);
v88.Position = UDim2.new(0, 0, 0, 52);
v88.BackgroundColor3 = Color3.fromRGB(6, 7, 14);
v88.BackgroundTransparency = 0.4;
v88.ZIndex = 2;
Instance.new("UICorner", v88).CornerRadius = UDim.new(0, 16);

local v94 = Instance.new("Frame", v88);
v94.Size = UDim2.new(1, -12, 0, 60);
v94.Position = UDim2.new(0, 6, 0, 8);
v94.BackgroundColor3 = Color3.fromRGB(3, 3, 8);
v94.BackgroundTransparency = 0.5;
Instance.new("UICorner", v94).CornerRadius = UDim.new(0, 12);

local v100 = Instance.new("ImageLabel", v94);
v100.Size = UDim2.fromOffset(40, 40);
v100.Position = UDim2.new(0, 8, 0.5, -20);
v100.BackgroundTransparency = 1;
v100.Image = "rbxthumb://type=AvatarHeadShot&id=" .. v12.UserId .. "&w=150&h=150";
Instance.new("UICorner", v100).CornerRadius = UDim.new(1, 0);

local v106 = Instance.new("TextLabel", v94);
v106.Size = UDim2.new(1, -58, 0, 20);
v106.Position = UDim2.new(0, 56, 0, 8);
v106.BackgroundTransparency = 1;
v106.Text = v12.Name;
v106.TextColor3 = Color3.fromRGB(255, 255, 255);
v106.TextSize = 12;
v106.Font = Enum.Font.GothamBold;
v106.TextXAlignment = Enum.TextXAlignment.Left;

local v116 = Instance.new("TextLabel", v94);
v116.Size = UDim2.new(1, -58, 0, 14);
v116.Position = UDim2.new(0, 56, 0, 32);
v116.BackgroundTransparency = 1;
v116.Text = "💎 Premium";
v116.TextColor3 = v24;
v116.TextSize = 9;
v116.Font = Enum.Font.GothamSemibold;
v116.TextXAlignment = Enum.TextXAlignment.Left;

local v126 = Instance.new("ScrollingFrame", v88);
v126.Size = UDim2.new(1, 0, 1, -76);
v126.Position = UDim2.new(0, 0, 0, 68);
v126.BackgroundTransparency = 1;
v126.ScrollBarThickness = 0;
v126.AutomaticCanvasSize = Enum.AutomaticSize.Y;
v126.CanvasSize = UDim2.new();

local v134 = Instance.new("UIListLayout", v126);
v134.Padding = UDim.new(0, 6);
v134.HorizontalAlignment = Enum.HorizontalAlignment.Center;

local v138 = Instance.new("Frame", v33);
v138.Size = UDim2.new(1, -v22, 1, -52);
v138.Position = UDim2.new(0, v22, 0, 52);
v138.BackgroundTransparency = 1;
v138.ClipsDescendants = true;
v138.ZIndex = 2;

local function v143()
    local v178 = Instance.new("Frame", v138);
    v178.Size = UDim2.new(1, 0, 1, 0);
    v178.BackgroundTransparency = 1;
    v178.Visible = false;

    local v179 = Instance.new("TextBox", v178);
    v179.Size = UDim2.new(1, -32, 0, 40);
    v179.Position = UDim2.new(0, 16, 0, 12);
    v179.BackgroundColor3 = Color3.fromRGB(3, 3, 8);
    v179.BackgroundTransparency = 0.5;
    v179.PlaceholderText = "🔍 Search script...";
    v179.PlaceholderColor3 = Color3.fromRGB(180, 180, 180);
    v179.Text = "";
    v179.TextColor3 = Color3.fromRGB(255, 255, 255);
    v179.TextSize = 13;
    v179.Font = Enum.Font.GothamSemibold;
    v179.ClearTextOnFocus = false;
    Instance.new("UICorner", v179).CornerRadius = UDim.new(0, 12);
    
    local v180 = Instance.new("UIStroke", v179);
    v180.Color = Color3.fromRGB(45, 25, 30);
    v180.Thickness = 1;

    local v181 = Instance.new("TextLabel", v178);
    v181.Size = UDim2.new(1, -32, 0, 16);
    v181.Position = UDim2.new(0, 16, 0, 64);
    v181.BackgroundTransparency = 1;
    v181.Text = "❌ NO KEY REQUIRED | SCRIPT HUB";
    v181.TextColor3 = v24;
    v181.TextSize = 10;
    v181.Font = Enum.Font.GothamBold;
    v181.TextXAlignment = Enum.TextXAlignment.Left;

    local v182 = Instance.new("ScrollingFrame", v178);
    v182.Size = UDim2.new(1, -20, 1, -88);
    v182.Position = UDim2.new(0, 10, 0, 80);
    v182.BackgroundTransparency = 1;
    v182.ScrollBarThickness = 3;
    v182.ScrollBarImageColor3 = v24;
    v182.AutomaticCanvasSize = Enum.AutomaticSize.Y;
    v182.CanvasSize = UDim2.new();

    local v183 = Instance.new("UIListLayout", v182);
    v183.Padding = UDim.new(0, 8);
    v183.HorizontalAlignment = Enum.HorizontalAlignment.Center;

    local v184 = {};
    v179:GetPropertyChangedSignal("Text"):Connect(function()
        local v264 = v179.Text:lower();
        for _, v303 in ipairs(v184) do
            v303.Button.Visible = (v264 == "") or v303.Name:find(v264);
        end
    end);

    return v178, v182, v184;
end

-- Khởi tạo 6 khung danh mục (Thêm 1 mục mới tổng cộng là 6)
local v144, v145, v146 = v143(); -- Steal an egg
local v147, v148, v149 = v143(); -- Break and steal an egg
local v150, v151, v152 = v143(); -- Blox Fruit
local v153, v154, v155 = v143(); -- MM2
local v156, v157, v158 = v143(); -- Ride a pets
local v159, v160_frame, v160_list = v143(); -- Throw food for animals (Mục mới)

v144.Visible = true;

local function v160(v185, v186, v187)
    if (type(v187) ~= "table") then return; end
    for _, v202 in ipairs(v187) do
        if (v202.Name and v202.Url) then
            local v247 = Instance.new("TextButton", v185);
            v247.Size = UDim2.new(1, -8, 0, 44);
            v247.BackgroundColor3 = Color3.fromRGB(5, 5, 12);
            v247.BackgroundTransparency = 0.5;
            v247.Text = "";
            v247.AutoButtonColor = false;
            Instance.new("UICorner", v247).CornerRadius = UDim.new(0, 12);
            
            local v248 = Instance.new("UIStroke", v247);
            v248.Color = Color3.fromRGB(35, 20, 25);
            v248.Thickness = 1;

            local v249 = Instance.new("TextLabel", v247);
            v249.Size = UDim2.new(1, -42, 1, 0);
            v249.Position = UDim2.new(0, 12, 0, 0);
            v249.BackgroundTransparency = 1;
            v249.Text = v202.Name;
            v249.TextColor3 = Color3.fromRGB(255, 255, 255);
            v249.TextSize = 12;
            v249.Font = Enum.Font.GothamSemibold;
            v249.TextXAlignment = Enum.TextXAlignment.Left;
            v249.TextTruncate = Enum.TextTruncate.AtEnd;

            local v250 = Instance.new("TextLabel", v247);
            v250.Size = UDim2.fromOffset(24, 24);
            v250.Position = UDim2.new(1, -34, 0.5, -12);
            v250.BackgroundTransparency = 1;
            v250.Text = "▶";
            v250.TextColor3 = Color3.fromRGB(200, 200, 200);
            v250.TextSize = 14;
            v250.Font = Enum.Font.GothamBold;

            v247.MouseEnter:Connect(function()
                v10:Create(v247, TweenInfo.new(0.18), {["BackgroundColor3"] = Color3.fromRGB(35, 22, 28), ["BackgroundTransparency"] = 0.3}):Play();
                v250.TextColor3 = v24;
                v248.Color = v24;
            end);

            v247.MouseLeave:Connect(function()
                v10:Create(v247, TweenInfo.new(0.18), {["BackgroundColor3"] = Color3.fromRGB(5, 5, 12), ["BackgroundTransparency"] = 0.5}):Play();
                v250.TextColor3 = Color3.fromRGB(200, 200, 200);
                v248.Color = Color3.fromRGB(35, 20, 25);
            end);

            v247.MouseButton1Click:Connect(function()
                v249.Text = "⏳ Loading...";
                v249.TextColor3 = v24;
                local success, err = pcall(function()
                    loadstring(game:HttpGet(v202.Url))();
                end);
                if success then
                    v249.Text = "✅ Success";
                    v249.TextColor3 = Color3.fromRGB(90, 210, 130);
                else
                    v249.Text = "❌ Load Error";
                    v249.TextColor3 = Color3.fromRGB(255, 85, 95);
                    warn("[Hirose] " .. tostring(err));
                end
            end);

            table.insert(v186, {["Button"] = v247, ["Name"] = v202.Name:lower()});
        end
    end
end

-- Tải dữ liệu JSON từ GitHub và fix hiển thị tên script (hỗ trợ cả tên tiếng Anh lẫn tiếng Việt từ file json)
task.spawn(function()
    local success, res = pcall(function()
        return game:HttpGet(v15);
    end);
    if success then
        local decodeSuccess, data = pcall(function()
            return v11:JSONDecode(res);
        end);
        if decodeSuccess and type(data) == "table" then
            -- Steal an egg
            local egg1 = data["Steal an egg"] or data["Steal An Egg"] or data["Ăn trộm một quả trứng"];
            if egg1 then v160(v145, v146, egg1); end

            -- Break and steal an egg
            local egg2 = data["Break and steal an egg"] or data["Break And Steal An Egg"] or data["Đập vỡ và ăn trộm một quả trứng"];
            if egg2 then v160(v148, v149, egg2); end

            -- Blox Fruit
            local blox = data["Blox Fruit"] or data["Bloxfruit"] or data["Blox Fruits"];
            if blox then v160(v151, v152, blox); end

            -- MM2
            local mm2 = data["MM2"] or data["Murder Mystery 2"];
            if mm2 then v160(v154, v155, mm2); end

            -- Ride a pets
            local pets = data["Ride a pets"] or data["Ride a Pets"] or data["RidePets"];
            if pets then v160(v157, v158, pets); end

            -- Throw food for animals (Mục mới)
            local food = data["Throw food for animals"] or data["Throw Food For Animals"] or data["Ném thức ăn cho động vật"];
            if food then v160(v160_frame, v160_list, food); end
        end
    end
end);

local v161 = {};
local v162 = v144;
local function v163(v191)
    v162.Visible = false;
    v191.Visible = true;
    v162 = v191;
end

local function v164(v193, v194, v195)
    local v197 = Instance.new("TextButton", v126);
    v197.Size = UDim2.new(1, -10, 0, 40);
    v197.BackgroundColor3 = (v195 and Color3.fromRGB(45, 22, 28)) or Color3.fromRGB(8, 8, 16);
    v197.BackgroundTransparency = (v195 and 0.3) or 0.5;
    v197.Text = v193;
    v197.TextColor3 = Color3.fromRGB(255, 255, 255);
    v197.TextSize = 11;
    v197.Font = Enum.Font.GothamBold;
    v197.AutoButtonColor = false;
    Instance.new("UICorner", v197).CornerRadius = UDim.new(0, 10);

    v197.MouseButton1Click:Connect(function()
        for _, btn in ipairs(v161) do
            btn.BackgroundColor3 = Color3.fromRGB(8, 8, 16);
            btn.BackgroundTransparency = 0.5;
        end
        v197.BackgroundColor3 = Color3.fromRGB(45, 22, 28);
        v197.BackgroundTransparency = 0.3;
        v163(v194);
    end);

    table.insert(v161, v197);
    return v197;
end

-- Thêm các nút chuyển tab ở menu bên trái (Đã đổi sang tiếng Anh hoàn toàn)
v164("🥚 Steal An Egg", v144, true);
v164("🥚 Break & Steal Egg", v147, false);
v164("🍊 Blox Fruit", v150, false);
v164("🔪 MM2", v153, false);
v164("🐾 Ride A Pets", v156, false);
v164("🍖 Throw Food", v159, false); -- Nút chuyển tab cho mục mới

-- Kéo thả UI
local v165 = false;
local v166 = Vector2.new();
local v167 = UDim2.new();

v49.InputBegan:Connect(function(v198)
    if (v198.UserInputType == Enum.UserInputType.MouseButton1) or (v198.UserInputType == Enum.UserInputType.Touch) then
        v165 = true;
        v166 = v198.Position;
        v167 = v33.Position;
        v198.Changed:Connect(function()
            if (v198.UserInputState == Enum.UserInputState.End) then
                v165 = false;
            end
        end);
    end
end);

v9.InputChanged:Connect(function(v199)
    if v165 and ((v199.UserInputType == Enum.UserInputType.MouseMovement) or (v199.UserInputType == Enum.UserInputType.Touch)) then
        local v205 = v199.Position - v166;
        v33.Position = UDim2.new(v167.X.Scale, v167.X.Offset + v205.X, v167.Y.Scale, v167.Y.Offset + v205.Y);
    end
end);
