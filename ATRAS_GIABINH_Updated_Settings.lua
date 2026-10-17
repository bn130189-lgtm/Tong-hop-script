local v8=game:GetService("Players");
local v9=game:GetService("UserInputService");
local v10=game:GetService("TweenService");
local v11=game:GetService("HttpService");
local v12=v8.LocalPlayer;
local v13=v12:WaitForChild("PlayerGui");
local v14="https://discord.gg/uqhEpzXy9q";
local v15="https://raw.githubusercontent.com/bn130189-lgtm/Tong-hop-script/main/script.json";
local function v16()local v171=0;
  local v172;
  while true do
    if(v171==0)then
      v172=setclipboard or toclipboard;
      return v172 and pcall(v172, v14);
    end
  end
end
task.spawn(v16);
local v17="rbxassetid://97608172188347";
local v18=workspace.CurrentCamera.ViewportSize;
local v19=(v18.X<550)or v9.TouchEnabled;
local v20=(v19 and 340)or 420;
local v21=(v19 and math.min(420, v18.Y-80))or 460;
local v22=(v19 and 120)or 140;
local v23=(v19 and 0.85)or 0.95;
for v173, v174 in ipairs({"AtrasGiaBinhUI"})do
  local v175=0;
  local v176;
  while true do
    if(0==v175)then
      v176=v13:FindFirstChild(v174);
      if v176 then
        v176:Destroy();
      end
      break;
    end
  end
