-- ================================================
--  bkz HUB v4.0 | By bkz | Keys B for open !
-- ================================================
local scrSuccess, scrError = pcall(function()
wait(1)

local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()
local playerGui = player:WaitForChild("PlayerGui")

if playerGui:FindFirstChild("AdminMenu") then playerGui.AdminMenu:Destroy() end

-- ================================================
-- ================================================
local Themes = {
	Dark = {
		BG        = Color3.fromRGB(10, 10, 16),
		Panel     = Color3.fromRGB(20, 20, 30),
		Button    = Color3.fromRGB(35, 35, 50),
		ButtonHov = Color3.fromRGB(55, 55, 75),
		Accent    = Color3.fromRGB(130, 100, 255),
		AccentHov = Color3.fromRGB(160, 135, 255),
		Text      = Color3.fromRGB(245, 245, 255),
		SubText   = Color3.fromRGB(160, 160, 190),
		Tab       = Color3.fromRGB(15, 15, 22),
		TabActive = Color3.fromRGB(130, 100, 255),
		Danger    = Color3.fromRGB(255, 60, 80),
		Success   = Color3.fromRGB(50, 220, 120),
		Warn      = Color3.fromRGB(255, 190, 50),
	},
	Light = {
		BG        = Color3.fromRGB(230, 230, 240),
		Panel     = Color3.fromRGB(255, 255, 255),
		Button    = Color3.fromRGB(210, 210, 228),
		ButtonHov = Color3.fromRGB(185, 185, 210),
		Accent    = Color3.fromRGB(110, 90, 255),
		AccentHov = Color3.fromRGB(85, 65, 230),
		Text      = Color3.fromRGB(15, 15, 35),
		SubText   = Color3.fromRGB(90, 90, 120),
		Tab       = Color3.fromRGB(220, 220, 238),
		TabActive = Color3.fromRGB(110, 90, 255),
		Danger    = Color3.fromRGB(220, 35, 50),
		Success   = Color3.fromRGB(30, 190, 80),
		Warn      = Color3.fromRGB(220, 140, 15),
	},
	Cyber = {
		BG        = Color3.fromRGB(2, 8, 15),
		Panel     = Color3.fromRGB(5, 16, 30),
		Button    = Color3.fromRGB(8, 30, 50),
		ButtonHov = Color3.fromRGB(12, 50, 78),
		Accent    = Color3.fromRGB(0, 230, 255),
		AccentHov = Color3.fromRGB(60, 245, 255),
		Text      = Color3.fromRGB(200, 250, 255),
		SubText   = Color3.fromRGB(100, 190, 230),
		Tab       = Color3.fromRGB(4, 12, 22),
		TabActive = Color3.fromRGB(0, 230, 255),
		Danger    = Color3.fromRGB(255, 40, 90),
		Success   = Color3.fromRGB(0, 255, 170),
		Warn      = Color3.fromRGB(255, 220, 0),
	},
	Rouge = {
		BG        = Color3.fromRGB(18, 5, 5),
		Panel     = Color3.fromRGB(30, 8, 8),
		Button    = Color3.fromRGB(50, 14, 14),
		ButtonHov = Color3.fromRGB(78, 22, 22),
		Accent    = Color3.fromRGB(255, 60, 85),
		AccentHov = Color3.fromRGB(255, 95, 115),
		Text      = Color3.fromRGB(255, 230, 230),
		SubText   = Color3.fromRGB(200, 140, 140),
		Tab       = Color3.fromRGB(24, 7, 7),
		TabActive = Color3.fromRGB(255, 60, 85),
		Danger    = Color3.fromRGB(255, 30, 50),
		Success   = Color3.fromRGB(50, 220, 110),
		Warn      = Color3.fromRGB(255, 180, 45),
	},
	Vert = {
		BG        = Color3.fromRGB(4, 14, 7),
		Panel     = Color3.fromRGB(7, 22, 12),
		Button    = Color3.fromRGB(10, 38, 20),
		ButtonHov = Color3.fromRGB(15, 58, 30),
		Accent    = Color3.fromRGB(40, 240, 100),
		AccentHov = Color3.fromRGB(70, 255, 135),
		Text      = Color3.fromRGB(210, 255, 225),
		SubText   = Color3.fromRGB(110, 200, 145),
		Tab       = Color3.fromRGB(5, 18, 10),
		TabActive = Color3.fromRGB(40, 240, 100),
		Danger    = Color3.fromRGB(240, 50, 70),
		Success   = Color3.fromRGB(40, 240, 100),
		Warn      = Color3.fromRGB(255, 210, 40),
	},
}
local currentTheme = Themes.Dark

-- ================================================
-- ================================================
local gui = Instance.new("ScreenGui", playerGui)
gui.Name = "AdminMenu"
gui.Enabled = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.DisplayOrder = 999
gui.ResetOnSpawn = false

-- Hover sound system (défini après gui pour éviter parent nil)
local hoverSoundId = "rbxassetid://8686980613"
local function playHover()
	local s = Instance.new("Sound")
	s.SoundId = hoverSoundId
	s.Volume = 0.35
	s.Parent = gui
	s:Play()
	Debris:AddItem(s, 1)
end

-- Drop shadow behind main (effet glow amélioré)
local shadow = Instance.new("ImageLabel", gui)
shadow.Size = UDim2.new(0, 400, 0, 520)
shadow.Position = UDim2.new(0.5, -200, 0.5, -260)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://11081004466"
shadow.ImageColor3 = currentTheme.Accent
shadow.ImageTransparency = 0.75
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 100, 100)
shadow.ZIndex = 0

-- Glass-morphism background overlay
local glassBg = Instance.new("Frame", gui)
glassBg.Size = UDim2.new(1, 0, 1, 0)
glassBg.BackgroundColor3 = Color3.new(0, 0, 0)
glassBg.BackgroundTransparency = 0.55
glassBg.BorderSizePixel = 0
glassBg.ZIndex = 0
glassBg.Visible = false

-- Main window
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 380, 0, 500)
main.Position = UDim2.new(0.5, -190, 0.5, -250)
main.BackgroundColor3 = currentTheme.BG
main.BorderSizePixel = 0
main.ZIndex = 1
main.ClipsDescendants = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)

-- Accent glow border (double stroke pour effet néon)
local stroke = Instance.new("UIStroke", main)
stroke.Color = currentTheme.Accent
stroke.Thickness = 2.5
stroke.Transparency = 0.2

local strokeGlow = Instance.new("UIStroke", main)
strokeGlow.Color = currentTheme.Accent
strokeGlow.Thickness = 6
strokeGlow.Transparency = 0.75

-- ================================================
-- ================================================
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 52)
header.BackgroundColor3 = currentTheme.Panel
header.BorderSizePixel = 0
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 14)

-- Accent bar under header
local accentBar = Instance.new("Frame", header)
accentBar.Size = UDim2.new(1, -30, 0, 2)
accentBar.Position = UDim2.new(0, 15, 1, -1)
accentBar.BackgroundColor3 = currentTheme.Accent
accentBar.BorderSizePixel = 0
accentBar.BackgroundTransparency = 0.4

-- Hide bottom corners of the header
local headerFix = Instance.new("Frame", header)
headerFix.Size = UDim2.new(1, 0, 0, 14)
headerFix.Position = UDim2.new(0, 0, 1, -14)
headerFix.BackgroundColor3 = currentTheme.Panel
headerFix.BorderSizePixel = 0

local title = Instance.new("TextLabel", header)
title.Text = "🌐 bkz HUB"
title.Size = UDim2.new(1, -50, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = currentTheme.Text
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left

local subtitle = Instance.new("TextLabel", header)
subtitle.Text = "v4.0  •  " .. player.Name
subtitle.Size = UDim2.new(1, -50, 0, 14)
subtitle.Position = UDim2.new(0, 15, 0, 33)
subtitle.BackgroundTransparency = 1
subtitle.TextColor3 = currentTheme.SubText
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 10
subtitle.TextXAlignment = Enum.TextXAlignment.Left

-- Close button amélioré avec hover
local closeBtn = Instance.new("TextButton", header)
closeBtn.Text = "✕"
closeBtn.Size = UDim2.new(0, 28, 0, 28)
closeBtn.Position = UDim2.new(1, -38, 0.5, -14)
closeBtn.BackgroundColor3 = currentTheme.Danger
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.BorderSizePixel = 0
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 8)
closeBtn.MouseEnter:Connect(playHover)
closeBtn.Name = "closeBtn"

-- ================================================
-- ================================================
local tabBar = Instance.new("Frame", main)
tabBar.Size = UDim2.new(1, -20, 0, 40)
tabBar.Position = UDim2.new(0, 10, 0, 57)
tabBar.BackgroundColor3 = currentTheme.Tab
tabBar.BorderSizePixel = 0
Instance.new("UICorner", tabBar).CornerRadius = UDim.new(0, 10)
local tabLayout = Instance.new("UIListLayout", tabBar)
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0, 4)
local tabPad = Instance.new("UIPadding", tabBar)
tabPad.PaddingLeft = UDim.new(0, 4); tabPad.PaddingRight = UDim.new(0, 4)
tabPad.PaddingTop = UDim.new(0, 4); tabPad.PaddingBottom = UDim.new(0, 4)

-- ================================================
-- ================================================
local tabDefs = {
	{ name = "Player",   icon = "👤" },
	{ name = "Personal", icon = "🔒" },
	{ name = "ESP",      icon = "👁" },
	{ name = "World",    icon = "🌍" },
	{ name = "Settings", icon = "⚙" },
	{ name = "Other",    icon = "ℹ" },
}

local pages = {}
local tabBtns = {}
local activeTab = "Player"

for _, def in ipairs(tabDefs) do

	local page = Instance.new("ScrollingFrame", main)
	page.Name = def.name
	page.Size = UDim2.new(1, -20, 1, -108)
	page.Position = UDim2.new(0, 10, 0, 100)
	page.BackgroundTransparency = 1
	page.BorderSizePixel = 0
	page.ScrollBarThickness = 4
	page.ScrollBarImageColor3 = currentTheme.Accent
	page.Visible = (def.name == "Player")
	page.AutomaticCanvasSize = Enum.AutomaticSize.Y
	page.CanvasSize = UDim2.new(0,0,0,0)
	local layout = Instance.new("UIListLayout", page)
	layout.Padding = UDim.new(0, 6)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	local pad = Instance.new("UIPadding", page)
	pad.PaddingTop = UDim.new(0, 4)
	pages[def.name] = page

	local tb = Instance.new("TextButton", tabBar)
	tb.Text = def.icon
	tb.Size = UDim2.new(0.1667, -3, 1, 0)
	tb.BackgroundColor3 = (def.name == "Player") and currentTheme.TabActive or currentTheme.Tab
	tb.TextColor3 = (def.name == "Player") and Color3.new(1,1,1) or currentTheme.SubText
	tb.Font = Enum.Font.GothamBold
	tb.TextSize = 16
	tb.BorderSizePixel = 0
	Instance.new("UICorner", tb).CornerRadius = UDim.new(0, 6)

	local nameLbl = Instance.new("TextLabel", tb)
	nameLbl.Size = UDim2.new(1, 0, 0, 10)
	nameLbl.Position = UDim2.new(0, 0, 1, -11)
	nameLbl.BackgroundTransparency = 1
	nameLbl.Text = def.name
	nameLbl.Font = Enum.Font.Gotham
	nameLbl.TextSize = 8
	nameLbl.TextColor3 = currentTheme.SubText
	tb.MouseEnter:Connect(playHover)
	tb.MouseButton1Click:Connect(function()
		playHover()
		activeTab = def.name
		for n, p in pairs(pages) do p.Visible = (n == def.name) end
		for n, b in pairs(tabBtns) do
			b.BackgroundColor3 = (n == def.name) and currentTheme.TabActive or currentTheme.Tab
			b.TextColor3 = (n == def.name) and Color3.new(1,1,1) or currentTheme.SubText
		end
	end)
	tabBtns[def.name] = tb
end

-- ================================================
-- ================================================
local function createSection(parent, title, order)
	local frame = Instance.new("Frame", parent)
	frame.Size = UDim2.new(1, 0, 0, 28)
	frame.BackgroundTransparency = 1
	frame.LayoutOrder = order or 0

	local bar = Instance.new("Frame", frame)
	bar.Size = UDim2.new(0, 3, 0, 14)
	bar.Position = UDim2.new(0, 0, 0.5, -7)
	bar.BackgroundColor3 = currentTheme.Accent
	bar.BorderSizePixel = 0
	Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)

	local lbl = Instance.new("TextLabel", frame)
	lbl.Text = "  " .. string.upper(title)
	lbl.Size = UDim2.new(1, -6, 1, 0)
	lbl.Position = UDim2.new(0, 6, 0, 0)
	lbl.BackgroundTransparency = 1
	lbl.TextColor3 = currentTheme.Accent
	lbl.Font = Enum.Font.GothamBold
	lbl.TextSize = 11
	lbl.TextXAlignment = Enum.TextXAlignment.Left
end

local function createBtn(parent, text, color, order, func)
	color = color or currentTheme.Button
	local frame = Instance.new("Frame", parent)
	frame.Size = UDim2.new(1, 0, 0, 40)
	frame.BackgroundColor3 = color
	frame.BorderSizePixel = 0
	frame.LayoutOrder = order or 1
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)
	local stroke2 = Instance.new("UIStroke", frame)
	stroke2.Color = Color3.new(1,1,1)
	stroke2.Transparency = 0.93
	stroke2.Thickness = 1

	local btn = Instance.new("TextButton", frame)
	btn.Text = text
	btn.Size = UDim2.new(1, 0, 1, 0)
	btn.BackgroundTransparency = 1
	btn.TextColor3 = currentTheme.Text
	btn.Font = Enum.Font.GothamSemibold
	btn.TextSize = 13
	btn.BorderSizePixel = 0

	btn.MouseEnter:Connect(function()
		playHover()
		TweenService:Create(frame, TweenInfo.new(0.12), {BackgroundColor3 = currentTheme.ButtonHov}):Play()
		TweenService:Create(stroke2, TweenInfo.new(0.12), {Transparency = 0.8, Color = currentTheme.Accent}):Play()
	end)
	btn.MouseLeave:Connect(function()
		TweenService:Create(frame, TweenInfo.new(0.12), {BackgroundColor3 = color}):Play()
		TweenService:Create(stroke2, TweenInfo.new(0.12), {Transparency = 0.93, Color = Color3.new(1,1,1)}):Play()
	end)
	btn.MouseButton1Click:Connect(function()
		local label = text:gsub("[^%w%s]","")
		showNotification("👉 " .. label, 1.5)
		TweenService:Create(frame, TweenInfo.new(0.05), {BackgroundColor3 = currentTheme.Accent}):Play()
		task.delay(0.08, function()
			TweenService:Create(frame, TweenInfo.new(0.1), {BackgroundColor3 = currentTheme.ButtonHov}):Play()
		end)
		func()
	end)
	return frame, btn
end

local function createToggle(parent, text, order, func, configKey)
	local frame = Instance.new("Frame", parent)
	frame.Size = UDim2.new(1, 0, 0, 40)
	frame.BackgroundColor3 = currentTheme.Button
	frame.BorderSizePixel = 0
	frame.LayoutOrder = order or 1
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

	local strokeT = Instance.new("UIStroke", frame)
	strokeT.Color = Color3.new(1,1,1)
	strokeT.Transparency = 0.93
	strokeT.Thickness = 1

	local lbl = Instance.new("TextLabel", frame)
	lbl.Text = text
	lbl.Size = UDim2.new(1, -56, 1, 0)
	lbl.Position = UDim2.new(0, 12, 0, 0)
	lbl.BackgroundTransparency = 1
	lbl.TextColor3 = currentTheme.Text
	lbl.Font = Enum.Font.GothamSemibold
	lbl.TextSize = 13
	lbl.TextXAlignment = Enum.TextXAlignment.Left

	local track = Instance.new("Frame", frame)
	track.Size = UDim2.new(0, 42, 0, 24)
	track.Position = UDim2.new(1, -52, 0.5, -12)
	track.BackgroundColor3 = Color3.fromRGB(60,60,80)
	track.BorderSizePixel = 0
	Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)

	local knob = Instance.new("Frame", track)
	knob.Size = UDim2.new(0, 18, 0, 18)
	knob.Position = UDim2.new(0, 3, 0.5, -9)
	knob.BackgroundColor3 = Color3.new(1,1,1)
	knob.BorderSizePixel = 0
	Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

	local state = false
	if configKey and toggleStates[configKey] ~= nil then state = toggleStates[configKey] end

	-- Apply initial state from toggleStates
	if state then
		track.BackgroundColor3 = currentTheme.Accent
		knob.Position = UDim2.new(1,-21,0.5,-9)
	end

	local hitbox = Instance.new("TextButton", frame)
	hitbox.Size = UDim2.new(1, 0, 1, 0)
	hitbox.BackgroundTransparency = 1
	hitbox.Text = ""

	hitbox.MouseEnter:Connect(playHover)
	hitbox.MouseButton1Click:Connect(function()
		playHover()
		state = not state
		if configKey then toggleStates[configKey] = state end
		TweenService:Create(track, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			BackgroundColor3 = state and currentTheme.Accent or Color3.fromRGB(60,60,80)
		}):Play()
		TweenService:Create(knob, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			Position = state and UDim2.new(1,-21,0.5,-9) or UDim2.new(0,3,0.5,-9)
		}):Play()
		local label = text:gsub("[^%w%s]","")
		showNotification((state and "✅ " or "❌ ") .. label, 1.2)
		func(state)
	end)

	-- Register apply function for config reload
	if configKey then
		toggleApply[configKey] = function(newState)
			state = newState
			track.BackgroundColor3 = state and currentTheme.Accent or Color3.fromRGB(60,60,80)
			knob.Position = state and UDim2.new(1,-21,0.5,-9) or UDim2.new(0,3,0.5,-9)
			func(state)
		end
		if state then task.spawn(function() toggleApply[configKey](true) end) end
	end

	return frame, lbl
end

