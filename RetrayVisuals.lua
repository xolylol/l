-- =====================================================================  
--         RETRAY VISUALS — ONYX LUXURY EDITION (FULL LOCAL SCRIPT)  
-- =====================================================================  
  
local Players = game:GetService("Players")  
local Lighting = game:GetService("Lighting")  
local RunService = game:GetService("RunService")  
local UserInputService = game:GetService("UserInputService")  
local TweenService = game:GetService("TweenService")  
local CoreGui = game:GetService("CoreGui")  
  
local LocalPlayer = Players.LocalPlayer  
local Camera = workspace.CurrentCamera  
  
-- Защищённая привязка интерфейса  
local ParentGui  
pcall(function()  
    ParentGui = CoreGui  
end)  
if not ParentGui or not pcall(function() local t = Instance.new("Folder", ParentGui) t:Destroy() end) then  
    ParentGui = LocalPlayer:WaitForChild("PlayerGui")  
end  
  
if ParentGui:FindFirstChild("RetrayVisualsGui") then  
    ParentGui.RetrayVisualsGui:Destroy()  
end  
  
-- =====================================================================  
--                          СИСТЕМА ЛОКАЛИЗАЦИИ  
-- =====================================================================  
local CurrentLanguage = "RU"  
  
local Translations = {  
    RU = {  
        Title = "RETRAY VISUALS  •  ONYX",  
        Tabs = {  
            Main = "Retray visuals",  
            Visuals = "Визуалы",  
            Weather = "Погода",  
            Skyboxes = "Небо",  
            World = "Мир",  
            Character = "Персонаж",  
            Crosshair = "Прицел",  
            Boards = "Паллеты",  
            ESP = "ESP / X-Ray",  
            Settings = "Настройки"  
        },  
        Main = {  
            ProfileTitle = "ПРОФИЛЬ ИГРОКА",  
            Username = "Никнейм: ",  
            DisplayName = "Отображаемое имя: ",  
            UserId = "User ID: ",  
            AccountAge = "Возраст аккаунта: ",  
            RegDate = "Дата регистрации: ",  
            Membership = "Статус Premium: ",  
            StatusTitle = "СТАТУС СКРИПТА",  
            StatusActive = " Retray Visuals v3.0 [ULTIMATE] — Активен"  
        },  
        Visuals = {  
            Bloom = "Эффект Bloom (Свечение)",  
            ColorCorrection = "Глубокая цветокоррекция",  
            Pshade = "Шейдеры Pshade Ultimate (RTX / Ultra)",  
            Fog = "Атмосферный туман",  
            FogColor = "Цвет тумана",  
            FOV = "Поле зрения (FOV): ",  
            ThirdPerson = "Вид от 3-го лица",  
            ThirdPersonDist = "Дистанция 3-й камеры: "  
        },  
        Weather = {  
            Winter = "Зима (Глобальный снегопад)",  
            Spring = "Весна (Лепестки сакуры по карте)",  
            Summer = "Лето (Солнечный зной и искры)"  
        },  
        Skyboxes = {  
            Anime = "Anime Sky (Аниме)",  
            Sunset = "Sunset (Золотой закат)",  
            PurpleSunset = "Purple Sunset (Неоновый закат)",  
            Night = "Night Sky (Глубокая ночь)",  
            Default = "Default (Сброс неба)"  
        },  
        World = {  
            FlyingCubes = "Летающие кубики вокруг",  
            CubeColor = "Цвет кубиков",  
            CubeCount = "Количество кубиков: "  
        },  
        Character = {  
            ChineseHat = "Китайская коническая шляпа",  
            ChineseHatRainbow = "Радужная шляпа (Chroma RGB)",  
            Wings = "Премиум кибер-крылья",  
            WingsColor = "Цвет крыльев",  
            OrbitCrystals = "Кристаллы вокруг игрока",  
            OrbitColor = "Цвет летающих кристаллов",  
            CrystalTrail = "След: растущие кристаллы",  
            CrystalTrailColor = "Цвет кристаллов шага",  
            JumpPulse = "Импульсный круг при прыжке",  
            JumpPulseColor = "Цвет импульса прыжка",  
            Trail = "Неоновый шлейф (Trail)",  
            TrailColor = "Цвет следа"  
        },  
        Crosshair = {  
            Toggle = "Кастомный прицел",  
            StyleCross = "Форма: Крестик",  
            StyleDot = "Форма: Точка",  
            StyleCircle = "Форма: Кольцо",  
            Color = "Цвет прицела",  
            Size = "Размер: "  
        },  
        Boards = {  
            AutoColor = "Авто-перекрас при спавне (SpawnedToys)",  
            Black = "Сделать паллеты угольно-чёрными",  
            Color = "Цвет паллеты",  
            Force = "Принудительно перекрасить паллеты",  
            Mat_SmoothPlastic = "Материал: SmoothPlastic",  
            Mat_Metal = "Материал: Metal",  
            Mat_Wood = "Материал: Wood",  
            Mat_Concrete = "Материал: Concrete",  
            Mat_Neon = "Материал: Neon",  
            Mat_Marble = "Материал: Marble"  
        },  
        ESP = {  
            PlayerESP = "ESP Игроков (Подсветка + Дистанция)",  
            XRay = "X-Ray (Сквозной обзор стен)",  
            XRayTrans = "Прозрачность X-Ray: "  
        },  
        Settings = {  
            Lang = "Сменить язык (RU/EN)",  
            MenuScale = "Масштаб интерфейса",  
            Font = "Типографика шрифта: "  
        }  
    },  
    EN = {  
        Title = "RETRAY VISUALS  •  ONYX",  
        Tabs = {  
            Main = "Retray visuals",  
            Visuals = "Visuals",  
            Weather = "Weather",  
            Skyboxes = "Skyboxes",  
            World = "World",  
            Character = "Character",  
            Crosshair = "Crosshair",  
            Boards = "Pallets",  
            ESP = "ESP / X-Ray",  
            Settings = "Settings"  
        },  
        Main = {  
            ProfileTitle = "PLAYER PROFILE",  
            Username = "Username: ",  
            DisplayName = "Display Name: ",  
            UserId = "User ID: ",  
            AccountAge = "Account Age: ",  
            RegDate = "Registration Date: ",  
            Membership = "Premium Status: ",  
            StatusTitle = "SCRIPT STATUS",  
            StatusActive = " Retray Visuals v3.0 [ULTIMATE] — Active"  
        },  
        Visuals = {  
            Bloom = "Bloom Glow Effect",  
            ColorCorrection = "Deep Color Correction",  
            Pshade = "Shaders Pshade Ultimate (RTX / Ultra)",  
            Fog = "Atmospheric Fog",  
            FogColor = "Fog Color",  
            FOV = "Field of View (FOV): ",  
            ThirdPerson = "Third Person Camera",  
            ThirdPersonDist = "3rd Camera Distance: "  
        },  
        Weather = {  
            Winter = "Winter (Global Map Snowfall)",  
            Spring = "Spring (Global Sakura Petals)",  
            Summer = "Summer (Global Sunny Heat)"  
        },  
        Skyboxes = {  
            Anime = "Anime Sky",  
            Sunset = "Sunset Sky",  
            PurpleSunset = "Purple Sunset",  
            Night = "Deep Night Sky",  
            Default = "Default Sky"  
        },  
        World = {  
            FlyingCubes = "Ambient Flying Cubes",  
            CubeColor = "Cube Color",  
            CubeCount = "Cube Count: "  
        },  
        Character = {  
            ChineseHat = "Chinese Cone Hat",  
            ChineseHatRainbow = "Rainbow Hat (Chroma RGB)",  
            Wings = "Premium Cyber Wings",  
            WingsColor = "Wings Color",  
            OrbitCrystals = "Orbiting Floating Crystals",  
            OrbitColor = "Orbit Crystal Color",  
            CrystalTrail = "Crystal Growth Footstep Trail",  
            CrystalTrailColor = "Footstep Crystal Color",  
            JumpPulse = "Ground Jump Pulse Shockwave",  
            JumpPulseColor = "Jump Pulse Color",  
            Trail = "Player Neon Trail",  
            TrailColor = "Trail Color"  
        },  
        Crosshair = {  
            Toggle = "Custom Crosshair",  
            StyleCross = "Style: Cross",  
            StyleDot = "Style: Dot",  
            StyleCircle = "Style: Circle",  
            Color = "Crosshair Color",  
            Size = "Size: "  
        },  
        Boards = {  
            AutoColor = "Auto-Color on Spawn (SpawnedToys)",  
            Black = "Make Pallets Obsidian Black",  
            Color = "Pallet Color",  
            Force = "Force Recolor Active Pallets",  
            Mat_SmoothPlastic = "Material: SmoothPlastic",  
            Mat_Metal = "Material: Metal",  
            Mat_Wood = "Material: Wood",  
            Mat_Concrete = "Material: Concrete",  
            Mat_Neon = "Material: Neon",  
            Mat_Marble = "Material: Marble"  
        },  
        ESP = {  
            PlayerESP = "Player ESP (Highlight + Distance)",  
            XRay = "X-Ray (Wall Transparency)",  
            XRayTrans = "X-Ray Transparency: "  
        },  
        Settings = {  
            Lang = "Change Language (RU/EN)",  
            MenuScale = "Menu Scale",  
            Font = "Font: "  
        }  
    }  
}  
  
local RegisteredLabels = {}  
local function RegisterText(label, updateFn)  
    table.insert(RegisteredLabels, {label = label, fn = updateFn})  
    updateFn(Translations[CurrentLanguage])  
end  
  
local function UpdateAllLanguageTexts()  
    local t = Translations[CurrentLanguage]  
    for _, item in ipairs(RegisteredLabels) do  
        if item.label and item.label.Parent then  
            item.fn(t)  
        end  
    end  
end  
  
-- =====================================================================  
--                   ПАЛИТРА С ПОДДЕРЖКОЙ РАДУЖНОГО RGB  
-- =====================================================================  
local Palette = {  
    {name = "Радужный (Chroma RGB)", isRainbow = true, color = Color3.fromRGB(255, 255, 255)},  
    {name = "Onyx Cyan", isRainbow = false, color = Color3.fromRGB(0, 230, 255)},  
    {name = "Pure White", isRainbow = false, color = Color3.fromRGB(255, 255, 255)},  
    {name = "Electric Purple", isRainbow = false, color = Color3.fromRGB(190, 70, 255)},  
    {name = "Ruby Crimson", isRainbow = false, color = Color3.fromRGB(255, 55, 75)},  
    {name = "Emerald Green", isRainbow = false, color = Color3.fromRGB(60, 255, 120)},  
    {name = "Amber Gold", isRainbow = false, color = Color3.fromRGB(255, 205, 45)},  
    {name = "Deep Obsidian", isRainbow = false, color = Color3.fromRGB(14, 14, 18)}  
}  
  
local function GetCurrentChromaColor()  
    return Color3.fromHSV((tick() * 0.45) % 1, 0.85, 1)  
end  
  
local function ResolveColor(paletteIndex)  
    local item = Palette[paletteIndex] or Palette[1]  
    if item.isRainbow then  
        return GetCurrentChromaColor()  
    end  
    return item.color  
end  
  
local Fonts = {  
    {name = "Gotham", font = Enum.Font.GothamMedium, bold = Enum.Font.GothamBold},  
    {name = "SourceSans", font = Enum.Font.SourceSans, bold = Enum.Font.SourceSansBold},  
    {name = "Code", font = Enum.Font.Code, bold = Enum.Font.Code},  
    {name = "Fantasy", font = Enum.Font.Fantasy, bold = Enum.Font.Fantasy},  
    {name = "Arcade", font = Enum.Font.Arcade, bold = Enum.Font.Arcade}  
}  
  
local State = {  
    -- Visuals  
    Bloom = false,  
    ColorCorrection = false,  
    FOV = 70,  
    Pshade = false,  
    Fog = false,  
    FogColorIndex = 2,  
    ThirdPerson = false,  
    ThirdPersonDistIndex = 2,  
  
    -- Weather  
    Winter = false,  
    Spring = false,  
    Summer = false,  
  
    -- Skyboxes  
    CurrentSky = "Default",  
  
    -- World  
    FlyingCubes = false,  
    CubeColorIndex = 1,  
    CubeCount = 25,  
  
    -- Character  
    ChineseHat = false,  
    ChineseHatRainbow = false,  
    Wings = false,  
    WingsColorIndex = 1,  
    OrbitCrystals = false,  
    OrbitColorIndex = 1,  
    CrystalTrail = false,  
    CrystalTrailColorIndex = 1,  
    JumpPulse = false,  
    JumpPulseColorIndex = 1,  
    Trail = false,  
    TrailColorIndex = 1,  
  
    -- Crosshair  
    CrosshairEnabled = false,  
    CrosshairStyle = "Cross",  
    CrosshairColorIndex = 2,  
    CrosshairSize = 12,  
  
    -- Pallets  
    PalletAutoColor = true,  
    PalletBlack = false,  
    PalletColorIndex = 1,  
    PalletMaterial = Enum.Material.SmoothPlastic,  
  
    -- ESP & X-Ray  
    ESP = false,  
    XRay = false,  
    XRayTransparency = 0.65,  
  
    -- Settings  
    FontIndex = 1,  
    ScaleIndex = 2  
}  
  