end
local v24=Color3.fromRGB(220, 70, 85);
local v25=Instance.new("ScreenGui");
v25.Name="AtrasGiaBinhUI";
v25.ResetOnSpawn=false;
v25.IgnoreGuiInset=true;
v25.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;
v25.DisplayOrder=100;
v25.Parent=v13;
local v33=Instance.new("Frame");
v33.Name="Main";
v33.Size=UDim2.fromOffset(v20, v21);
v33.Position=UDim2.new(0.5,-v20/2, 0.5,-v21/2);
v33.BackgroundColor3=Color3.fromRGB(5, 5, 10);
v33.BackgroundTransparency=0.55;
v33.BorderSizePixel=0;
v33.ClipsDescendants=true;
v33.Active=true;
v33.Parent=v25;
Instance.new("UICorner", v33).CornerRadius=UDim.new(0, 24);
local v44=Instance.new("UIStroke", v33);
v44.Color=Color3.fromRGB(75, 35, 40);
v44.Thickness=1.2;
local v47=Instance.new("UIScale", v33);
v47.Scale=v23;
local v49=Instance.new("Frame", v33);
v49.Size=UDim2.new(1, 0, 0, 52);
v49.BackgroundColor3=Color3.fromRGB(3, 3, 8);
v49.BackgroundTransparency=0.6;
v49.ClipsDescendants=true;
v49.Active=true;
local v55=Instance.new("ImageLabel", v49);
v55.Size=UDim2.fromOffset(26, 26);
v55.Position=UDim2.new(0, 12, 0.5,-13);
v55.BackgroundTransparency=1;
v55.Image=v17;
Instance.new("UICorner", v55).CornerRadius=UDim.new(0, 6);
local v61=Instance.new("TextLabel", v49);
v61.Size=UDim2.new(1,-80, 1, 0);
v61.Position=UDim2.new(0, 44, 0, 0);
v61.BackgroundTransparency=1;
v61.Text="ATRAS | GIABÌNH";
v61.TextColor3=Color3.fromRGB(255, 255, 255);
v61.TextSize=17;
v61.Font=Enum.Font.GothamBold;
v61.TextXAlignment=Enum.TextXAlignment.Left;
local v72=Instance.new("ImageLabel", v49);
v72.Size=UDim2.fromOffset(28, 28);
v72.Position=UDim2.new(1,-68, 0.5,-14);
v72.BackgroundTransparency=1;
v72.Image=v17;
Instance.new("UICorner", v72).CornerRadius=UDim.new(1, 0);
local v78=Instance.new("TextButton", v49);
v78.Size=UDim2.fromOffset(28, 28);
v78.Position=UDim2.new(1,-34, 0.5,-14);
v78.BackgroundColor3=Color3.fromRGB(40, 20, 25);
v78.BackgroundTransparency=0.65;
v78.Text="×";
v78.TextColor3=Color3.fromRGB(255, 255, 255);
v78.TextSize=18;
v78.Font=Enum.Font.GothamBold;
Instance.new("UICorner", v78).CornerRadius=UDim.new(0, 8);
v78.MouseButton1Click:Connect(function()v25:Destroy();
end
);
local v88=Instance.new("Frame", v33);
v88.Size=UDim2.new(0, v22, 1,-52);
v88.Position=UDim2.new(0, 0, 0, 52);
v88.BackgroundColor3=Color3.fromRGB(6, 7, 14);
v88.BackgroundTransparency=0.58;
Instance.new("UICorner", v88).CornerRadius=UDim.new(0, 16);
local v94=Instance.new("Frame", v88);
v94.Size=UDim2.new(1,-12, 0, 60);
v94.Position=UDim2.new(0, 6, 0, 8);
v94.BackgroundColor3=Color3.fromRGB(3, 3, 8);
v94.BackgroundTransparency=0.62;
Instance.new("UICorner", v94).CornerRadius=UDim.new(0, 12);
local v100=Instance.new("ImageLabel", v94);
v100.Size=UDim2.fromOffset(40, 40);
v100.Position=UDim2.new(0, 8, 0.5,-20);
v100.BackgroundTransparency=1;
v100.Image="rbxthumb://type=AvatarHeadShot&id=" .. v12.UserId .. "&w=150&h=150";
Instance.new("UICorner", v100).CornerRadius=UDim.new(1, 0);
local v106=Instance.new("TextLabel", v94);
v106.Size=UDim2.new(1,-58, 0, 20);
v106.Position=UDim2.new(0, 56, 0, 8);
v106.BackgroundTransparency=1;
v106.Text=v12.Name;
v106.TextColor3=Color3.fromRGB(255, 255, 255);
v106.TextSize=12;
v106.Font=Enum.Font.GothamBold;
v106.TextXAlignment=Enum.TextXAlignment.Left;
local v116=Instance.new("TextLabel", v94);
v116.Size=UDim2.new(1,-58, 0, 14);
v116.Position=UDim2.new(0, 56, 0, 32);
v116.BackgroundTransparency=1;
v116.Text="💎 Premium";
v116.TextColor3=v24;
v116.TextSize=9;
v116.Font=Enum.Font.GothamSemibold;
v116.TextXAlignment=Enum.TextXAlignment.Left;
local v126=Instance.new("ScrollingFrame", v88);
v126.Size=UDim2.new(1, 0, 1,-76);
v126.Position=UDim2.new(0, 0, 0, 68);
v126.BackgroundTransparency=1;
v126.ScrollBarThickness=0;
v126.AutomaticCanvasSize=Enum.AutomaticSize.Y;
v126.CanvasSize=UDim2.new();
local v134=Instance.new("UIListLayout", v126);
v134.Padding=UDim.new(0, 6);
v134.HorizontalAlignment=Enum.HorizontalAlignment.Center;
local v138=Instance.new("Frame", v33);
v138.Size=UDim2.new(1,-v22, 1,-52);
v138.Position=UDim2.new(0, v22, 0, 52);
v138.BackgroundTransparency=1;
v138.ClipsDescendants=true;
local function v143()local v177=0;
  local v178;
  local v179;
  local v180;
  local v181;
  local v182;
  local v183;
  local v184;
  while true do
    if(v177==0)then
      v178=Instance.new("Frame", v138);
      v178.Size=UDim2.new(1, 0, 1, 0);
      v178.BackgroundTransparency=1;
      v178.Visible=false;
      v179=Instance.new("TextBox", v178);
      v179.Size=UDim2.new(1,-32, 0, 40);
      v177=1;
    end
    if(v177==5)then
      v182.Size=UDim2.new(1,-20, 1,-88);
      v182.Position=UDim2.new(0, 10, 0, 80);
      v182.BackgroundTransparency=1;
      v182.ScrollBarThickness=3;
      v182.ScrollBarImageColor3=v24;
      v182.AutomaticCanvasSize=Enum.AutomaticSize.Y;
      v177=6;
    end
    if(v177==3)then
      v180.Color=Color3.fromRGB(45, 25, 30);
      v180.Thickness=1;
      v181=Instance.new("TextLabel", v178);
      v181.Size=UDim2.new(1,-32, 0, 16);
      v181.Position=UDim2.new(0, 16, 0, 64);
      v181.BackgroundTransparency=1;
      v177=4;
    end
    if(v177==4)then
      v181.Text="✅ KHÔNG CẦN KEY | TẬP SCRIPT";
      v181.TextColor3=v24;
      v181.TextSize=10;
      v181.Font=Enum.Font.GothamBold;
      v181.TextXAlignment=Enum.TextXAlignment.Left;
      v182=Instance.new("ScrollingFrame", v178);
      v177=5;
    end
    if(v177==2)then
      v179.TextColor3=Color3.fromRGB(255, 255, 255);
      v179.TextSize=13;
      v179.Font=Enum.Font.GothamSemibold;
      v179.ClearTextOnFocus=false;
      Instance.new("UICorner", v179).CornerRadius=UDim.new(0, 12);
      v180=Instance.new("UIStroke", v179);
      v177=3;
    end
    if(v177==7)then
      return v178, v182, v184;
    end
    if(v177==1)then
      v179.Position=UDim2.new(0, 16, 0, 12);
      v179.BackgroundColor3=Color3.fromRGB(3, 3, 8);
      v179.BackgroundTransparency=0.62;
      v179.PlaceholderText="🔍 Tìm script...";
      v179.PlaceholderColor3=Color3.fromRGB(180, 180, 180);
      v179.Text="";
      v177=2;
    end
    if(v177==6)then
      v182.CanvasSize=UDim2.new();
      v183=Instance.new("UIListLayout", v182);
      v183.Padding=UDim.new(0, 8);
      v183.HorizontalAlignment=Enum.HorizontalAlignment.Center;
      v184={};
      v179:GetPropertyChangedSignal("Text"):Connect(function()local v263=0;
        local v264;
        while true do
          if(v263==0)then
            v264=v179.Text:lower();
            for v302, v303 in ipairs(v184)do
              v303.Button.Visible=(v264=="")or v303.Name:find(v264);
            end
            break;
          end
        end
      end
      );
      v177=7;
    end
  end