local function createSlider(parent, text, min, max, default, order, func)
	local frame = Instance.new("Frame", parent)
	frame.Size = UDim2.new(1, 0, 0, 58)
	frame.BackgroundColor3 = currentTheme.Button
	frame.BorderSizePixel = 0
	frame.LayoutOrder = order or 1
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

	local lbl = Instance.new("TextLabel", frame)
	lbl.Text = text
	lbl.Size = UDim2.new(1, -110, 0, 24)
	lbl.Position = UDim2.new(0, 12, 0, 4)
	lbl.BackgroundTransparency = 1
	lbl.TextColor3 = currentTheme.Text
	lbl.Font = Enum.Font.GothamSemibold
	lbl.TextSize = 12
	lbl.TextXAlignment = Enum.TextXAlignment.Left

	-- Editable input box
	local inputBox = Instance.new("TextBox", frame)
	inputBox.Size = UDim2.new(0, 56, 0, 20)
	inputBox.Position = UDim2.new(1, -68, 0, 5)
	inputBox.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
	inputBox.BorderSizePixel = 0
	inputBox.TextColor3 = currentTheme.Accent
	inputBox.Font = Enum.Font.GothamBold
	inputBox.TextSize = 12
	inputBox.Text = tostring(default)
	inputBox.ClearTextOnFocus = false
	inputBox.PlaceholderText = tostring(default)
	Instance.new("UICorner", inputBox).CornerRadius = UDim.new(0, 6)

	local track = Instance.new("Frame", frame)
	track.Size = UDim2.new(1, -24, 0, 6)
	track.Position = UDim2.new(0, 12, 0, 42)
	track.BackgroundColor3 = Color3.fromRGB(55,55,75)
	track.BorderSizePixel = 0
	Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)

	local fill = Instance.new("Frame", track)
	local pct = (default - min) / (max - min)
	fill.Size = UDim2.new(pct, 0, 1, 0)
	fill.BackgroundColor3 = currentTheme.Accent
	fill.BorderSizePixel = 0
	Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

	local knob = Instance.new("Frame", track)
	knob.Size = UDim2.new(0, 14, 0, 14)
	knob.Position = UDim2.new(pct, -7, 0.5, -7)
	knob.BackgroundColor3 = Color3.new(1,1,1)
	knob.BorderSizePixel = 0
	Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

	local currentVal = default

	local function setVal(val, fromSlider)
		local display = math.floor(val)
		if fromSlider then
			display = math.clamp(display, min, max)
		end
		currentVal = display
		local rel = math.clamp((display - min) / (max - min), 0, 1)
		fill.Size = UDim2.new(rel, 0, 1, 0)
		knob.Position = UDim2.new(rel, -7, 0.5, -7)
		inputBox.Text = tostring(display)
		func(display)
	end

	-- Manual input: type any number, press Enter or lose focus
	inputBox.FocusLost:Connect(function()
		local num = tonumber(inputBox.Text)
		if num then
			setVal(num, false)  -- no clamp for manual input
		else
			inputBox.Text = tostring(currentVal)
		end
	end)

	local draggingSlider = false
	local hitbox = Instance.new("TextButton", track)
	hitbox.Size = UDim2.new(1, 0, 0, 20)
	hitbox.Position = UDim2.new(0, 0, 0.5, -10)
	hitbox.BackgroundTransparency = 1
	hitbox.Text = ""

	local function updateSlider(input)
		local trackPos = track.AbsolutePosition.X
		local trackSize = track.AbsoluteSize.X
		local rel = math.clamp((input.Position.X - trackPos) / trackSize, 0, 1)
		setVal(min + (max - min) * rel, true)
	end

	hitbox.MouseButton1Down:Connect(function(x,y)
		draggingSlider = true
		playHover()
		updateSlider({Position = Vector3.new(x,y,0)})
	end)
	UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then draggingSlider = false end end)
	UIS.InputChanged:Connect(function(i) if draggingSlider and i.UserInputType == Enum.UserInputType.MouseMovement then updateSlider(i) end end)
	hitbox.MouseButton1Down:Connect(function(x,y) updateSlider({Position = Vector3.new(x,y,0)}) end)

	return frame
end

local function createNumberInput(parent, text, default, order, func)
	local frame = Instance.new("Frame", parent)
	frame.Size = UDim2.new(1, 0, 0, 40)
	frame.BackgroundColor3 = currentTheme.Button
	frame.BorderSizePixel = 0
	frame.LayoutOrder = order or 1
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

	local lbl = Instance.new("TextLabel", frame)
	lbl.Text = text
	lbl.Size = UDim2.new(1, -90, 1, 0)
	lbl.Position = UDim2.new(0, 12, 0, 0)
	lbl.BackgroundTransparency = 1
	lbl.TextColor3 = currentTheme.Text
	lbl.Font = Enum.Font.GothamSemibold
	lbl.TextSize = 12
	lbl.TextXAlignment = Enum.TextXAlignment.Left

	local box = Instance.new("TextBox", frame)
	box.Size = UDim2.new(0, 72, 0, 26)
	box.Position = UDim2.new(1, -82, 0.5, -13)
	box.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
	box.BorderSizePixel = 0
	box.TextColor3 = currentTheme.Accent
	box.Font = Enum.Font.GothamBold
	box.TextSize = 13
	box.Text = tostring(default)
	box.ClearTextOnFocus = false
	box.PlaceholderText = tostring(default)
	Instance.new("UICorner", box).CornerRadius = UDim.new(0, 6)

	local current = default

	box.Changed:Connect(function(prop)
		if prop == "Text" then
			box.Text = box.Text:gsub("[^%d%-%.]+", "")
		end
	end)

	box.FocusLost:Connect(function()
		local n = tonumber(box.Text)
		if n then
			current = n
			func(n)
		else
			box.Text = tostring(current)
		end
	end)

	return frame
end

-- ================================================

-- ================================================
local dragging, dragStart, startPos

local function startDrag(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true; dragStart = input.Position; startPos = main.Position
	end
end

local dragZone = Instance.new("TextButton", main)
dragZone.Size = UDim2.new(1, 0, 1, 0)
dragZone.BackgroundTransparency = 1
dragZone.Text = ""
dragZone.ZIndex = 0
dragZone.InputBegan:Connect(startDrag)

header.InputBegan:Connect(startDrag)

UIS.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)
UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)
-- ================================================

-- ================================================
local gokuMode = false

local function spawnRing(cframe, color, size)
	local ring = Instance.new("Part", workspace)
	ring.Shape = Enum.PartType.Cylinder
	ring.Size = Vector3.new(0.3, size, size)
	ring.CFrame = cframe * CFrame.Angles(0, 0, math.pi/2)
	ring.Color = color
	ring.Material = Enum.Material.Neon
	ring.Anchored = true; ring.CanCollide = false; ring.CastShadow = false
	ring.Transparency = 0.1
	TweenService:Create(ring, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
		Size = Vector3.new(0.05, size * 3, size * 3),
		Transparency = 1
	}):Play()
	Debris:AddItem(ring, 0.55)
end

local function playInstantTransmissionFX(position)
	local char = player.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return end
	local hrp = char.HumanoidRootPart
	local originCFrame = hrp.CFrame

	-- His departure: whoosh, powerful!
	local snd1 = Instance.new("Sound", hrp)
	snd1.SoundId = "rbxassetid://126099526912322"
	snd1.Volume = 0.8; snd1.PlaybackSpeed = 1.3
	snd1:Play(); Debris:AddItem(snd1, 2)

	-- Afterimage of the original character's ghost
	for _, part in ipairs(char:GetDescendants()) do
		if part:IsA("BasePart") then
			local ghost = Instance.new("Part", workspace)
			ghost.Size = part.Size
			ghost.CFrame = part.CFrame
			ghost.Anchored = true; ghost.CanCollide = false; ghost.CastShadow = false
			ghost.Material = Enum.Material.Neon
			ghost.Color = Color3.fromRGB(120, 210, 255)
			ghost.Transparency = 0.3
			TweenService:Create(ghost, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Transparency = 1}):Play()
			Debris:AddItem(ghost, 0.45)
		end
	end

	-- Originally a pillar of light
	local pillar = Instance.new("Part", workspace)
	pillar.Size = Vector3.new(2.5, 40, 2.5)
	pillar.CFrame = originCFrame * CFrame.new(0, 20, 0)
	pillar.Color = Color3.fromRGB(150, 220, 255)
	pillar.Material = Enum.Material.Neon
	pillar.Anchored = true; pillar.CanCollide = false; pillar.Transparency = 0.2
	TweenService:Create(pillar, TweenInfo.new(0.45, Enum.EasingStyle.Quad), {
		Transparency = 1, Size = Vector3.new(7, 40, 7)
	}):Play()
	Debris:AddItem(pillar, 0.5)

	-- Starting rings
	spawnRing(originCFrame, Color3.fromRGB(100, 200, 255), 5)
	spawnRing(originCFrame, Color3.fromRGB(255, 255, 255), 2.5)

	-- Effective TP
	task.wait(0.06)
	hrp.CFrame = CFrame.new(position + Vector3.new(0, 3, 0))

	-- Its arrival impact
	local snd2 = Instance.new("Sound", hrp)
	snd2.SoundId = "rbxassetid://3716468774"
	snd2.Volume = 0.6; snd2.PlaybackSpeed = 0.85
	snd2:Play(); Debris:AddItem(snd2, 2)

	local arrCF = hrp.CFrame

	-- Shockwave ground arrival
	local wave = Instance.new("Part", workspace)
	wave.Shape = Enum.PartType.Cylinder
	wave.Size = Vector3.new(0.2, 2, 2)
	wave.CFrame = arrCF * CFrame.new(0,-3,0) * CFrame.Angles(0,0,math.pi/2)
	wave.Color = Color3.fromRGB(200, 240, 255)
	wave.Material = Enum.Material.Neon
	wave.Anchored = true; wave.CanCollide = false
	TweenService:Create(wave, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
		Size = Vector3.new(0.05, 25, 25), Transparency = 1
	}):Play()
	Debris:AddItem(wave, 0.55)

	-- Arrival rings (3 layers)
	spawnRing(arrCF, Color3.fromRGB(255, 255, 180), 6)
	spawnRing(arrCF, Color3.fromRGB(100, 200, 255), 3.5)
	spawnRing(arrCF, Color3.fromRGB(255, 255, 255), 1.8)

	-- Central flash arrival
	local burst = Instance.new("Part", workspace)
	burst.Shape = Enum.PartType.Ball
	burst.Size = Vector3.new(3, 3, 3)
	burst.CFrame = arrCF
	burst.Color = Color3.fromRGB(230, 250, 255)
	burst.Material = Enum.Material.Neon
	burst.Anchored = true; burst.CanCollide = false
	TweenService:Create(burst, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {
		Size = Vector3.new(14, 14, 14), Transparency = 1
	}):Play()
	Debris:AddItem(burst, 0.45)
end

UIS.InputBegan:Connect(function(input, gpe)
	if not gpe and gokuMode and input.KeyCode == Enum.KeyCode.F then

		local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if hrp then
			local sndTP = Instance.new("Sound", hrp)
			sndTP.SoundId = "rbxassetid://126099526912322"
			sndTP.Volume = 0.5; sndTP.PlaybackSpeed = 1.2
			sndTP:Play(); Debris:AddItem(sndTP, 2)

			local sndImpact = Instance.new("Sound", hrp)
			sndImpact.SoundId = "rbxassetid://135938385687045"
			sndImpact.Volume = 0.35; sndImpact.PlaybackSpeed = 0.9
			task.delay(0.05, function() sndImpact:Play() end)
			Debris:AddItem(sndImpact, 2)
		end
		playInstantTransmissionFX(mouse.Hit.p)
	end
end)

-- ================================================

-- ================================================
createSection(pages.Player, "Targeting", 0)

-- Player search container (input + refresh button)
local searchRow = Instance.new("Frame", pages.Player)
searchRow.Size = UDim2.new(1, 0, 0, 38)
searchRow.BackgroundTransparency = 1
searchRow.BorderSizePixel = 0
searchRow.LayoutOrder = 1

-- Search text field
local ddFrame = Instance.new("Frame", searchRow)
ddFrame.Size = UDim2.new(1, -44, 1, 0)
ddFrame.Position = UDim2.new(0, 0, 0, 0)
ddFrame.BackgroundColor3 = currentTheme.Button
ddFrame.BorderSizePixel = 0
Instance.new("UICorner", ddFrame).CornerRadius = UDim.new(0, 8)

local searchBox = Instance.new("TextBox", ddFrame)
searchBox.PlaceholderText = "  👤  Search for a player..."
searchBox.Text = ""
searchBox.Size = UDim2.new(1, -10, 1, 0)
searchBox.Position = UDim2.new(0, 10, 0, 0)
searchBox.BackgroundTransparency = 1
searchBox.TextColor3 = currentTheme.Text
searchBox.PlaceholderColor3 = currentTheme.SubText
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 12
searchBox.TextXAlignment = Enum.TextXAlignment.Left
searchBox.ClearTextOnFocus = false

-- Refresh button
local refreshFrame = Instance.new("Frame", searchRow)
refreshFrame.Size = UDim2.new(0, 38, 1, 0)
refreshFrame.Position = UDim2.new(1, -38, 0, 0)
refreshFrame.BackgroundColor3 = currentTheme.Accent
refreshFrame.BorderSizePixel = 0
Instance.new("UICorner", refreshFrame).CornerRadius = UDim.new(0, 8)

local refreshBtn = Instance.new("TextButton", refreshFrame)
refreshBtn.Text = "🔄"
refreshBtn.Size = UDim2.new(1, 0, 1, 0)
refreshBtn.BackgroundTransparency = 1
refreshBtn.TextColor3 = Color3.new(1,1,1)
refreshBtn.Font = Enum.Font.GothamBold
refreshBtn.TextSize = 16

	refreshBtn.MouseEnter:Connect(function()
		playHover()
		TweenService:Create(refreshFrame, TweenInfo.new(0.12), {BackgroundColor3 = currentTheme.AccentHov}):Play()
	end)
	refreshBtn.MouseLeave:Connect(function()
		TweenService:Create(refreshFrame, TweenInfo.new(0.12), {BackgroundColor3 = currentTheme.Accent}):Play()
	end)

-- Results drop-down list
local ddList = Instance.new("ScrollingFrame", pages.Player)
ddList.Size = UDim2.new(1, 0, 0, 0)
ddList.BackgroundColor3 = currentTheme.Panel
ddList.BorderSizePixel = 0
ddList.ScrollBarThickness = 3
ddList.Visible = false
ddList.LayoutOrder = 2
ddList.AutomaticCanvasSize = Enum.AutomaticSize.Y
ddList.CanvasSize = UDim2.new(0,0,0,0)
Instance.new("UICorner", ddList).CornerRadius = UDim.new(0, 8)
Instance.new("UIListLayout", ddList).Padding = UDim.new(0, 2)

local targetPlayer = nil

-- Select a player and close the list
local function selectPlayer(p)
	targetPlayer = p
	searchBox.Text = p.Name
	searchBox.TextColor3 = currentTheme.Text
	TweenService:Create(ddList, TweenInfo.new(0.15), {Size = UDim2.new(1,0,0,0)}):Play()
	task.wait(0.15); ddList.Visible = false
end

-- Filter and populate the list according to the entered text.
local function updateDD(filter)
	filter = filter and filter:lower() or ""
	for _, c in pairs(ddList:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
	local results = {}
	for _, p in pairs(Players:GetPlayers()) do
		if filter == "" or p.Name:lower():find(filter, 1, true) or p.DisplayName:lower():find(filter, 1, true) then
			table.insert(results, p)
		end
	end
	for _, p in ipairs(results) do
		local pb = Instance.new("TextButton", ddList)
		pb.Text = "  " .. p.Name .. (p.DisplayName ~= p.Name and " (" .. p.DisplayName .. ")" or "")
		pb.Size = UDim2.new(1, 0, 0, 30)
		pb.BackgroundColor3 = Color3.fromRGB(0,0,0)
		pb.BackgroundTransparency = 1
		pb.TextColor3 = currentTheme.Text
		pb.Font = Enum.Font.Gotham
		pb.TextSize = 12
		pb.TextXAlignment = Enum.TextXAlignment.Left
		pb.MouseEnter:Connect(function() playHover(); pb.BackgroundTransparency = 0.8 end)
		pb.MouseLeave:Connect(function() pb.BackgroundTransparency = 1 end)
		pb.MouseButton1Click:Connect(function() playHover(); selectPlayer(p) end)
	end
	local h = math.min(#results * 32, 130)
	ddList.Visible = h > 0
	if h > 0 then
		TweenService:Create(ddList, TweenInfo.new(0.15), {Size = UDim2.new(1,0,0,h)}):Play()
	end
end

-- Open/refresh the full list
local function refreshDD()
	searchBox.Text = ""
	updateDD("")
end

-- Text field events
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
	updateDD(searchBox.Text)
end)

-- Press TAB or Enter → selects the first visible result
searchBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		for _, c in pairs(ddList:GetChildren()) do
			if c:IsA("TextButton") then
				local name = c.Text:gsub("^%s+", "")
				local p = Players:FindFirstChild(name)
				if p then selectPlayer(p) end
				return
			end
		end
	end
end)

UIS.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.Tab and searchBox:IsFocused() then
		for _, c in pairs(ddList:GetChildren()) do
			if c:IsA("TextButton") then
				local name = c.Text:gsub("^%s+", "")
				local p = Players:FindFirstChild(name)
				if p then selectPlayer(p) end
				return
			end
		end
	end
end)

-- Refresh button
refreshBtn.MouseButton1Click:Connect(function()
	refreshDD()
end)

-- Open the list to focus
searchBox.Focused:Connect(function()
	updateDD(searchBox.Text)
end)

createSection(pages.Player, "Actions", 2)

-- Target player panel information
local infoPanel = Instance.new("Frame", pages.Player)
infoPanel.Size = UDim2.new(1, 0, 0, 60)
infoPanel.BackgroundColor3 = currentTheme.Panel
infoPanel.BorderSizePixel = 0
infoPanel.LayoutOrder = 2
Instance.new("UICorner", infoPanel).CornerRadius = UDim.new(0, 8)
local infoPad = Instance.new("UIPadding", infoPanel)
infoPad.PaddingLeft = UDim.new(0, 10)
infoPad.PaddingTop = UDim.new(0, 6)