-- =====================================================================  
--                   ПРЕМИАЛЬНЫЙ ЧЁРНЫЙ ИНТЕРФЕЙС  
-- =====================================================================  
local ScreenGui = Instance.new("ScreenGui")  
ScreenGui.Name = "RetrayVisualsGui"  
ScreenGui.ResetOnSpawn = false  
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling  
ScreenGui.Parent = ParentGui  
  
local CrosshairGui = Instance.new("ScreenGui")  
CrosshairGui.Name = "RetrayCrosshairGui"  
CrosshairGui.ResetOnSpawn = false  
CrosshairGui.DisplayOrder = 999  
CrosshairGui.Parent = ParentGui  
  
local MainFrame = Instance.new("Frame")  
MainFrame.Name = "MainFrame"  
MainFrame.Size = UDim2.new(0, 640, 0, 485)  
MainFrame.Position = UDim2.new(0.5, -320, 0.5, -242)  
MainFrame.BackgroundColor3 = Color3.fromRGB(9, 10, 13)  
MainFrame.BorderSizePixel = 0  
MainFrame.ClipsDescendants = true  
MainFrame.Visible = false  
MainFrame.Parent = ScreenGui  
  
local MainScale = Instance.new("UIScale", MainFrame)  
MainScale.Scale = 1.0  
  
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)  
  
local MainStroke = Instance.new("UIStroke", MainFrame)  
MainStroke.Thickness = 1.5  
MainStroke.Color = Color3.fromRGB(38, 42, 52)  
  
local MainGradient = Instance.new("UIGradient", MainFrame)  
MainGradient.Color = ColorSequence.new({  
    ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 16, 22)),  
    ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 8, 11))  
})  
MainGradient.Rotation = 45  
  
-- Шапка  
local TopBar = Instance.new("Frame", MainFrame)  
TopBar.Name = "TopBar"  
TopBar.Size = UDim2.new(1, 0, 0, 46)  
TopBar.BackgroundColor3 = Color3.fromRGB(13, 14, 18)  
TopBar.BorderSizePixel = 0  
  
local TopBorder = Instance.new("Frame", TopBar)  
TopBorder.Size = UDim2.new(1, 0, 0, 1)  
TopBorder.Position = UDim2.new(0, 0, 1, -1)  
TopBorder.BackgroundColor3 = Color3.fromRGB(26, 28, 36)  
TopBorder.BorderSizePixel = 0  
  
local TitleLabel = Instance.new("TextLabel", TopBar)  
TitleLabel.Size = UDim2.new(1, -90, 1, 0)  
TitleLabel.Position = UDim2.new(0, 18, 0, 0)  
TitleLabel.BackgroundTransparency = 1  
TitleLabel.Font = Enum.Font.GothamBold  
TitleLabel.Text = "RETRAY VISUALS  •  ONYX"  
TitleLabel.TextColor3 = Color3.fromRGB(240, 245, 255)  
TitleLabel.TextSize = 15  
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left  
  
RegisterText(TitleLabel, function(t)  
    TitleLabel.Text = t.Title  
end)  
  
local Badge = Instance.new("TextLabel", TopBar)  
Badge.Size = UDim2.new(0, 52, 0, 18)  
Badge.Position = UDim2.new(0, 230, 0.5, -9)  
Badge.BackgroundColor3 = Color3.fromRGB(0, 210, 255)  
Badge.BackgroundTransparency = 0.85  
Badge.Font = Enum.Font.GothamBold  
Badge.Text = "ELITE"  
Badge.TextColor3 = Color3.fromRGB(0, 210, 255)  
Badge.TextSize = 10  
Instance.new("UICorner", Badge).CornerRadius = UDim.new(0, 4)  
  
-- Кнопка закрытия [X]  
local CloseBtn = Instance.new("TextButton", TopBar)  
CloseBtn.Name = "CloseButton"  
CloseBtn.Size = UDim2.new(0, 30, 0, 30)  
CloseBtn.Position = UDim2.new(1, -38, 0.5, -15)  
CloseBtn.BackgroundColor3 = Color3.fromRGB(20, 21, 28)  
CloseBtn.Font = Enum.Font.GothamBold  
CloseBtn.Text = "✕"  
CloseBtn.TextColor3 = Color3.fromRGB(160, 170, 190)  
CloseBtn.TextSize = 14  
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)  
  
local CloseStroke = Instance.new("UIStroke", CloseBtn)  
CloseStroke.Thickness = 1  
CloseStroke.Color = Color3.fromRGB(35, 38, 48)  
  
CloseBtn.MouseEnter:Connect(function()  
    CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 80)  
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)  
    CloseStroke.Color = Color3.fromRGB(255, 90, 110)  
end)  
CloseBtn.MouseLeave:Connect(function()  
    CloseBtn.BackgroundColor3 = Color3.fromRGB(20, 21, 28)  
    CloseBtn.TextColor3 = Color3.fromRGB(160, 170, 190)  
    CloseStroke.Color = Color3.fromRGB(35, 38, 48)  
end)  
CloseBtn.MouseButton1Click:Connect(function()  
    MainFrame.Visible = false  
end)  
  
-- Нижний колонтитул (Footer)  
local FooterFrame = Instance.new("Frame", MainFrame)  
FooterFrame.Name = "FooterFrame"  
FooterFrame.Size = UDim2.new(1, 0, 0, 26)  
FooterFrame.Position = UDim2.new(0, 0, 1, -26)  
FooterFrame.BackgroundColor3 = Color3.fromRGB(11, 12, 16)  
FooterFrame.BorderSizePixel = 0  
  
local FooterBorder = Instance.new("Frame", FooterFrame)  
FooterBorder.Size = UDim2.new(1, 0, 0, 1)  
FooterBorder.BackgroundColor3 = Color3.fromRGB(25, 28, 36)  
FooterBorder.BorderSizePixel = 0  
  
local FooterText = Instance.new("TextLabel", FooterFrame)  
FooterText.Size = UDim2.new(1, -20, 1, 0)  
FooterText.Position = UDim2.new(0, 10, 0, 0)  
FooterText.BackgroundTransparency = 1  
FooterText.Font = Enum.Font.GothamMedium  
FooterText.Text = "By:arti (myrzik19899),Retray_Doors (Valera240415)"  
FooterText.TextColor3 = Color3.fromRGB(130, 140, 160)  
FooterText.TextSize = 11  
FooterText.TextXAlignment = Enum.TextXAlignment.Center  
  
-- Перетаскивание окна  
local isDraggingMenu = false  
local dragStartMenu, startPosMenu  
TopBar.InputBegan:Connect(function(input)  
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then  
        isDraggingMenu = true  
        dragStartMenu = input.Position  
        startPosMenu = MainFrame.Position  
        input.Changed:Connect(function()  
            if input.UserInputState == Enum.UserInputState.End then  
                isDraggingMenu = false  
            end  
        end)  
    end  
end)  
  
UserInputService.InputChanged:Connect(function(input)  
    if isDraggingMenu and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then  
        local delta = input.Position - dragStartMenu  
        MainFrame.Position = UDim2.new(  
            startPosMenu.X.Scale,  
            startPosMenu.X.Offset + delta.X,  
            startPosMenu.Y.Scale,  
            startPosMenu.Y.Offset + delta.Y  
        )  
    end  
end)  
  
-- Меню вкладок  
local TabsContainer = Instance.new("ScrollingFrame", MainFrame)  
TabsContainer.Name = "TabsContainer"  
TabsContainer.Size = UDim2.new(0, 155, 1, -80)  
TabsContainer.Position = UDim2.new(0, 8, 0, 50)  
TabsContainer.BackgroundColor3 = Color3.fromRGB(12, 13, 17)  
TabsContainer.BorderSizePixel = 0  
TabsContainer.ScrollBarThickness = 2  
TabsContainer.ScrollBarImageColor3 = Color3.fromRGB(45, 50, 65)  
Instance.new("UICorner", TabsContainer).CornerRadius = UDim.new(0, 8)  
  
local TabsStroke = Instance.new("UIStroke", TabsContainer)  
TabsStroke.Thickness = 1  
TabsStroke.Color = Color3.fromRGB(25, 28, 36)  
  
local TabsLayout = Instance.new("UIListLayout", TabsContainer)  
TabsLayout.SortOrder = Enum.SortOrder.LayoutOrder  
TabsLayout.Padding = UDim.new(0, 4)  
  
-- Контейнер контента  
local PagesContainer = Instance.new("Frame", MainFrame)  
PagesContainer.Name = "PagesContainer"  
PagesContainer.Size = UDim2.new(1, -177, 1, -80)  
PagesContainer.Position = UDim2.new(0, 169, 0, 50)  
PagesContainer.BackgroundColor3 = Color3.fromRGB(12, 13, 17)  
PagesContainer.BorderSizePixel = 0  
Instance.new("UICorner", PagesContainer).CornerRadius = UDim.new(0, 8)  
  
local PagesStroke = Instance.new("UIStroke", PagesContainer)  
PagesStroke.Thickness = 1  
PagesStroke.Color = Color3.fromRGB(25, 28, 36)  
  
-- Мобильная кнопка RV  
local RVButton = Instance.new("TextButton", ScreenGui)  
RVButton.Name = "RV_ToggleButton"  
RVButton.Size = UDim2.new(0, 52, 0, 52)  
RVButton.Position = UDim2.new(0, 25, 0.4, 0)  
RVButton.BackgroundColor3 = Color3.fromRGB(12, 13, 18)  
RVButton.Text = "RV"  
RVButton.TextColor3 = Color3.fromRGB(230, 240, 255)  
RVButton.Font = Enum.Font.GothamBold  
RVButton.TextSize = 17  
RVButton.Active = true  
RVButton.AutoButtonColor = false  
  
Instance.new("UICorner", RVButton).CornerRadius = UDim.new(1, 0)  
local RVStroke = Instance.new("UIStroke", RVButton)  
RVStroke.Color = Color3.fromRGB(0, 210, 255)  
RVStroke.Thickness = 1.8  
  
local rvDragging = false  
local rvDragStartPos = Vector2.new()  
local rvStartOffset = Vector2.new()  
local rvDragDistance = 0  
  
RVButton.InputBegan:Connect(function(input)  
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then  
        rvDragging = true  
        rvDragDistance = 0  
        rvDragStartPos = Vector2.new(input.Position.X, input.Position.Y)  
        rvStartOffset = Vector2.new(RVButton.AbsolutePosition.X, RVButton.AbsolutePosition.Y)  
    end  
end)  
  
UserInputService.InputChanged:Connect(function(input)  
    if rvDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then  
        local currentPos = Vector2.new(input.Position.X, input.Position.Y)  
        local delta = currentPos - rvDragStartPos  
        rvDragDistance = delta.Magnitude  
  
        local vp = Camera.ViewportSize  
        local targetX = math.clamp(rvStartOffset.X + delta.X, 4, vp.X - RVButton.AbsoluteSize.X - 4)  
        local targetY = math.clamp(rvStartOffset.Y + delta.Y, 24, vp.Y - RVButton.AbsoluteSize.Y - 24)  
  
        RVButton.Position = UDim2.new(0, targetX, 0, targetY)  
    end  
end)  
  
UserInputService.InputEnded:Connect(function(input)  
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then  
        if rvDragging then  
            rvDragging = false  
            if rvDragDistance < 8 then  
                MainFrame.Visible = not MainFrame.Visible  
            end  
        end  
    end  
end)  
  
UserInputService.InputBegan:Connect(function(input, gpe)  
    if gpe then return end  
    if input.KeyCode == Enum.KeyCode.RightShift then  
        MainFrame.Visible = not MainFrame.Visible  
    end  
end)  
  
-- =====================================================================  
--                   ФАБРИКА СТРАНИЦ И ЭЛЕМЕНТОВ  
-- =====================================================================  
local Pages = {}  
local TabButtons = {}  
  