end
local v144, v145, v146=v143();
local v147, v148, v149=v143();
local v150, v151, v152=v143();
local v153, v154, v155=v143();
local v156, v157, v158=v143();
local settingsPage, settingsList, settingsItems=v143();
v144.Visible=true;
local function v160(v185, v186, v187)if(type(v187)~="table")then
  return;
end
for v201, v202 in ipairs(v187)do
  if(v202.Name and v202.Url)then
    local v246=0;
    local v247;
    local v248;
    local v249;
    local v250;
    while true do
      if(v246==6)then
        v247.MouseButton1Click:Connect(function()local v294=0;
          local v295;
          local v296;
          while true do
            if(0==v294)then
              v249.Text="⏳ Đang tải...";
              v249.TextColor3=v24;
              v294=1;
            end
            if(v294==1)then
              v295, v296=pcall(function()loadstring(game:HttpGet(v202.Url))();
              end
              );
              if v295 then
                local v327=0;
                while true do
                  if(v327==1)then
                    task.spawn(v16);
                    break;
                  end
                  if(v327==0)then
                    v249.Text="✅ Thành công";
                    v249.TextColor3=Color3.fromRGB(90, 210, 130);
                    v327=1;
                  end
                end
              else
                local v328=0;
                while true do
                  if(v328==0)then
                    v249.Text="❌ Lỗi tải";
                    v249.TextColor3=Color3.fromRGB(255, 85, 95);
                    v328=1;
                  end
                  if(v328==1)then
                    warn("[Atras] " .. tostring(v296));
                    break;
                  end
                end
              end
              break;
            end
          end
        end
        );
        table.insert(v186,{["Button"]=v247,["Name"]=v202.Name:lower()});
        break;
      end
      if(v246==0)then
        v247=Instance.new("TextButton", v185);
        v247.Size=UDim2.new(1,-8, 0, 44);
        v247.BackgroundColor3=Color3.fromRGB(5, 5, 12);
        v247.BackgroundTransparency=0.65;
        v247.Text="";
        v246=1;
      end
      if(v246==2)then
        v249=Instance.new("TextLabel", v247);
        v249.Size=UDim2.new(1,-42, 1, 0);
        v249.Position=UDim2.new(0, 12, 0, 0);
        v249.BackgroundTransparency=1;
        v249.Text=v202.Name;
        v246=3;
      end
      if(1==v246)then
        v247.AutoButtonColor=false;
        Instance.new("UICorner", v247).CornerRadius=UDim.new(0, 12);
        v248=Instance.new("UIStroke", v247);
        v248.Color=Color3.fromRGB(35, 20, 25);
        v248.Thickness=1;
        v246=2;
      end
      if(v246==3)then
        local v285=0;
        while true do
          if(v285==2)then
            v249.TextTruncate=Enum.TextTruncate.AtEnd;
            v246=4;
            break;
          end
          if(v285==0)then
            v249.TextColor3=Color3.fromRGB(255, 255, 255);
            v249.TextSize=12;
            v285=1;
          end
          if(v285==1)then
            v249.Font=Enum.Font.GothamSemibold;
            v249.TextXAlignment=Enum.TextXAlignment.Left;
            v285=2;
          end
        end
      end
      if(v246==4)then
        v250=Instance.new("TextLabel", v247);
        v250.Size=UDim2.fromOffset(24, 24);
        v250.Position=UDim2.new(1,-34, 0.5,-12);
        v250.BackgroundTransparency=1;
        v250.Text="▶";
        v246=5;
      end
      if(v246==5)then
        v250.TextColor3=Color3.fromRGB(200, 200, 200);
        v250.TextSize=14;
        v250.Font=Enum.Font.GothamBold;
        v247.MouseEnter:Connect(function()local v297=0;
          while true do
            if(v297==0)then
              v10:Create(v247, TweenInfo.new(0.18),{["BackgroundColor3"]=Color3.fromRGB(35, 22, 28),["BackgroundTransparency"]=0.45}):Play();
              v250.TextColor3=v24;
              v297=1;
            end
            if(v297==1)then
              v248.Color=v24;
              break;
            end
          end
        end
        );
        v247.MouseLeave:Connect(function()v10:Create(v247, TweenInfo.new(0.18),{["BackgroundColor3"]=Color3.fromRGB(5, 5, 12),["BackgroundTransparency"]=0.65}):Play();
          v250.TextColor3=Color3.fromRGB(200, 200, 200);
          v248.Color=Color3.fromRGB(35, 20, 25);
        end
        );
        v246=6;
      end
    end
  end