local infoName = Instance.new("TextLabel", infoPanel)
infoName.Text = "No player selected"
infoName.Size = UDim2.new(1, -10, 0, 20)
infoName.BackgroundTransparency = 1
infoName.TextColor3 = currentTheme.Text
infoName.Font = Enum.Font.GothamBold
infoName.TextSize = 12
infoName.TextXAlignment = Enum.TextXAlignment.Left

local infoStats = Instance.new("TextLabel", infoPanel)
infoStats.Text = ""
infoStats.Size = UDim2.new(1, -10, 0, 16)
infoStats.Position = UDim2.new(0, 0, 0, 22)
infoStats.BackgroundTransparency = 1
infoStats.TextColor3 = currentTheme.SubText
infoStats.Font = Enum.Font.Gotham
infoStats.TextSize = 10
infoStats.TextXAlignment = Enum.TextXAlignment.Left

local infoHP = Instance.new("TextLabel", infoPanel)
infoHP.Text = ""
infoHP.Size = UDim2.new(1, -10, 0, 16)
infoHP.Position = UDim2.new(0, 0, 0, 38)
infoHP.BackgroundTransparency = 1
infoHP.TextColor3 = Color3.fromRGB(80, 220, 80)
infoHP.Font = Enum.Font.Gotham
infoHP.TextSize = 10
infoHP.TextXAlignment = Enum.TextXAlignment.Left

-- Updates the panel when targetPlayer changes
local _origSelectPlayer = selectPlayer
selectPlayer = function(p)
	_origSelectPlayer(p)
	infoName.Text = "👤  " .. p.Name .. "  (ID: " .. p.UserId .. ")"
	local teamName = p.Team and p.Team.Name or "None"
	infoStats.Text = "🏷  " .. p.Name .. (p.DisplayName ~= p.Name and " (" .. p.DisplayName .. ")" or "") .. "   🚩 Team: " .. teamName
	local hum = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
	if hum then
		infoHP.Text = "❤  HP: " .. math.floor(hum.Health) .. " / " .. math.floor(hum.MaxHealth)
	else
		infoHP.Text = "❤  HP: N/A"
	end
end

-- HP update live on the panel
RunService.Heartbeat:Connect(function()
	if targetPlayer and targetPlayer.Character then
		local hum = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
		if hum then
			infoHP.Text = "❤  HP: " .. math.floor(hum.Health) .. " / " .. math.floor(hum.MaxHealth)
		end
	end
end)

createBtn(pages.Player, "🎥  Spectate", currentTheme.Button, 3, function()
	if targetPlayer and targetPlayer.Character then
		workspace.CurrentCamera.CameraSubject = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
	end
end)
createBtn(pages.Player, "⏹  Stop Spectate", currentTheme.Button, 4, function()
	if player.Character then workspace.CurrentCamera.CameraSubject = player.Character:FindFirstChildOfClass("Humanoid") end
end)
createBtn(pages.Player, "📍  TP Player to Me", currentTheme.Button, 5, function()
	if not (targetPlayer and targetPlayer.Character and player.Character) then return end
	local myHRP = player.Character:FindFirstChild("HumanoidRootPart")
	local theirHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
	if myHRP and theirHRP then
		local wasAnchored = theirHRP.Anchored
		theirHRP.Anchored = false
		pcall(function() theirHRP.CFrame = myHRP.CFrame * CFrame.new(2, 0, 0) end)
		task.wait(0.05)
		theirHRP.Anchored = wasAnchored
	end
end)
createBtn(pages.Player, "🚀  TP Me to Player", currentTheme.Button, 6, function()
	if not (targetPlayer and targetPlayer.Character and player.Character) then return end
	local myHRP = player.Character:FindFirstChild("HumanoidRootPart")
	local theirHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
	if myHRP and theirHRP then
		pcall(function() myHRP.CFrame = theirHRP.CFrame * CFrame.new(2, 2, 0) end)
	end
end)
-- Chat Spy : 3 méthodes compatibles (TextChatService + legacy Player.Chatted)
local chatSpyConns  = {}
local chatSpyActive = false

local function stopChatSpy()
	chatSpyActive = false
	for _, c in ipairs(chatSpyConns) do pcall(function() c:Disconnect() end) end
	chatSpyConns = {}
end

local function startChatSpy(filterPlayer)
	stopChatSpy()
	chatSpyActive = true
	local connected = false

	-- Méthode 1 : TextChatService (jeux modernes Roblox)
	pcall(function()
		local TCS = game:GetService("TextChatService")
		if TCS and TCS.MessageReceived then
			local c = TCS.MessageReceived:Connect(function(msg)
				if not chatSpyActive then return end
				local src = msg.TextSource
				if not src then return end
				if filterPlayer and src.UserId ~= filterPlayer.UserId then return end
				local pName = tostring(src.UserId)
				for _, pl in ipairs(Players:GetPlayers()) do
					if pl.UserId == src.UserId then pName = pl.Name; break end
				end
				showNotification("💬  " .. pName .. ": " .. (msg.Text or ""), 5)
			end)
			table.insert(chatSpyConns, c)
			connected = true
		end
	end)

	-- Méthode 2 : Player.Chatted (legacy, le plus compatible)
	local function hookPlayer(pl)
		if filterPlayer and pl ~= filterPlayer then return end
		local c = pl.Chatted:Connect(function(msg)
			if not chatSpyActive then return end
			showNotification("💬  " .. pl.Name .. ": " .. msg, 5)
		end)
		table.insert(chatSpyConns, c)
	end
	for _, pl in ipairs(Players:GetPlayers()) do
		pcall(function() hookPlayer(pl) end)
	end
	local cAdd = Players.PlayerAdded:Connect(function(pl)
		pcall(function() hookPlayer(pl) end)
	end)
	table.insert(chatSpyConns, cAdd)
end

createBtn(pages.Player, "💬  Chat Spy (joueur ciblé)", currentTheme.Button, 7, function()
	if chatSpyActive then
		stopChatSpy()
		showNotification("👁  Chat Spy OFF", 2)
	else
		if targetPlayer then
			startChatSpy(targetPlayer)
			showNotification("👁  Chat Spy ON → " .. targetPlayer.Name, 3)
		else
			showNotification("❌  Sélectionne un joueur d'abord", 2)
		end
	end
end)
createBtn(pages.Player, "💬  Chat Spy (tous les joueurs)", currentTheme.Button, 8, function()
	if chatSpyActive then
		stopChatSpy()
		showNotification("👁  Chat Spy OFF", 2)
	else
		startChatSpy(nil)
		showNotification("👁  Chat Spy ON → tous les joueurs", 3)
	end
end)

createSection(pages.Player, "⚡  Force Modes", 9)

createBtn(pages.Player, "🪑  Force All Sit", currentTheme.Button, 10, function()
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player and p.Character then
			local hum = p.Character:FindFirstChildOfClass("Humanoid")
			if hum then pcall(function() hum.Sit = true end) end
		end
	end
	showNotification("🪑  Tous assis!", 2)
end)

createBtn(pages.Player, "💀  Force All Kill", currentTheme.Danger, 11, function()
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player and p.Character then
			local hum = p.Character:FindFirstChildOfClass("Humanoid")
			if hum then pcall(function() hum.Health = 0 end) end
		end
	end
	showNotification("💀  Tous tués!", 2)
end)

createBtn(pages.Player, "🧊  Force All Freeze", currentTheme.Button, 12, function()
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player and p.Character then
			local hrp = p.Character:FindFirstChild("HumanoidRootPart")
			if hrp then pcall(function() hrp.Anchored = true end) end
		end
	end
	showNotification("🧊  Tous frozen!", 2)
end)

createBtn(pages.Player, "🧊  Force All Unfreeze", currentTheme.Button, 13, function()
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player and p.Character then
			local hrp = p.Character:FindFirstChild("HumanoidRootPart")
			if hrp then pcall(function() hrp.Anchored = false end) end
		end
	end
	showNotification("🧊  Tous unfrozen!", 2)
end)

createBtn(pages.Player, "🗡  Remove All Tools", currentTheme.Button, 14, function()
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player and p.Character then
			for _, t in ipairs(p.Character:GetChildren()) do
				if t:IsA("Tool") then pcall(function() t:Destroy() end) end
			end
		end
	end
	showNotification("🗡  Tools supprimées!", 2)
end)

createBtn(pages.Player, "📡  Force All TP to Me", currentTheme.Accent, 15, function()
	if not player.Character then return end
	local myHRP = player.Character:FindFirstChild("HumanoidRootPart")
	if not myHRP then return end
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player and p.Character then
			local hrp = p.Character:FindFirstChild("HumanoidRootPart")
			if hrp then
				pcall(function()
					hrp.Anchored = false
					hrp.CFrame = myHRP.CFrame * CFrame.new(math.random(-4,4), 0, math.random(-4,4))
				end)
			end
		end
	end
	showNotification("📡  Tous TP à vous!", 2)
end)

-- ================================================

-- ================================================
-- Global toggle states tracking (for config save/load)
toggleStates = {}; toggleApply = {}

createSection(pages.Personal, "🏃  Movement", 0)

local savedWalkSpeed = 16
local savedJumpPower = 50

local function applyMovement(char)
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	if not hum then return end
	hum.WalkSpeed = savedWalkSpeed
	hum.JumpPower = savedJumpPower
	hum.JumpHeight = savedJumpPower * 0.3
end

player.CharacterAdded:Connect(function(char)
	task.wait(0.3)
	applyMovement(char)
end)

createToggle(pages.Personal, "⚡  Goku TP (F + Mouse)", 1, function(state)
	gokuMode = state
end, "gokuTP")

createNumberInput(pages.Personal, "🏃  Walk Speed", 16, 2, function(val)
	savedWalkSpeed = val
	local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	if hum then hum.WalkSpeed = val end
end)

createNumberInput(pages.Personal, "🦘  Jump Height", 50, 3, function(val)
	savedJumpPower = val
	local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	if hum then
		hum.JumpPower = val
		hum.JumpHeight = val * 0.3
	end
end)

createToggle(pages.Personal, "🧊  Freeze (no move)", 4, function(state)
	local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if hrp then hrp.Anchored = state end
end, "freeze")
createSection(pages.Personal, "🦅  Fly", 5)

local flyEnabled = false
local flyBodyVel, flyBodyGyro
local flySpeed = 40

local function enableFly()
	local char = player.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local hum = char:FindFirstChildOfClass("Humanoid")
	if not hrp or not hum then return end

	hum:ChangeState(Enum.HumanoidStateType.Physics)

	flyBodyVel = Instance.new("BodyVelocity", hrp)
	flyBodyVel.Velocity = Vector3.zero
	flyBodyVel.MaxForce = Vector3.new(1e5, 1e5, 1e5)

	flyBodyGyro = Instance.new("BodyGyro", hrp)
	flyBodyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
	flyBodyGyro.P = 1e4
	flyBodyGyro.D = 100

	RunService:BindToRenderStep("Fly", Enum.RenderPriority.Character.Value + 1, function()
		if not flyEnabled then return end
		local cam = workspace.CurrentCamera

		local dir = Vector3.zero
		if UIS:IsKeyDown(Enum.KeyCode.W) then dir = dir + cam.CFrame.LookVector end
		if UIS:IsKeyDown(Enum.KeyCode.S) then dir = dir - cam.CFrame.LookVector end
		if UIS:IsKeyDown(Enum.KeyCode.A) then dir = dir - cam.CFrame.RightVector end
		if UIS:IsKeyDown(Enum.KeyCode.D) then dir = dir + cam.CFrame.RightVector end
		if UIS:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0,1,0) end
		if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then dir = dir - Vector3.new(0,1,0) end
		if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then dir = dir * 2.5 end

		if dir.Magnitude > 0 then dir = dir.Unit end

		flyBodyVel.Velocity = dir * flySpeed
		flyBodyGyro.CFrame = cam.CFrame
	end)
end

local function disableFly()
	RunService:UnbindFromRenderStep("Fly")
	if flyBodyVel then flyBodyVel:Destroy(); flyBodyVel = nil end
	if flyBodyGyro then flyBodyGyro:Destroy(); flyBodyGyro = nil end
	local char = player.Character
	if char then
		local hum = char:FindFirstChildOfClass("Humanoid")
		if hum then hum:ChangeState(Enum.HumanoidStateType.GettingUp) end
	end
end

createToggle(pages.Personal, "🦅  Fly  (WASD + Space/Ctrl)", 6, function(state)
	flyEnabled = state
	if state then enableFly() else disableFly() end
end, "fly")

createNumberInput(pages.Personal, "🦅  Fly Speed", 40, 7, function(val)
	flySpeed = val
end)

createSection(pages.Personal, "👁  Collision & Visual", 8)

createToggle(pages.Personal, "🕶  Noclip (walk through walls)", 9, function(state)
	if state then
		RunService:BindToRenderStep("Noclip", Enum.RenderPriority.Character.Value + 1, function()
			local char = player.Character
			if not char then return end
			for _, part in ipairs(char:GetDescendants()) do
				if part:IsA("BasePart") then part.CanCollide = false; part.Velocity = part.Velocity * 0.98 end
			end
			local hrp = char:FindFirstChild("HumanoidRootPart")
			if hrp then hrp.CanCollide = false end
		end)
	else
		RunService:UnbindFromRenderStep("Noclip")
		local char = player.Character
		if char then
			for _, part in ipairs(char:GetDescendants()) do
				if part:IsA("BasePart") then part.CanCollide = true end
			end
		end
	end
end, "noclip")

createSection(pages.Personal, "🛡  Survival", 10)

-- God Mode — robuste, fonctionne partout
local godConn        = nil
local godHumConn     = nil
local godRespawnConn = nil
local godEnabled     = false

local function applyGodToHum(hum)
	if not hum then return end
	-- Méthode 1: MaxHealth infini + Health infini
	pcall(function()
		hum.MaxHealth = math.huge
		hum.Health    = math.huge
	end)
	-- Méthode 2: si math.huge refusé par le jeu, on force 1e6
	pcall(function()
		if hum.MaxHealth < 1e5 then
			hum.MaxHealth = 1e6
			hum.Health    = 1e6
		end
	end)
	-- Méthode 3: hook HealthChanged → reset instantané
	if godHumConn then godHumConn:Disconnect(); godHumConn = nil end
	godHumConn = hum.HealthChanged:Connect(function()
		if not godEnabled then return end
		pcall(function()
			if hum.Health < hum.MaxHealth * 0.98 then
				hum.Health = hum.MaxHealth
			end
		end)
	end)
end

local function enableGod()
	godEnabled = true
	-- Applique au personnage courant
	local char = player.Character
	if char then
		local hum = char:FindFirstChildOfClass("Humanoid")
		applyGodToHum(hum)
	end
	-- Reconnecte à chaque respawn
	if godRespawnConn then godRespawnConn:Disconnect() end
	godRespawnConn = player.CharacterAdded:Connect(function(c)
		task.wait(0.15)
		if godEnabled then
			applyGodToHum(c:FindFirstChildOfClass("Humanoid"))
		end
	end)
	-- Heartbeat léger : maintien continu
	if godConn then godConn:Disconnect() end
	godConn = RunService.Heartbeat:Connect(function()
		if not godEnabled then return end
		local char2 = player.Character
		if not char2 then return end
		local hum = char2:FindFirstChildOfClass("Humanoid")
		if hum then
			pcall(function()
				if hum.Health < hum.MaxHealth * 0.98 then
					hum.Health = hum.MaxHealth
				end
			end)
		end
	end)
end

local function disableGod()
	godEnabled = false
	if godConn        then godConn:Disconnect();        godConn        = nil end
	if godHumConn     then godHumConn:Disconnect();     godHumConn     = nil end
	if godRespawnConn then godRespawnConn:Disconnect(); godRespawnConn = nil end
end

createToggle(pages.Personal, "🛡  God Mode (invincible)", 11, function(state)
	if state then enableGod() else disableGod() end
end, "godMode")

-- ===== ANTI-KICK BYPASS =====
local antiKickEnabled = false
local antiKickConns = {}

local function stopAntiKick()
	antiKickEnabled = false
	for _, c in ipairs(antiKickConns) do pcall(c.Disconnect, c) end
	antiKickConns = {}
end

local function startAntiKick()
	stopAntiKick()
	antiKickEnabled = true
	-- Block Kick/Remove (some games kick via PlayerRemoving or Kick)
	local c1 = player:GetPropertyChangedSignal("Parent"):Connect(function()
		if not antiKickEnabled then return end
		if player.Parent ~= Players then
			pcall(function() player.Parent = Players end)
		end
	end)
	table.insert(antiKickConns, c1)
	-- Override Kick method if accessible
	local c2 = player.ChildAdded:Connect(function(c)
		if c:IsA("StringValue") and c.Name:lower():find("kick") then
			c:Destroy()
		end
	end)
	table.insert(antiKickConns, c2)
end

createToggle(pages.Personal, "🚫  Anti-Kick Bypass", 12, function(state)
	if state then startAntiKick() else stopAntiKick() end
end, "antiKick")

-- ===== NO FALL DAMAGE =====
local noFallEnabled = false
local noFallConn = nil

local function enableNoFall()
	noFallEnabled = true
	noFallConn = RunService.Heartbeat:Connect(function()
		if not noFallEnabled then return end
		local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
		if hum then
			local hv = hum:GetState() == Enum.HumanoidStateType.Freefall or hum:GetState() == Enum.HumanoidStateType.Jumping
			if not hv and hum.FloorMaterial == Enum.Material.Air then
				local hrp = player.Character:FindFirstChild("HumanoidRootPart")
				if hrp and hrp.Velocity.Y < -50 then
					pcall(function() hum.Health = hum.Health + math.abs(hrp.Velocity.Y) * 0.5 end)
				end
			end
		end
	end)
end

local function disableNoFall()
	noFallEnabled = false
	if noFallConn then noFallConn:Disconnect(); noFallConn = nil end
end

createToggle(pages.Personal, "🦶  No Fall Damage", 13, function(state)
	if state then enableNoFall() else disableNoFall() end
end, "noFall")

-- ===== ANTI-TOOL GRAB BYPASS =====
local antiGrabEnabled = false
local antiGrabConn = nil