local function CreatePage(id, tabNameKey)  
    local page = Instance.new("ScrollingFrame", PagesContainer)  
    page.Name = id .. "Page"  
    page.Size = UDim2.new(1, -14, 1, -14)  
    page.Position = UDim2.new(0, 7, 0, 7)  
    page.BackgroundTransparency = 1  
    page.BorderSizePixel = 0  
    page.ScrollBarThickness = 3  
    page.ScrollBarImageColor3 = Color3.fromRGB(0, 190, 255)  
    page.Visible = false  
  
    local layout = Instance.new("UIListLayout", page)  
    layout.Padding = UDim.new(0, 6)  
    layout.SortOrder = Enum.SortOrder.LayoutOrder  
  
    local tabBtn = Instance.new("TextButton", TabsContainer)  
    tabBtn.Size = UDim2.new(1, -6, 0, 35)  
    tabBtn.BackgroundColor3 = Color3.fromRGB(15, 16, 21)  
    tabBtn.Font = Enum.Font.GothamMedium  
    tabBtn.TextSize = 13  
    tabBtn.TextColor3 = Color3.fromRGB(160, 170, 190)  
    Instance.new("UICorner", tabBtn).CornerRadius = UDim.new(0, 6)  
  
    local stroke = Instance.new("UIStroke", tabBtn)  
    stroke.Thickness = 1  
    stroke.Color = Color3.fromRGB(24, 27, 36)  
  
    RegisterText(tabBtn, function(t)  
        tabBtn.Text = t.Tabs[tabNameKey] or tabNameKey  
    end)  
  
    tabBtn.MouseButton1Click:Connect(function()  
        for _, p in pairs(Pages) do p.Visible = false end  
        for _, b in pairs(TabButtons) do  
            b.BackgroundColor3 = Color3.fromRGB(15, 16, 21)  
            b.TextColor3 = Color3.fromRGB(160, 170, 190)  
            b.UIStroke.Color = Color3.fromRGB(24, 27, 36)  
        end  
        page.Visible = true  
        tabBtn.BackgroundColor3 = Color3.fromRGB(22, 25, 34)  
        tabBtn.TextColor3 = Color3.fromRGB(0, 230, 255)  
        tabBtn.UIStroke.Color = Color3.fromRGB(0, 180, 255)  
    end)  
  
    Pages[id] = page  
    TabButtons[id] = tabBtn  
    return page  
end  
  
local function CreateToggle(parent, defaultState, textKeyPath, onToggle)  
    local state = defaultState or false  
  
    local btn = Instance.new("TextButton", parent)  
    btn.Size = UDim2.new(1, -6, 0, 38)  
    btn.BackgroundColor3 = Color3.fromRGB(16, 17, 23)  
    btn.Font = Enum.Font.GothamMedium  
    btn.TextSize = 13  
    btn.TextColor3 = Color3.fromRGB(210, 220, 240)  
    btn.TextXAlignment = Enum.TextXAlignment.Left  
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)  
  
    local stroke = Instance.new("UIStroke", btn)  
    stroke.Thickness = 1  
    stroke.Color = state and Color3.fromRGB(0, 190, 255) or Color3.fromRGB(28, 31, 42)  
  
    local function getRawText(t)  
        local cur = t  
        for _, k in ipairs(textKeyPath) do cur = cur[k] end  
        return cur or ""  
    end  
  
    local function updateText()  
        local box = state and "[✓]  " or "[  ]  "  
        local base = getRawText(Translations[CurrentLanguage])  
        btn.Text = "   " .. box .. base  
        stroke.Color = state and Color3.fromRGB(0, 210, 255) or Color3.fromRGB(28, 31, 42)  
        btn.TextColor3 = state and Color3.fromRGB(0, 230, 255) or Color3.fromRGB(190, 200, 220)  
    end  
  
    RegisterText(btn, function() updateText() end)  
  
    btn.MouseButton1Click:Connect(function()  
        state = not state  
        updateText()  
        onToggle(state)  
    end)  
  
    return {  
        SetState = function(val)  
            state = val  
            updateText()  
            onToggle(state)  
        end,  
        GetState = function() return state end,  
        Button = btn  
    }  
end  
  
local function CreateActionButton(parent, title, onClick)  
    local btn = Instance.new("TextButton", parent)  
    btn.Size = UDim2.new(1, -6, 0, 36)  
    btn.BackgroundColor3 = Color3.fromRGB(18, 20, 27)  
    btn.Font = Enum.Font.GothamMedium  
    btn.TextSize = 13  
    btn.TextColor3 = Color3.fromRGB(195, 215, 245)  
    btn.Text = title  
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)  
  
    local stroke = Instance.new("UIStroke", btn)  
    stroke.Thickness = 1  
    stroke.Color = Color3.fromRGB(30, 35, 48)  
  
    btn.MouseEnter:Connect(function()  
        btn.BackgroundColor3 = Color3.fromRGB(24, 27, 36)  
        stroke.Color = Color3.fromRGB(0, 180, 255)  
    end)  
    btn.MouseLeave:Connect(function()  
        btn.BackgroundColor3 = Color3.fromRGB(18, 20, 27)  
        stroke.Color = Color3.fromRGB(30, 35, 48)  
    end)  
  
    btn.MouseButton1Click:Connect(onClick)  
    return btn  
end  
  
-- =====================================================================  
--         ГЛАВНЫЙ ПУНКТ: RETRAY VISUALS (КРУТЯЩИЙСЯ СКИН И ИНФО)  
-- =====================================================================  
local MainPage = CreatePage("Main", "Main")  
  
local ProfileCard = Instance.new("Frame", MainPage)  
ProfileCard.Size = UDim2.new(1, -6, 0, 290)  
ProfileCard.BackgroundColor3 = Color3.fromRGB(15, 16, 22)  
ProfileCard.BorderSizePixel = 0  
Instance.new("UICorner", ProfileCard).CornerRadius = UDim.new(0, 8)  
local CardStroke = Instance.new("UIStroke", ProfileCard)  
CardStroke.Color = Color3.fromRGB(28, 32, 44)  
CardStroke.Thickness = 1  
  
-- 3D ViewportFrame со скином игрока  
local ViewportContainer = Instance.new("Frame", ProfileCard)  
ViewportContainer.Size = UDim2.new(0, 160, 1, -16)  
ViewportContainer.Position = UDim2.new(0, 10, 0, 8)  
ViewportContainer.BackgroundColor3 = Color3.fromRGB(9, 10, 13)  
ViewportContainer.BorderSizePixel = 0  
Instance.new("UICorner", ViewportContainer).CornerRadius = UDim.new(0, 8)  
local VpStroke = Instance.new("UIStroke", ViewportContainer)  
VpStroke.Color = Color3.fromRGB(0, 180, 255)  
VpStroke.Thickness = 1  
  
local CharViewport = Instance.new("ViewportFrame", ViewportContainer)  
CharViewport.Size = UDim2.new(1, 0, 1, 0)  
CharViewport.BackgroundTransparency = 1  
  
local VpWorld = Instance.new("WorldModel", CharViewport)  
local VpCamera = Instance.new("Camera", CharViewport)  
VpCamera.FieldOfView = 36  
CharViewport.CurrentCamera = VpCamera  
  
local ClonedCharModel = nil  
local function SetupViewportCharacter()  
    if ClonedCharModel then ClonedCharModel:Destroy() ClonedCharModel = nil end  
    local realChar = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()  
    realChar.Archivable = true  
    local cloned = realChar:Clone()  
    cloned.Name = "ViewportCharacter"  
  
    for _, v in ipairs(cloned:GetDescendants()) do  
        if v:IsA("Script") or v:IsA("LocalScript") or v:IsA("Sound") or v:IsA("ParticleEmitter") or v:IsA("BillboardGui") then  
            v:Destroy()  
        elseif v:IsA("BasePart") then  
            v.Anchored = true  
            v.CanCollide = false  
        end  
    end  
  
    local hrp = cloned:FindFirstChild("HumanoidRootPart") or cloned:FindFirstChild("Head")  
    if hrp then  
        cloned:PivotTo(CFrame.new(0, 0, 0))  
    end  
  
    cloned.Parent = VpWorld  
    ClonedCharModel = cloned  
  
    local camOffset = Vector3.new(0, 0.5, 7.5)  
    VpCamera.CFrame = CFrame.new(camOffset, Vector3.new(0, 0, 0))  
end  
  
task.spawn(SetupViewportCharacter)  
LocalPlayer.CharacterAdded:Connect(function()  
    task.wait(1)  
    SetupViewportCharacter()  
end)  
  
-- Плавное вращение скина  
RunService.RenderStepped:Connect(function()  
    if ClonedCharModel and ClonedCharModel.Parent and MainFrame.Visible then  
        local rotY = math.rad(tick() * 45 % 360)  
        ClonedCharModel:PivotTo(CFrame.Angles(0, rotY, 0))  
    end  
end)  
  
-- Информационная панель профиля игрока  
local InfoContainer = Instance.new("Frame", ProfileCard)  
InfoContainer.Size = UDim2.new(1, -190, 1, -16)  
InfoContainer.Position = UDim2.new(0, 180, 0, 8)  
InfoContainer.BackgroundTransparency = 1  
  
local InfoLayout = Instance.new("UIListLayout", InfoContainer)  
InfoLayout.SortOrder = Enum.SortOrder.LayoutOrder  
InfoLayout.Padding = UDim.new(0, 5)  
  
local regTimestamp = os.time() - (LocalPlayer.AccountAge * 86400)  
local regDateString = os.date("%d.%m.%Y", regTimestamp)  
local isPremium = (LocalPlayer.MembershipType == Enum.MembershipType.Premium) and "Да (Premium)" or "Нет (Standard)"  
  
local infoLabels = {  
    {tag = "Username", fn = function(t) return t.Main.Username .. "@" .. LocalPlayer.Name end},  
    {tag = "DisplayName", fn = function(t) return t.Main.DisplayName .. LocalPlayer.DisplayName end},  
    {tag = "UserId", fn = function(t) return t.Main.UserId .. LocalPlayer.UserId end},  
    {tag = "AccountAge", fn = function(t) return t.Main.AccountAge .. LocalPlayer.AccountAge .. " дней" end},  
    {tag = "RegDate", fn = function(t) return t.Main.RegDate .. regDateString end},  
    {tag = "Membership", fn = function(t) return t.Main.Membership .. isPremium end}  
}  
  
for _, item in ipairs(infoLabels) do  
    local lbl = Instance.new("TextLabel", InfoContainer)  
    lbl.Size = UDim2.new(1, 0, 0, 22)  
    lbl.BackgroundTransparency = 1  
    lbl.Font = Enum.Font.GothamMedium  
    lbl.TextSize = 12  
    lbl.TextColor3 = Color3.fromRGB(200, 215, 240)  
    lbl.TextXAlignment = Enum.TextXAlignment.Left  
  
    RegisterText(lbl, function(t)  
        lbl.Text = item.fn(t)  
    end)  
end  
  
-- =====================================================================  
--       ДОБАВЛЕННЫЙ БЛОК АВТОРОВ И ПРИЗЫВА ПОД СТРОЧКОЙ PREMIUM  
-- =====================================================================  
local SepLine = Instance.new("Frame", InfoContainer)  
SepLine.Size = UDim2.new(1, -10, 0, 1)  
SepLine.BackgroundColor3 = Color3.fromRGB(28, 35, 48)  
SepLine.BorderSizePixel = 0  
  
local CreditLabel1 = Instance.new("TextLabel", InfoContainer)  
CreditLabel1.Size = UDim2.new(1, 0, 0, 18)  
CreditLabel1.BackgroundTransparency = 1  
CreditLabel1.Font = Enum.Font.GothamMedium  
CreditLabel1.TextSize = 11  
CreditLabel1.TextColor3 = Color3.fromRGB(0, 210, 255)  
CreditLabel1.TextXAlignment = Enum.TextXAlignment.Left  
CreditLabel1.Text = "by:arti(myrzik19899"  
  
local CreditLabel2 = Instance.new("TextLabel", InfoContainer)  
CreditLabel2.Size = UDim2.new(1, 0, 0, 18)  
CreditLabel2.BackgroundTransparency = 1  
CreditLabel2.Font = Enum.Font.GothamMedium  
CreditLabel2.TextSize = 11  
CreditLabel2.TextColor3 = Color3.fromRGB(0, 210, 255)  
CreditLabel2.TextXAlignment = Enum.TextXAlignment.Left  
CreditLabel2.Text = "by:Retray_doors (Valera240415)"  
  
local FollowLabel = Instance.new("TextLabel", InfoContainer)  
FollowLabel.Size = UDim2.new(1, 0, 0, 18)  
FollowLabel.BackgroundTransparency = 1  
FollowLabel.Font = Enum.Font.GothamBold  
FollowLabel.TextSize = 11  
FollowLabel.TextColor3 = Color3.fromRGB(255, 210, 80)  
FollowLabel.TextXAlignment = Enum.TextXAlignment.Left  
FollowLabel.Text = "Follow with we pls."  
  
-- Карточка статуса  
local StatusCard = Instance.new("Frame", MainPage)  
StatusCard.Size = UDim2.new(1, -6, 0, 46)  
StatusCard.BackgroundColor3 = Color3.fromRGB(15, 16, 22)  
StatusCard.BorderSizePixel = 0  
Instance.new("UICorner", StatusCard).CornerRadius = UDim.new(0, 8)  
local StatusStroke = Instance.new("UIStroke", StatusCard)  
StatusStroke.Color = Color3.fromRGB(0, 180, 255)  
StatusStroke.Thickness = 1  
  
