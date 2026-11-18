local v8=game:GetService("Players");
local v9=game:GetService("UserInputService");
local v10=game:GetService("TweenService");
local v11=game:GetService("HttpService");
local v12=v8.LocalPlayer;
local v13=v12:WaitForChild("PlayerGui");
local v14="https://discord.gg/uqhEpzXy9q";
local v15="https://raw.githubusercontent.com/bn130189-lgtm/Tong-hop-script/main/script.json";
hàm cục bộ v16()local v171=0;
  cục bộ v172;
  trong khi đúng vậy
    nếu (v171 == 0) thì
      v172=setclipboard hoặc toclipboard;
      trả về v172 và pcall(v172, v14);
    kết thúc
  kết thúc
kết thúc
task.spawn(v16);
local v17="rbxassetid97608172188347";
local v18=workspace.CurrentCamera.ViewportSize;
cục bộ v19=(v18.X<550)hoặc v9.TouchEnabled;
cục bộ v20=(v19 và 340)hoặc 420;
local v21=(v19 and math.min(420, v18.Y-80))or 460;
cục bộ v22=(v19 và 120)hoặc 140;
cục bộ v23=(v19 và 0.85)hoặc 0.95;
for v173, v174 in ipairs({"AtrasGiaBinhUI"})do
  cục bộ v175=0;
  cục bộ v176;
  trong khi đúng vậy
    nếu (0 == v175) thì
      v176=v13:FindFirstChild(v174);
      nếu v176 thì
        v176:Destroy();
      kết thúc
      phá vỡ;
    kết thúc
  kết thúc
kết thúc
local v24=Color3.fromRGB(220, 70, 85);
local v25=Instance.new("ScreenGui");
v25.Name="AtrasGiaBinhUI";
v25.ResetOnSpawn=false;
v25.IgnoreGuiInset=true;
v25.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;
v25.DisplayOrder=100;
v25.Parent=v13;
local v33=Instance.new("Frame");
v33.Name="Chính";
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
kết thúc
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
v116.Text="💎 Cao cấp";
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
hàm cục bộ v143()local v177=0;
  cục bộ v178;
  cục bộ v179;
  cục bộ v180;
  cục bộ v181;
  cục bộ v182;
  cục bộ v183;
  cục bộ v184;
  trong khi đúng vậy
    nếu (v177 == 0) thì
      v178=Instance.new("Frame", v138);
      v178.Size=UDim2.new(1, 0, 1, 0);
      v178.BackgroundTransparency=1;
      v178.Visible=false;
      v179=Instance.new("TextBox", v178);
      v179.Size=UDim2.new(1,-32, 0, 40);
      v177=1;
    kết thúc
    nếu (v177 == 5) thì
      v182.Size=UDim2.new(1,-20, 1,-88);
      v182.Position=UDim2.new(0, 10, 0, 80);
      v182.BackgroundTransparency=1;
      v182.ScrollBarThickness=3;
      v182.ScrollBarImageColor3=v24;
      v182.AutomaticCanvasSize=Enum.AutomaticSize.Y;
      v177=6;
    kết thúc
    nếu (v177 == 3) thì
      v180.Color=Color3.fromRGB(45, 25, 30);
      v180.Thickness=1;
      v181=Instance.new("TextLabel", v178);
      v181.Size=UDim2.new(1,-32, 0, 16);
      v181.Position=UDim2.new(0, 16, 0, 64);
      v181.BackgroundTransparency=1;
      v177=4;
    kết thúc
    nếu (v177 == 4) thì
      v181.Text="❌ KHÔNG CẦN KEY | TẬP SCRIPT";
      v181.TextColor3=v24;
      v181.TextSize=10;
      v181.Font=Enum.Font.GothamBold;
      v181.TextXAlignment=Enum.TextXAlignment.Left;
      v182=Instance.new("ScrollingFrame", v178);
      v177=5;
    kết thúc
    nếu (v177 == 2) thì
      v179.TextColor3=Color3.fromRGB(255, 255, 255);
      v179.TextSize=13;
      v179.Font=Enum.Font.GothamSemibold;
      v179.ClearTextOnFocus=false;
      Instance.new("UICorner", v179).CornerRadius=UDim.new(0, 12);
      v180=Instance.new("UIStroke", v179);
      v177=3;
    kết thúc
    nếu (v177 == 7) thì
      trả về v178, v182, v184;
    kết thúc
    nếu (v177 == 1) thì
      v179.Position=UDim2.new(0, 16, 0, 12);
      v179.BackgroundColor3=Color3.fromRGB(3, 3, 8);
      v179.BackgroundTransparency=0.62;
      v179.PlaceholderText="🔍 Tìm script...";
      v179.PlaceholderColor3=Color3.fromRGB(180, 180, 180);
      v179.Text="";
      v177=2;
    kết thúc
    nếu (v177 == 6) thì
      v182.CanvasSize=UDim2.new();
      v183=Instance.new("UIListLayout", v182);
      v183.Padding=UDim.new(0, 8);
      v183.HorizontalAlignment=Enum.HorizontalAlignment.Center;
      v184={};
      v179:GetPropertyChangedSignal("Text"):Connect(function()local v263=0;
        cục bộ v264;
        trong khi đúng vậy
          nếu (v263 == 0) thì
            v264=v179.Text:lower();
            for v302, v303 in ipairs(v184)do
              v303.Button.Visible=(v264=="")or v303.Name:find(v264);
            kết thúc
            phá vỡ;
          kết thúc
        kết thúc
      kết thúc
      );
      v177=7;
    kết thúc
  kết thúc