local function enableAntiGrab()
	antiGrabEnabled = true
	antiGrabConn = RunService.Heartbeat:Connect(function()
		if not antiGrabEnabled then return end
		local char = player.Character
		if not char then return end
		for _, t in ipairs(char:GetChildren()) do
			if t:IsA("Tool") then
				pcall(function()
					if t.Parent ~= char then t.Parent = char end
				end)
			end
		end
	end)
end

local function disableAntiGrab()
	antiGrabEnabled = false
	if antiGrabConn then antiGrabConn:Disconnect(); antiGrabConn = nil end
end

createToggle(pages.Personal, "🔒  Anti-Tool Grab", 14, function(state)
	if state then enableAntiGrab() else disableAntiGrab() end
end, "antiGrab")

-- ===== ANTI-CHEAT BYPASS =====
local antiCheatEnabled = false
local antiCheatConns = {}

local function stopAntiCheat()
	antiCheatEnabled = false
	for _, c in ipairs(antiCheatConns) do pcall(c.Disconnect, c) end
	antiCheatConns = {}
end

local function startAntiCheat()
	stopAntiCheat()
	antiCheatEnabled = true
	local c1 = player.CharacterAdded:Connect(function(char)
		task.wait(0.3)
		if not antiCheatEnabled then return end
		for _, v in ipairs(char:GetDescendants()) do
			local n = v.Name:lower()
			if (v:IsA("Script") or v:IsA("LocalScript")) and (n:find("ant") or n:find("cheat") or n:find("kick") or n:find("ban") or n:find("detect")) then
				pcall(function() v.Disabled = true end)
			end
			if v:IsA("StringValue") and (n:find("ant") or n:find("ban")) then
				pcall(function() v:Destroy() end)
			end
		end
	end)
	table.insert(antiCheatConns, c1)
end

createToggle(pages.Personal, "🛡  Anti-Cheat Bypass", 15, function(state)
	if state then startAntiCheat() else stopAntiCheat() end
end, "antiCheat")

-- Infinite Jump
local jumpConn = nil
createToggle(pages.Personal, "🦘  Infinite Jump", 14, function(state)
	if state then
		jumpConn = UIS.JumpRequest:Connect(function()
			local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
			if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
		end)
	else
		if jumpConn then jumpConn:Disconnect(); jumpConn = nil end
	end
end, "infJump")

createSection(pages.Personal, "🎯  Combat", 16)

-- ===== UNLIMITED AMMO =====
local ammoEnabled   = false
local ammoConns     = {}

local function ammoCleanup()
	for _, c in ipairs(ammoConns) do pcall(function() c:Disconnect() end) end
	ammoConns = {}
end

local function patchAmmoTool(tool)
	for _, v in ipairs(tool:GetDescendants()) do
		local n = v.Name:lower()
		if (v:IsA("IntValue") or v:IsA("NumberValue")) and
			(n:find("ammo") or n:find("bullet") or n:find("mag") or n:find("clip") or n:find("round") or n:find("count")) then
			pcall(function() v.Value = 999999 end)
			local c = v.Changed:Connect(function()
				if ammoEnabled and v.Value < 500 then
					pcall(function() v.Value = 999999 end)
				end
			end)
			table.insert(ammoConns, c)
		end
	end
	-- Fire ammo remotes
	for _, v in ipairs(tool:GetDescendants()) do
		if v:IsA("RemoteEvent") then
			local n = v.Name:lower()
			if n:find("ammo") or n:find("setammo") or n:find("refill") then
				pcall(function() v:FireServer(999999) end)
			end
		end
	end
	-- Watch new descendants (tools qui créent leurs values après équipement)
	local c = tool.DescendantAdded:Connect(function(v)
		if not ammoEnabled then return end
		local n = v.Name:lower()
		if (v:IsA("IntValue") or v:IsA("NumberValue")) and
			(n:find("ammo") or n:find("bullet") or n:find("mag") or n:find("clip") or n:find("round") or n:find("count")) then
			task.wait(0.05)
			pcall(function() v.Value = 999999 end)
		end
	end)
	table.insert(ammoConns, c)
end

local function watchAmmoChar(char)
	for _, t in ipairs(char:GetChildren()) do
		if t:IsA("Tool") then patchAmmoTool(t) end
	end
	local c = char.ChildAdded:Connect(function(t)
		if t:IsA("Tool") then task.wait(0.08); patchAmmoTool(t) end
	end)
	table.insert(ammoConns, c)
end

createToggle(pages.Personal, "🔫  Unlimited Ammo", 17, function(state)
	ammoEnabled = state
	ammoCleanup()
	if not state then return end
	if player.Character then watchAmmoChar(player.Character) end
	local c = player.CharacterAdded:Connect(function(ch)
		task.wait(0.2)
		if ammoEnabled then watchAmmoChar(ch) end
	end)
	table.insert(ammoConns, c)
end, "unlimAmmo")

-- ===== INSTANT RELOAD =====
local reloadEnabled = false
local reloadConns   = {}

local function reloadCleanup()
	for _, c in ipairs(reloadConns) do pcall(function() c:Disconnect() end) end
	reloadConns = {}
end

local function patchReloadTool(tool)
	-- Patch delay/cooldown values à 0
	for _, v in ipairs(tool:GetDescendants()) do
		local n = v.Name:lower()
		if (v:IsA("NumberValue") or v:IsA("IntValue")) and
			(n:find("reload") or n:find("reloadtime") or n:find("delay") or n:find("cooldown") or n:find("firerate")) then
			pcall(function() v.Value = 0 end)
			local c = v.Changed:Connect(function()
				if reloadEnabled then pcall(function() v.Value = 0 end) end
			end)
			table.insert(reloadConns, c)
		end
	end
	-- Fire reload remotes
	for _, v in ipairs(tool:GetDescendants()) do
		if v:IsA("RemoteEvent") and v.Name:lower():find("reload") then
			pcall(function() v:FireServer() end)
		end
	end
	-- Accélère les AnimationTrack actives
	local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	local animator = hum and hum:FindFirstChildOfClass("Animator")
	if animator then
		for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
			pcall(function()
				if track.Speed < 10 then track:AdjustSpeed(99) end
			end)
		end
	end
end

local function watchReloadChar(char)
	for _, t in ipairs(char:GetChildren()) do
		if t:IsA("Tool") then patchReloadTool(t) end
	end
	local c = char.ChildAdded:Connect(function(t)
		if t:IsA("Tool") then task.wait(0.08); patchReloadTool(t) end
	end)
	table.insert(reloadConns, c)
end

createToggle(pages.Personal, "⚡  Instant Reload", 18, function(state)
	reloadEnabled = state
	reloadCleanup()
	if not state then return end
	if player.Character then watchReloadChar(player.Character) end
	local c = player.CharacterAdded:Connect(function(ch)
		task.wait(0.2)
		if reloadEnabled then watchReloadChar(ch) end
	end)
	table.insert(reloadConns, c)
end, "instReload")

-- ===== NO RECOIL =====
local recoilEnabled  = false
local recoilConn     = nil
local recoilConns    = {}

local function recoilPatchTool(tool)
	for _, v in ipairs(tool:GetDescendants()) do
		local n = v.Name:lower()
		if (v:IsA("NumberValue") or v:IsA("Vector3Value") or v:IsA("IntValue")) and
			(n:find("recoil") or n:find("kickback") or n:find("kick") or n:find("spread") or n:find("sway")) then
			pcall(function()
				if v:IsA("Vector3Value") then v.Value = Vector3.new(0,0,0)
				else v.Value = 0 end
			end)
			local c = v.Changed:Connect(function()
				if not recoilEnabled then return end
				pcall(function()
					if v:IsA("Vector3Value") then v.Value = Vector3.new(0,0,0)
					else v.Value = 0 end
				end)
			end)
			table.insert(recoilConns, c)
		end
	end
end

createToggle(pages.Personal, "🎯  No Recoil", 19, function(state)
	recoilEnabled = state
	-- Nettoie les anciennes connexions
	if recoilConn then recoilConn:Disconnect(); recoilConn = nil end
	for _, c in ipairs(recoilConns) do pcall(function() c:Disconnect() end) end
	recoilConns = {}
	if not state then return end

	local cam    = workspace.CurrentCamera
	-- Stocke le pitch/yaw initial proprement
	local lastYaw, lastPitch = 0, 0
	local function getCamAngles()
		local _, y, _ = cam.CFrame:ToEulerAnglesYXZ()
		local x, _, _ = cam.CFrame:ToEulerAnglesYXZ()
		return x, y
	end
	local initP, initY = getCamAngles()
	lastPitch, lastYaw = initP, initY

	-- RenderStepped : annule uniquement le pitch vers le haut (recul)
	-- sans toucher au yaw ni aux mouvements normaux
	recoilConn = RunService.RenderStepped:Connect(function()
		if not recoilEnabled then return end
		local curP, curY = getCamAngles()
		local dPitch = curP - lastPitch
		-- Recul = pitch monte (valeur augmente en abs quand on vise haut)
		-- On annule uniquement les sauts soudains > seuil
		if dPitch > 0.008 then
			-- Reconstruit CFrame en annulant le recul vertical
			local pos   = cam.CFrame.Position
			local look  = cam.CFrame.LookVector
			-- Soustrait le delta de recul
			local corrected = CFrame.new(pos) * CFrame.Angles(lastPitch, curY, 0)
			pcall(function() cam.CFrame = corrected end)
		else
			lastPitch = curP
			lastYaw   = curY
		end
	end)

	-- Patch les valeurs de recul dans les outils équipés
	local char = player.Character
	if char then
		for _, t in ipairs(char:GetChildren()) do
			if t:IsA("Tool") then recoilPatchTool(t) end
		end
		local c = char.ChildAdded:Connect(function(t)
			if t:IsA("Tool") then task.wait(0.08); recoilPatchTool(t) end
		end)
		table.insert(recoilConns, c)
	end
	local c2 = player.CharacterAdded:Connect(function(ch)
		task.wait(0.2)
		if not recoilEnabled then return end
		for _, t in ipairs(ch:GetChildren()) do
			if t:IsA("Tool") then recoilPatchTool(t) end
		end
		local cc = ch.ChildAdded:Connect(function(t)
			if t:IsA("Tool") then task.wait(0.08); recoilPatchTool(t) end
		end)
		table.insert(recoilConns, cc)
	end)
	table.insert(recoilConns, c2)
end, "noRecoil")

-- ===== AUTO PARRY =====
local autoParryEnabled = false
local autoParryConn = nil

local function enableAutoParry()
	autoParryEnabled = true
	autoParryConn = RunService.RenderStepped:Connect(function()
		if not autoParryEnabled then return end
		local char = player.Character
		if not char then return end
		-- Auto-block: tilt torso back slightly (mimics parry)
		local torso = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
		if torso then
			pcall(function()
				torso.CFrame = torso.CFrame * CFrame.Angles(0.15, 0, 0)
			end)
		end
	end)
end

local function disableAutoParry()
	autoParryEnabled = false
	if autoParryConn then autoParryConn:Disconnect(); autoParryConn = nil end
end

createToggle(pages.Personal, "⚔  Auto Parry (block)", 20, function(state)
	if state then enableAutoParry() else disableAutoParry() end
end, "autoParry")

-- ================================================

-- ================================================
local aimEnabled   = false
local aimActive    = false
local aimConn      = nil
local aimMode      = "hold"
local aimKey       = "Mouse2"
local aimSmooth    = 0.08
local aimFOV       = 250

-- All possible mouse buttons
local MOUSE_KEYS = {
	{ label = "Right Click  (Mouse2)",   id = "Mouse2"  },
	{ label = "Left Click  (Mouse1)",  id = "Mouse1"  },
	{ label = "Middle Click  (Mouse3)", id = "Mouse3"  },
}

-- All valid Roblo keyboard keys (KeyCode.Name)
local KEYBOARD_KEYS = {
	-- Lettres
	"A","B","C","D","E","F","G","H","I","J","K","L","M",
	"N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
	-- Chiffres rangée du haut
	"Zero","One","Two","Three","Four","Five","Six","Seven","Eight","Nine",
	-- Touches fonction
	"F1","F2","F3","F4","F5","F6","F7","F8","F9","F10","F11","F12",
	-- Modificateurs
	"LeftShift","RightShift","LeftControl","RightControl","LeftAlt","RightAlt",
	-- Navigation
	"Up","Down","Left","Right","Home","End","PageUp","PageDown","Insert","Delete",
	-- Pavé numérique
	"KeypadZero","KeypadOne","KeypadTwo","KeypadThree","KeypadFour",
	"KeypadFive","KeypadSix","KeypadSeven","KeypadEight","KeypadNine",
	"KeypadPlus","KeypadMinus","KeypadAsterisk","KeypadSlash","KeypadPeriod",
	-- Divers
	"Tab","CapsLock","Space","BackSpace","Return","Escape",
	"Minus","Equals","LeftBracket","RightBracket","BackSlash",
	"Semicolon","Quote","Comma","Period","Slash","Backquote",
}

-- Check if an input corresponds to the aim key
local function isAimInput(input, began)
	if aimKey == "Mouse1" then
		return input.UserInputType == Enum.UserInputType.MouseButton1
	elseif aimKey == "Mouse2" then
		return input.UserInputType == Enum.UserInputType.MouseButton2
	elseif aimKey == "Mouse3" then
		return input.UserInputType == Enum.UserInputType.MouseButton3
	else
		return input.UserInputType == Enum.UserInputType.Keyboard
			and input.KeyCode.Name == aimKey
	end
end

-- Find the target in the FOV
local function getTarget()
	local cam   = workspace.CurrentCamera
	local myHRP = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if not myHRP then return nil end

	local best, bestScore = nil, math.huge
	local vp = cam.ViewportSize
	local cx, cy = vp.X / 2, vp.Y / 2

	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player and p.Character then
			-- Skip allies (same team)
			local myTeam     = player.Team
			local theirTeam  = p.Team
			if not (myTeam and theirTeam and myTeam == theirTeam) then
				local hum  = p.Character:FindFirstChildOfClass("Humanoid")
				local head = p.Character:FindFirstChild("Head")
				if hum and hum.Health > 0 and head then
					local sp, onScreen = cam:WorldToViewportPoint(head.Position)
					if onScreen and sp.Z > 0 then
						local dx = sp.X - cx
						local dy = sp.Y - cy
						local fovDist = math.sqrt(dx*dx + dy*dy)
						if fovDist < aimFOV and fovDist < bestScore then
							bestScore = fovDist
							best = p
						end
					end
				end
			end
		end
	end
	return best
end

-- Aim loop: 3 alternative methods depending on the game
-- Method 1: cam.CFrame direct (works on most games)
-- Method 2: mouse.Move simulation via UserInputService
-- Method 3: HumanoidRootPart CFrame orients towards target (fallback)
local aimMethod = 1   -- méthode active

local aimPrediction = 0.15
local aimTargetPart = "Head"

local function applyAim(head)
	local cam = workspace.CurrentCamera

	-- Simple prediction: lead the target based on velocity
	local targetPos = head.Position
	local hrpTarget = head.Parent and head.Parent:FindFirstChild("HumanoidRootPart")
	if hrpTarget and aimPrediction > 0 then
		targetPos = targetPos + hrpTarget.Velocity * aimPrediction
	end

	if aimMethod == 1 then
		local targetCF = CFrame.new(cam.CFrame.Position, targetPos)
		cam.CFrame = cam.CFrame:Lerp(targetCF, aimSmooth)

	elseif aimMethod == 2 then
		local prev = cam.CameraType
		cam.CameraType = Enum.CameraType.Scriptable
		local targetCF = CFrame.new(cam.CFrame.Position, targetPos)
		cam.CFrame = cam.CFrame:Lerp(targetCF, aimSmooth)
		cam.CameraType = prev

	elseif aimMethod == 3 then
		local myHrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if myHrp then
			local dir = (targetPos - myHrp.Position) * Vector3.new(1, 0, 1)
			if dir.Magnitude > 0.1 then
				myHrp.CFrame = myHrp.CFrame:Lerp(
					CFrame.new(myHrp.Position, myHrp.Position + dir),
					aimSmooth * 2
				)
			end
		end
	end
end

local function startAim()
	if aimConn then return end
	aimConn = RunService.RenderStepped:Connect(function()
		if not aimActive then return end
		local t = getTarget()
		if not (t and t.Character) then return end
		local head = t.Character:FindFirstChild("Head")
		if not head then return end
		pcall(applyAim, head)
	end)
end

local function stopAim()
	if aimConn then aimConn:Disconnect(); aimConn = nil end
	aimActive = false
end

-- Listen InputBegan/Ended
UIS.InputBegan:Connect(function(input, gpe)
	if gpe or not aimEnabled then return end
	if isAimInput(input) then
		if aimMode == "toggle" then
			aimActive = not aimActive
		else
			aimActive = true
		end
	end
end)
UIS.InputEnded:Connect(function(input)
	if aimMode == "hold" and isAimInput(input) then
		aimActive = false
	end
end)

-- ================================================

-- ================================================
createSection(pages.Personal, "🎯  Aim Lock", 100)

-- Declaration BEFORE use
local aimStatusLabel = Instance.new("TextLabel", pages.Personal)
aimStatusLabel.Size  = UDim2.new(1, 0, 0, 18)
aimStatusLabel.BackgroundTransparency = 1
aimStatusLabel.TextColor3 = currentTheme.SubText
aimStatusLabel.Font  = Enum.Font.Gotham
aimStatusLabel.TextSize = 11
aimStatusLabel.TextXAlignment = Enum.TextXAlignment.Left
aimStatusLabel.LayoutOrder = 100
local function updateAimStatus()
	aimStatusLabel.Text = "  Key: " .. aimKey
		.. "   Mode: " .. aimMode
		.. "   Smooth: " .. math.floor(aimSmooth * 100) .. "%"
end
updateAimStatus()

-- Main Toggle
createToggle(pages.Personal, "🎯  Aim Lock ON / OFF", 101, function(state)
	aimEnabled = state
	if state then startAim() else stopAim() end
end, "aimLock")

-- Slider smooth (aiming speed)
createSlider(pages.Personal, "🎚  Smooth (aim speed)", 1, 30, 8, 102, function(val)
	aimSmooth = val / 100
	updateAimStatus()
end)