local StatusLabel = Instance.new("TextLabel", StatusCard)  
StatusLabel.Size = UDim2.new(1, -20, 1, 0)  
StatusLabel.Position = UDim2.new(0, 10, 0, 0)  
StatusLabel.BackgroundTransparency = 1  
StatusLabel.Font = Enum.Font.GothamBold  
StatusLabel.TextSize = 12  
StatusLabel.TextColor3 = Color3.fromRGB(0, 230, 255)  
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left  
  
RegisterText(StatusLabel, function(t)  
    StatusLabel.Text = t.Main.StatusTitle .. ":" .. t.Main.StatusActive  
end)  
  
-- =====================================================================  
--                   1. ВИЗУАЛЫ И ШЕЙДЕРЫ PSHADE ULTIMATE  
-- =====================================================================  
local VisualsPage = CreatePage("Visuals", "Visuals")  
  
local BloomInstance = Lighting:FindFirstChild("RV_Bloom") or Instance.new("BloomEffect")  
BloomInstance.Name = "RV_Bloom"  
BloomInstance.Intensity = 1.25  
BloomInstance.Size = 24  
BloomInstance.Threshold = 0.85  
BloomInstance.Enabled = false  
BloomInstance.Parent = Lighting  
  
local ColorCorrectionInstance = Lighting:FindFirstChild("RV_ColorCorrection") or Instance.new("ColorCorrectionEffect")  
ColorCorrectionInstance.Name = "RV_ColorCorrection"  
ColorCorrectionInstance.Saturation = 0.35  
ColorCorrectionInstance.Contrast = 0.2  
ColorCorrectionInstance.Brightness = 0.05  
ColorCorrectionInstance.Enabled = false  
ColorCorrectionInstance.Parent = Lighting  
  
CreateToggle(VisualsPage, false, {"Visuals", "Bloom"}, function(on)  
    BloomInstance.Enabled = on  
end)  
  
CreateToggle(VisualsPage, false, {"Visuals", "ColorCorrection"}, function(on)  
    ColorCorrectionInstance.Enabled = on  
end)  
  
-- Pshade Ultimate Shaders (RTX реалистичное освещение)  
local PshadeAtmosphere = nil  
local PshadeSunRays = nil  
local PshadeDOF = nil  
local PshadeBloom = nil  
local PshadeCC = nil  
  
local OrigLightingData = {  
    Brightness = Lighting.Brightness,  
    OutdoorAmbient = Lighting.OutdoorAmbient,  
    ShadowSoftness = Lighting.ShadowSoftness,  
    GlobalShadows = Lighting.GlobalShadows,  
    ExposureCompensation = Lighting.ExposureCompensation  
}  
  
local function EnablePshadeUltimate(enable)  
    if enable then  
        Lighting.Brightness = 2.4  
        Lighting.ShadowSoftness = 0.15  
        Lighting.GlobalShadows = true  
        Lighting.OutdoorAmbient = Color3.fromRGB(85, 90, 105)  
        Lighting.ExposureCompensation = 0.12  
  
        PshadeAtmosphere = Instance.new("Atmosphere")  
        PshadeAtmosphere.Name = "Pshade_Atmosphere"  
        PshadeAtmosphere.Density = 0.34  
        PshadeAtmosphere.Offset = 0.28  
        PshadeAtmosphere.Color = Color3.fromRGB(205, 215, 235)  
        PshadeAtmosphere.Decay = Color3.fromRGB(115, 125, 145)  
        PshadeAtmosphere.Glare = 0.45  
        PshadeAtmosphere.Haze = 0.55  
        PshadeAtmosphere.Parent = Lighting  
  
        PshadeSunRays = Instance.new("SunRaysEffect")  
        PshadeSunRays.Name = "Pshade_SunRays"  
        PshadeSunRays.Intensity = 0.24  
        PshadeSunRays.Spread = 0.92  
        PshadeSunRays.Parent = Lighting  
  
        PshadeDOF = Instance.new("DepthOfFieldEffect")  
        PshadeDOF.Name = "Pshade_DOF"  
        PshadeDOF.FarIntensity = 0.22  
        PshadeDOF.FocusDistance = 35  
        PshadeDOF.InFocusRadius = 45  
        PshadeDOF.NearIntensity = 0.08  
        PshadeDOF.Parent = Lighting  
  
        PshadeBloom = Instance.new("BloomEffect")  
        PshadeBloom.Name = "Pshade_Bloom"  
        PshadeBloom.Intensity = 0.7  
        PshadeBloom.Size = 36  
        PshadeBloom.Threshold = 0.8  
        PshadeBloom.Parent = Lighting  
  
        PshadeCC = Instance.new("ColorCorrectionEffect")  
        PshadeCC.Name = "Pshade_CC"  
        PshadeCC.Brightness = 0.04  
        PshadeCC.Contrast = 0.28  
        PshadeCC.Saturation = 0.38  
        PshadeCC.TintColor = Color3.fromRGB(255, 248, 242)  
        PshadeCC.Parent = Lighting  
    else  
        Lighting.Brightness = OrigLightingData.Brightness  
        Lighting.ShadowSoftness = OrigLightingData.ShadowSoftness  
        Lighting.GlobalShadows = OrigLightingData.GlobalShadows  
        Lighting.OutdoorAmbient = OrigLightingData.OutdoorAmbient  
        Lighting.ExposureCompensation = OrigLightingData.ExposureCompensation  
  
        if PshadeAtmosphere then PshadeAtmosphere:Destroy() PshadeAtmosphere = nil end  
        if PshadeSunRays then PshadeSunRays:Destroy() PshadeSunRays = nil end  
        if PshadeDOF then PshadeDOF:Destroy() PshadeDOF = nil end  
        if PshadeBloom then PshadeBloom:Destroy() PshadeBloom = nil end  
        if PshadeCC then PshadeCC:Destroy() PshadeCC = nil end  
    end  
end  
  
CreateToggle(VisualsPage, false, {"Visuals", "Pshade"}, function(on)  
    State.Pshade = on  
    EnablePshadeUltimate(on)  
end)  
  
local fovBtn = CreateActionButton(VisualsPage, "FOV: " .. Camera.FieldOfView, function() end)  
fovBtn.MouseButton1Click:Connect(function()  
    local fovList = {50, 70, 80, 90, 100, 110, 120}  
    local curIdx = 1  
    for i, v in ipairs(fovList) do  
        if v == State.FOV then curIdx = i break end  
    end  
    curIdx = (curIdx % #fovList) + 1  
    State.FOV = fovList[curIdx]  
    Camera.FieldOfView = State.FOV  
    fovBtn.Text = Translations[CurrentLanguage].Visuals.FOV .. State.FOV  
end)  
RegisterText(fovBtn, function(t)  
    fovBtn.Text = t.Visuals.FOV .. State.FOV  
end)  
  
local origFogEnd = Lighting.FogEnd  
local origFogStart = Lighting.FogStart  
local origFogColor = Lighting.FogColor  
  
CreateToggle(VisualsPage, false, {"Visuals", "Fog"}, function(on)  
    State.Fog = on  
    if on then  
        Lighting.FogStart = 10  
        Lighting.FogEnd = 300  
        Lighting.FogColor = ResolveColor(State.FogColorIndex)  
    else  
        Lighting.FogStart = origFogStart  
        Lighting.FogEnd = 100000  
        Lighting.FogColor = origFogColor  
    end  
end)  
  
local fogColorBtn = CreateActionButton(VisualsPage, "Цвет тумана", function() end)  
fogColorBtn.MouseButton1Click:Connect(function()  
    State.FogColorIndex = (State.FogColorIndex % #Palette) + 1  
    local p = Palette[State.FogColorIndex]  
    fogColorBtn.Text = Translations[CurrentLanguage].Visuals.FogColor .. ": " .. p.name  
    if State.Fog then  
        Lighting.FogColor = ResolveColor(State.FogColorIndex)  
    end  
end)  
RegisterText(fogColorBtn, function(t)  
    fogColorBtn.Text = t.Visuals.FogColor .. ": " .. Palette[State.FogColorIndex].name  
end)  
  
local ThirdPersonDistances = {  
    {name = "Близко (8m)", dist = 8, offset = Vector3.new(1.8, 0.4, 0)},  
    {name = "Стандарт (15m)", dist = 15, offset = Vector3.new(2.2, 0.6, 0)},  
    {name = "Далеко (25m)", dist = 25, offset = Vector3.new(2.8, 0.8, 0)},  
    {name = "Максимум (40m)", dist = 40, offset = Vector3.new(3.5, 1.0, 0)}  
}  
  
local function ApplyThirdPersonView()  
    local char = LocalPlayer.Character  
    local hum = char and char:FindFirstChildOfClass("Humanoid")  
    local config = ThirdPersonDistances[State.ThirdPersonDistIndex]  
  
    if State.ThirdPerson then  
        LocalPlayer.CameraMode = Enum.CameraMode.Classic  
        LocalPlayer.CameraMinZoomDistance = config.dist  
        LocalPlayer.CameraMaxZoomDistance = config.dist  
        if hum then hum.CameraOffset = config.offset end  
    else  
        LocalPlayer.CameraMinZoomDistance = 0.5  
        LocalPlayer.CameraMaxZoomDistance = 128  
        if hum then hum.CameraOffset = Vector3.new(0, 0, 0) end  
    end  
end  
  
CreateToggle(VisualsPage, false, {"Visuals", "ThirdPerson"}, function(on)  
    State.ThirdPerson = on  
    ApplyThirdPersonView()  
end)  
  
local tpDistBtn = CreateActionButton(VisualsPage, "Дистанция 3-й камеры", function() end)  
tpDistBtn.MouseButton1Click:Connect(function()  
    State.ThirdPersonDistIndex = (State.ThirdPersonDistIndex % #ThirdPersonDistances) + 1  
    local cur = ThirdPersonDistances[State.ThirdPersonDistIndex]  
    tpDistBtn.Text = Translations[CurrentLanguage].Visuals.ThirdPersonDist .. cur.name  
    if State.ThirdPerson then ApplyThirdPersonView() end  
end)  
RegisterText(tpDistBtn, function(t)  
    tpDistBtn.Text = t.Visuals.ThirdPersonDist .. ThirdPersonDistances[State.ThirdPersonDistIndex].name  
end)  
  
-- =====================================================================  
--         2. ПОГОДА (ГЛОБАЛЬНАЯ ПО ВСЕЙ КАРТЕ)  
-- =====================================================================  
local WeatherPage = CreatePage("Weather", "Weather")  
local GlobalWeatherPart = nil  
local GlobalWeatherEmitter = nil  
local WeatherLoopConnection = nil  
  
local function ClearGlobalWeather()  
    if WeatherLoopConnection then  
        WeatherLoopConnection:Disconnect()  
        WeatherLoopConnection = nil  
    end  
    if GlobalWeatherEmitter then  
        GlobalWeatherEmitter:Destroy()  
        GlobalWeatherEmitter = nil  
    end  
    if GlobalWeatherPart then  
        GlobalWeatherPart:Destroy()  
        GlobalWeatherPart = nil  
    end  
end  
  
local function ApplyGlobalWeather(kind)  
    ClearGlobalWeather()  
  
    GlobalWeatherPart = Instance.new("Part", workspace)  
    GlobalWeatherPart.Name = "RV_GlobalWeatherEmitter"  
    GlobalWeatherPart.Size = Vector3.new(350, 2, 350)  
    GlobalWeatherPart.Transparency = 1  
    GlobalWeatherPart.Anchored = true  
    GlobalWeatherPart.CanCollide = false  
    GlobalWeatherPart.CastShadow = false  
  
    GlobalWeatherEmitter = Instance.new("ParticleEmitter", GlobalWeatherPart)  
    GlobalWeatherEmitter.Shape = Enum.ParticleEmitterShape.Box  
    GlobalWeatherEmitter.Rate = 280  
    GlobalWeatherEmitter.EmissionDirection = Enum.NormalId.Bottom  
    GlobalWeatherEmitter.Speed = NumberRange.new(22, 38)  
    GlobalWeatherEmitter.SpreadAngle = Vector2.new(10, 10)  
  
    if kind == "Winter" then  
        GlobalWeatherEmitter.Texture = "rbxasset://textures/particles/sparkles_main.dds"  
        GlobalWeatherEmitter.Color = ColorSequence.new(Color3.fromRGB(245, 250, 255))  
        GlobalWeatherEmitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.45), NumberSequenceKeypoint.new(1, 0.2)})  
        GlobalWeatherEmitter.Lifetime = NumberRange.new(3.5, 5.5)  
        GlobalWeatherEmitter.Acceleration = Vector3.new(2, -18, 1)  
    elseif kind == "Spring" then  
        GlobalWeatherEmitter.Texture = "rbxasset://textures/particles/sparkles_main.dds"  
        GlobalWeatherEmitter.Color = ColorSequence.new({  
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 180, 205)),  
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 220, 235))  
        })  
        GlobalWeatherEmitter.Size = NumberSequence.new(0.38)  
        GlobalWeatherEmitter.Lifetime = NumberRange.new(4, 6)  
        GlobalWeatherEmitter.Acceleration = Vector3.new(4, -12, 3)  
    elseif kind == "Summer" then  
        GlobalWeatherEmitter.Texture = "rbxasset://textures/particles/sparkles_main.dds"  
        GlobalWeatherEmitter.Color = ColorSequence.new(Color3.fromRGB(255, 215, 110))  
        GlobalWeatherEmitter.Size = NumberSequence.new(0.45)  
        GlobalWeatherEmitter.Lifetime = NumberRange.new(2.5, 4.5)  
        GlobalWeatherEmitter.Acceleration = Vector3.new(0, -15, 0)  
    end  
  
    WeatherLoopConnection = RunService.RenderStepped:Connect(function()  
        if GlobalWeatherPart and GlobalWeatherPart.Parent then  
            local camPos = Camera.CFrame.Position  
            GlobalWeatherPart.CFrame = CFrame.new(camPos.X, camPos.Y + 45, camPos.Z)  
        end  
    end)  