kết thúc
cục bộ v144, v145, v146=v143();
cục bộ v147, v148, v149=v143();
cục bộ v150, v151, v152=v143();
cục bộ v153, v154, v155=v143();
cục bộ v156, v157, v158=v143();
v144.Visible=true;
hàm cục bộ v160(v185, v186, v187) nếu (kiểu(v187) ~="table") thì
  trở lại;
kết thúc
for v201, v202 in ipairs(v187)do
  nếu (v202.Name và v202.Url) thì
    cục bộ v246=0;
    cục bộ v247;
    cục bộ v248;
    cục bộ v249;
    cục bộ v250;
    trong khi đúng vậy
      nếu (v246 == 6) thì
        v247.MouseButton1Click:Connect(function()local v294=0;
          cục bộ v295;
          cục bộ v296;
          trong khi đúng vậy
            nếu (0 == v294) thì
              v249.Text="⏳Đang tải...";
              v249.TextColor3=v24;
              v294=1;
            kết thúc
            nếu (v294 == 1) thì
              v295, v296=pcall(function()loadstring(game:HttpGet(v202.Url))();
              kết thúc
              );
              nếu v295 thì
                cục bộ v327=0;
                trong khi đúng vậy
                  nếu (v327 == 1) thì
                    task.spawn(v16);
                    phá vỡ;
                  kết thúc
                  nếu (v327 == 0) thì
                    v249.Text="✅ Thành công";
                    v249.TextColor3=Color3.fromRGB(90, 210, 130);
                    v327=1;
                  kết thúc
                kết thúc
              khác
                cục bộ v328=0;
                trong khi đúng vậy
                  nếu (v328 == 0) thì
                    v249.Text="❌ Lỗi tải";
                    v249.TextColor3=Color3.fromRGB(255, 85, 95);
                    v328=1;
                  kết thúc
                  nếu (v328 == 1) thì
                    cảnh báo("[Atras] " .. tostring(v296));
                    phá vỡ;
                  kết thúc
                kết thúc
              kết thúc
              phá vỡ;
            kết thúc
          kết thúc
        kết thúc
        );
        table.insert(v186,{["Button"]=v247,["Name"]=v202.Name:lower()});
        phá vỡ;
      kết thúc
      nếu (v246 == 0) thì
        v247=Instance.new("TextButton", v185);
        v247.Size=UDim2.new(1,-8, 0, 44);
        v247.BackgroundColor3=Color3.fromRGB(5, 5, 12);
        v247.BackgroundTransparency=0.65;
        v247.Text="";
        v246=1;
      kết thúc
      nếu (v246 == 2) thì
        v249=Instance.new("TextLabel", v247);
        v249.Size=UDim2.new(1,-42, 1, 0);
        v249.Position=UDim2.new(0, 12, 0, 0);
        v249.BackgroundTransparency=1;
        v249.Text=v202.Name;
        v246=3;
      kết thúc
      nếu (1 == v246) thì
        v247.AutoButtonColor=false;
        Instance.new("UICorner", v247).CornerRadius=UDim.new(0, 12);
        v248=Instance.new("UIStroke", v247);
        v248.Color=Color3.fromRGB(35, 20, 25);
        v248.Thickness=1;
        v246=2;
      kết thúc
      nếu (v246 == 3) thì
        cục bộ v285=0;
        trong khi đúng vậy
          nếu (v285 == 2) thì
            v249.TextTruncate=Enum.TextTruncate.AtEnd;
            v246=4;
            phá vỡ;
          kết thúc
          nếu (v285 == 0) thì
            v249.TextColor3=Color3.fromRGB(255, 255, 255);
            v249.TextSize=12;
            v285=1;
          kết thúc
          nếu (v285 == 1) thì
            v249.Font=Enum.Font.GothamSemibold;
            v249.TextXAlignment=Enum.TextXAlignment.Left;
            v285=2;
          kết thúc
        kết thúc
      kết thúc
      nếu (v246 == 4) thì
        v250=Instance.new("TextLabel", v247);
        v250.Size=UDim2.fromOffset(24, 24);
        v250.Position=UDim2.new(1,-34, 0.5,-12);
        v250.BackgroundTransparency=1;
        v250.Text="▶";
        v246=5;
      kết thúc
      nếu (v246 == 5) thì
        v250.TextColor3=Color3.fromRGB(200, 200, 200);
        v250.TextSize=14;
        v250.Font=Enum.Font.GothamBold;
        v247.MouseEnter:Connect(function()local v297=0;
          trong khi đúng vậy
            nếu (v297 == 0) thì
              v10:Create(v247, TweenInfo.new(0.18),{["BackgroundColor3"]=Color3.fromRGB(35, 22, 28),["BackgroundTransparency"]=0.45}):Play();
              v250.TextColor3=v24;
              v297=1;
            kết thúc
            nếu (v297 == 1) thì
              v248.Color=v24;
              phá vỡ;
            kết thúc
          kết thúc
        kết thúc
        );
        v247.MouseLeave:Connect(function()v10:Create(v247, TweenInfo.new(0.18),{["BackgroundColor3"]=Color3.fromRGB(5, 5, 12),["BackgroundTransparency"]=0.65}):Play();
          v250.TextColor3=Color3.fromRGB(200, 200, 200);
          v248.Color=Color3.fromRGB(35, 20, 25);
        kết thúc
        );
        v246=6;
      kết thúc
    kết thúc
  kết thúc