-- Slider FOV
createNumberInput(pages.Personal, "🔵  FOV (radius pixels)", 250, 103, function(val)
	aimFOV = val
end)

createSlider(pages.Personal, "🎯  Prediction (lead)", 0, 50, 15, 104, function(val)
	aimPrediction = val / 100
end)

-- Mode Hold / Toggle
createBtn(pages.Personal, "🔄  Mode: " .. aimMode, currentTheme.Button, 105, function(btn)
	aimMode = (aimMode == "hold") and "toggle" or "hold"
	updateAimStatus()
	showNotification("🎯  Mode: " .. aimMode, 2)
end)

local methodNames = {"1 - Direct Cam", "2 - Scriptable Cam", "3 - HRP Orient"}
createBtn(pages.Personal, "🔧  Method: " .. methodNames[aimMethod], currentTheme.Button, 106, function()
	aimMethod = (aimMethod % 3) + 1
	showNotification("🎯  Method: " .. methodNames[aimMethod], 2)
end)

-- Generic dropdown (declared here, used for mouse and keyboard)
local function mkDropdown(parent, label, items, defaultIdx, order, onPick)
	local selIdx = defaultIdx
	local open   = false

	local hdr = Instance.new("Frame", parent)
	hdr.Size = UDim2.new(1,0,0,34)
	hdr.BackgroundColor3 = currentTheme.Button
	hdr.BorderSizePixel  = 0
	hdr.LayoutOrder      = order
	Instance.new("UICorner", hdr).CornerRadius = UDim.new(0, 8)

	local htxt = Instance.new("TextLabel", hdr)
	htxt.Size = UDim2.new(1,-28,1,0)
	htxt.Position = UDim2.new(0,10,0,0)
	htxt.BackgroundTransparency = 1
	htxt.Text = label .. " : " .. items[selIdx]
	htxt.TextColor3 = currentTheme.Text
	htxt.Font = Enum.Font.Gotham; htxt.TextSize = 12
	htxt.TextXAlignment = Enum.TextXAlignment.Left

	local arrw = Instance.new("TextLabel", hdr)
	arrw.Size = UDim2.new(0,24,1,0)
	arrw.Position = UDim2.new(1,-26,0,0)
	arrw.BackgroundTransparency = 1
	arrw.Text = "▾"; arrw.TextColor3 = currentTheme.SubText
	arrw.Font = Enum.Font.GothamBold; arrw.TextSize = 14

	local list = Instance.new("ScrollingFrame", parent)
	list.Size = UDim2.new(1,0,0,0)
	list.CanvasSize = UDim2.new(0,0,0,0)
	list.AutomaticCanvasSize = Enum.AutomaticSize.Y
	list.BackgroundColor3 = currentTheme.Panel
	list.BorderSizePixel  = 0
	list.ScrollBarThickness = 3
	list.ClipsDescendants = true
	list.Visible = false
	list.LayoutOrder = order
	Instance.new("UICorner", list).CornerRadius = UDim.new(0, 8)
	Instance.new("UIListLayout", list).Padding = UDim.new(0, 1)

	for i, item in ipairs(items) do
		local row = Instance.new("TextButton", list)
		row.Size = UDim2.new(1,0,0,26)
		row.BackgroundTransparency = 1
		row.Text = "  " .. item
		row.TextColor3 = currentTheme.Text
		row.Font = Enum.Font.Gotham; row.TextSize = 12
		row.TextXAlignment = Enum.TextXAlignment.Left
		row.BorderSizePixel = 0
		row.MouseEnter:Connect(function() playHover(); row.BackgroundTransparency = 0.8 end)
		row.MouseLeave:Connect(function() row.BackgroundTransparency = 1 end)
		row.MouseButton1Click:Connect(function()
			playHover()
			selIdx = i
			htxt.Text = label .. " : " .. items[selIdx]
			onPick(items[selIdx])
			open = false
			TweenService:Create(list, TweenInfo.new(0.14), {Size=UDim2.new(1,0,0,0)}):Play()
			task.delay(0.15, function() list.Visible = false end)
		end)
	end

	local hbtn = Instance.new("TextButton", hdr)
	hbtn.Size = UDim2.new(1,0,1,0)
	hbtn.BackgroundTransparency = 1; hbtn.Text = ""
	hbtn.MouseEnter:Connect(playHover)
	hbtn.MouseButton1Click:Connect(function()
		playHover()
		open = not open
		list.Visible = true
		local h = open and math.min(#items * 27, 216) or 0
		TweenService:Create(list, TweenInfo.new(0.14), {Size=UDim2.new(1,0,0,h)}):Play()
		if not open then task.delay(0.15, function() list.Visible = false end) end
	end)
end

-- Labels for dropdowns
local MOUSE_LABELS = {}
for _, m in ipairs(MOUSE_KEYS) do table.insert(MOUSE_LABELS, m.label) end

mkDropdown(pages.Personal, "🖱  Mouse", MOUSE_LABELS, 1, 107, function(lbl)
	for _, m in ipairs(MOUSE_KEYS) do
		if m.label == lbl then aimKey = m.id; break end
	end
	updateAimStatus()
end)

mkDropdown(pages.Personal, "⌨  Keyboard", KEYBOARD_KEYS, 1, 108, function(key)
	aimKey = key
	updateAimStatus()
end)

createSection(pages.Personal, "📐  Appearance", 108)

local currentScale = 1.0

local function applyScale(val)
	currentScale = val / 100
	local char = player.Character
	if not char then return end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if not hum then return end

	local function setScale()
		-- Method 1: Humanoid BodyScale ValueObjects (R15 standard)
		local bd = hum:FindFirstChild("BodyDepthScale")
		local bh = hum:FindFirstChild("BodyHeightScale")
		local bw = hum:FindFirstChild("BodyWidthScale")
		local hs = hum:FindFirstChild("HeadScale")
		if bd then bd.Value = currentScale end
		if bh then bh.Value = currentScale end
		if bw then bw.Value = currentScale end
		if hs then hs.Value = currentScale end

		-- Method 2: Humanoid BodyTypeScale (R15 alternate)
		local bt = hum:FindFirstChild("BodyTypeScale")
		if bt then bt.Value = math.clamp(currentScale, 0, 1) end

		-- Method 3: CFrame + Size scale all BaseParts directly
		local hrp = char:FindFirstChild("HumanoidRootPart")
		if hrp and not bd then  -- fallback if no ValueObjects
			for _, part in ipairs(char:GetDescendants()) do
				if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
					pcall(function()
						part.Size = part.Size * currentScale
					end)
				end
			end
		end

		-- Method 4: Model:ScaleTo (newer Roblox API)
		pcall(function()
			if char.ScaleTo then
				char:ScaleTo(currentScale)
			end
		end)
	end

	setScale()
	-- Retry after short delay (some games set scale server-side)
	task.delay(0.3, setScale)
	task.delay(1.0, setScale)
end

-- Also applies to respawning
player.CharacterAdded:Connect(function(char)
	task.wait(0.5)
	applyScale(currentScale * 100)
end)

createNumberInput(pages.Personal, "📐  Character Size", 100, 109, function(val)
	applyScale(val)
end)

-- ================================================

-- ================================================
createSection(pages.World, "☀  Environment", 0)

local shader = nil
for _, v in pairs(Lighting:GetChildren()) do if v.Name == "AdminShader" then shader = v; break end end
if not shader then shader = Instance.new("ColorCorrectionEffect", Lighting); shader.Name = "AdminShader"; shader.Enabled = false end

createToggle(pages.World, "🎨  Cinematic Shaders", 1, function(state)
	shader.Enabled = state
	if state then
		shader.Brightness = -0.05; shader.Contrast = 0.08
		shader.Saturation = 0.15; shader.TintColor = Color3.fromRGB(255, 240, 220)
	end
end, "cinematic")

createToggle(pages.World, "🌙  Night Mode", 2, function(state)
	if state then
		TweenService:Create(Lighting, TweenInfo.new(1.5), {ClockTime=0, Brightness=0.5, Ambient=Color3.fromRGB(20,20,50)}):Play()
	else
		TweenService:Create(Lighting, TweenInfo.new(1.5), {ClockTime=14, Brightness=2, Ambient=Color3.fromRGB(100,100,100)}):Play()
	end
end, "nightMode")

createToggle(pages.World, "🌈  Rainbow Sky", 4, function(state)
	if state then
		local hue = 0
		RunService:BindToRenderStep("RainbowSky", 1, function()
			hue = (hue + 0.001) % 1
			Lighting.Ambient = Color3.fromHSV(hue, 0.6, 0.9)
			Lighting.OutdoorAmbient = Color3.fromHSV((hue+0.3)%1, 0.5, 0.8)
		end)
	else
		RunService:UnbindFromRenderStep("RainbowSky")
		Lighting.Ambient = Color3.fromRGB(100,100,100)
		Lighting.OutdoorAmbient = Color3.fromRGB(128,128,128)
	end
end, "rainbowSky")

-- Fog
createSection(pages.World, "🌫  Fog", 4)

createSection(pages.World, "🌫  Fog & Effects", 5)

local function getAtmo()
	local a = Lighting:FindFirstChildOfClass("Atmosphere")
	if not a then a = Instance.new("Atmosphere", Lighting) end
	return a
end

createToggle(pages.World, "🌫  Dense Fog", 5, function(state)
	local atmo = getAtmo()
	TweenService:Create(atmo, TweenInfo.new(1.5), {
		Density = state and 0.85 or 0.3,
		Offset  = state and 0.1  or 0,
	}):Play()
end, "denseFog")

createToggle(pages.World, "☁  Light Fog", 6, function(state)
	local atmo = getAtmo()
	TweenService:Create(atmo, TweenInfo.new(1.5), {
		Density = state and 0.5 or 0.3,
	}):Play()
end, "lightFog")

-- Rain: multi-layer high quality system
createToggle(pages.World, "🌧  Rain", 7, function(state)
	RunService:UnbindFromRenderStep("AdminRain")
	for _, v in ipairs(workspace:GetChildren()) do
		if v.Name == "AdminRain" or v.Name == "AdminRainFar" or v.Name == "AdminRainSplash" then v:Destroy() end
	end
	if not state then
		-- Reset lighting
		TweenService:Create(Lighting, TweenInfo.new(2), {
			Brightness = 2,
			Ambient = Color3.fromRGB(100,100,100),
			OutdoorAmbient = Color3.fromRGB(128,128,128),
		}):Play()
		local atmo = Lighting:FindFirstChildOfClass("Atmosphere")
		if atmo then
			TweenService:Create(atmo, TweenInfo.new(2), { Density = 0 }):Play()
		end
		return
	end

	-- Dark stormy ambiance
	TweenService:Create(Lighting, TweenInfo.new(2), {
		Brightness = 0.6,
		Ambient = Color3.fromRGB(80, 95, 120),
		OutdoorAmbient = Color3.fromRGB(90, 105, 130),
	}):Play()
	local atmo = Lighting:FindFirstChildOfClass("Atmosphere")
	if not atmo then atmo = Instance.new("Atmosphere", Lighting) end
	TweenService:Create(atmo, TweenInfo.new(2), { Density = 0.45 }):Play()

	-- Layer 1: heavy close rain
	local rain = Instance.new("Part", workspace)
	rain.Name = "AdminRain"; rain.Anchored = true
	rain.CanCollide = false; rain.Transparency = 1
	rain.Size = Vector3.new(160, 1, 160)
	local ps1 = Instance.new("ParticleEmitter", rain)
	ps1.Texture      = "rbxassetid://17628471654"
	ps1.Rate         = 1200
	ps1.Lifetime     = NumberRange.new(0.6, 1.0)
	ps1.Speed        = NumberRange.new(90, 110)
	ps1.SpreadAngle  = Vector2.new(2, 2)
	ps1.Size         = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.07),
		NumberSequenceKeypoint.new(1, 0.03),
	})
	ps1.Color        = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 210, 255)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(140, 175, 230)),
	})
	ps1.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.2),
		NumberSequenceKeypoint.new(0.8, 0.3),
		NumberSequenceKeypoint.new(1, 1),
	})
	ps1.Rotation     = NumberRange.new(88, 92)
	ps1.RotSpeed     = NumberRange.new(0, 0)
	ps1.LightEmission = 0.05
	ps1.LightInfluence = 0.8

	-- Layer 2: wide far rain
	local rainFar = Instance.new("Part", workspace)
	rainFar.Name = "AdminRainFar"; rainFar.Anchored = true
	rainFar.CanCollide = false; rainFar.Transparency = 1
	rainFar.Size = Vector3.new(400, 1, 400)
	local ps2 = Instance.new("ParticleEmitter", rainFar)
	ps2.Texture      = "rbxassetid://17628471654"
	ps2.Rate         = 600
	ps2.Lifetime     = NumberRange.new(1.0, 1.6)
	ps2.Speed        = NumberRange.new(70, 85)
	ps2.SpreadAngle  = Vector2.new(5, 5)
	ps2.Size         = NumberSequence.new(0.04)
	ps2.Color        = ColorSequence.new(Color3.fromRGB(160, 195, 245))
	ps2.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.5),
		NumberSequenceKeypoint.new(1, 1),
	})
	ps2.Rotation     = NumberRange.new(87, 93)
	ps2.RotSpeed     = NumberRange.new(0, 0)
	ps2.LightEmission = 0
	ps2.LightInfluence = 1

	-- Rain sound
	local snd = Instance.new("Sound", rain)
	snd.SoundId = "rbxassetid://9117963093"
	snd.Volume = 0.25; snd.Looped = true
	TweenService:Create(snd, TweenInfo.new(1.5), { Volume = 0.25 }):Play()
	snd:Play()

	-- Thunder ambient sound
	local thunder = Instance.new("Sound", rain)
	thunder.SoundId = "rbxassetid://9117963093"
	thunder.Volume = 0; thunder.Looped = true; thunder:Play()

	RunService:BindToRenderStep("AdminRain", 1, function()
		local c = player.Character
		if c and c:FindFirstChild("HumanoidRootPart") then
			local pos = c.HumanoidRootPart.Position
			rain.CFrame    = CFrame.new(pos + Vector3.new(0, 45, 0))
			rainFar.CFrame = CFrame.new(pos + Vector3.new(0, 50, 0))
		end
	end)
end, "rain")

-- Snow: high quality multi-layer system
createToggle(pages.World, "❄  Snow", 8, function(state)
	RunService:UnbindFromRenderStep("AdminSnow")
	for _, v in ipairs(workspace:GetChildren()) do
		if v.Name == "AdminSnow" or v.Name == "AdminSnowFar" or v.Name == "AdminSnowGround" then v:Destroy() end
	end

	if state then
		-- Cold winter ambiance
		TweenService:Create(Lighting, TweenInfo.new(2), {
			Brightness = 1.4,
			Ambient = Color3.fromRGB(170, 185, 215),
			OutdoorAmbient = Color3.fromRGB(185, 200, 230),
		}):Play()
		local atmo = Lighting:FindFirstChildOfClass("Atmosphere")
		if not atmo then atmo = Instance.new("Atmosphere", Lighting) end
		TweenService:Create(atmo, TweenInfo.new(2), { Density = 0.25, Color = Color3.fromRGB(200, 215, 240) }):Play()

		-- Layer 1: heavy close snowflakes
		local snow = Instance.new("Part", workspace)
		snow.Name = "AdminSnow"; snow.Anchored = true
		snow.CanCollide = false; snow.Transparency = 1
		snow.Size = Vector3.new(160, 1, 160)
		local ps1 = Instance.new("ParticleEmitter", snow)
		ps1.Texture      = "rbxassetid://1411517390"
		ps1.Rate         = 500
		ps1.Lifetime     = NumberRange.new(3.5, 5.5)
		ps1.Speed        = NumberRange.new(8, 18)
		ps1.SpreadAngle  = Vector2.new(30, 30)
		ps1.Size         = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.28),
			NumberSequenceKeypoint.new(0.5, 0.22),
			NumberSequenceKeypoint.new(1, 0.0),
		})
		ps1.Color        = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(240, 248, 255)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(210, 228, 255)),
		})
		ps1.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.1),
			NumberSequenceKeypoint.new(0.85, 0.2),
			NumberSequenceKeypoint.new(1, 1),
		})
		ps1.Rotation     = NumberRange.new(0, 360)
		ps1.RotSpeed     = NumberRange.new(-20, 20)
		ps1.LightEmission = 0.3
		ps1.LightInfluence = 0.6

		-- Layer 2: distant wide blizzard
		local snowFar = Instance.new("Part", workspace)
		snowFar.Name = "AdminSnowFar"; snowFar.Anchored = true
		snowFar.CanCollide = false; snowFar.Transparency = 1
		snowFar.Size = Vector3.new(400, 1, 400)
		local ps2 = Instance.new("ParticleEmitter", snowFar)
		ps2.Texture      = "rbxassetid://1411517390"
		ps2.Rate         = 250
		ps2.Lifetime     = NumberRange.new(4, 7)
		ps2.Speed        = NumberRange.new(12, 22)
		ps2.SpreadAngle  = Vector2.new(45, 45)
		ps2.Size         = NumberSequence.new(0.12)
		ps2.Color        = ColorSequence.new(Color3.fromRGB(220, 235, 255))
		ps2.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.5),
			NumberSequenceKeypoint.new(1, 1),
		})
		ps2.Rotation     = NumberRange.new(0, 360)
		ps2.RotSpeed     = NumberRange.new(-10, 10)
		ps2.LightEmission = 0.15
		ps2.LightInfluence = 0.8

		-- Layer 3: small fast wind particles
		local snowGround = Instance.new("Part", workspace)
		snowGround.Name = "AdminSnowGround"; snowGround.Anchored = true
		snowGround.CanCollide = false; snowGround.Transparency = 1
		snowGround.Size = Vector3.new(80, 1, 80)
		local ps3 = Instance.new("ParticleEmitter", snowGround)
		ps3.Texture      = "rbxassetid://1411517390"
		ps3.Rate         = 180
		ps3.Lifetime     = NumberRange.new(1.5, 2.5)
		ps3.Speed        = NumberRange.new(20, 35)
		ps3.SpreadAngle  = Vector2.new(60, 15)
		ps3.Size         = NumberSequence.new(0.06)
		ps3.Color        = ColorSequence.new(Color3.fromRGB(255, 255, 255))
		ps3.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.4),
			NumberSequenceKeypoint.new(1, 1),
		})
		ps3.Rotation     = NumberRange.new(0, 360)
		ps3.RotSpeed     = NumberRange.new(-50, 50)
		ps3.LightEmission = 0.4

		-- Wind sound
		local snd = Instance.new("Sound", snow)
		snd.SoundId = "rbxassetid://5800330726"
		snd.Volume = 0.15; snd.Looped = true; snd:Play()

		RunService:BindToRenderStep("AdminSnow", 1, function()
			local c = player.Character
			if c and c:FindFirstChild("HumanoidRootPart") then
				local pos = c.HumanoidRootPart.Position
				snow.CFrame       = CFrame.new(pos + Vector3.new(0, 35, 0))
				snowFar.CFrame    = CFrame.new(pos + Vector3.new(0, 45, 0))
				snowGround.CFrame = CFrame.new(pos + Vector3.new(0, 5, 0))
			end
		end)
	else
		TweenService:Create(Lighting, TweenInfo.new(1.5), {
			Brightness = 2,
			Ambient = Color3.fromRGB(100,100,100),
			OutdoorAmbient = Color3.fromRGB(128,128,128),
		}):Play()
		local atmo = Lighting:FindFirstChildOfClass("Atmosphere")
		if atmo then
			TweenService:Create(atmo, TweenInfo.new(2), { Density = 0 }):Play()
		end
	end