end
end
task.spawn(function()local v188=0;
  local v189;
  local v190;
  while true do
    if(v188==0)then
      v189, v190=pcall(function()return game:HttpGet(v15);
      end
      );
      if v189 then
        local v266=0;
        local v267;
        local v268;
        while true do
          if(v266==0)then
            v267, v268=pcall(function()return v11:JSONDecode(v190);
            end
            );
            if(v267 and(type(v268)=="table"))then
              local v320=v268["Steal an egg"]or v268["Steal An Egg"];
              if v320 then
                v160(v145, v146, v320);
              end
              local v321=v268["Break and Steal an Egg"]or v268["Break And Steal An Egg"]or v268["Break and Steal Egg"];
              if v321 then
                v160(v148, v149, v321);
              end
              local v322=v268["Blox Fruit"]or v268["Bloxfruit"]or v268["Blox Fruits"];
              if v322 then
                v160(v151, v152, v322);
              end
              local v323=v268["MM2"]or v268["Murder Mystery 2"];
              if v323 then
                v160(v154, v155, v323);
              end
              local v324=v268["Ride a pets"]or v268["Ride a Pets"]or v268["RidePets"];
              if v324 then
                v160(v157, v158, v324);
              end
            end
            break;
          end
        end
      end
      break;
    end
  end
end
);
local v161={};
local v162=v144;
local function v163(v191)local v192=0;
  while true do
    if(v192==1)then
      v162=v191;
      break;
    end
    if(0==v192)then
      v162.Visible=false;
      v191.Visible=true;
      v192=1;
    end
  end
end
local function v164(v193, v194, v195)local v196=0;
  local v197;
  while true do
    if(v196==1)then
      v197.Text=v193;
      v197.TextColor3=Color3.fromRGB(255, 255, 255);
      v197.TextSize=11;
      v197.Font=Enum.Font.GothamBold;
      v196=2;
    end
    if(v196==0)then
      v197=Instance.new("TextButton", v126);
      v197.Size=UDim2.new(1,-10, 0, 40);
      v197.BackgroundColor3=(v195 and Color3.fromRGB(45, 22, 28))or Color3.fromRGB(8, 8, 16);
      v197.BackgroundTransparency=(v195 and 0.45)or 0.65;
      v196=1;
    end
    if(v196==3)then
      return v197;
    end
    if(v196==2)then
      v197.AutoButtonColor=false;
      Instance.new("UICorner", v197).CornerRadius=UDim.new(0, 10);
      v197.MouseButton1Click:Connect(function()local v265=0;
        while true do
          if(v265==1)then
            v197.BackgroundTransparency=0.45;
            v163(v194);
            break;
          end
          if(v265==0)then
            for v305, v306 in ipairs(v161)do
              local v307=0;
              while true do
                if(v307==0)then
                  v306.BackgroundColor3=Color3.fromRGB(8, 8, 16);
                  v306.BackgroundTransparency=0.65;
                  break;
                end
              end
            end
            v197.BackgroundColor3=Color3.fromRGB(45, 22, 28);
            v265=1;
          end
        end
      end
      );
      table.insert(v161, v197);
      v196=3;
    end
  end