kết thúc
kết thúc
task.spawn(function()local v188=0;
  cục bộ v189;
  cục bộ v190;
  trong khi đúng vậy
    nếu (v188 == 0) thì
      v189, v190=pcall(function()return game:HttpGet(v15);
      kết thúc
      );
      nếu v189 thì
        cục bộ v266=0;
        cục bộ v267;
        cục bộ v268;
        trong khi đúng vậy
          nếu (v266 == 0) thì
            v267, v268=pcall(function()return v11:JSONDecode(v190);
            kết thúc
            );
            nếu (v267 và (loại (v268) = ="table")) thì
              local v320=v268["Ăn trộm một quả trứng"]hoặc v268["Ăn trộm một quả trứng"];
              nếu v320 thì
                v160(v145, v146, v320);
              kết thúc
              local v321=v268["Đập vỡ và ăn trộm một quả trứng"]hoặc v268["Đập vỡ và ăn trộm một quả trứng"]hoặc v268["Đập vỡ và ăn trộm một quả trứng"];
              nếu v321 thì
                v160(v148, v149, v321);
              kết thúc
              local v322=v268["Blox Fruit"]or v268["Bloxfruit"]or v268["Blox Fruits"];
              nếu v322 thì
                v160(v151, v152, v322);
              kết thúc
              local v323=v268["MM2"]or v268["Murder Mystery 2"];
              nếu v323 thì
                v160(v154, v155, v323);
              kết thúc
              local v324=v268["Ride a pets"]or v268["Ride a Pets"]or v268["RidePets"];
              nếu v324 thì
                v160(v157, v158, v324);
              kết thúc
            kết thúc
            phá vỡ;
          kết thúc
        kết thúc
      kết thúc
      phá vỡ;
    kết thúc
  kết thúc
kết thúc
);
cục bộ v161={};
cục bộ v162=v144;
hàm cục bộ v163(v191)local v192=0;
  trong khi đúng vậy
    nếu (v192 == 1) thì
      v162=v191;
      phá vỡ;
    kết thúc
    nếu (0 == v192) thì
      v162.Visible=false;
      v191.Visible=true;
      v192=1;
    kết thúc
  kết thúc