end, "snow")

createToggle(pages.World, "🌅  Sunset", 9, function(state)
	if state then
		TweenService:Create(Lighting, TweenInfo.new(2), {
			ClockTime = 18, Brightness = 1.2,
			Ambient = Color3.fromRGB(80,30,10),
			OutdoorAmbient = Color3.fromRGB(180,80,30),
		}):Play()
		shader.Enabled = true
		shader.TintColor = Color3.fromRGB(255,180,120)
		shader.Saturation = 0.3
	else
		shader.Enabled = false
		TweenService:Create(Lighting, TweenInfo.new(1.5), {
			Brightness = 2,
			Ambient = Color3.fromRGB(100,100,100),
			OutdoorAmbient = Color3.fromRGB(128,128,128),
		}):Play()
	end
end, "sunset")

createSection(pages.World, "⏩  Time", 9)

createNumberInput(pages.World, "☀  Time of Day", 14, 10, function(val)
	Lighting.ClockTime = val
end)

createSlider(pages.World, "⏩  Time Speed (x)", 0, 5, 0, 11, function(val)
	RunService:UnbindFromRenderStep("AdminTimeSpeed")
	if val > 0 then
		RunService:BindToRenderStep("AdminTimeSpeed", 1, function(dt)
			Lighting.ClockTime = (Lighting.ClockTime + dt * val) % 24
		end)
	end
end)

createSection(pages.World, "⚙  Physics", 11)

createNumberInput(pages.World, "🌍  Gravity", 196, 12, function(val)
	workspace.Gravity = val
end)
createBtn(pages.World, "↩  Reset Gravity", currentTheme.Button, 13, function()
	workspace.Gravity = 196
end)

createSection(pages.World, "🖥  Performance", 13)

createBtn(pages.World, "🔓  Unlock FPS", currentTheme.Button, 14, function()
	if setfpscap then RunService:BindToRenderStep("FPSUnlock",1,function() setfpscap(0) end) end
end)
createBtn(pages.World, "🔒  Reset FPS (60)", currentTheme.Button, 15, function()
	RunService:UnbindFromRenderStep("FPSUnlock")
	if setfpscap then setfpscap(60) end
end)

-- ================================================

-- ================================================

-- Size stored to avoid the AbsoluteSize+tween bug
local menuW, menuH = 380, 500

local function applyMenuSize(w, h)
	menuW, menuH = w, h
	main.Size = UDim2.new(0, menuW, 0, menuH)
end

-- Central function of theme application
local function applyTheme(t)
	currentTheme = t
	main.BackgroundColor3 = t.BG
	stroke.Color = t.Accent
	header.BackgroundColor3 = t.Panel
	headerFix.BackgroundColor3 = t.Panel
	title.TextColor3 = t.Text
	subtitle.TextColor3 = t.SubText
	tabBar.BackgroundColor3 = t.Tab
	for name, btn in pairs(tabBtns) do
		btn.BackgroundColor3 = (name == activeTab) and t.TabActive or t.Tab
		btn.TextColor3 = (name == activeTab) and Color3.new(1,1,1) or t.SubText
	end
end

createSection(pages.Settings, "🎨  Theme", 0)
createBtn(pages.Settings, "🌑  Dark",  currentTheme.Button, 1, function() applyTheme(Themes.Dark)  end)
createBtn(pages.Settings, "🌕  Light", currentTheme.Button, 2, function() applyTheme(Themes.Light) end)
createBtn(pages.Settings, "💠  Cyber", currentTheme.Button, 3, function() applyTheme(Themes.Cyber) end)
createBtn(pages.Settings, "🔴  Red",   currentTheme.Button, 4, function() applyTheme(Themes.Rouge) end)
createBtn(pages.Settings, "🟢  Green", currentTheme.Button, 5, function() applyTheme(Themes.Vert)  end)

createSection(pages.Settings, "📐  Menu Size", 6)
createBtn(pages.Settings, "➕  Enlarge (+40)",      currentTheme.Button, 7,  function() applyMenuSize(menuW + 40, menuH + 40) end)
createBtn(pages.Settings, "➖  Reduce (-40)",       currentTheme.Button, 8,  function() applyMenuSize(math.max(280, menuW - 40), math.max(380, menuH - 40)) end)
createBtn(pages.Settings, "➡  +Width Only",        currentTheme.Button, 9,  function() applyMenuSize(menuW + 40, menuH) end)
createBtn(pages.Settings, "⬅  -Width Only",        currentTheme.Button, 10, function() applyMenuSize(math.max(280, menuW - 40), menuH) end)
createBtn(pages.Settings, "⬆  +Height Only",       currentTheme.Button, 11, function() applyMenuSize(menuW, menuH + 40) end)
createBtn(pages.Settings, "⬇  -Height Only",       currentTheme.Button, 12, function() applyMenuSize(menuW, math.max(380, menuH - 40)) end)
createBtn(pages.Settings, "↩  Reset Size",          currentTheme.Button, 13, function() applyMenuSize(380, 500) end)

createSlider(pages.Settings, "🔲  Menu Opacity", 20, 100, 100, 14, function(val)
	main.BackgroundTransparency = 1 - (val / 100)
end)
createBtn(pages.Settings, "🏠  Recenter Menu", currentTheme.Button, 15, function()
	main.Position = UDim2.new(0.5, -menuW/2, 0.5, -menuH/2)
end)

createSection(pages.Settings, "💾  Configuration", 16)

-- Save/load via writefile/readfile (Roblox executors)
local CONFIG_FILE = "AdminMenu_config.json"

local function getConfig()
	local toggles = {}
	for k, v in pairs(toggleStates) do toggles[k] = v end
	return {
		theme     = (function()
			for name, t in pairs(Themes) do if t == currentTheme then return name end end
			return "Dark"
		end)(),
		menuW     = menuW,
		menuH     = menuH,
		aimKey    = aimKey,
		aimMode   = aimMode,
		flySpeed  = flySpeed,
		walkSpeed = savedWalkSpeed,
		jumpPower = savedJumpPower,
		toggles   = toggles,
	}
end

local function applyConfig(cfg)
	if cfg.theme and Themes[cfg.theme] then applyTheme(Themes[cfg.theme]) end
	if cfg.menuW and cfg.menuH then applyMenuSize(cfg.menuW, cfg.menuH) end
	if cfg.aimKey   then aimKey   = cfg.aimKey   end
	if cfg.aimMode  then aimMode  = cfg.aimMode  end
	if cfg.flySpeed then flySpeed = cfg.flySpeed end
	if cfg.walkSpeed then savedWalkSpeed = cfg.walkSpeed; applyMovement(player.Character) end
	if cfg.jumpPower then savedJumpPower = cfg.jumpPower; applyMovement(player.Character) end
	if cfg.toggles then
		for k, v in pairs(cfg.toggles) do
			toggleStates[k] = v
		end
		-- Re-trigger toggles for visual update after config load
		for k, v in pairs(cfg.toggles) do
			if toggleApply[k] then
				task.spawn(function() toggleApply[k](v) end)
			end
		end
	end
	updateAimStatus()
end

local function saveConfig()
	if not writefile then
		showNotification("❌  writefile not available", 3); return
	end
	local ok, err = pcall(function()
		local data = game:GetService("HttpService"):JSONEncode(getConfig())
		writefile(CONFIG_FILE, data)
	end)
	if ok then
		showNotification("✅  Config saved!", 3)
	else
		showNotification("❌  Save error: " .. tostring(err), 4)
	end
end

local function loadConfig()
	if not readfile then
		showNotification("❌  readfile not available", 3); return
	end
	local ok, result = pcall(function()
		local raw = readfile(CONFIG_FILE)
		return game:GetService("HttpService"):JSONDecode(raw)
	end)
	if ok and result then
		applyConfig(result)
		showNotification("✅  Config loaded!", 3)
	else
		showNotification("❌  No config found", 3)
	end
end

createBtn(pages.Settings, "💾  Save Config",  currentTheme.Success, 17, saveConfig)
createBtn(pages.Settings, "📂  Load Config",  currentTheme.Button,  18, loadConfig)
createBtn(pages.Settings, "🗑  Reset Config", currentTheme.Danger,  19, function()
	applyTheme(Themes.Dark)
	applyMenuSize(380, 500)
	aimKey = "Mouse2"; aimMode = "hold"; flySpeed = 40
	savedWalkSpeed = 16; savedJumpPower = 50
	applyMovement(player.Character)
	updateAimStatus()
	showNotification("↩  Config reset", 2)
end)

-- ================================================

-- ================================================
local function showNotification(message, duration)
	duration = duration or 4

	-- Toast container
	local toastGui = Instance.new("ScreenGui", playerGui)
	toastGui.Name = "AdminToast"
	toastGui.ResetOnSpawn = false
	toastGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local toast = Instance.new("Frame", toastGui)
	toast.Size = UDim2.new(0, 280, 0, 54)
	toast.Position = UDim2.new(1, 10, 1, -80)
	toast.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
	toast.BorderSizePixel = 0
	toast.AnchorPoint = Vector2.new(1, 1)
	Instance.new("UICorner", toast).CornerRadius = UDim.new(0, 12)

	-- Accented border
	local toastStroke = Instance.new("UIStroke", toast)
	toastStroke.Color = Color3.fromRGB(100, 80, 255)
	toastStroke.Thickness = 1.5
	toastStroke.Transparency = 0.3

	-- Colorful icon on the left
	local icon = Instance.new("Frame", toast)
	icon.Size = UDim2.new(0, 4, 1, -16)
	icon.Position = UDim2.new(0, 8, 0.5, 0)
	icon.AnchorPoint = Vector2.new(0, 0.5)
	icon.BackgroundColor3 = Color3.fromRGB(100, 80, 255)
	icon.BorderSizePixel = 0
	Instance.new("UICorner", icon).CornerRadius = UDim.new(1, 0)

	-- Text
	local toastLabel = Instance.new("TextLabel", toast)
	toastLabel.Text = message
	toastLabel.Size = UDim2.new(1, -26, 1, 0)
	toastLabel.Position = UDim2.new(0, 22, 0, 0)
	toastLabel.BackgroundTransparency = 1
	toastLabel.TextColor3 = Color3.fromRGB(220, 220, 240)
	toastLabel.Font = Enum.Font.GothamSemibold
	toastLabel.TextSize = 13
	toastLabel.TextXAlignment = Enum.TextXAlignment.Left
	toastLabel.TextWrapped = true
	toastLabel.RichText = true

	-- Slide-in from the right
	TweenService:Create(toast, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Position = UDim2.new(1, -16, 1, -80)
	}):Play()

	-- Progress bar
	local progress = Instance.new("Frame", toast)
	progress.Size = UDim2.new(1, 0, 0, 3)
	progress.Position = UDim2.new(0, 0, 1, -3)
	progress.BackgroundColor3 = Color3.fromRGB(100, 80, 255)
	progress.BorderSizePixel = 0
	local progressCorner = Instance.new("UICorner", progress)
	progressCorner.CornerRadius = UDim.new(0, 12)

	TweenService:Create(progress, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
		Size = UDim2.new(0, 0, 0, 3)
	}):Play()

	-- Wait, then slide out and destroy
	task.delay(duration, function()
		TweenService:Create(toast, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			Position = UDim2.new(1, 10, 1, -80)
		}):Play()
		task.wait(0.35)
		toastGui:Destroy()
	end)
end

-- Displays the notification on launch
showNotification("👉𝐁 Press <b>[B]</b> to open the menu", 5)

-- ================================================
-- ================================================
local function openMenu()
	gui.Enabled = true
	glassBg.Visible = true
	main.Size = UDim2.new(0, menuW, 0, 0)
	main.BackgroundTransparency = 0.3
	TweenService:Create(main, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, menuW, 0, menuH),
		BackgroundTransparency = 0
	}):Play()
	TweenService:Create(glassBg, TweenInfo.new(0.25), {BackgroundTransparency = 0.55}):Play()
end

local function closeMenu()
	TweenService:Create(main, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
		Size = UDim2.new(0, menuW, 0, 0),
		BackgroundTransparency = 0.3
	}):Play()
	TweenService:Create(glassBg, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
	task.wait(0.15)
	gui.Enabled = false
	main.Size = UDim2.new(0, menuW, 0, menuH)
	main.BackgroundTransparency = 0
	glassBg.Visible = false
	glassBg.BackgroundTransparency = 1
end

closeBtn.MouseButton1Click:Connect(function()
	closeMenu()
end)

UIS.InputBegan:Connect(function(input, gpe)
	if not gpe and input.KeyCode == Enum.KeyCode.B then
		if gui.Enabled then closeMenu() else openMenu() end
	end
end)

-- ================================================
-- ================================================
local nukeEnabled = false
local nukeConn = nil

local function spawnExplosionFX(pos)
	-- Central fireball
	local ball = Instance.new("Part", workspace)
	ball.Shape = Enum.PartType.Ball
	ball.Size = Vector3.new(2,2,2)
	ball.CFrame = CFrame.new(pos)
	ball.Color = Color3.fromRGB(255, 120, 10)
	ball.Material = Enum.Material.Neon
	ball.Anchored = true; ball.CanCollide = false
	TweenService:Create(ball, TweenInfo.new(0.6, Enum.EasingStyle.Quad), {
		Size = Vector3.new(35,35,35), Transparency = 1
	}):Play()
	Debris:AddItem(ball, 0.65)

	-- Shockwave ring
	local ring = Instance.new("Part", workspace)
	ring.Size = Vector3.new(2, 0.5, 2)
	ring.CFrame = CFrame.new(pos)
	ring.Color = Color3.fromRGB(255, 220, 80)
	ring.Material = Enum.Material.Neon
	ring.Anchored = true; ring.CanCollide = false
	ring.Shape = Enum.PartType.Cylinder
	TweenService:Create(ring, TweenInfo.new(0.7, Enum.EasingStyle.Quad), {
		Size = Vector3.new(0.3, 60, 60), Transparency = 1
	}):Play()
	Debris:AddItem(ring, 0.75)

	-- Black smoke
	for i = 1, 8 do
		local smoke = Instance.new("Part", workspace)
		smoke.Shape = Enum.PartType.Ball
		smoke.Size = Vector3.new(1,1,1)
		smoke.CFrame = CFrame.new(pos + Vector3.new(math.random(-3,3), math.random(0,2), math.random(-3,3)))
		smoke.Color = Color3.fromRGB(30, 30, 30)
		smoke.Material = Enum.Material.SmoothPlastic
		smoke.Anchored = true; smoke.CanCollide = false
		TweenService:Create(smoke, TweenInfo.new(1.5, Enum.EasingStyle.Quad), {
			Size = Vector3.new(math.random(8,18), math.random(8,18), math.random(8,18)),
			Transparency = 1,
			CFrame = smoke.CFrame * CFrame.new(0, math.random(5,15), 0)
		}):Play()
		Debris:AddItem(smoke, 1.6)
	end

	-- His explosion
	local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if hrp then
		local boom = Instance.new("Sound", hrp)
		boom.SoundId = "rbxassetid://84792688181059"
		boom.Volume = 1.5; boom.RollOffMaxDistance = 300
		boom:Play(); Debris:AddItem(boom, 3)
	end
end

local function startNuke()
	local char = player.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum then hum:ChangeState(Enum.HumanoidStateType.Physics) end

	-- LinearVelocity (more powerful than BodyVelocity on modern Roblox)
	local att = Instance.new("Attachment", hrp)
	att.Name = "NukeAtt"
	local lv = Instance.new("LinearVelocity", hrp)
	lv.Name = "NukeBV"
	lv.Attachment0 = att
	lv.VectorVelocity = Vector3.new(0, 150, 0)
	lv.MaxForce = math.huge

	-- Rocket sounds (2 layers for a more powerful effect)
	local snd = Instance.new("Sound", hrp)
	snd.Name = "NukeSound"
	snd.SoundId = "rbxassetid://84792688181059"
	snd.Volume = 1.2; snd.Looped = true; snd:Play()

	local sndBoost = Instance.new("Sound", hrp)
	sndBoost.Name = "NukeBoost"
	sndBoost.SoundId = "rbxassetid://84792688181059"
	sndBoost.Volume = 0.7; sndBoost.Looped = true; sndBoost:Play()

	-- Trail of fire
	nukeConn = RunService.Heartbeat:Connect(function()
		local c = player.Character
		if not c then return end
		local h = c:FindFirstChild("HumanoidRootPart")
		if not h then return end
		local flame = Instance.new("Part", workspace)
		flame.Shape = Enum.PartType.Ball
		flame.Size = Vector3.new(math.random(1,3), math.random(1,3), math.random(1,3))
		flame.CFrame = h.CFrame * CFrame.new((math.random()-0.5)*2, -3, (math.random()-0.5)*2)
		flame.Color = math.random() > 0.4
			and Color3.fromRGB(255, math.random(80,160), 10)
			or  Color3.fromRGB(255, 220, 50)
		flame.Material = Enum.Material.Neon
		flame.Anchored = true; flame.CanCollide = false
		TweenService:Create(flame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
			Size = Vector3.new(6,6,6), Transparency = 1,
			CFrame = flame.CFrame * CFrame.new(0,-4,0)
		}):Play()
		Debris:AddItem(flame, 0.35)
	end)