end  
  
local winterToggle, springToggle, summerToggle  
  
winterToggle = CreateToggle(WeatherPage, false, {"Weather", "Winter"}, function(on)  
    State.Winter = on  
    if on then  
        springToggle.SetState(false)  
        summerToggle.SetState(false)  
        ApplyGlobalWeather("Winter")  
    else  
        if not State.Spring and not State.Summer then ClearGlobalWeather() end  
    end  
end)  
  
springToggle = CreateToggle(WeatherPage, false, {"Weather", "Spring"}, function(on)  
    State.Spring = on  
    if on then  
        winterToggle.SetState(false)  
        summerToggle.SetState(false)  
        ApplyGlobalWeather("Spring")  
    else  
        if not State.Winter and not State.Summer then ClearGlobalWeather() end  
    end  
end)  
  
summerToggle = CreateToggle(WeatherPage, false, {"Weather", "Summer"}, function(on)  
    State.Summer = on  
    if on then  
        winterToggle.SetState(false)  
        springToggle.SetState(false)  
        ApplyGlobalWeather("Summer")  
    else  
        if not State.Winter and not State.Spring then ClearGlobalWeather() end  
    end  
end)  
  
-- =====================================================================  
--                   3. СКАЙБОКСЫ  
-- =====================================================================  
local SkiesPage = CreatePage("Skies", "Skyboxes")  
  
local OriginalSky = Lighting:FindFirstChildOfClass("Sky")  
local OriginalSkyData = {}  
if OriginalSky then  
    OriginalSkyData = {  
        Bk = OriginalSky.SkyboxBk,  
        Dn = OriginalSky.SkyboxDn,  
        Ft = OriginalSky.SkyboxFt,  
        Lf = OriginalSky.SkyboxLf,  
        Rt = OriginalSky.SkyboxRt,  
        Up = OriginalSky.SkyboxUp  
    }  
end  
  
local RealSkyboxes = {  
    Anime = {  
        Bk = "rbxassetid://21076888",  
        Dn = "rbxassetid://21076888",  
        Ft = "rbxassetid://21076888",  
        Lf = "rbxassetid://21076888",  
        Rt = "rbxassetid://21076888",  
        Up = "rbxassetid://21076888"  
    },  
    Sunset = {  
        Bk = "rbxassetid://626460377",  
        Dn = "rbxassetid://626460216",  
        Ft = "rbxassetid://626460513",  
        Lf = "rbxassetid://626473032",  
        Rt = "rbxassetid://626458639",  
        Up = "rbxassetid://626460625"  
    },  
    PurpleSunset = {  
        Bk = "rbxassetid://159454299",  
        Dn = "rbxassetid://159454296",  
        Ft = "rbxassetid://159454293",  
        Lf = "rbxassetid://159454286",  
        Rt = "rbxassetid://159454300",  
        Up = "rbxassetid://159454288"  
    },  
    Night = {  
        Bk = "rbxassetid://12064107",  
        Dn = "rbxassetid://12064152",  
        Ft = "rbxassetid://12064121",  
        Lf = "rbxassetid://12063984",  
        Rt = "rbxassetid://12064115",  
        Up = "rbxassetid://12064131"  
    }  
}  
  
local function ApplySkybox(name)  
    State.CurrentSky = name  
    local current = Lighting:FindFirstChild("RV_ActiveSky") or Lighting:FindFirstChildOfClass("Sky")  
    if not current then  
        current = Instance.new("Sky")  
        current.Name = "RV_ActiveSky"  
        current.Parent = Lighting  
    end  
  
    if name == "Default" then  
        if OriginalSkyData.Bk then  
            current.SkyboxBk = OriginalSkyData.Bk  
            current.SkyboxDn = OriginalSkyData.Dn  
            current.SkyboxFt = OriginalSkyData.Ft  
            current.SkyboxLf = OriginalSkyData.Lf  
            current.SkyboxRt = OriginalSkyData.Rt  
            current.SkyboxUp = OriginalSkyData.Up  
        else  
            current:Destroy()  
        end  
        return  
    end  
  
    local pack = RealSkyboxes[name]  
    if pack then  
        current.Name = "RV_ActiveSky"  
        current.SkyboxBk = pack.Bk  
        current.SkyboxDn = pack.Dn  
        current.SkyboxFt = pack.Ft  
        current.SkyboxLf = pack.Lf  
        current.SkyboxRt = pack.Rt  
        current.SkyboxUp = pack.Up  
        current.CelestialBodiesShown = true  
        current.Parent = Lighting  
    end  
end  
  
CreateActionButton(SkiesPage, "Anime Sky", function() ApplySkybox("Anime") end)  
CreateActionButton(SkiesPage, "Sunset", function() ApplySkybox("Sunset") end)  
CreateActionButton(SkiesPage, "Purple Sunset", function() ApplySkybox("PurpleSunset") end)  
CreateActionButton(SkiesPage, "Night", function() ApplySkybox("Night") end)  
CreateActionButton(SkiesPage, "Default (Сброс)", function() ApplySkybox("Default") end)  
  
-- =====================================================================  
--                   4. ДОПОЛНИТЕЛЬНЫЕ ЭФФЕКТЫ МИРА  
-- =====================================================================  
local WorldPage = CreatePage("World", "World")  
local CubesFolder = nil  
local CubesConnection = nil  
local ActiveCubes = {}  
  
local function ClearCubes()  
    if CubesConnection then CubesConnection:Disconnect() CubesConnection = nil end  
    if CubesFolder then CubesFolder:Destroy() CubesFolder = nil end  
    table.clear(ActiveCubes)  
end  
  
local function StartFlyingCubes()  
    ClearCubes()  
    CubesFolder = Instance.new("Folder", workspace)  
    CubesFolder.Name = "RV_FlyingCubes"  
  
    local centerPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")  
    local origin = centerPart and centerPart.Position or Vector3.new(0, 10, 0)  
  
    for i = 1, State.CubeCount do  
        local cube = Instance.new("Part", CubesFolder)  
        cube.Size = Vector3.new(1.2, 1.2, 1.2)  
        cube.Anchored = true  
        cube.CanCollide = false  
        cube.Material = Enum.Material.Neon  
        cube.Color = ResolveColor(State.CubeColorIndex)  
        cube.Transparency = 0.25  
  
        local angle = (i / State.CubeCount) * math.pi * 2  
        local dist = math.random(15, 60)  
        local height = math.random(-5, 25)  
        local speed = (math.random(10, 25) / 10) * (math.random() > 0.5 and 1 or -1)  
  
        table.insert(ActiveCubes, {  
            part = cube,  
            angle = angle,  
            dist = dist,  
            height = height,  
            speed = speed,  
            rotSpeed = Vector3.new(math.random(), math.random(), math.random())  
        })  
    end  
  
    CubesConnection = RunService.RenderStepped:Connect(function(dt)  
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")  
        local basePos = root and root.Position or origin  
        local currentColor = ResolveColor(State.CubeColorIndex)  
        for _, c in ipairs(ActiveCubes) do  
            c.angle = c.angle + (c.speed * dt * 0.4)  
            local x = basePos.X + math.cos(c.angle) * c.dist  
            local z = basePos.Z + math.sin(c.angle) * c.dist  
            local y = basePos.Y + c.height + math.sin(tick() * 2 + c.dist) * 2  
            c.part.CFrame = CFrame.new(x, y, z) * CFrame.Angles(tick() * c.rotSpeed.X, tick() * c.rotSpeed.Y, tick() * c.rotSpeed.Z)  
            if Palette[State.CubeColorIndex].isRainbow then  
                c.part.Color = currentColor  
            end  
        end  
    end)  
end  
  
CreateToggle(WorldPage, false, {"World", "FlyingCubes"}, function(on)  
    State.FlyingCubes = on  
    if on then StartFlyingCubes() else ClearCubes() end  
end)  
  