kết thúc
hàm cục bộ v164(v193, v194, v195)local v196=0;
  cục bộ v197;
  trong khi đúng vậy
    nếu (v196 == 1) thì
      v197.Text=v193;
      v197.TextColor3=Color3.fromRGB(255, 255, 255);
      v197.TextSize=11;
      v197.Font=Enum.Font.GothamBold;
      v196=2;
    kết thúc
    nếu (v196 == 0) thì
      v197=Instance.new("TextButton", v126);
      v197.Size=UDim2.new(1,-10, 0, 40);
      v197.BackgroundColor3=(v195 and Color3.fromRGB(45, 22, 28))or Color3.fromRGB(8, 8, 16);
      v197.BackgroundTransparency=(v195 và 0.45)hoặc 0.65;
      v196=1;
    kết thúc
    nếu (v196 == 3) thì
      trả về v197;
    kết thúc
    nếu (v196 == 2) thì
      v197.AutoButtonColor=false;
      Instance.new("UICorner", v197).CornerRadius=UDim.new(0, 10);
      v197.MouseButton1Click:Connect(function()local v265=0;
        trong khi đúng vậy
          nếu (v265 == 1) thì
            v197.BackgroundTransparency=0.45;
            v163(v194);
            phá vỡ;
          kết thúc
          nếu (v265 == 0) thì
            for v305, v306 in ipairs(v161)do
              cục bộ v307=0;
              trong khi đúng vậy
                nếu (v307 == 0) thì
                  v306.BackgroundColor3=Color3.fromRGB(8, 8, 16);
                  v306.BackgroundTransparency=0.65;
                  phá vỡ;
                kết thúc
              kết thúc
            kết thúc
            v197.BackgroundColor3=Color3.fromRGB(45, 22, 28);
            v265=1;
          kết thúc
        kết thúc
      kết thúc
      );
      table.insert(v161, v197);
      v196=3;
    kết thúc
  kết thúc
kết thúc
v164("🥚 Trộm Trứng", v144, true);
v164("🥚 Phá vỡ và ăn trộm trứng", v147, false);
v164("🍊 Blox Fruit", v150, false);
v164("🔪 MM2", v153, false);
v164("🐾 Cưỡi thú cưng", v156, false);
cục bộ v165=false;
local v166=Vector2.new();
local v167=UDim2.new();
v49.InputBegan:Connect(function(v198)if((v198.UserInputType==Enum.UserInputType.MouseButton1)or(v198.UserInputType==Enum.UserInputType.Touch))then
  cục bộ v203=0;
  trong khi đúng vậy
    nếu (v203 == 0) thì
      v165=true;
      v166=v198.Vị trí;
      v203=1;
    kết thúc
    nếu (v203 == 1) thì
      v167=v33.Vị trí;
      v198.Changed:Connect(function()if(v198.UserInputState==Enum.UserInputState.End)then
        v165=false;
      kết thúc
    kết thúc
    );
    phá vỡ;
  kết thúc
kết thúc
kết thúc
kết thúc
);
v9.InputChanged:Connect(function(v199)if(v165 and((v199.UserInputType==Enum.UserInputType.MouseMovement)or(v199.UserInputType==Enum.UserInputType.Touch)))then
  cục bộ v204=0;
  cục bộ v205;
  trong khi đúng vậy
    nếu (v204 == 0) thì
      v205=v199.Vị trí-v166;
      v33.Position=UDim2.new(v167.X.Scale, v167.X.Offset+v205.X, v167.Y.Scale, v167.Y.Offset+v205.Y);
      phá vỡ;
    kết thúc
  kết thúc
kết thúc
kết thúc
);
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()if not v165 then
  v33.Position=UDim2.new(0.5,-v33.AbsoluteSize.X/2, 0.5,-v33.AbsoluteSize.Y/2);
kết thúc
kết thúc
);