end

local function stopNuke()
	if nukeConn then nukeConn:Disconnect(); nukeConn = nil end
	local char = player.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if hrp then
		local bv  = hrp:FindFirstChild("NukeBV");  if bv  then bv:Destroy()  end
		local att = hrp:FindFirstChild("NukeAtt"); if att then att:Destroy() end
		local snd = hrp:FindFirstChild("NukeSound"); if snd then snd:Destroy() end
		local sndB = hrp:FindFirstChild("NukeBoost"); if sndB then sndB:Destroy() end
	end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum then hum:ChangeState(Enum.HumanoidStateType.Freefall) end
	-- Explosion at the point of impact upon landing
	task.spawn(function()
		task.wait(1.2)
		if char and hrp then
			spawnExplosionFX(hrp.Position)
		end
	end)
end

-- Toggle Nuke on the Personal page
createSection(pages.Personal, "💥  Chaos & Fun", 200)
createToggle(pages.Personal, "🚀  NUKE MODE  (propulsion + explosion)", 201, function(state)
	nukeEnabled = state
	if state then startNuke() else stopNuke() end
end, "nukeMode")
createBtn(pages.Personal, "💣  Explode in Place", currentTheme.Danger, 202, function()
	local char = player.Character
	local hrp  = char and char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	-- Immediate explosion sound (2 layers: impact + bass)
	local boom1 = Instance.new("Sound", hrp)
	boom1.SoundId = "rbxassetid://84792688181059"; boom1.Volume = 1.5
	boom1.RollOffMaxDistance = 300; boom1:Play()
	Debris:AddItem(boom1, 4)

	local boom2 = Instance.new("Sound", hrp)
	boom2.SoundId = "rbxassetid://3716468774"; boom2.Volume = 1.0
	boom2.RollOffMaxDistance = 200; boom2:Play()
	Debris:AddItem(boom2, 3)

	spawnExplosionFX(hrp.Position)

	-- Kill the character (via Humanoid)
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum then
		task.delay(0.1, function()
			hum.Health = 0
		end)
	end
end)
createBtn(pages.Personal, "🔄  Reset Character", currentTheme.Button, 203, function()
	if player.Character then
		local hum = player.Character:FindFirstChildOfClass("Humanoid")
		if hum then hum.Health = 0 end
	end
end)

-- ================================================
-- ================================================
local espState = {
	boxes     = false,
	names     = false,
	health    = false,
	distance  = false,
	tracers   = false,
	snaplines = false,
	headDots  = false,
	skeletons = false,
	chams     = false,
	healthBar = false,
	bots      = false,
}
local espObjects    = {}
local espBotObjects = {}

local ESP_COLOR_ALLY  = Color3.fromRGB(50, 200, 100)
local ESP_COLOR_ENEMY = Color3.fromRGB(255, 40, 50)
local ESP_COLOR_BOT   = Color3.fromRGB(255, 200, 0)

-- Distance max ESP (0 = infini)
local ESP_MAX_DIST_PLAYER = 0
local ESP_MAX_DIST_BOT    = 0

-- Nettoie ESP d'un joueur
local function clearESPFor(p)
	if espObjects[p] then
		for _, obj in ipairs(espObjects[p]) do
			pcall(function() if obj and obj.Parent then obj:Destroy() end end)
		end
		espObjects[p] = nil
	end
end

-- Nettoie tous les ESP bots
local function clearAllBotESP()
	for model, objs in pairs(espBotObjects) do
		for _, obj in ipairs(objs) do
			pcall(function() if obj and obj.Parent then obj:Destroy() end end)
		end
	end
	espBotObjects = {}
end

-- Détecte si un Model est un NPC/Bot (Humanoid mais pas un joueur)
local function isBot(model)
	if not model:IsA("Model") then return false end
	local hum = model:FindFirstChildOfClass("Humanoid")
	if not hum then return false end
	local hrp = model:FindFirstChild("HumanoidRootPart")
	if not hrp then return false end
	-- Vérifie que ce n'est pas un vrai joueur
	for _, p in ipairs(Players:GetPlayers()) do
		if p.Character == model then return false end
	end
	return true
end

-- Construit l'ESP sur un bot/NPC
local function buildESPBot(model)
	if espBotObjects[model] then return end
	local hum = model:FindFirstChildOfClass("Humanoid")
	local hrp = model:FindFirstChild("HumanoidRootPart")
	local head = model:FindFirstChild("Head")
	if not hrp then return end

	local color = ESP_COLOR_BOT
	local objs  = {}

	-- Chams
	local old = model:FindFirstChild("ESP_BotHL")
	if old then old:Destroy() end
	local hl = Instance.new("Highlight", model)
	hl.Name = "ESP_BotHL"
	hl.FillColor = color
	hl.OutlineColor = color
	hl.FillTransparency = 0.7
	hl.OutlineTransparency = 0
	hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	table.insert(objs, hl)

	-- Nom du bot
	local bb = mkBB(hrp, "ESP_BotName", 120, 18, 3.4)
	local lbl = mkLbl(bb, "[BOT] " .. model.Name, 10, color)
	table.insert(objs, bb)

	-- Barre de vie
	if hum then
		local bb2 = mkBB(hrp, "ESP_BotBar", 5, 54, 0)
		bb2.StudsOffset = Vector3.new(-1.3, 0, 0)
		local bg = Instance.new("Frame", bb2)
		bg.Size = UDim2.new(1,0,1,0)
		bg.BackgroundColor3 = Color3.fromRGB(20,20,20)
		bg.BackgroundTransparency = 0.15
		bg.BorderSizePixel = 0
		Instance.new("UICorner", bg).CornerRadius = UDim.new(1,0)
		local fill = Instance.new("Frame", bg)
		fill.AnchorPoint = Vector2.new(0,1)
		fill.Position = UDim2.new(0,0,1,0)
		local p0 = math.clamp(hum.Health / math.max(hum.MaxHealth,1), 0, 1)
		fill.Size = UDim2.new(1,0,p0,0)
		fill.BackgroundColor3 = Color3.fromRGB(math.floor(255*(1-p0)), math.floor(220*p0+35), 40)
		fill.BorderSizePixel = 0
		Instance.new("UICorner", fill).CornerRadius = UDim.new(1,0)
		hum.HealthChanged:Connect(function(h)
			if not espState.bots then return end
			local pct = math.clamp(h / math.max(hum.MaxHealth,1), 0, 1)
			fill.Size = UDim2.new(1,0,pct,0)
			fill.BackgroundColor3 = Color3.fromRGB(math.floor(255*(1-pct)), math.floor(220*pct+35), 40)
		end)
		table.insert(objs, bb2)
	end

	espBotObjects[model] = objs

	-- Nettoie si le bot est détruit
	model.AncestryChanged:Connect(function()
		if not model.Parent then
			for _, obj in ipairs(espBotObjects[model] or {}) do
				pcall(function() if obj and obj.Parent then obj:Destroy() end end)
			end
			espBotObjects[model] = nil
		end
	end)
end

-- Scan tous les NPC dans workspace
local function refreshBotESP()
	clearAllBotESP()
	if not espState.bots then return end
	for _, model in ipairs(workspace:GetDescendants()) do
		if isBot(model) then
			pcall(function() buildESPBot(model) end)
		end
	end
end

-- BillboardGui : distance infinie (MaxDistance = 0 = illimitée dans Roblox)
local function mkBB(parent, name, w, h, offsetY)
	local bb = Instance.new("BillboardGui", parent)
	bb.Name          = name
	bb.AlwaysOnTop   = true
	bb.Size          = UDim2.new(0, w, 0, h)
	bb.StudsOffset   = Vector3.new(0, offsetY, 0)
	bb.MaxDistance   = 0        -- 0 = distance infinie
	bb.LightInfluence = 0
	bb.ResetOnSpawn  = false
	return bb
end

-- Label helper
local function mkLbl(parent, txt, size, color)
	local l = Instance.new("TextLabel", parent)
	l.Size                  = UDim2.new(1,0,1,0)
	l.BackgroundTransparency = 1
	l.Text                  = txt
	l.TextColor3            = color or Color3.new(1,1,1)
	l.Font                  = Enum.Font.GothamBold
	l.TextSize              = size or 10
	l.TextStrokeTransparency = 0.1
	l.TextStrokeColor3      = Color3.new(0,0,0)
	l.TextScaled            = false
	return l
end

local function buildESPFor(p)
	clearESPFor(p)
	if p == player then return end
	local char = p.Character
	if not char then return end

	local hum  = char:FindFirstChildOfClass("Humanoid")
	local hrp  = char:FindFirstChild("HumanoidRootPart")
	local head = char:FindFirstChild("Head")
	if not hrp then return end

	local isAlly = (player.Team ~= nil) and (p.Team == player.Team)
	local color  = isAlly and ESP_COLOR_ALLY or ESP_COLOR_ENEMY
	local objs   = {}

	-- CHAMS (Highlight natif Roblox) renforcé
	if espState.chams then
		local old = char:FindFirstChild("ESP_Highlight")
		if old then old:Destroy() end
		local hl = Instance.new("Highlight", char)
		hl.Name              = "ESP_Highlight"
		hl.FillColor         = color
		hl.OutlineColor      = Color3.new(1,1,1)
		hl.FillTransparency  = 0.55
		hl.OutlineTransparency = 0.2
		hl.DepthMode         = Enum.HighlightDepthMode.AlwaysOnTop
		-- Double highlight pour effet glow
		local hl2 = Instance.new("Highlight", char)
		hl2.Name             = "ESP_Highlight2"
		hl2.FillColor        = color
		hl2.OutlineColor     = color
		hl2.FillTransparency = 1
		hl2.OutlineTransparency = 0.35
		hl2.DepthMode        = Enum.HighlightDepthMode.AlwaysOnTop
		table.insert(objs, hl)
		table.insert(objs, hl2)
	end

	-- BOX ESP : cadre complet ultra-visible avec contour lumineux
	if espState.boxes then
		local bb = mkBB(hrp, "ESP_Box", 62, 92, 0)
		bb.StudsOffset = Vector3.new(0, 0.3, 0)
		bb.AlwaysOnTop = true

		-- Fond semi-transparent
		local bg = Instance.new("Frame", bb)
		bg.Size = UDim2.new(1,0,1,0)
		bg.BackgroundColor3 = color
		bg.BackgroundTransparency = 0.82
		bg.BorderSizePixel = 0

		-- Contour lumineux (double stroke pour effet glow)
		local stroke1 = Instance.new("UIStroke", bg)
		stroke1.Color = color
		stroke1.Thickness = 2
		stroke1.Transparency = 0.1

		local stroke2 = Instance.new("UIStroke", bg)
		stroke2.Color = Color3.new(1,1,1)
		stroke2.Thickness = 1
		stroke2.Transparency = 0.6
		stroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

		-- Coins décoratifs (L-shapes) renforcés
		local CORNER = 14
		local THICK  = 3
		local corners = {
			{x=0, y=0, w=CORNER, h=THICK},
			{x=0, y=0, w=THICK,  h=CORNER},
			{x=1, y=0, ox=-CORNER, w=CORNER, h=THICK},
			{x=1, y=0, ox=-THICK,  w=THICK,  h=CORNER},
			{x=0, y=1, oy=-THICK,  w=CORNER, h=THICK},
			{x=0, y=1, oy=-CORNER, w=THICK,  h=CORNER},
			{x=1, y=1, ox=-CORNER, oy=-THICK,  w=CORNER, h=THICK},
			{x=1, y=1, ox=-THICK,  oy=-CORNER, w=THICK,  h=CORNER},
		}
		for _, c in ipairs(corners) do
			local f = Instance.new("Frame", bb)
			f.BorderSizePixel = 0
			f.BackgroundColor3 = color
			f.AnchorPoint = Vector2.new(c.x or 0, c.y or 0)
			f.Position = UDim2.new(c.x or 0, c.ox or 0, c.y or 0, c.oy or 0)
			f.Size = UDim2.new(0, c.w, 0, c.h)
			local sh = Instance.new("UIStroke", f)
			sh.Color = Color3.new(0,0,0)
			sh.Thickness = 1.5
			sh.Transparency = 0.3
		end

		table.insert(objs, bb)
	end

	-- HEAD DOT
	if espState.headDots and head then
		local bb = mkBB(head, "ESP_HeadDot", 12, 12, 0.5)
		local dot = Instance.new("Frame", bb)
		dot.Size            = UDim2.new(1,0,1,0)
		dot.BackgroundColor3 = color
		dot.BorderSizePixel = 0
		Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)
		local st = Instance.new("UIStroke", dot)
		st.Color = Color3.new(1,1,1); st.Thickness = 1.2
		table.insert(objs, bb)
	end

	-- NOMS
	if espState.names then
		local bb  = mkBB(hrp, "ESP_Name", 120, 18, 3.4)
		local lbl = mkLbl(bb, (isAlly and "[A] " or "[E] ") .. p.Name, 10, color)
		lbl.Text = (isAlly and "[A] " or "[E] ") .. p.Name
		table.insert(objs, bb)
	end

	-- HEALTH texte
	if espState.health and hum then
		local bb  = mkBB(hrp, "ESP_HP", 90, 13, 2.7)
		local lbl = mkLbl(bb, math.floor(hum.Health) .. " hp", 9,
			Color3.fromRGB(80 + math.floor(175*(1 - hum.Health/math.max(hum.MaxHealth,1))),
			200 - math.floor(150*(1 - hum.Health/math.max(hum.MaxHealth,1))), 50))
		hum.HealthChanged:Connect(function(h)
			if not espState.health then return end
			local pct = math.clamp(h / math.max(hum.MaxHealth,1), 0, 1)
			lbl.Text       = math.floor(h) .. " hp"
			lbl.TextColor3 = Color3.fromRGB(80+math.floor(175*(1-pct)), 200-math.floor(150*(1-pct)), 50)
		end)
		table.insert(objs, bb)
	end

	-- BARRE DE VIE verticale
	if espState.healthBar and hum then
		local bb = mkBB(hrp, "ESP_Bar", 5, 54, 0)
		bb.StudsOffset = Vector3.new(-1.3, 0, 0)
		local bg = Instance.new("Frame", bb)
		bg.Size                  = UDim2.new(1,0,1,0)
		bg.BackgroundColor3      = Color3.fromRGB(20,20,20)
		bg.BackgroundTransparency = 0.15
		bg.BorderSizePixel       = 0
		Instance.new("UICorner", bg).CornerRadius = UDim.new(1,0)
		local fill = Instance.new("Frame", bg)
		fill.AnchorPoint = Vector2.new(0,1)
		fill.Position    = UDim2.new(0,0,1,0)
		local p0 = math.clamp(hum.Health / math.max(hum.MaxHealth,1), 0, 1)
		fill.Size             = UDim2.new(1,0,p0,0)
		fill.BackgroundColor3 = Color3.fromRGB(math.floor(255*(1-p0)), math.floor(220*p0+35), 40)
		fill.BorderSizePixel  = 0
		Instance.new("UICorner", fill).CornerRadius = UDim.new(1,0)
		hum.HealthChanged:Connect(function(h)
			if not espState.healthBar then return end
			local pct = math.clamp(h / math.max(hum.MaxHealth,1), 0, 1)
			fill.Size             = UDim2.new(1,0,pct,0)
			fill.BackgroundColor3 = Color3.fromRGB(math.floor(255*(1-pct)), math.floor(220*pct+35), 40)
		end)
		table.insert(objs, bb)
	end

	-- DISTANCE
	if espState.distance then
		local bb = mkBB(hrp, "ESP_Dist", 70, 12, 2.1)
		mkLbl(bb, "?m", 9, Color3.fromRGB(180,180,255))
		table.insert(objs, bb)
	end

	-- TRACER (triangle pointant vers le joueur, toujours visible)
	if espState.tracers then
		local bb = mkBB(hrp, "ESP_Tracer", 20, 20, -3)
		local lbl = Instance.new("TextLabel", bb)
		lbl.Size = UDim2.new(1,0,1,0)
		lbl.BackgroundTransparency = 1
		lbl.Text = "▼"
		lbl.TextColor3 = color
		lbl.Font = Enum.Font.GothamBold
		lbl.TextSize = 18
		lbl.TextStrokeTransparency = 0
		lbl.TextStrokeColor3 = Color3.new(0,0,0)
		local glow = Instance.new("UIStroke", lbl)
		glow.Color = color; glow.Thickness = 2; glow.Transparency = 0.3
		table.insert(objs, bb)
	end

	-- SNAPLINE (ligne verticale du haut vers le bas sur le joueur)
	if espState.snaplines then
		local bbTop = mkBB(hrp, "ESP_Snap", 20, 20, 4.5)
		local lblT = Instance.new("TextLabel", bbTop)
		lblT.Size = UDim2.new(1,0,1,0)
		lblT.BackgroundTransparency = 1
		lblT.Text = "▲"
		lblT.TextColor3 = color
		lblT.Font = Enum.Font.GothamBold
		lblT.TextSize = 18
		lblT.TextStrokeTransparency = 0
		lblT.TextStrokeColor3 = Color3.new(0,0,0)
		local glow2 = Instance.new("UIStroke", lblT)
		glow2.Color = color; glow2.Thickness = 2; glow2.Transparency = 0.3
		local bbLine = mkBB(hrp, "ESP_SnapLine", 4, 90, 0)
		local lineF = Instance.new("Frame", bbLine)
		lineF.Size = UDim2.new(1,0,1,0)
		lineF.BackgroundColor3 = color
		lineF.BorderSizePixel = 0
		lineF.BackgroundTransparency = 0.1
		local lineGlow = Instance.new("UIStroke", lineF)
		lineGlow.Color = color; lineGlow.Thickness = 2; lineGlow.Transparency = 0.4
		table.insert(objs, bbTop)
		table.insert(objs, bbLine)
	end

	-- SQUELETTE via BillboardGui sur chaque part (100% fiable partout)
	if espState.skeletons then
		local PARTS_R15 = {
			"Head","UpperTorso","LowerTorso",
			"RightUpperArm","RightLowerArm","RightHand",
			"LeftUpperArm","LeftLowerArm","LeftHand",
			"RightUpperLeg","RightLowerLeg","RightFoot",
			"LeftUpperLeg","LeftLowerLeg","LeftFoot",
		}
		local PARTS_R6 = {"Head","Torso","Left Arm","Right Arm","Left Leg","Right Leg"}
		local isR15 = char:FindFirstChild("UpperTorso") ~= nil
		local partNames = isR15 and PARTS_R15 or PARTS_R6

		for _, pname in ipairs(partNames) do
			local part = char:FindFirstChild(pname)
			if part then
				local bb = mkBB(part, "ESP_Skel", 10, 10, 0)
				local dot = Instance.new("Frame", bb)
				dot.Size = UDim2.new(1,0,1,0)
				dot.BackgroundColor3 = color
				dot.BorderSizePixel = 0
				local st = Instance.new("UIStroke", dot)
				st.Color = Color3.new(0,0,0)
				st.Thickness = 1
				Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)
				table.insert(objs, bb)
			end
		end

		-- Lignes entre les parts via Highlight coloré léger
		local hl2 = Instance.new("Highlight", char)
		hl2.Name = "ESP_SkelHL"
		hl2.FillTransparency = 1
		hl2.OutlineColor = color
		hl2.OutlineTransparency = 0.4
		hl2.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		table.insert(objs, hl2)
	end

	espObjects[p] = objs