local cubeColorBtn = CreateActionButton(WorldPage, "Цвет кубиков", function() end)  
cubeColorBtn.MouseButton1Click:Connect(function()  
    State.CubeColorIndex = (State.CubeColorIndex % #Palette) + 1  
    local p = Palette[State.CubeColorIndex]  
    cubeColorBtn.Text = Translations[CurrentLanguage].World.CubeColor .. ": " .. p.name  
    local col = ResolveColor(State.CubeColorIndex)  
    for _, c in ipairs(ActiveCubes) do  
        c.part.Color = col  
    end  
end)  
RegisterText(cubeColorBtn, function(t)  
    cubeColorBtn.Text = t.World.CubeColor .. ": " .. Palette[State.CubeColorIndex].name  
end)  
  
local cubeCountBtn = CreateActionButton(WorldPage, "Количество кубиков: 25", function() end)  
cubeCountBtn.MouseButton1Click:Connect(function()  
    local counts = {10, 25, 50, 100}  
    local idx = 1  
    for i, v in ipairs(counts) do  
        if v == State.CubeCount then idx = i break end  
    end  
    idx = (idx % #counts) + 1  
    State.CubeCount = counts[idx]  
    cubeCountBtn.Text = Translations[CurrentLanguage].World.CubeCount .. State.CubeCount  
    if State.FlyingCubes then StartFlyingCubes() end  
end)  
RegisterText(cubeCountBtn, function(t)  
    cubeCountBtn.Text = t.World.CubeCount .. State.CubeCount  
end)  
  
-- =====================================================================  
--         5. ПЕРСОНАЖ: КРЫЛЬЯ, КРИСТАЛЛЫ, РАДУЖНАЯ ШЛЯПА, ИМПУЛЬС  
-- =====================================================================  
local CharPage = CreatePage("Character", "Character")  
  
local CurrentHat = nil  
local CurrentTrail = nil  
local CurrentWingsModel = nil  
local OrbitCrystalsModel = nil  
local OrbitConnection = nil  
local CrystalTrailConnection = nil  
local JumpPulseConnection = nil  
local HatRainbowConnection = nil  
  
-- --- ШЛЯПА И РАДУГА ---  
local function RemoveHat()  
    if CurrentHat then CurrentHat:Destroy() CurrentHat = nil end  
end  
  
local function ApplyHat()  
    RemoveHat()  
    local char = LocalPlayer.Character  
    if not char then return end  
    local head = char:FindFirstChild("Head")  
    if not head then return end  
  
    local hat = Instance.new("Part")  
    hat.Name = "RV_ChineseHat"  
    hat.Size = Vector3.new(2.8, 0.6, 2.8)  
    hat.CanCollide = false  
    hat.Massless = true  
    hat.Material = Enum.Material.Neon  
    hat.Color = Color3.fromRGB(0, 210, 255)  
  
    local mesh = Instance.new("SpecialMesh", hat)  
    mesh.MeshType = Enum.MeshType.FileMesh  
    mesh.MeshId = "rbxassetid://1033714"  
    mesh.Scale = Vector3.new(1.3, 0.8, 1.3)  
  
    local weld = Instance.new("Weld", hat)  
    weld.Part0 = head  
    weld.Part1 = hat  
    weld.C0 = CFrame.new(0, 0.95, 0)  
    hat.Parent = char  
    CurrentHat = hat  
end  
  
CreateToggle(CharPage, false, {"Character", "ChineseHat"}, function(on)  
    State.ChineseHat = on  
    if on then ApplyHat() else RemoveHat() end  
end)  
  
CreateToggle(CharPage, false, {"Character", "ChineseHatRainbow"}, function(on)  
    State.ChineseHatRainbow = on  
    if on then  
        if not State.ChineseHat then  
            State.ChineseHat = true  
            ApplyHat()  
        end  
        if HatRainbowConnection then HatRainbowConnection:Disconnect() end  
        HatRainbowConnection = RunService.RenderStepped:Connect(function()  
            if State.ChineseHatRainbow and CurrentHat and CurrentHat.Parent then  
                CurrentHat.Color = GetCurrentChromaColor()  
            end  
        end)  
    else  
        if HatRainbowConnection then  
            HatRainbowConnection:Disconnect()  
            HatRainbowConnection = nil  
        end  
        if CurrentHat then  
            CurrentHat.Color = Color3.fromRGB(0, 210, 255)  
        end  
    end  
end)  
  
-- --- ПРЕМИУМ КИБЕР-КРЫЛЬЯ ---  
local function RemoveWings()  
    if CurrentWingsModel then  
        CurrentWingsModel:Destroy()  
        CurrentWingsModel = nil  
    end  
end  
  
local function ApplyWings()  
    RemoveWings()  
    local char = LocalPlayer.Character  
    if not char then return end  
    local torso = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")  
    if not torso then return end  
  
    local wingsModel = Instance.new("Model", char)  
    wingsModel.Name = "RV_CyberWings"  
  
    local wingColor = ResolveColor(State.WingsColorIndex)  
  
    local function createFeather(side, offset, size, angle)  
        local feather = Instance.new("Part", wingsModel)  
        feather.Name = "Feather"  
        feather.Size = size  
        feather.Material = Enum.Material.Neon  
        feather.Color = wingColor  
        feather.CanCollide = false  
        feather.Massless = true  
  
        local mesh = Instance.new("SpecialMesh", feather)  
        mesh.MeshType = Enum.MeshType.Wedge  
  
        local weld = Instance.new("Weld", feather)  
        weld.Part0 = torso  
        weld.Part1 = feather  
        local sign = (side == "Left") and -1 or 1  
        weld.C0 = CFrame.new(offset.X * sign, offset.Y, offset.Z) * CFrame.Angles(angle.X, angle.Y * sign, angle.Z * sign)  
    end  
  
    local layers = {  
        {offset = Vector3.new(1.1, 0.9, 0.6), size = Vector3.new(0.3, 1.8, 0.7), angle = Vector3.new(0.2, 0.3, 0.7)},  
        {offset = Vector3.new(1.8, 1.4, 0.7), size = Vector3.new(0.25, 2.3, 0.6), angle = Vector3.new(0.1, 0.4, 0.9)},  
        {offset = Vector3.new(2.4, 1.8, 0.8), size = Vector3.new(0.2, 2.8, 0.5), angle = Vector3.new(0.0, 0.5, 1.1)},  
        {offset = Vector3.new(1.6, 0.4, 0.7), size = Vector3.new(0.25, 1.9, 0.55), angle = Vector3.new(0.1, 0.2, 0.5)},  
        {offset = Vector3.new(2.3, 0.7, 0.8), size = Vector3.new(0.2, 2.2, 0.45), angle = Vector3.new(0.0, 0.3, 0.8)}  
    }  
  
    for _, side in ipairs({"Left", "Right"}) do  
        for _, l in ipairs(layers) do  
            createFeather(side, l.offset, l.size, l.angle)  
        end  
    end  
  
    CurrentWingsModel = wingsModel  
end  
  
CreateToggle(CharPage, false, {"Character", "Wings"}, function(on)  
    State.Wings = on  
    if on then ApplyWings() else RemoveWings() end  
end)  
  
local wingsColorBtn = CreateActionButton(CharPage, "Цвет крыльев", function() end)  
wingsColorBtn.MouseButton1Click:Connect(function()  
    State.WingsColorIndex = (State.WingsColorIndex % #Palette) + 1  
    local p = Palette[State.WingsColorIndex]  
    wingsColorBtn.Text = Translations[CurrentLanguage].Character.WingsColor .. ": " .. p.name  
    if CurrentWingsModel then  
        local col = ResolveColor(State.WingsColorIndex)  
        for _, part in ipairs(CurrentWingsModel:GetChildren()) do  
            if part:IsA("BasePart") then part.Color = col end  
        end  
    end  
end)  
RegisterText(wingsColorBtn, function(t)  
    wingsColorBtn.Text = t.Character.WingsColor .. ": " .. Palette[State.WingsColorIndex].name  
end)  
  
-- --- КРИСТАЛЛЫ ВОКРУГ ИГРОКА ---  
local function RemoveOrbitCrystals()  
    if OrbitConnection then  
        OrbitConnection:Disconnect()  
        OrbitConnection = nil  
    end  
    if OrbitCrystalsModel then  
        OrbitCrystalsModel:Destroy()  
        OrbitCrystalsModel = nil  
    end  
end  
  
local function ApplyOrbitCrystals()  
    RemoveOrbitCrystals()  
    local char = LocalPlayer.Character  
    if not char then return end  
    local hrp = char:FindFirstChild("HumanoidRootPart")  
    if not hrp then return end  
  
    OrbitCrystalsModel = Instance.new("Model", workspace)  
    OrbitCrystalsModel.Name = "RV_OrbitCrystals"  
  
    local crystalCount = 6  
    local crystalParts = {}  
    local crystalColor = ResolveColor(State.OrbitColorIndex)  
  
    for i = 1, crystalCount do  
        local c = Instance.new("Part", OrbitCrystalsModel)  
        c.Name = "Crystal"  
        c.Size = Vector3.new(0.65, 1.8, 0.65)  
        c.Material = Enum.Material.Neon  
        c.Color = crystalColor  
        c.CanCollide = false  
        c.Anchored = true  
        c.CastShadow = false  
  
        local m = Instance.new("SpecialMesh", c)  
        m.MeshType = Enum.MeshType.Brick  
        m.Scale = Vector3.new(0.8, 1, 0.8)  
  
        table.insert(crystalParts, c)  
    end  
  
    OrbitConnection = RunService.RenderStepped:Connect(function()  
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")  
        if not root or not OrbitCrystalsModel.Parent then return end  
  
        local t = tick() * 2.2  
        local radius = 4.5  
        local dynamicCol = ResolveColor(State.OrbitColorIndex)  
  
        for i, crystal in ipairs(crystalParts) do  
            local angle = t + (i * (math.pi * 2 / crystalCount))  
            local x = root.Position.X + math.cos(angle) * radius  
            local z = root.Position.Z + math.sin(angle) * radius  
            local y = root.Position.Y + math.sin(t * 1.5 + i) * 0.8 + 0.5  
  
            crystal.CFrame = CFrame.new(x, y, z) * CFrame.Angles(t + i, t * 1.2, math.sin(t))  
            if Palette[State.OrbitColorIndex].isRainbow then  
                crystal.Color = dynamicCol  
            end  
        end  
    end)  
end  
  
CreateToggle(CharPage, false, {"Character", "OrbitCrystals"}, function(on)  
    State.OrbitCrystals = on  
    if on then ApplyOrbitCrystals() else RemoveOrbitCrystals() end  
end)  
  
local orbitColorBtn = CreateActionButton(CharPage, "Цвет летающих кристаллов", function() end)  
orbitColorBtn.MouseButton1Click:Connect(function()  
    State.OrbitColorIndex = (State.OrbitColorIndex % #Palette) + 1  
    local p = Palette[State.OrbitColorIndex]  
    orbitColorBtn.Text = Translations[CurrentLanguage].Character.OrbitColor .. ": " .. p.name  
    if OrbitCrystalsModel then  
        local col = ResolveColor(State.OrbitColorIndex)  
        for _, c in ipairs(OrbitCrystalsModel:GetChildren()) do  
            if c:IsA("BasePart") then c.Color = col end  
        end  
    end  
end)  
RegisterText(orbitColorBtn, function(t)  
    orbitColorBtn.Text = t.Character.OrbitColor .. ": " .. Palette[State.OrbitColorIndex].name  
end)  
  
-- --- РАСТУЩИЕ КРИСТАЛЛЫ ПРИ ХОДЬБЕ ---  
local function SpawnGroundCrystal(pos)  
    local crystal = Instance.new("Part", workspace)  
    crystal.Name = "RV_FootstepCrystal"  
    crystal.Anchored = true  
    crystal.CanCollide = false  
    crystal.Material = Enum.Material.Neon  
    crystal.Color = ResolveColor(State.CrystalTrailColorIndex)  
    crystal.Size = Vector3.new(0.1, 0.1, 0.1)  
  
    local targetHeight = math.random(12, 22) / 10  
    local targetWidth = math.random(4, 7) / 10  
    local targetSize = Vector3.new(targetWidth, targetHeight, targetWidth)  
  
    local rx = math.rad(math.random(-20, 20))  
    local ry = math.rad(math.random(0, 360))  
    local rz = math.rad(math.random(-20, 20))  
    local targetCF = CFrame.new(pos + Vector3.new(0, targetHeight * 0.45, 0)) * CFrame.Angles(rx, ry, rz)  
  
    crystal.CFrame = CFrame.new(pos) * CFrame.Angles(rx, ry, rz)  
  
    local growTween = TweenService:Create(crystal, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {  
        Size = targetSize,  
        CFrame = targetCF  
    })  
    growTween:Play()  
  
    task.delay(1.1, function()  
        if crystal and crystal.Parent then  
            local shrinkTween = TweenService:Create(crystal, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {  
                Size = Vector3.new(0.05, 0.05, 0.05),  
                Transparency = 1,  
                CFrame = CFrame.new(pos)  
            })  
            shrinkTween:Play()  
            shrinkTween.Completed:Connect(function()  
                crystal:Destroy()  
            end)  
        end  
    end)  
end  
  
local lastFootstepPos = Vector3.new()  
local function BindCrystalTrail()  
    if CrystalTrailConnection then CrystalTrailConnection:Disconnect() CrystalTrailConnection = nil end  
  
    CrystalTrailConnection = RunService.Heartbeat:Connect(function()  
        if not State.CrystalTrail then return end  
        local char = LocalPlayer.Character  
        local hrp = char and char:FindFirstChild("HumanoidRootPart")  
        local hum = char and char:FindFirstChildOfClass("Humanoid")  
        if not hrp or not hum then return end  
  
        if hum.MoveDirection.Magnitude > 0.1 and hum.FloorMaterial ~= Enum.Material.Air then  
            if (hrp.Position - lastFootstepPos).Magnitude > 2.8 then  
                lastFootstepPos = hrp.Position  
  
                local rayOrigin = hrp.Position  
                local rayDirection = Vector3.new(0, -5, 0)  
                local rayParams = RaycastParams.new()  
                rayParams.FilterDescendantsInstances = {char}  
                rayParams.FilterType = Enum.RaycastFilterType.Exclude  
  
                local hit = workspace:Raycast(rayOrigin, rayDirection, rayParams)  
                if hit then  
                    SpawnGroundCrystal(hit.Position)  
                end  
            end  
        end  
    end)  
end  
  
CreateToggle(CharPage, false, {"Character", "CrystalTrail"}, function(on)  
    State.CrystalTrail = on  
    if on then BindCrystalTrail() else  
        if CrystalTrailConnection then CrystalTrailConnection:Disconnect() CrystalTrailConnection = nil end  
    end  
end)  
  
local trailCrystColorBtn = CreateActionButton(CharPage, "Цвет кристаллов шага", function() end)  
trailCrystColorBtn.MouseButton1Click:Connect(function()  
    State.CrystalTrailColorIndex = (State.CrystalTrailColorIndex % #Palette) + 1  
    local p = Palette[State.CrystalTrailColorIndex]  
    trailCrystColorBtn.Text = Translations[CurrentLanguage].Character.CrystalTrailColor .. ": " .. p.name  
end)  
RegisterText(trailCrystColorBtn, function(t)  
    trailCrystColorBtn.Text = t.Character.CrystalTrailColor .. ": " .. Palette[State.CrystalTrailColorIndex].name  
end)  
  
-- --- ПУЛЬСИРУЮЩИЙ КРУГ ПРИ ПРЫЖКЕ ---  
local function SpawnJumpPulse(centerPos)  
    local ring = Instance.new("Part", workspace)  
    ring.Name = "RV_JumpPulseRing"  
    ring.Shape = Enum.PartType.Cylinder  
    ring.Material = Enum.Material.Neon  
    ring.Color = ResolveColor(State.JumpPulseColorIndex)  
    ring.CanCollide = false  
    ring.Anchored = true  
    ring.CastShadow = false  
  
    ring.Size = Vector3.new(0.08, 0.4, 0.4)  
    ring.CFrame = CFrame.new(centerPos + Vector3.new(0, 0.05, 0)) * CFrame.Angles(0, 0, math.rad(90))  
  
    local openTween = TweenService:Create(ring, TweenInfo.new(0.24, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {  
        Size = Vector3.new(0.05, 14, 14),  
        Transparency = 0.2  
    })  
  
    openTween:Play()  
    openTween.Completed:Connect(function()  
        local closeTween = TweenService:Create(ring, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {  
            Size = Vector3.new(0.05, 0.1, 0.1),  
            Transparency = 1  
        })  
        closeTween:Play()  
        closeTween.Completed:Connect(function()  
            ring:Destroy()  
        end)  
    end)  
end  
  
local function BindJumpPulse()  
    if JumpPulseConnection then JumpPulseConnection:Disconnect() JumpPulseConnection = nil end  
  
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()  
    local hum = char:WaitForChild("Humanoid", 5)  
    if not hum then return end  
  
    JumpPulseConnection = hum.Jumping:Connect(function(isJumping)  
        if isJumping and State.JumpPulse then  
            local hrp = char:FindFirstChild("HumanoidRootPart")  
            if not hrp then return end  
  
            local rayParams = RaycastParams.new()  
            rayParams.FilterDescendantsInstances = {char}  
            rayParams.FilterType = Enum.RaycastFilterType.Exclude  
  
            local hit = workspace:Raycast(hrp.Position, Vector3.new(0, -6, 0), rayParams)  
            if hit then  
                SpawnJumpPulse(hit.Position)  
            end  
        end  
    end)  
end  
  
CreateToggle(CharPage, false, {"Character", "JumpPulse"}, function(on)  
    State.JumpPulse = on  
    if on then BindJumpPulse() else  
        if JumpPulseConnection then JumpPulseConnection:Disconnect() JumpPulseConnection = nil end  
    end  
end)  
  
local jumpPulseColorBtn = CreateActionButton(CharPage, "Цвет импульса прыжка", function() end)  
jumpPulseColorBtn.MouseButton1Click:Connect(function()  
    State.JumpPulseColorIndex = (State.JumpPulseColorIndex % #Palette) + 1  
    local p = Palette[State.JumpPulseColorIndex]  
    jumpPulseColorBtn.Text = Translations[CurrentLanguage].Character.JumpPulseColor .. ": " .. p.name  
end)  
RegisterText(jumpPulseColorBtn, function(t)  
    jumpPulseColorBtn.Text = t.Character.JumpPulseColor .. ": " .. Palette[State.JumpPulseColorIndex].name  
end)  
  
-- --- ОБЫЧНЫЙ ТРЕЙЛ ---  
local function RemoveTrail()  
    if CurrentTrail then CurrentTrail:Destroy() CurrentTrail = nil end  
end  
  
local function ApplyTrail()  
    RemoveTrail()  
    local char = LocalPlayer.Character  
    if not char then return end  
    local hrp = char:FindFirstChild("HumanoidRootPart")  
    if not hrp then return end  
  
    local a0 = hrp:FindFirstChild("RV_Att0") or Instance.new("Attachment", hrp)  
    a0.Name = "RV_Att0"  
    a0.Position = Vector3.new(0, 1.2, 0)  
  
    local a1 = hrp:FindFirstChild("RV_Att1") or Instance.new("Attachment", hrp)  
    a1.Name = "RV_Att1"  
    a1.Position = Vector3.new(0, -1.2, 0)  
  
    local trail = Instance.new("Trail", hrp)  
    trail.Name = "RV_Trail"  
    trail.Attachment0 = a0  
    trail.Attachment1 = a1  
    trail.Lifetime = 0.55  
    trail.LightEmission = 1  
    trail.Transparency = NumberSequence.new({  
        NumberSequenceKeypoint.new(0, 0.1),  
        NumberSequenceKeypoint.new(1, 1)  
    })  
    trail.Color = ColorSequence.new(ResolveColor(State.TrailColorIndex))  
    CurrentTrail = trail  
end  
  
CreateToggle(CharPage, false, {"Character", "Trail"}, function(on)  
    State.Trail = on  
    if on then ApplyTrail() else RemoveTrail() end  
end)  
  
local trailColorBtn = CreateActionButton(CharPage, "Цвет следа", function() end)  
trailColorBtn.MouseButton1Click:Connect(function()  
    State.TrailColorIndex = (State.TrailColorIndex % #Palette) + 1  
    local p = Palette[State.TrailColorIndex]  
    trailColorBtn.Text = Translations[CurrentLanguage].Character.TrailColor .. ": " .. p.name  
    if CurrentTrail then  
        CurrentTrail.Color = ColorSequence.new(ResolveColor(State.TrailColorIndex))  
    end  
end)  
RegisterText(trailColorBtn, function(t)  
    trailColorBtn.Text = t.Character.TrailColor .. ": " .. Palette[State.TrailColorIndex].name  
end)  
  
-- =====================================================================  
--                   6. КАСТОМНЫЕ ПРИЦЕЛЫ  
-- =====================================================================  
local CrossPage = CreatePage("Crosshair", "Crosshair")  
local CrosshairCenter = Instance.new("Frame", CrosshairGui)  
CrosshairCenter.Name = "CrosshairCenter"  
CrosshairCenter.AnchorPoint = Vector2.new(0.5, 0.5)  
CrosshairCenter.Position = UDim2.new(0.5, 0, 0.5, 0)  
CrosshairCenter.Size = UDim2.new(0, 40, 0, 40)  
CrosshairCenter.BackgroundTransparency = 1  
CrosshairCenter.Visible = false  
  
local function RedrawCrosshair()  
    CrosshairCenter:ClearAllChildren()  
    if not State.CrosshairEnabled then  
        CrosshairCenter.Visible = false  
        return  
    end  
    CrosshairCenter.Visible = true  
  
    local color = ResolveColor(State.CrosshairColorIndex)  
    local sz = State.CrosshairSize  
  
    if State.CrosshairStyle == "Cross" then  
        local top = Instance.new("Frame", CrosshairCenter)  
        top.BackgroundColor3 = color  
        top.BorderSizePixel = 0  
        top.AnchorPoint = Vector2.new(0.5, 1)  
        top.Position = UDim2.new(0.5, 0, 0.5, -4)  
        top.Size = UDim2.new(0, 2, 0, sz)  
  
        local bottom = Instance.new("Frame", CrosshairCenter)  
        bottom.BackgroundColor3 = color  
        bottom.BorderSizePixel = 0  
        bottom.AnchorPoint = Vector2.new(0.5, 0)  
        bottom.Position = UDim2.new(0.5, 0, 0.5, 4)  
        bottom.Size = UDim2.new(0, 2, 0, sz)  
  
        local left = Instance.new("Frame", CrosshairCenter)  
        left.BackgroundColor3 = color  
        left.BorderSizePixel = 0  
        left.AnchorPoint = Vector2.new(1, 0.5)  
        left.Position = UDim2.new(0.5, -4, 0.5, 0)  
        left.Size = UDim2.new(0, sz, 0, 2)  
  
        local right = Instance.new("Frame", CrosshairCenter)  
        right.BackgroundColor3 = color  
        right.BorderSizePixel = 0  
        right.AnchorPoint = Vector2.new(0, 0.5)  
        right.Position = UDim2.new(0.5, 4, 0.5, 0)  
        right.Size = UDim2.new(0, sz, 0, 2)  
  
    elseif State.CrosshairStyle == "Dot" then  
        local dot = Instance.new("Frame", CrosshairCenter)  
        dot.BackgroundColor3 = color  
        dot.BorderSizePixel = 0  
        dot.AnchorPoint = Vector2.new(0.5, 0.5)  
        dot.Position = UDim2.new(0.5, 0, 0.5, 0)  
        dot.Size = UDim2.new(0, sz * 0.7, 0, sz * 0.7)  
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)  
  
    elseif State.CrosshairStyle == "Circle" then  
        local circle = Instance.new("Frame", CrosshairCenter)  
        circle.BackgroundTransparency = 1  
        circle.AnchorPoint = Vector2.new(0.5, 0.5)  
        circle.Position = UDim2.new(0.5, 0, 0.5, 0)  
        circle.Size = UDim2.new(0, sz * 2, 0, sz * 2)  
        Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)  
  
        local stroke = Instance.new("UIStroke", circle)  
        stroke.Thickness = 2  
        stroke.Color = color  
    end  
end  
  
CreateToggle(CrossPage, false, {"Crosshair", "Toggle"}, function(on)  
    State.CrosshairEnabled = on  
    RedrawCrosshair()  
end)  
  
CreateActionButton(CrossPage, "Форма: Крестик (Cross)", function()  
    State.CrosshairStyle = "Cross"  
    RedrawCrosshair()  
end)  
  
CreateActionButton(CrossPage, "Форма: Точка (Dot)", function()  
    State.CrosshairStyle = "Dot"  
    RedrawCrosshair()  
end)  
  
CreateActionButton(CrossPage, "Форма: Кольцо (Circle)", function()  
    State.CrosshairStyle = "Circle"  
    RedrawCrosshair()  
end)  
  
local crossColorBtn = CreateActionButton(CrossPage, "Цвет прицела", function() end)  
crossColorBtn.MouseButton1Click:Connect(function()  
    State.CrosshairColorIndex = (State.CrosshairColorIndex % #Palette) + 1  
    crossColorBtn.Text = Translations[CurrentLanguage].Crosshair.Color .. ": " .. Palette[State.CrosshairColorIndex].name  
    RedrawCrosshair()  
end)  
RegisterText(crossColorBtn, function(t)  
    crossColorBtn.Text = t.Crosshair.Color .. ": " .. Palette[State.CrosshairColorIndex].name  
end)  
  
local crossSizeBtn = CreateActionButton(CrossPage, "Размер: 12", function() end)  
crossSizeBtn.MouseButton1Click:Connect(function()  
    local sizes = {6, 10, 14, 20}  
    local idx = 1  
    for i, s in ipairs(sizes) do  
        if s == State.CrosshairSize then idx = i break end  
    end  
    idx = (idx % #sizes) + 1  
    State.CrosshairSize = sizes[idx]  
    crossSizeBtn.Text = Translations[CurrentLanguage].Crosshair.Size .. State.CrosshairSize  
    RedrawCrosshair()  
end)  
RegisterText(crossSizeBtn, function(t)  
    crossSizeBtn.Text = t.Crosshair.Size .. State.CrosshairSize  
end)  
  
-- =====================================================================  
--                   7. ПЕРЕКРАС ПАЛЛЕТ ([Player]SpawnedToys)  
-- =====================================================================  
local BoardsPage = CreatePage("Boards", "Boards")  
local PalletModelConnections = {}  
  
local function PaintPartFully(part, color, material)  
    if not part:IsA("BasePart") then return end  
    part.Color = color  
    if material then part.Material = material end  
  
    for _, child in ipairs(part:GetChildren()) do  
        if child:IsA("Decal") or child:IsA("Texture") then  
            child.Color3 = color  
        elseif child:IsA("SurfaceAppearance") then  
            child:Destroy()  
        end  
    end  
end  
  
local function RecolorPalletModel(model)  
    if not model or not model.Parent then return end  
  
    local targetColor = State.PalletBlack and Color3.fromRGB(15, 15, 15) or ResolveColor(State.PalletColorIndex)  
    local targetMat = State.PalletMaterial  
  
    for _, desc in ipairs(model:GetDescendants()) do  
        PaintPartFully(desc, targetColor, targetMat)  
    end  
  
    if not PalletModelConnections[model] then  
        PalletModelConnections[model] = {}  
  
        local addConn = model.DescendantAdded:Connect(function(desc)  
            task.defer(function()  
                if desc and desc.Parent then  
                    PaintPartFully(desc, targetColor, targetMat)  
                end  
            end)  
        end)  
        table.insert(PalletModelConnections[model], addConn)  
  
        local destroyConn  
        destroyConn = model.Destroying:Connect(function()  
            if PalletModelConnections[model] then  
                for _, c in ipairs(PalletModelConnections[model]) do c:Disconnect() end  
                PalletModelConnections[model] = nil  
            end  
            destroyConn:Disconnect()  
        end)  
        table.insert(PalletModelConnections[model], destroyConn)  
    end  
end  
  
local function CheckIsPallet(item)  
    local nm = item.Name:lower()  
    if nm:find("pallet") or nm:find("паллет") or nm:find("plank") or nm:find("board") then  
        return true  
    end  
    if item:IsA("Model") then  
        for _, child in ipairs(item:GetChildren()) do  
            local cnm = child.Name:lower()  
            if cnm:find("pallet") or cnm:find("паллет") or cnm:find("plank") or cnm:find("board") then  
                return true  
            end  
        end  
    end  
    return false  
end  
  
local function HandleIncomingToy(toy)  
    if not State.PalletAutoColor then return end  
    if CheckIsPallet(toy) or toy:IsA("Model") or toy:IsA("BasePart") then  
        RecolorPalletModel(toy)  
    end  
end  
  
local ToyFolderWatcher = nil  
local function BindSpawnedToysFolder(folder)  
    if not folder then return end  
    if ToyFolderWatcher then ToyFolderWatcher:Disconnect() ToyFolderWatcher = nil end  
  
    for _, toy in ipairs(folder:GetChildren()) do  
        HandleIncomingToy(toy)  
    end  
  
    ToyFolderWatcher = folder.ChildAdded:Connect(function(toy)  
        task.defer(function()  
            HandleIncomingToy(toy)  
        end)  
    end)  
end  
  
local targetFolderName = LocalPlayer.Name .. "SpawnedToys"  
local existingFolder = workspace:FindFirstChild(targetFolderName)  
if existingFolder then BindSpawnedToysFolder(existingFolder) end  
  
workspace.ChildAdded:Connect(function(child)  
    if child.Name == targetFolderName then BindSpawnedToysFolder(child) end  
end)  
  
CreateToggle(BoardsPage, true, {"Boards", "AutoColor"}, function(on)  
    State.PalletAutoColor = on  
    if on then  
        local f = workspace:FindFirstChild(targetFolderName)  
        if f then  
            for _, toy in ipairs(f:GetChildren()) do HandleIncomingToy(toy) end  
        end  
    end  
end)  
  
CreateActionButton(BoardsPage, "Сделать паллеты чёрными", function()  
    State.PalletBlack = true  
    local f = workspace:FindFirstChild(targetFolderName)  
    if f then  
        for _, toy in ipairs(f:GetChildren()) do RecolorPalletModel(toy) end  
    end  
end)  
  
local palletColorBtn = CreateActionButton(BoardsPage, "Цвет паллеты: Радужный", function() end)  
palletColorBtn.MouseButton1Click:Connect(function()  
    State.PalletBlack = false  
    State.PalletColorIndex = (State.PalletColorIndex % #Palette) + 1  
    local p = Palette[State.PalletColorIndex]  
    palletColorBtn.Text = Translations[CurrentLanguage].Boards.Color .. ": " .. p.name  
    local f = workspace:FindFirstChild(targetFolderName)  
    if f then  
        for _, toy in ipairs(f:GetChildren()) do RecolorPalletModel(toy) end  
    end  
end)  
RegisterText(palletColorBtn, function(t)  
    palletColorBtn.Text = t.Boards.Color .. ": " .. Palette[State.PalletColorIndex].name  
end)  
  
CreateActionButton(BoardsPage, "Принудительно перекрасить текущие", function()  
    local f = workspace:FindFirstChild(targetFolderName)  
    if f then  
        for _, toy in ipairs(f:GetChildren()) do RecolorPalletModel(toy) end  
    end  
end)  
  
local palletMaterials = {  
    {name = "SmoothPlastic", mat = Enum.Material.SmoothPlastic},  
    {name = "Metal", mat = Enum.Material.Metal},  
    {name = "Wood", mat = Enum.Material.Wood},  
    {name = "Concrete", mat = Enum.Material.Concrete},  
    {name = "Neon", mat = Enum.Material.Neon},  
    {name = "Marble", mat = Enum.Material.Marble}  
}  
  
for _, m in ipairs(palletMaterials) do  
    CreateActionButton(BoardsPage, "Материал: " .. m.name, function()  
        State.PalletMaterial = m.mat  
        local f = workspace:FindFirstChild(targetFolderName)  
        if f then  
            for _, toy in ipairs(f:GetChildren()) do RecolorPalletModel(toy) end  
        end  
    end)  
end  
  
-- =====================================================================  
--                   8. X-RAY И 9. ESP ИГРОКОВ  
-- =====================================================================  
local ESPPage = CreatePage("ESP", "ESP")  
  
local OriginalTransparencies = {}  
local function SetXRay(enabled, transparency)  
    if enabled then  
        for _, part in ipairs(workspace:GetDescendants()) do  
            if part:IsA("BasePart") and not part:IsDescendantOf(LocalPlayer.Character or workspace) then  
                local isPlayer = false  
                for _, pl in ipairs(Players:GetPlayers()) do  
                    if pl.Character and part:IsDescendantOf(pl.Character) then  
                        isPlayer = true  
                        break  
                    end  
                end  
                if not isPlayer and part.Transparency < 0.95 then  
                    if OriginalTransparencies[part] == nil then  
                        OriginalTransparencies[part] = part.Transparency  
                    end  
                    part.Transparency = transparency  
                end  
            end  
        end  
    else  
        for part, orig in pairs(OriginalTransparencies) do  
            if part and part.Parent then  
                part.Transparency = orig  
            end  
        end  
        table.clear(OriginalTransparencies)  
    end  
end  
  
CreateToggle(ESPPage, false, {"ESP", "XRay"}, function(on)  
    State.XRay = on  
    SetXRay(on, State.XRayTransparency)  
end)  
  
local xrayTransBtn = CreateActionButton(ESPPage, "Прозрачность X-Ray: 0.65", function() end)  
xrayTransBtn.MouseButton1Click:Connect(function()  
    local transValues = {0.4, 0.65, 0.85}  
    local idx = 1  
    for i, v in ipairs(transValues) do  
        if v == State.XRayTransparency then idx = i break end  
    end  
    idx = (idx % #transValues) + 1  
    State.XRayTransparency = transValues[idx]  
    xrayTransBtn.Text = Translations[CurrentLanguage].ESP.XRayTrans .. State.XRayTransparency  
    if State.XRay then SetXRay(true, State.XRayTransparency) end  
end)  
RegisterText(xrayTransBtn, function(t)  
    xrayTransBtn.Text = t.ESP.XRayTrans .. State.XRayTransparency  
end)  
  
local ESPContainer = {}  
  
local function ClearESPForPlayer(plr)  
    if ESPContainer[plr] then  
        if ESPContainer[plr].Highlight then ESPContainer[plr].Highlight:Destroy() end  
        if ESPContainer[plr].Billboard then ESPContainer[plr].Billboard:Destroy() end  
        ESPContainer[plr] = nil  
    end  
end  
  
local function ApplyESPForPlayer(plr)  
    if plr == LocalPlayer then return end  
    ClearESPForPlayer(plr)  
  
    local char = plr.Character  
    if not char then return end  
    local head = char:WaitForChild("Head", 3)  
    if not head then return end  
  
    local highlight = Instance.new("Highlight")  
    highlight.Name = "RV_ESP_Highlight"  
    highlight.Adornee = char  
    highlight.FillColor = Color3.fromRGB(0, 200, 255)  
    highlight.FillTransparency = 0.45  
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)  
    highlight.OutlineTransparency = 0  
    highlight.Parent = char  
  
    local bb = Instance.new("BillboardGui")  
    bb.Name = "RV_ESP_Tag"  
    bb.Adornee = head  
    bb.Size = UDim2.new(0, 120, 0, 30)  
    bb.StudsOffset = Vector3.new(0, 2.5, 0)  
    bb.AlwaysOnTop = true  
  
    local txt = Instance.new("TextLabel", bb)  
    txt.Size = UDim2.new(1, 0, 1, 0)  
    txt.BackgroundTransparency = 1  
    txt.Font = Enum.Font.GothamBold  
    txt.TextSize = 13  
    txt.TextColor3 = Color3.fromRGB(0, 230, 255)  
    txt.TextStrokeTransparency = 0.3  
    txt.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)  
    txt.Text = plr.DisplayName  
  
    bb.Parent = head  
    ESPContainer[plr] = {Highlight = highlight, Billboard = bb, Text = txt}  
end  
  
local ESPLoop = nil  
local function SetESP(enabled)  
    if enabled then  
        for _, plr in ipairs(Players:GetPlayers()) do  
            if plr ~= LocalPlayer then  
                ApplyESPForPlayer(plr)  
                plr.CharacterAdded:Connect(function()  
                    task.wait(0.5)  
                    if State.ESP then ApplyESPForPlayer(plr) end  
                end)  
            end  
        end  
        Players.PlayerAdded:Connect(function(plr)  
            plr.CharacterAdded:Connect(function()  
                task.wait(0.5)  
                if State.ESP then ApplyESPForPlayer(plr) end  
            end)  
        end)  
        Players.PlayerRemoving:Connect(ClearESPForPlayer)  
  
        ESPLoop = RunService.RenderStepped:Connect(function()  
            local myHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")  
            if not myHrp then return end  
            for plr, data in pairs(ESPContainer) do  
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then  
                    local dist = math.floor((plr.Character.HumanoidRootPart.Position - myHrp.Position).Magnitude)  
                    data.Text.Text = plr.DisplayName .. " [" .. dist .. "m]"  
                end  
            end  
        end)  
    else  
        if ESPLoop then ESPLoop:Disconnect() ESPLoop = nil end  
        for plr, _ in pairs(ESPContainer) do ClearESPForPlayer(plr) end  
    end  
end  
  
CreateToggle(ESPPage, false, {"ESP", "PlayerESP"}, function(on)  
    State.ESP = on  
    SetESP(on)  
end)  
  
-- =====================================================================  
--                   10. НАСТРОЙКИ (Settings)  
-- =====================================================================  
local SettingsPage = CreatePage("Settings", "Settings")  
  
local langBtn = CreateActionButton(SettingsPage, "Язык: RU", function() end)  
langBtn.MouseButton1Click:Connect(function()  
    CurrentLanguage = (CurrentLanguage == "RU") and "EN" or "RU"  
    langBtn.Text = (CurrentLanguage == "RU") and "Сменить язык: Русский (RU)" or "Change Language: English (EN)"  
    UpdateAllLanguageTexts()  
end)  
RegisterText(langBtn, function(t)  
    langBtn.Text = t.Settings.Lang .. " (" .. CurrentLanguage .. ")"  
end)  
  
local scaleBtn = CreateActionButton(SettingsPage, "Масштаб интерфейса: 1.0x", function() end)  
scaleBtn.MouseButton1Click:Connect(function()  
    local scales = {0.8, 1.0, 1.15}  
    State.ScaleIndex = (State.ScaleIndex % #scales) + 1  
    MainScale.Scale = scales[State.ScaleIndex]  
    scaleBtn.Text = Translations[CurrentLanguage].Settings.MenuScale .. ": " .. scales[State.ScaleIndex] .. "x"  
end)  
RegisterText(scaleBtn, function(t)  
    scaleBtn.Text = t.Settings.MenuScale .. ": " .. ({0.8, 1.0, 1.15})[State.ScaleIndex] .. "x"  
end)  
  
local fontBtn = CreateActionButton(SettingsPage, "Шрифт: Gotham", function() end)  
local function ApplyFontToAll(fontData)  
    for _, inst in ipairs(ScreenGui:GetDescendants()) do  
        if inst:IsA("TextLabel") or inst:IsA("TextButton") then  
            if inst.Name == "CloseButton" or inst == TitleLabel then  
                inst.Font = fontData.bold  
            else  
                inst.Font = fontData.font  
            end  
        end  
    end  
end  
  
fontBtn.MouseButton1Click:Connect(function()  
    State.FontIndex = (State.FontIndex % #Fonts) + 1  
    local f = Fonts[State.FontIndex]  
    fontBtn.Text = Translations[CurrentLanguage].Settings.Font .. f.name  
    ApplyFontToAll(f)  
end)  
RegisterText(fontBtn, function(t)  
    fontBtn.Text = t.Settings.Font .. Fonts[State.FontIndex].name  
end)  
  
-- =====================================================================  
--                   ГЛОБАЛЬНЫЙ ЦИКЛ ОБНОВЛЕНИЯ CHROMA RGB  
-- =====================================================================  
RunService.RenderStepped:Connect(function()  
    local chroma = GetCurrentChromaColor()  
  
    if State.Fog and Palette[State.FogColorIndex].isRainbow then  
        Lighting.FogColor = chroma  
    end  
  
    if State.Wings and CurrentWingsModel and Palette[State.WingsColorIndex].isRainbow then  
        for _, part in ipairs(CurrentWingsModel:GetChildren()) do  
            if part:IsA("BasePart") then part.Color = chroma end  
        end  
    end  
  
    if State.CrosshairEnabled and Palette[State.CrosshairColorIndex].isRainbow then  
        for _, part in ipairs(CrosshairCenter:GetChildren()) do  
            if part:IsA("Frame") then  
                part.BackgroundColor3 = chroma  
                local stroke = part:FindFirstChildOfClass("UIStroke")  
                if stroke then stroke.Color = chroma end  
            end  
        end  
    end  
  
    if State.Trail and CurrentTrail and Palette[State.TrailColorIndex].isRainbow then  
        CurrentTrail.Color = ColorSequence.new(chroma)  
    end  
  
    if State.PalletAutoColor and not State.PalletBlack and Palette[State.PalletColorIndex].isRainbow then  
        local folder = workspace:FindFirstChild(targetFolderName)  
        if folder then  
            for _, toy in ipairs(folder:GetChildren()) do  
                for _, desc in ipairs(toy:GetDescendants()) do  
                    if desc:IsA("BasePart") then desc.Color = chroma end  
                end  
            end  
        end  
    end  
end)  
  
-- Авто-восстановление при респавне  
LocalPlayer.CharacterAdded:Connect(function()  
    task.wait(0.5)  
    if State.ChineseHat then ApplyHat() end  
    if State.Wings then ApplyWings() end  
    if State.OrbitCrystals then ApplyOrbitCrystals() end  
    if State.Trail then ApplyTrail() end  
    if State.ThirdPerson then   
ApplyThirdPersonView() end  
    if State.JumpPulse then BindJumpPulse() end  
end)  
  
-- Открытие первого главного пункта "Retray visuals" по умолчанию  
TabButtons["Main"].BackgroundColor3 = Color3.fromRGB(22, 25, 34)  
TabButtons["Main"].TextColor3 = Color3.fromRGB(0, 230, 255)  
TabButtons["Main"].UIStroke.Color = Color3.fromRGB(0, 180, 255)  
Pages["Main"].Visible = true  
  
print("[Retray Visuals Onyx] Запущен успешно.")  
  