end
v164("🥚 Trộm Trứng", v144, true);
v164("🥚 Break & Steal Egg", v147, false);
v164("🍊 Blox Fruit", v150, false);
v164("🔪 MM2", v153, false);
v164("🐾 Ride Pets", v156, false);
v164("⚙ Settings", settingsPage, false);

-- Settings page (English)
local SETTINGS_FILE = "AtrasGiaBinh_Settings.json"
local AUTO_EXECUTE_URL = "https://pastefy.app/vllOuZRT/raw"
local autoExecuteEnabled = false

local function loadAutoExecuteSetting()
    if type(readfile) == "function" and type(isfile) == "function" then
        local ok, result = pcall(function()
            if isfile(SETTINGS_FILE) then
                local data = v11:JSONDecode(readfile(SETTINGS_FILE))
                return data.AutoExecute == true
            end
            return false
        end)
        if ok then
            return result
        end
    end
    return false
end

local function saveAutoExecuteSetting(value)
    if type(writefile) == "function" then
        pcall(function()
            writefile(SETTINGS_FILE, v11:JSONEncode({AutoExecute = value}))
        end)
    end
end

autoExecuteEnabled = loadAutoExecuteSetting()

local settingsTitle = Instance.new("TextLabel", settingsPage)
settingsTitle.Size = UDim2.new(1, -32, 0, 32)
settingsTitle.Position = UDim2.new(0, 16, 0, 12)
settingsTitle.BackgroundTransparency = 1
settingsTitle.Text = "Settings"
settingsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsTitle.TextSize = 18
settingsTitle.Font = Enum.Font.GothamBold
settingsTitle.TextXAlignment = Enum.TextXAlignment.Left

local settingsDescription = Instance.new("TextLabel", settingsPage)
settingsDescription.Size = UDim2.new(1, -32, 0, 44)
settingsDescription.Position = UDim2.new(0, 16, 0, 44)
settingsDescription.BackgroundTransparency = 1
settingsDescription.Text = "Configure script behavior."
settingsDescription.TextColor3 = Color3.fromRGB(180, 180, 190)
settingsDescription.TextSize = 11
settingsDescription.Font = Enum.Font.Gotham
settingsDescription.TextWrapped = true
settingsDescription.TextXAlignment = Enum.TextXAlignment.Left
settingsDescription.TextYAlignment = Enum.TextYAlignment.Top

local autoExecuteRow = Instance.new("Frame", settingsPage)
autoExecuteRow.Size = UDim2.new(1, -32, 0, 66)
autoExecuteRow.Position = UDim2.new(0, 16, 0, 98)
autoExecuteRow.BackgroundColor3 = Color3.fromRGB(8, 8, 16)
autoExecuteRow.BackgroundTransparency = 0.25
autoExecuteRow.BorderSizePixel = 0
Instance.new("UICorner", autoExecuteRow).CornerRadius = UDim.new(0, 12)
local autoExecuteStroke = Instance.new("UIStroke", autoExecuteRow)
autoExecuteStroke.Color = Color3.fromRGB(35, 20, 25)
autoExecuteStroke.Thickness = 1

local autoExecuteLabel = Instance.new("TextLabel", autoExecuteRow)
autoExecuteLabel.Size = UDim2.new(1, -94, 0, 24)
autoExecuteLabel.Position = UDim2.new(0, 12, 0, 8)
autoExecuteLabel.BackgroundTransparency = 1
autoExecuteLabel.Text = "Auto Execute"
autoExecuteLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
autoExecuteLabel.TextSize = 13
autoExecuteLabel.Font = Enum.Font.GothamBold
autoExecuteLabel.TextXAlignment = Enum.TextXAlignment.Left