end

-- Updates distance + visibility based on max distance (runs every frame via RenderStepped)
local function updateDistances()
	local myHRP = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if not myHRP then return end

	-- Joueurs
	for p, objs in pairs(espObjects) do
		if p.Character then
			local hrp = p.Character:FindFirstChild("HumanoidRootPart")
			if hrp then
				local dist = math.floor((hrp.Position - myHRP.Position).Magnitude)
				local visible = (ESP_MAX_DIST_PLAYER == 0) or (dist <= ESP_MAX_DIST_PLAYER)
				for _, obj in ipairs(objs) do
					if obj:IsA("BillboardGui") then
						obj.Enabled = visible
						if obj.Name == "ESP_Dist" then
							local lbl = obj:FindFirstChildOfClass("TextLabel")
							if lbl then lbl.Text = dist .. "m" end
						end
					elseif obj:IsA("Highlight") then
						obj.Enabled = visible
					end
				end
			end
		end
	end

	-- Bots
	for model, objs in pairs(espBotObjects) do
		if model and model.Parent then
			local hrp = model:FindFirstChild("HumanoidRootPart")
			if hrp then
				local dist = math.floor((hrp.Position - myHRP.Position).Magnitude)
				local visible = (ESP_MAX_DIST_BOT == 0) or (dist <= ESP_MAX_DIST_BOT)
				for _, obj in ipairs(objs) do
					if obj:IsA("BillboardGui") then
						obj.Enabled = visible
					elseif obj:IsA("Highlight") then
						obj.Enabled = visible
					end
				end
			end
		end
	end
end

-- Rebuilds the entire ESP when a state changes
local function refreshAllESP()
	for _, p in ipairs(Players:GetPlayers()) do
		buildESPFor(p)
	end
	if espState.bots then refreshBotESP() end
end

-- ================================================

local function toggleESP(key, state)
	espState[key] = state
	refreshAllESP()
end

-- Helper dropdown color ESP
local function createColorDropdown(parent, label, order, defaultColor, onChange)
	local colors = {
		{"Red",    Color3.fromRGB(255,60,60)},
		{"Orange", Color3.fromRGB(255,140,30)},
		{"Yellow", Color3.fromRGB(255,220,50)},
		{"Green",  Color3.fromRGB(50,220,100)},
		{"Cyan",   Color3.fromRGB(0,210,255)},
		{"Blue",   Color3.fromRGB(80,160,255)},
		{"Purple", Color3.fromRGB(180,80,255)},
		{"White",  Color3.fromRGB(240,240,240)},
		{"Pink",   Color3.fromRGB(255,100,180)},
	}
	local selected = defaultColor
	local open = false

	-- Main button
	local headerF = Instance.new("Frame", parent)
	headerF.Size = UDim2.new(1,0,0,34)
	headerF.BackgroundColor3 = currentTheme.Button
	headerF.BorderSizePixel = 0
	headerF.LayoutOrder = order
	Instance.new("UICorner", headerF).CornerRadius = UDim.new(0,8)

	local swatch = Instance.new("Frame", headerF)
	swatch.Size = UDim2.new(0,14,0,14)
	swatch.Position = UDim2.new(0,10,0.5,-7)
	swatch.BackgroundColor3 = selected
	swatch.BorderSizePixel = 0
	Instance.new("UICorner", swatch).CornerRadius = UDim.new(1,0)

	local lbl = Instance.new("TextLabel", headerF)
	lbl.Size = UDim2.new(1,-60,1,0)
	lbl.Position = UDim2.new(0,30,0,0)
	lbl.BackgroundTransparency = 1
	lbl.Text = label
	lbl.TextColor3 = currentTheme.Text
	lbl.Font = Enum.Font.Gotham; lbl.TextSize = 12
	lbl.TextXAlignment = Enum.TextXAlignment.Left

	local arrow = Instance.new("TextLabel", headerF)
	arrow.Size = UDim2.new(0,24,1,0)
	arrow.Position = UDim2.new(1,-28,0,0)
	arrow.BackgroundTransparency = 1
	arrow.Text = "▾"; arrow.TextColor3 = currentTheme.SubText
	arrow.Font = Enum.Font.GothamBold; arrow.TextSize = 13

	-- Drop-down list
	local listF = Instance.new("Frame", parent)
	listF.Size = UDim2.new(1,0,0,0)
	listF.BackgroundColor3 = currentTheme.Panel
	listF.BorderSizePixel = 0
	listF.ClipsDescendants = true
	listF.LayoutOrder = order
	Instance.new("UICorner", listF).CornerRadius = UDim.new(0,8)
	local ll = Instance.new("UIListLayout", listF)
	ll.Padding = UDim.new(0,2)

	for _, pair in ipairs(colors) do
		local cname, cval = pair[1], pair[2]
		local row = Instance.new("TextButton", listF)
		row.Size = UDim2.new(1,0,0,28)
		row.BackgroundTransparency = 1
		row.Text = ""
		row.BorderSizePixel = 0

		local dot = Instance.new("Frame", row)
		dot.Size = UDim2.new(0,12,0,12)
		dot.Position = UDim2.new(0,10,0.5,-6)
		dot.BackgroundColor3 = cval
		dot.BorderSizePixel = 0
		Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)

		local rl = Instance.new("TextLabel", row)
		rl.Size = UDim2.new(1,-30,1,0)
		rl.Position = UDim2.new(0,28,0,0)
		rl.BackgroundTransparency = 1
		rl.Text = cname
		rl.TextColor3 = currentTheme.Text
		rl.Font = Enum.Font.Gotham; rl.TextSize = 11
		rl.TextXAlignment = Enum.TextXAlignment.Left

		row.MouseEnter:Connect(function() playHover(); row.BackgroundTransparency = 0.8 end)
		row.MouseLeave:Connect(function() row.BackgroundTransparency = 1 end)
		row.MouseButton1Click:Connect(function()
			playHover()
			selected = cval
			swatch.BackgroundColor3 = cval
			onChange(cval)
			open = false
			TweenService:Create(listF, TweenInfo.new(0.15), {Size=UDim2.new(1,0,0,0)}):Play()
			task.wait(0.15); listF.Visible = false
		end)
	end

	local headerBtn = Instance.new("TextButton", headerF)
	headerBtn.Size = UDim2.new(1,0,1,0)
	headerBtn.BackgroundTransparency = 1
	headerBtn.Text = ""
	headerBtn.MouseEnter:Connect(playHover)
	headerBtn.MouseButton1Click:Connect(function()
		playHover()
		open = not open
		listF.Visible = true
		local h = open and (#colors * 30 + 4) or 0
		TweenService:Create(listF, TweenInfo.new(0.15), {Size=UDim2.new(1,0,0,h)}):Play()
		if not open then task.wait(0.15); listF.Visible = false end
	end)
end

-- UI ESP in pages.ESP
createSection(pages.ESP, "⚡  Shortcuts", -1)
createBtn(pages.ESP, "⚡  Enable All", currentTheme.Accent, 0, function()
	for k in pairs(espState) do espState[k] = true end
	refreshAllESP()
end)
createBtn(pages.ESP, "❌  Disable All", currentTheme.Danger, 1, function()
	for k in pairs(espState) do espState[k] = false end
	for _, p in ipairs(Players:GetPlayers()) do clearESPFor(p) end
end)
createToggle(pages.ESP, "📦  Boxes", 2, function(s) toggleESP("boxes", s) end, "espBoxes")
createToggle(pages.ESP, "🏷  Names + Team Tag", 3, function(s) toggleESP("names", s) end, "espNames")
createToggle(pages.ESP, "❤  Health (text)", 4, function(s) toggleESP("health", s) end, "espHealth")
createToggle(pages.ESP, "📊  Health Bar", 5, function(s) toggleESP("healthBar", s) end, "espHealthBar")
createToggle(pages.ESP, "📏  Distance", 6, function(s) toggleESP("distance", s) end, "espDistance")

createSection(pages.ESP, "🎨  Advanced Visual", 6)
createToggle(pages.ESP, "🔴  Head Dots", 7, function(s) toggleESP("headDots", s) end, "espHeadDots")
createToggle(pages.ESP, "💀  Skeleton", 8, function(s) toggleESP("skeletons", s) end, "espSkeleton")
createToggle(pages.ESP, "🔆  Chams (Highlight)", 9, function(s) toggleESP("chams", s) end, "espChams")
createToggle(pages.ESP, "🎯  Tracers", 10, function(s) toggleESP("tracers", s) end, "espTracers")
createToggle(pages.ESP, "🔫  Snaplines", 11, function(s) toggleESP("snaplines", s) end, "espSnaplines")

createSection(pages.ESP, "🎨  Colors", 19)
createColorDropdown(pages.ESP, "🔴  Enemy Color", 20,
	Color3.fromRGB(255,60,60),
	function(c) ESP_COLOR_ENEMY = c; refreshAllESP() end
)
createColorDropdown(pages.ESP, "🔵  Ally Color", 21,
	Color3.fromRGB(80,160,255),
	function(c) ESP_COLOR_ALLY = c; refreshAllESP() end
)

createSection(pages.ESP, "🤖  Bots / NPC", 22)
createToggle(pages.ESP, "🤖  ESP Bots & NPC", 23, function(s)
	espState.bots = s
	if s then refreshBotESP() else clearAllBotESP() end
end, "espBots")
createBtn(pages.ESP, "🔄  Scan Bots Now", currentTheme.Button, 24, function()
	if espState.bots then refreshBotESP()
	else showNotification("⚠  Active ESP Bots d'abord", 2) end
end)
createColorDropdown(pages.ESP, "🟡  Bot Color", 25,
	Color3.fromRGB(255,200,0),
	function(c) ESP_COLOR_BOT = c; if espState.bots then refreshBotESP() end end
)

createSection(pages.ESP, "📏  Distance Max", 26)
createSlider(pages.ESP, "👥  Joueurs (0 = infini)", 0, 2000, 0, 27, function(val)
	ESP_MAX_DIST_PLAYER = val
	refreshAllESP()
end)
createSlider(pages.ESP, "🤖  Bots (0 = infini)", 0, 2000, 0, 28, function(val)
	ESP_MAX_DIST_BOT = val
	if espState.bots then refreshBotESP() end
end)
-- ================================================
createSection(pages.Other, "👑  Credits", 0)

local credits = {
	{"👑  Owner","bkz"},
	{"🤝  Contributor","All people use menu thx you !"},
}

for i, entry in ipairs(credits) do
	local row = Instance.new("Frame", pages.Other)
	row.Size = UDim2.new(1, 0, 0, 44)
	row.BackgroundColor3 = currentTheme.Panel
	row.BorderSizePixel = 0
	row.LayoutOrder = i
	Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8)

	local pad = Instance.new("UIPadding", row)
	pad.PaddingLeft = UDim.new(0, 10)

	local role = Instance.new("TextLabel", row)
	role.Size = UDim2.new(1, -10, 0, 18)
	role.Position = UDim2.new(0, 0, 0, 5)
	role.BackgroundTransparency = 1
	role.Text = entry[1]
	role.TextColor3 = currentTheme.Accent
	role.Font = Enum.Font.GothamBold
	role.TextSize = 11
	role.TextXAlignment = Enum.TextXAlignment.Left

	local nameLbl = Instance.new("TextLabel", row)
	nameLbl.Size = UDim2.new(1, -10, 0, 16)
	nameLbl.Position = UDim2.new(0, 0, 0, 22)
	nameLbl.BackgroundTransparency = 1
	nameLbl.Text = entry[2]
	nameLbl.TextColor3 = currentTheme.Text
	nameLbl.Font = Enum.Font.Gotham
	nameLbl.TextSize = 12
	nameLbl.TextXAlignment = Enum.TextXAlignment.Left
	nameLbl.TextWrapped = true
end

createSection(pages.Other, "ℹ  Informations", 98)
local verFrame = Instance.new("Frame", pages.Other)
verFrame.Size = UDim2.new(1, 0, 0, 90)
verFrame.BackgroundColor3 = currentTheme.Panel
verFrame.BorderSizePixel = 0
verFrame.LayoutOrder = 99
Instance.new("UICorner", verFrame).CornerRadius = UDim.new(0, 10)
local verPad = Instance.new("UIPadding", verFrame)
verPad.PaddingLeft = UDim.new(0, 12); verPad.PaddingTop = UDim.new(0, 8)

local verLabel = Instance.new("TextLabel", verFrame)
verLabel.Size = UDim2.new(1, -12, 0, 16)
verLabel.BackgroundTransparency = 1
verLabel.Text = "🌐 bkz HUB  v4.0"
verLabel.TextColor3 = currentTheme.Accent
verLabel.Font = Enum.Font.GothamBold
verLabel.TextSize = 14
verLabel.TextXAlignment = Enum.TextXAlignment.Left

local controlsLabel = Instance.new("TextLabel", verFrame)
controlsLabel.Size = UDim2.new(1, -12, 0, 36)
controlsLabel.Position = UDim2.new(0, 0, 0, 20)
controlsLabel.BackgroundTransparency = 1
controlsLabel.Text = "🎮  [B]  → Open / Close\n🖱  Drag anywhere → Move"
controlsLabel.TextColor3 = currentTheme.Text
controlsLabel.Font = Enum.Font.Gotham
controlsLabel.TextSize = 12
controlsLabel.TextXAlignment = Enum.TextXAlignment.Left
controlsLabel.TextWrapped = true

local featLabel = Instance.new("TextLabel", verFrame)
featLabel.Size = UDim2.new(1, -12, 0, 16)
featLabel.Position = UDim2.new(0, 0, 0, 58)
featLabel.BackgroundTransparency = 1
featLabel.Text = "🔥 Bypass • Force Modes • ESP HD • Son Hover"
featLabel.TextColor3 = currentTheme.SubText
featLabel.Font = Enum.Font.Gotham
featLabel.TextSize = 10
featLabel.TextXAlignment = Enum.TextXAlignment.Left
	-- ESP initialized by startESP() below


-- Start the ESP loop
local function startESP()
	Players.PlayerAdded:Connect(function(p)
		p.CharacterAdded:Connect(function() task.wait(1); buildESPFor(p) end)
	end)
	Players.PlayerRemoving:Connect(function(p) clearESPFor(p) end)

	-- Loop ESP fluide via RenderStepped (remplace task.wait(0.5))
	RunService:BindToRenderStep("ESP_Update", Enum.RenderPriority.Last.Value, function()
		if espState.distance or ESP_MAX_DIST_PLAYER > 0 or ESP_MAX_DIST_BOT > 0 then
			updateDistances()
		end
	end)

	-- Scan bots périodiquement
	task.spawn(function()
		while true do
			task.wait(5)
			if espState.bots then refreshBotESP() end
		end
	end)

	-- Scan nouveaux NPC ajoutés en live
	workspace.DescendantAdded:Connect(function(obj)
		if espState.bots and obj:IsA("Model") then
			task.wait(0.5)
			if isBot(obj) then
				pcall(function() buildESPBot(obj) end)
			end
		end
	end)

	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player then
			p.CharacterAdded:Connect(function() task.wait(1); buildESPFor(p) end)
			buildESPFor(p)
		end
	end
end

startESP()

-- Auto-load config at startup
task.spawn(function()
	task.wait(0.5)
	if readfile then
		local ok2, result = pcall(function()
			return game:GetService("HttpService"):JSONDecode(readfile("AdminMenu_config.json"))
		end)
		if ok2 and result then
			applyConfig(result)
			showNotification("📂 Config loaded automatically!", 3)
		end
	end
end)

end) -- fin du pcall global
if not scrSuccess then
	warn("bkz HUB Error:", scrError)
	-- Still run essential error display
	pcall(function()
		local plr = game:GetService("Players").LocalPlayer
		if plr then
			local gui2 = Instance.new("ScreenGui", plr:WaitForChild("PlayerGui"))
			local lbl = Instance.new("TextLabel", gui2)
			lbl.Size = UDim2.new(1,0,0,50)
			lbl.Position = UDim2.new(0,0,0,100)
			lbl.BackgroundTransparency = 0.5
			lbl.BackgroundColor3 = Color3.new(0,0,0)
			lbl.TextColor3 = Color3.new(1,0,0)
			lbl.Text = "bkz HUB Error: " .. tostring(scrError)
			lbl.Font = Enum.Font.GothamBold
			lbl.TextSize = 16
			lbl.TextWrapped = true
			lbl.ZIndex = 1000
		end
	end)
end