local autoExecuteHint = Instance.new("TextLabel", autoExecuteRow)
autoExecuteHint.Size = UDim2.new(1, -94, 0, 22)
autoExecuteHint.Position = UDim2.new(0, 12, 0, 32)
autoExecuteHint.BackgroundTransparency = 1
autoExecuteHint.Text = "Save your preference"
autoExecuteHint.TextColor3 = Color3.fromRGB(170, 170, 180)
autoExecuteHint.TextSize = 10
autoExecuteHint.Font = Enum.Font.Gotham
autoExecuteHint.TextXAlignment = Enum.TextXAlignment.Left

local autoExecuteToggle = Instance.new("TextButton", autoExecuteRow)
autoExecuteToggle.Size = UDim2.fromOffset(56, 30)
autoExecuteToggle.Position = UDim2.new(1, -68, 0.5, -15)
autoExecuteToggle.BackgroundColor3 = Color3.fromRGB(65, 65, 75)
autoExecuteToggle.BorderSizePixel = 0
autoExecuteToggle.Text = ""
autoExecuteToggle.AutoButtonColor = false
Instance.new("UICorner", autoExecuteToggle).CornerRadius = UDim.new(1, 0)

local toggleKnob = Instance.new("Frame", autoExecuteToggle)
toggleKnob.Size = UDim2.fromOffset(22, 22)
toggleKnob.Position = UDim2.new(0, 4, 0.5, -11)
toggleKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
toggleKnob.BorderSizePixel = 0
Instance.new("UICorner", toggleKnob).CornerRadius = UDim.new(1, 0)

local function updateAutoExecuteToggle()
    autoExecuteToggle.BackgroundColor3 = autoExecuteEnabled
        and Color3.fromRGB(220, 70, 85)
        or Color3.fromRGB(65, 65, 75)
    toggleKnob.Position = autoExecuteEnabled
        and UDim2.new(1, -26, 0.5, -11)
        or UDim2.new(0, 4, 0.5, -11)
    autoExecuteHint.Text = autoExecuteEnabled and "Enabled • preference saved" or "Disabled • preference saved"
end

updateAutoExecuteToggle()
autoExecuteToggle.MouseButton1Click:Connect(function()
    autoExecuteEnabled = not autoExecuteEnabled
    saveAutoExecuteSetting(autoExecuteEnabled)
    updateAutoExecuteToggle()
end)

local settingsNote = Instance.new("TextLabel", settingsPage)
settingsNote.Size = UDim2.new(1, -32, 0, 58)
settingsNote.Position = UDim2.new(0, 16, 0, 174)
settingsNote.BackgroundTransparency = 1
settingsNote.Text = "Note: launching automatically after leaving and rejoining requires your executor's Auto Execute/Autoexec feature. This toggle saves your preference; it cannot enable that executor feature by itself."
settingsNote.TextColor3 = Color3.fromRGB(180, 180, 190)
settingsNote.TextSize = 10
settingsNote.Font = Enum.Font.Gotham
settingsNote.TextWrapped = true
settingsNote.TextXAlignment = Enum.TextXAlignment.Left
settingsNote.TextYAlignment = Enum.TextYAlignment.Top


local v165=false;
local v166=Vector2.new();
local v167=UDim2.new();
v49.InputBegan:Connect(function(v198)if((v198.UserInputType==Enum.UserInputType.MouseButton1)or(v198.UserInputType==Enum.UserInputType.Touch))then
  local v203=0;
  while true do
    if(v203==0)then
      v165=true;
      v166=v198.Position;
      v203=1;
    end
    if(v203==1)then
      v167=v33.Position;
      v198.Changed:Connect(function()if(v198.UserInputState==Enum.UserInputState.End)then
        v165=false;
      end
    end
    );
    break;
  end
end
end
end
);
v9.InputChanged:Connect(function(v199)if(v165 and((v199.UserInputType==Enum.UserInputType.MouseMovement)or(v199.UserInputType==Enum.UserInputType.Touch)))then
  local v204=0;
  local v205;
  while true do
    if(v204==0)then
      v205=v199.Position-v166;
      v33.Position=UDim2.new(v167.X.Scale, v167.X.Offset+v205.X, v167.Y.Scale, v167.Y.Offset+v205.Y);
      break;
    end
  end
end
end
);
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()if not v165 then
  v33.Position=UDim2.new(0.5,-v33.AbsoluteSize.X/2, 0.5,-v33.AbsoluteSize.Y/2);
end
end
);
