


local _Instance = Instance
local scrSuccess, scrError = pcall(function()
if not Instance then Instance = _Instance end
wait(1)

UIS = game:GetService("UserInputService")
RunService = game:GetService("RunService")
Players = game:GetService("Players")
Lighting = game:GetService("Lighting")
TweenService = game:GetService("TweenService")
Debris = game:GetService("Debris")
HttpService = game:GetService("HttpService")

showNotification = nil

player = nil
mouse = nil
playerGui = nil
for i = 1, 30 do
	local ok = pcall(function()
		player = Players.LocalPlayer
		if player then
			mouse = player:GetMouse()
			playerGui = player:WaitForChild("PlayerGui", 2)
		end
	end)
	if ok and player and playerGui then break end
	task.wait(0.5)
end
if not player then error("Players.LocalPlayer nil after 15s - retry injection") end
if not playerGui then
	playerGui = Instance.new("ScreenGui", player)
	playerGui.Name = "PlayerGui_Fallback"
end

if playerGui:FindFirstChild("AdminMenu") then playerGui.AdminMenu:Destroy() end



Themes = {
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
	Blue = {
		BG        = Color3.fromRGB(8, 12, 22),
		Panel     = Color3.fromRGB(14, 20, 38),
		Button    = Color3.fromRGB(22, 34, 60),
		ButtonHov = Color3.fromRGB(34, 52, 90),
		Accent    = Color3.fromRGB(60, 160, 255),
		AccentHov = Color3.fromRGB(100, 190, 255),
		Text      = Color3.fromRGB(230, 240, 255),
		SubText   = Color3.fromRGB(140, 170, 220),
		Tab       = Color3.fromRGB(10, 16, 30),
		TabActive = Color3.fromRGB(60, 160, 255),
		Danger    = Color3.fromRGB(255, 70, 90),
		Success   = Color3.fromRGB(50, 200, 220),
		Warn      = Color3.fromRGB(255, 200, 50),
	},
	Pink = {
		BG        = Color3.fromRGB(22, 8, 18),
		Panel     = Color3.fromRGB(38, 14, 30),
		Button    = Color3.fromRGB(60, 22, 48),
		ButtonHov = Color3.fromRGB(90, 34, 72),
		Accent    = Color3.fromRGB(255, 80, 180),
		AccentHov = Color3.fromRGB(255, 120, 200),
		Text      = Color3.fromRGB(255, 235, 245),
		SubText   = Color3.fromRGB(220, 150, 190),
		Tab       = Color3.fromRGB(30, 10, 24),
		TabActive = Color3.fromRGB(255, 80, 180),
		Danger    = Color3.fromRGB(255, 50, 70),
		Success   = Color3.fromRGB(80, 220, 150),
		Warn      = Color3.fromRGB(255, 210, 50),
	},
	Orange = {
		BG        = Color3.fromRGB(22, 14, 6),
		Panel     = Color3.fromRGB(38, 24, 10),
		Button    = Color3.fromRGB(60, 38, 16),
		ButtonHov = Color3.fromRGB(90, 58, 24),
		Accent    = Color3.fromRGB(255, 150, 40),
		AccentHov = Color3.fromRGB(255, 180, 80),
		Text      = Color3.fromRGB(255, 240, 225),
		SubText   = Color3.fromRGB(220, 170, 120),
		Tab       = Color3.fromRGB(30, 18, 8),
		TabActive = Color3.fromRGB(255, 150, 40),
		Danger    = Color3.fromRGB(255, 60, 60),
		Success   = Color3.fromRGB(100, 220, 80),
		Warn      = Color3.fromRGB(255, 230, 50),
	},
	Purple = {
		BG        = Color3.fromRGB(14, 6, 22),
		Panel     = Color3.fromRGB(24, 10, 38),
		Button    = Color3.fromRGB(38, 16, 60),
		ButtonHov = Color3.fromRGB(58, 24, 90),
		Accent    = Color3.fromRGB(200, 80, 255),
		AccentHov = Color3.fromRGB(220, 120, 255),
		Text      = Color3.fromRGB(245, 230, 255),
		SubText   = Color3.fromRGB(180, 140, 220),
		Tab       = Color3.fromRGB(18, 8, 30),
		TabActive = Color3.fromRGB(200, 80, 255),
		Danger    = Color3.fromRGB(255, 50, 90),
		Success   = Color3.fromRGB(80, 220, 150),
		Warn      = Color3.fromRGB(255, 210, 50),
	},
	Gold = {
		BG        = Color3.fromRGB(20, 16, 6),
		Panel     = Color3.fromRGB(34, 28, 10),
		Button    = Color3.fromRGB(54, 44, 16),
		ButtonHov = Color3.fromRGB(82, 66, 24),
		Accent    = Color3.fromRGB(255, 210, 50),
		AccentHov = Color3.fromRGB(255, 225, 90),
		Text      = Color3.fromRGB(255, 248, 220),
		SubText   = Color3.fromRGB(210, 180, 110),
		Tab       = Color3.fromRGB(26, 22, 8),
		TabActive = Color3.fromRGB(255, 210, 50),
		Danger    = Color3.fromRGB(255, 60, 70),
		Success   = Color3.fromRGB(130, 220, 70),
		Warn      = Color3.fromRGB(255, 180, 40),
	},
	Ocean = {
		BG        = Color3.fromRGB(4, 16, 18),
		Panel     = Color3.fromRGB(8, 28, 32),
		Button    = Color3.fromRGB(12, 46, 52),
		ButtonHov = Color3.fromRGB(18, 70, 80),
		Accent    = Color3.fromRGB(20, 220, 210),
		AccentHov = Color3.fromRGB(60, 240, 230),
		Text      = Color3.fromRGB(210, 250, 250),
		SubText   = Color3.fromRGB(110, 200, 210),
		Tab       = Color3.fromRGB(6, 22, 25),
		TabActive = Color3.fromRGB(20, 220, 210),
		Danger    = Color3.fromRGB(255, 60, 80),
		Success   = Color3.fromRGB(50, 230, 160),
		Warn      = Color3.fromRGB(255, 220, 40),
	},
	Neon = {
		BG        = Color3.fromRGB(5, 5, 10),
		Panel     = Color3.fromRGB(10, 10, 20),
		Button    = Color3.fromRGB(18, 18, 38),
		ButtonHov = Color3.fromRGB(28, 28, 60),
		Accent    = Color3.fromRGB(255, 0, 200),
		AccentHov = Color3.fromRGB(255, 50, 215),
		Text      = Color3.fromRGB(240, 240, 255),
		SubText   = Color3.fromRGB(180, 180, 220),
		Tab       = Color3.fromRGB(8, 8, 16),
		TabActive = Color3.fromRGB(255, 0, 200),
		Danger    = Color3.fromRGB(255, 30, 50),
		Success   = Color3.fromRGB(0, 255, 130),
		Warn      = Color3.fromRGB(255, 200, 0),
	},
	Matrix = {
		BG        = Color3.fromRGB(0, 5, 0),
		Panel     = Color3.fromRGB(0, 10, 0),
		Button    = Color3.fromRGB(0, 20, 5),
		ButtonHov = Color3.fromRGB(0, 40, 10),
		Accent    = Color3.fromRGB(0, 255, 65),
		AccentHov = Color3.fromRGB(60, 255, 110),
		Text      = Color3.fromRGB(180, 255, 190),
		SubText   = Color3.fromRGB(80, 200, 100),
		Tab       = Color3.fromRGB(0, 8, 2),
		TabActive = Color3.fromRGB(0, 255, 65),
		Danger    = Color3.fromRGB(255, 50, 70),
		Success   = Color3.fromRGB(0, 255, 65),
		Warn      = Color3.fromRGB(255, 220, 0),
	},
}
currentTheme = Themes.Dark


themeListeners = {}
themeListenerNextId = 0
function onThemeChanged(fn)
	themeListenerNextId = themeListenerNextId + 1
	themeListeners[themeListenerNextId] = fn
	return themeListenerNextId
end

vcAntiBan = false
vcAntiBanConns = {}
vcAntiBanActive = false
vcAntiBanKey = "V"

function activateVCAntiBan()
	if vcAntiBanActive then
		showNotification("🎤  VC Anti-Ban déjà actif", 2)
		return
	end
	task.spawn(function()
		pcall(function()
			local vcs = game:FindService("VoiceChatService") or game:GetService("VoiceChatService")
			local function findVoice()
				for _, c in ipairs(player:GetChildren()) do
					if c:IsA("Voice") then return c end
				end
				return nil
			end
			local voice = findVoice()
			if not voice then
				for _ = 1, 20 do
					task.wait(0.3)
					voice = findVoice()
					if voice then break end
				end
			end
			if not voice then
				showNotification("❌  Voice introuvable", 2)
				return
			end
			local muted = false
			pcall(function() muted = voice.IsMuted end)
			if muted then
				showNotification("🔇  Désactive le mute d'abord", 2)
				return
			end
			vcAntiBan = true
			vcAntiBanActive = true
			if vcs then
				local mt = getrawmetatable and getrawmetatable(vcs)
				if mt and mt.__namecall then
					local nc = mt.__namecall
					if setreadonly then pcall(function() setreadonly(mt, false) end) end
					mt.__namecall = function(self, ...)
						local m = getnamecallmethod and getnamecallmethod()
						if m and vcAntiBan then
							local lm = m:lower()
							if lm == "isvoicechatenabled" then return false end
							if lm == "getvoicechatstatus" then return "Disabled" end
						end
						return nc(self, ...)
					end
					if setreadonly then pcall(function() setreadonly(mt, true) end) end
				end
			end
			local vmt = getrawmetatable and getrawmetatable(voice)
			if vmt and vmt.__index then
				local vi = vmt.__index
				if setreadonly then pcall(function() setreadonly(vmt, false) end) end
				vmt.__index = function(self, k)
					if vcAntiBan then
						if k == "VoiceState" then return Enum.ParticleStatus.Inactive end
					end
					return vi(self, k)
				end
				if setreadonly then pcall(function() setreadonly(vmt, true) end) end
			end
			local function isV(v)
				if not v:IsA("GuiObject") then return false end
				local n = v.Name:lower()
				return n:find("voice") or n:find("mic") or n:find("speaker") or n:find("speak") or n:find("mute") or n:find("audio") or n:find("push") or n:find("talk") or n:find("vcs")
			end
			for _, v in ipairs(playerGui:GetDescendants()) do
				if isV(v) then v.Visible = false; v.Active = false end
			end
			vcAntiBanConns[#vcAntiBanConns+1] = playerGui.DescendantAdded:Connect(function(v)
				if not vcAntiBan then return end
				task.wait(0.05)
				if isV(v) then v.Visible = false; v.Active = false end
			end)
			vcAntiBanConns[#vcAntiBanConns+1] = UIS.InputBegan:Connect(function(input, gpe)
				if not vcAntiBan or gpe then return end
				if input.KeyCode.Name == vcAntiBanKey then
					pcall(function()
						if vcs then vcs:ToggleMicrophone() end
					end)
				end
			end)
			showNotification("🎤  VC Anti-Ban: ON (" .. vcAntiBanKey .. ")", 2)
		end)
	end)
end

gui = Instance.new("ScreenGui", playerGui)
gui.Name = "AdminMenu"
gui.Enabled = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.DisplayOrder = 999
gui.ResetOnSpawn = false

local hoverSound
function playHover()
	pcall(function()
		if not hoverSound then
			hoverSound = Instance.new("Sound")
			hoverSound.SoundId = "rbxassetid://9044532086"
			hoverSound.Volume = 0.15
			hoverSound.PlaybackSpeed = 1.5
			hoverSound.Parent = workspace
		end
		hoverSound:Play()
	end)
end





main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 380, 0, 500)
main.Position = UDim2.new(0.5, -190, 0.5, -250)
main.BackgroundColor3 = currentTheme.BG
main.BorderSizePixel = 0
main.ZIndex = 1
main.ClipsDescendants = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 16)


stroke = Instance.new("UIStroke", main)
stroke.Color = currentTheme.Accent
stroke.Thickness = 2
stroke.Transparency = 0.25





header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 52)
header.BackgroundColor3 = currentTheme.Panel
header.BorderSizePixel = 0
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 16)


accentBar = Instance.new("Frame", header)
accentBar.Size = UDim2.new(1, -40, 0, 2)
accentBar.Position = UDim2.new(0, 20, 1, -1)
accentBar.BackgroundColor3 = currentTheme.Accent
accentBar.BorderSizePixel = 0
accentBar.BackgroundTransparency = 0.4
Instance.new("UICorner", accentBar).CornerRadius = UDim.new(1, 0)
TweenService:Create(accentBar, TweenInfo.new(2.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
	BackgroundTransparency = 0.15,
	Size = UDim2.new(1, -80, 0, 2)
}):Play()


headerFix = Instance.new("Frame", header)
headerFix.Size = UDim2.new(1, 0, 0, 14)
headerFix.Position = UDim2.new(0, 0, 1, -14)
headerFix.BackgroundColor3 = currentTheme.Panel
headerFix.BorderSizePixel = 0

title = Instance.new("TextLabel", header)
title.Text = "🌐 bkz HUB"
title.Size = UDim2.new(1, -50, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = currentTheme.Text
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left

subtitle = Instance.new("TextLabel", header)
subtitle.Text = "v5.7  •  " .. player.Name
subtitle.Size = UDim2.new(1, -50, 0, 14)
subtitle.Position = UDim2.new(0, 15, 0, 33)
subtitle.BackgroundTransparency = 1
subtitle.TextColor3 = currentTheme.SubText
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 10
subtitle.TextXAlignment = Enum.TextXAlignment.Left


lockBtn = Instance.new("TextButton", header)
lockBtn.Text = "🔓"
lockBtn.Size = UDim2.new(0, 30, 0, 30)
lockBtn.Position = UDim2.new(1, -74, 0.5, -15)
lockBtn.BackgroundColor3 = currentTheme.Button
lockBtn.TextColor3 = Color3.new(1,1,1)
lockBtn.Font = Enum.Font.GothamBold
lockBtn.TextSize = 13
lockBtn.BorderSizePixel = 0
Instance.new("UICorner", lockBtn).CornerRadius = UDim.new(0, 8)
lockBtn.MouseEnter:Connect(playHover)
lockBtn.Name = "lockBtn"
lockBtn.MouseButton1Click:Connect(function()
	interfaceLocked = not interfaceLocked
	lockBtn.Text = interfaceLocked and "🔒" or "🔓"
	lockBtn.BackgroundColor3 = interfaceLocked and currentTheme.Success or currentTheme.Button
	showNotification(interfaceLocked and "🔒 Interface locked" or "🔓 Interface unlocked", 1.5)
end)


closeBtn = Instance.new("TextButton", header)
closeBtn.Text = "✕"
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -38, 0.5, -15)
closeBtn.BackgroundColor3 = currentTheme.Danger
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.BorderSizePixel = 0
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 8)
closeBtn.MouseEnter:Connect(playHover)
closeBtn.Name = "closeBtn"

glassOverlay = Instance.new("Frame", main)
glassOverlay.Size = UDim2.new(1, 0, 1, 0)
glassOverlay.Position = UDim2.new(0, 0, 0, 0)
glassOverlay.BackgroundColor3 = currentTheme.BG
glassOverlay.BackgroundTransparency = 0.92
glassOverlay.BorderSizePixel = 0
glassOverlay.ZIndex = 0
Instance.new("UICorner", glassOverlay).CornerRadius = UDim.new(0, 16)
glassOverlay.ClipsDescendants = true



tabBar = Instance.new("Frame", main)
tabBar.Size = UDim2.new(1, -20, 0, 40)
tabBar.Position = UDim2.new(0, 10, 0, 57)
tabBar.BackgroundColor3 = currentTheme.Tab
tabBar.BorderSizePixel = 0
Instance.new("UICorner", tabBar).CornerRadius = UDim.new(0, 10)
tabLayout = Instance.new("UIListLayout", tabBar)
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0, 4)
tabPad = Instance.new("UIPadding", tabBar)
tabPad.PaddingLeft = UDim.new(0, 4); tabPad.PaddingRight = UDim.new(0, 4)
tabPad.PaddingTop = UDim.new(0, 4); tabPad.PaddingBottom = UDim.new(0, 4)



tabDefs = {
	{ name = "Player",   icon = "👤" },
	{ name = "Personal", icon = "🔒" },
	{ name = "Aim",      icon = "🎯" },
	{ name = "ESP",      icon = "👁" },
	{ name = "World",    icon = "🌍" },
	{ name = "Emotes",   icon = "💃" },
	{ name = "Settings", icon = "⚙" },
	{ name = "Other",    icon = "ℹ" },
}

pages = {}
tabBtns = {}
activeTab = "Player"

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
	tb.Size = UDim2.new(0.125, -3, 1, 0)
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
	tb.MouseEnter:Connect(function()
		if def.name ~= activeTab then
			TweenService:Create(tb, TweenInfo.new(0.15), {BackgroundColor3 = currentTheme.Button}):Play()
		end
	end)
	tb.MouseLeave:Connect(function()
		if def.name ~= activeTab then
			TweenService:Create(tb, TweenInfo.new(0.15), {BackgroundColor3 = currentTheme.Tab}):Play()
		end
	end)
	tb.MouseButton1Click:Connect(function()
		activeTab = def.name
		for n, p in pairs(pages) do
			if n == def.name then
				p.Visible = true
				p.Position = UDim2.new(0, 10, 0, 110)
				TweenService:Create(p, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					Position = UDim2.new(0, 10, 0, 100),
					BackgroundTransparency = 1
				}):Play()
			else
				p.Visible = false
			end
		end
		for n, b in pairs(tabBtns) do
			b.BackgroundColor3 = (n == def.name) and currentTheme.TabActive or currentTheme.Tab
			b.TextColor3 = (n == def.name) and Color3.new(1,1,1) or currentTheme.SubText
		end
	end)
	tabBtns[def.name] = tb
end



function createSection(parent, title, order)
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

function createBtn(parent, text, color, order, func)
	color = color or currentTheme.Button
	local colorKey = nil
	for k, v in pairs(currentTheme) do if v == color then colorKey = k; break end end
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
		TweenService:Create(frame, TweenInfo.new(0.2), {BackgroundColor3 = currentTheme.ButtonHov}):Play()
		TweenService:Create(stroke2, TweenInfo.new(0.2), {Transparency = 0.75, Color = currentTheme.Accent}):Play()
		TweenService:Create(frame, TweenInfo.new(0.15), {Size = UDim2.new(1, 0, 0, 42)}):Play()
	end)
	btn.MouseLeave:Connect(function()
		TweenService:Create(frame, TweenInfo.new(0.2), {BackgroundColor3 = colorKey and currentTheme[colorKey] or color, Size = UDim2.new(1, 0, 0, 40)}):Play()
		TweenService:Create(stroke2, TweenInfo.new(0.2), {Transparency = 0.93, Color = Color3.new(1,1,1)}):Play()
	end)
	btn.MouseButton1Click:Connect(function()
		local label = text:gsub("[^%w%s]","")
		showNotification("👉 " .. label, 1.5)
		TweenService:Create(frame, TweenInfo.new(0.04), {BackgroundColor3 = currentTheme.Accent, Size = UDim2.new(1, 0, 0, 38)}):Play()
		task.delay(0.06, function()
			TweenService:Create(frame, TweenInfo.new(0.12), {BackgroundColor3 = currentTheme.ButtonHov, Size = UDim2.new(1, 0, 0, 40)}):Play()
		end)
		func()
	end)

	onThemeChanged(function(t)
		if colorKey then frame.BackgroundColor3 = t[colorKey] end
		btn.TextColor3 = t.Text
	end)

	return frame, btn
end


toggleStates = {}
toggleApply = {}

function createToggle(parent, text, order, func, configKey)
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
		state = not state
		if configKey then toggleStates[configKey] = state end
		TweenService:Create(track, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			BackgroundColor3 = state and currentTheme.Accent or currentTheme.Button
		}):Play()
		TweenService:Create(knob, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			Position = state and UDim2.new(1,-21,0.5,-9) or UDim2.new(0,3,0.5,-9),
			Size = state and UDim2.new(0, 20, 0, 20) or UDim2.new(0, 18, 0, 18)
		}):Play()
		local label = text:gsub("[^%w%s]","")
		func(state)
	end)

	
	if configKey then
		toggleApply[configKey] = function(newState)
			state = newState
			track.BackgroundColor3 = state and currentTheme.Accent or currentTheme.Button
			knob.Position = state and UDim2.new(1,-21,0.5,-9) or UDim2.new(0,3,0.5,-9)
			func(state)
		end
		if state then task.spawn(function() toggleApply[configKey](true) end) end
	end

	onThemeChanged(function(t)
		frame.BackgroundColor3 = t.Button
		lbl.TextColor3 = t.Text
	end)

	return frame, lbl
end

function createSlider(parent, text, min, max, default, order, func)
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

	
	local inputBox = Instance.new("TextBox", frame)
	inputBox.Size = UDim2.new(0, 56, 0, 20)
	inputBox.Position = UDim2.new(1, -68, 0, 5)
	inputBox.BackgroundColor3 = currentTheme.Panel
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
	track.BackgroundColor3 = currentTheme.Button
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

	
	inputBox.FocusLost:Connect(function()
		local num = tonumber(inputBox.Text)
		if num then
			setVal(num, false)
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
		updateSlider({Position = Vector3.new(x,y,0)})
	end)
	UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then draggingSlider = false end end)
	UIS.InputChanged:Connect(function(i) if draggingSlider and i.UserInputType == Enum.UserInputType.MouseMovement then updateSlider(i) end end)

	onThemeChanged(function(t)
		frame.BackgroundColor3 = t.Button
		lbl.TextColor3 = t.Text
		fill.BackgroundColor3 = t.Accent
		inputBox.TextColor3 = t.Accent
	end)

	return frame
end

function createNumberInput(parent, text, default, order, func)
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
	box.BackgroundColor3 = currentTheme.Panel
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

	onThemeChanged(function(t)
		frame.BackgroundColor3 = t.Button
		lbl.TextColor3 = t.Text
		box.TextColor3 = t.Accent
	end)

	return frame
end




interfaceLocked = false
savedOpacity = 100
bgAnimEnabled = false
bgAnimParts = {}
dragging, dragStart, startPos = nil
resizing, resizeStart, resizeStartSize = nil

function startDrag(input)
	if interfaceLocked then return end
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		local mpos = input.Position
		local aPos, aSz = main.AbsolutePosition, main.AbsoluteSize
		if mpos.X >= aPos.X + aSz.X - 8 and mpos.X <= aPos.X + aSz.X then return end
		if mpos.Y >= aPos.Y + aSz.Y - 8 and mpos.Y <= aPos.Y + aSz.Y then return end
		dragging = true; dragStart = input.Position; startPos = main.Position
	end
end

dragZone = Instance.new("TextButton", main)
dragZone.Size = UDim2.new(1, 0, 1, 0)
dragZone.BackgroundTransparency = 1
dragZone.Text = ""
dragZone.ZIndex = 0
dragZone.InputBegan:Connect(startDrag)

header.InputBegan:Connect(startDrag)


edgeBars = {}
local handle = Instance.new("Frame", main)
handle.Size = UDim2.new(0, 36, 0, 36)
handle.AnchorPoint = Vector2.new(1, 1)
handle.Position = UDim2.new(1, 4, 1, 4)
handle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
handle.BackgroundTransparency = 0.5
handle.BorderSizePixel = 0
handle.ZIndex = 2
Instance.new("UICorner", handle).CornerRadius = UDim.new(0, 6)
local pat = {{0}, {-1, 0}, {-2, -1, 0}}
for ri, offs in ipairs(pat) do
	for ci, o in ipairs(offs) do
		local d = Instance.new("Frame", handle)
		d.Size = UDim2.new(0, 4, 0, 4)
		d.AnchorPoint = Vector2.new(1, 1)
		d.Position = UDim2.new(1, -6 - o * 6, 1, -6 - (#pat - ri) * 6)
		d.BackgroundColor3 = Color3.new(1, 1, 1)
		d.BorderSizePixel = 0
		Instance.new("UICorner", d).CornerRadius = UDim.new(1, 0)
	end
end
local bar = Instance.new("TextButton", main)
bar.Size = UDim2.new(0, 36, 0, 36)
bar.AnchorPoint = Vector2.new(1, 1)
bar.Position = UDim2.new(1, 4, 1, 4)
bar.BackgroundTransparency = 1
bar.BorderSizePixel = 0; bar.ZIndex = 3; bar.Text = ""; bar.AutoButtonColor = false
bar.InputBegan:Connect(function(input)
	if interfaceLocked then return end
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		resizing = "xy"; resizeStart = input.Position; resizeStartSize = Vector2.new(menuW, menuH)
	end
end)
edgeBars["corner"] = {bar=bar, handle=handle}

onThemeChanged(function(t)
	for _, v in pairs(edgeBars) do v.bar.BackgroundColor3 = t.Accent end
end)

UIS.InputChanged:Connect(function(input)
	if input.UserInputType ~= Enum.UserInputType.MouseMovement then return end
	if dragging and not resizing then
		local delta = input.Position - dragStart
		main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	if resizing then
		local delta = input.Position - resizeStart
		local newW, newH = menuW, menuH
		if resizing == "x" or resizing == "xy" then newW = math.max(280, resizeStartSize.X + delta.X) end
		if resizing == "y" or resizing == "xy" then newH = math.max(380, resizeStartSize.Y + delta.Y) end
		applyMenuSize(newW, newH)
	end
end)

UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false; resizing = nil
	end
end)



gokuMode = false

function spawnRing(cframe, color, size)
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

function playInstantTransmissionFX(position)
	local char = player.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return end
	local hrp = char.HumanoidRootPart
	local originCFrame = hrp.CFrame

	
	
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

	
	spawnRing(originCFrame, Color3.fromRGB(100, 200, 255), 5)
	spawnRing(originCFrame, Color3.fromRGB(255, 255, 255), 2.5)

	
	task.wait(0.06)
	hrp.CFrame = CFrame.new(position + Vector3.new(0, 3, 0))

	
	local arrCF = hrp.CFrame

	
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

	
	spawnRing(arrCF, Color3.fromRGB(255, 255, 180), 6)
	spawnRing(arrCF, Color3.fromRGB(100, 200, 255), 3.5)
	spawnRing(arrCF, Color3.fromRGB(255, 255, 255), 1.8)

	
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
		playInstantTransmissionFX(mouse.Hit.p)
	end
end)




createSection(pages.Player, "Targeting", 0)


searchRow = Instance.new("Frame", pages.Player)
searchRow.Size = UDim2.new(1, 0, 0, 38)
searchRow.BackgroundTransparency = 1
searchRow.BorderSizePixel = 0
searchRow.LayoutOrder = 1


ddFrame = Instance.new("Frame", searchRow)
ddFrame.Size = UDim2.new(1, -44, 1, 0)
ddFrame.Position = UDim2.new(0, 0, 0, 0)
ddFrame.BackgroundColor3 = currentTheme.Button
ddFrame.BorderSizePixel = 0
Instance.new("UICorner", ddFrame).CornerRadius = UDim.new(0, 8)

searchBox = Instance.new("TextBox", ddFrame)
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


refreshFrame = Instance.new("Frame", searchRow)
refreshFrame.Size = UDim2.new(0, 38, 1, 0)
refreshFrame.Position = UDim2.new(1, -38, 0, 0)
refreshFrame.BackgroundColor3 = currentTheme.Accent
refreshFrame.BorderSizePixel = 0
Instance.new("UICorner", refreshFrame).CornerRadius = UDim.new(0, 8)

refreshBtn = Instance.new("TextButton", refreshFrame)
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


ddList = Instance.new("ScrollingFrame", pages.Player)
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

targetPlayer = nil


function selectPlayer(p)
	targetPlayer = p
	searchBox.Text = p.Name
	searchBox.TextColor3 = currentTheme.Text
	TweenService:Create(ddList, TweenInfo.new(0.15), {Size = UDim2.new(1,0,0,0)}):Play()
	task.wait(0.15); ddList.Visible = false

	infoName.Text = "👤  " .. p.Name .. "  (ID: " .. p.UserId .. ")"
	local teamName = p.Team and p.Team.Name or "None"
	infoStats.Text = "🏷  " .. p.Name .. (p.DisplayName ~= p.Name and " (" .. p.DisplayName .. ")" or "") .. "   🚩 Team: " .. teamName
	local hum = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
	if hum then
		infoHP.Text = "❤  HP: " .. math.floor(hum.Health) .. " / " .. math.max(hum.MaxHealth,1)
	else
		infoHP.Text = "❤  HP: N/A"
	end
end


function updateDD(filter)
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


function refreshDD()
	searchBox.Text = ""
	updateDD("")
end


searchBox:GetPropertyChangedSignal("Text"):Connect(function()
	updateDD(searchBox.Text)
end)


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


refreshBtn.MouseButton1Click:Connect(function()
	refreshDD()
end)


searchBox.Focused:Connect(function()
	updateDD(searchBox.Text)
end)

createSection(pages.Player, "Actions", 2)


infoPanel = Instance.new("Frame", pages.Player)
infoPanel.Size = UDim2.new(1, 0, 0, 60)
infoPanel.BackgroundColor3 = currentTheme.Panel
infoPanel.BorderSizePixel = 0
infoPanel.LayoutOrder = 2
Instance.new("UICorner", infoPanel).CornerRadius = UDim.new(0, 8)
infoPad = Instance.new("UIPadding", infoPanel)
infoPad.PaddingLeft = UDim.new(0, 10)
infoPad.PaddingTop = UDim.new(0, 6)

infoName = Instance.new("TextLabel", infoPanel)
infoName.Text = "No player selected"
infoName.Size = UDim2.new(1, -10, 0, 20)
infoName.BackgroundTransparency = 1
infoName.TextColor3 = currentTheme.Text
infoName.Font = Enum.Font.GothamBold
infoName.TextSize = 12
infoName.TextXAlignment = Enum.TextXAlignment.Left

infoStats = Instance.new("TextLabel", infoPanel)
infoStats.Text = ""
infoStats.Size = UDim2.new(1, -10, 0, 16)
infoStats.Position = UDim2.new(0, 0, 0, 22)
infoStats.BackgroundTransparency = 1
infoStats.TextColor3 = currentTheme.SubText
infoStats.Font = Enum.Font.Gotham
infoStats.TextSize = 10
infoStats.TextXAlignment = Enum.TextXAlignment.Left

infoHP = Instance.new("TextLabel", infoPanel)
infoHP.Text = ""
infoHP.Size = UDim2.new(1, -10, 0, 16)
infoHP.Position = UDim2.new(0, 0, 0, 38)
infoHP.BackgroundTransparency = 1
infoHP.TextColor3 = Color3.fromRGB(80, 220, 80)
infoHP.Font = Enum.Font.Gotham
infoHP.TextSize = 10
infoHP.TextXAlignment = Enum.TextXAlignment.Left




RunService.Heartbeat:Connect(function()
	if not targetPlayer then return end
	if targetPlayer and targetPlayer.Character then
		local hum = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
		if hum then
			infoHP.Text = "❤  HP: " .. math.floor(hum.Health) .. " / " .. math.max(hum.MaxHealth,1)
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

chatSpyConns  = {}
chatSpyActive = false

function stopChatSpy()
	chatSpyActive = false
	for _, c in ipairs(chatSpyConns) do pcall(function() c:Disconnect() end) end
	chatSpyConns = {}
end

function startChatSpy(filterPlayer)
	stopChatSpy()
	chatSpyActive = true
	local connected = false

	
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

createSection(pages.Player, "🎭  Local Visual Fun", 9)

createBtn(pages.Player, "🪑  Sit All (Local)", currentTheme.Button, 10, function()
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player and p.Character then
			local hum = p.Character:FindFirstChildOfClass("Humanoid")
			if hum then pcall(function() hum.Sit = true end) end
		end
	end
	showNotification("🪑  Local: All sitting (visual only)", 3)
end)

createBtn(pages.Player, "💀  Kill All (Local)", currentTheme.Danger, 11, function()
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player and p.Character then
			local hum = p.Character:FindFirstChildOfClass("Humanoid")
			if hum then pcall(function() hum.Health = 0 end) end
		end
	end
	showNotification("💀  Local: All killed (visual only)", 3)
end)

createBtn(pages.Player, "🧊  Freeze All (Local)", currentTheme.Button, 12, function()
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player and p.Character then
			local hrp = p.Character:FindFirstChild("HumanoidRootPart")
			if hrp then pcall(function() hrp.Anchored = true end) end
		end
	end
	showNotification("🧊  Local: All frozen (visual only)", 3)
end)

createBtn(pages.Player, "🧊  Unfreeze All (Local)", currentTheme.Button, 13, function()
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player and p.Character then
			local hrp = p.Character:FindFirstChild("HumanoidRootPart")
			if hrp then pcall(function() hrp.Anchored = false end) end
		end
	end
	showNotification("🧊  Local: All unfrozen (visual only)", 3)
end)

createBtn(pages.Player, "🗡  Remove All Tools (Local)", currentTheme.Button, 14, function()
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player and p.Character then
			for _, t in ipairs(p.Character:GetChildren()) do
				if t:IsA("Tool") then pcall(function() t:Destroy() end) end
			end
		end
	end
	showNotification("🗡  Local: Tools removed (visual only)", 3)
end)

createBtn(pages.Player, "📡  TP All to Me (Local)", currentTheme.Accent, 15, function()
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
	showNotification("📡  Local: All TP to you (visual only)", 3)
end)

createSection(pages.Player, "🎤  Voice Chat", 16)
createBtn(pages.Player, "🎤  Activer VC Anti-Ban", currentTheme.Accent, 17, function(btn)
	activateVCAntiBan()
	if btn then
		btn.Text = "🎤  VC Anti-Ban: ON"
		btn.BackgroundColor3 = currentTheme.Success
		btn.AutoButtonColor = false
	end
end)
do
	local vcKf = Instance.new("Frame", pages.Player)
	vcKf.Size = UDim2.new(1,0,0,34)
	vcKf.BackgroundColor3 = currentTheme.Button
	vcKf.BorderSizePixel = 0
	vcKf.LayoutOrder = 18
	Instance.new("UICorner", vcKf).CornerRadius = UDim.new(0, 8)
	local vcKl = Instance.new("TextLabel", vcKf)
	vcKl.Size = UDim2.new(1,-10,1,0)
	vcKl.Position = UDim2.new(0,10,0,0)
	vcKl.BackgroundTransparency = 1
	vcKl.Text = "⌨  Touche: " .. vcAntiBanKey .. "  [cliquer]"
	vcKl.TextColor3 = currentTheme.Text
	vcKl.Font = Enum.Font.Gotham
	vcKl.TextSize = 12
	vcKl.TextXAlignment = Enum.TextXAlignment.Left
	local vcKb = Instance.new("TextButton", vcKf)
	vcKb.Size = UDim2.new(1,0,1,0)
	vcKb.BackgroundTransparency = 1
	vcKb.Text = ""
	local listening = false
	local bindConn = nil
	vcKb.MouseEnter:Connect(playHover)
	vcKb.MouseButton1Click:Connect(function()
		if listening then return end
		listening = true
		vcKl.Text = "⌨  Appuie sur une touche..."
		if bindConn then bindConn:Disconnect() end
		bindConn = UIS.InputBegan:Connect(function(input, gpe)
			if gpe then return end
			local key = nil
			if input.UserInputType == Enum.UserInputType.Keyboard then
				key = input.KeyCode.Name
			elseif input.UserInputType == Enum.UserInputType.MouseButton1 then key = "Mouse1"
			elseif input.UserInputType == Enum.UserInputType.MouseButton2 then key = "Mouse2"
			elseif input.UserInputType == Enum.UserInputType.MouseButton3 then key = "Mouse3"
			end
			if key then
				vcAntiBanKey = key
				vcKl.Text = "⌨  Touche: " .. key .. "  [cliquer]"
				listening = false
				if bindConn then bindConn:Disconnect(); bindConn = nil end
				showNotification("🎤  Touche: " .. key, 2)
			end
		end)
		task.delay(5, function()
			if listening then
				listening = false
				if bindConn then bindConn:Disconnect(); bindConn = nil end
				vcKl.Text = "⌨  Touche: " .. vcAntiBanKey .. "  [cliquer]"
			end
		end)
	end)
	onThemeChanged(function(t)
		vcKf.BackgroundColor3 = t.Button
		vcKl.TextColor3 = t.Text
	end)
end

createSection(pages.Personal, "🏃  Movement", 0)

savedWalkSpeed = 16
savedJumpPower = 50

function applyMovement(char)
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

flyEnabled = false
flyBodyVel, flyBodyGyro = nil
flySpeed = 40

function enableFly()
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

function disableFly()
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

local noclipPlatform = nil

createToggle(pages.Personal, "🕶  Noclip (walk through walls)", 9, function(state)
	if state then
		noclipPlatform = Instance.new("Part")
		noclipPlatform.Name = "NoclipPlatform"
		noclipPlatform.Anchored = true
		noclipPlatform.CanCollide = true
		noclipPlatform.Transparency = 1
		noclipPlatform.Size = Vector3.new(50, 1, 50)
		noclipPlatform.Material = Enum.Material.ForceField
		noclipPlatform.Locked = true
		noclipPlatform.Parent = workspace
		RunService:BindToRenderStep("Noclip", Enum.RenderPriority.Character.Value + 1, function()
			local char = player.Character
			if not char then return end
			local hrp = char:FindFirstChild("HumanoidRootPart")
			if not hrp then return end
			for _, part in ipairs(char:GetDescendants()) do
				if part:IsA("BasePart") then part.CanCollide = false end
			end
			hrp.CanCollide = false
			noclipPlatform.CFrame = CFrame.new(hrp.Position.X, hrp.Position.Y - 5, hrp.Position.Z)
		end)
	else
		RunService:UnbindFromRenderStep("Noclip")
		if noclipPlatform then noclipPlatform:Destroy(); noclipPlatform = nil end
		local char = player.Character
		if char then
			for _, part in ipairs(char:GetDescendants()) do
				if part:IsA("BasePart") then part.CanCollide = true end
			end
		end
	end
end, "noclip")

local emoteTracks = {}
emoteSpeed = 1.0

local function createEmoteToggle(parent, name, order, animId, configKey)
	createToggle(parent, name, order, function(state)
		if state then
			local char = player.Character
			if not char then return end
			local hum = char:FindFirstChildOfClass("Humanoid")
			if not hum then return end
			local animator = hum:FindFirstChildOfClass("Animator")
			if not animator then animator = Instance.new("Animator", hum) end
			local anim = Instance.new("Animation")
			anim.AnimationId = "rbxassetid://" .. tostring(animId)
			local track = animator:LoadAnimation(anim)
			track.Looped = true
			track:AdjustSpeed(emoteSpeed)
			track:Play()
			emoteTracks[configKey] = track
		else
			if emoteTracks[configKey] then
				emoteTracks[configKey]:Stop()
				emoteTracks[configKey]:Destroy()
				emoteTracks[configKey] = nil
			end
		end
	end, configKey)
end

function stopAllEmotes()
	for k, track in pairs(emoteTracks) do
		pcall(function() track:Stop(); track:Destroy() end)
	end
	emoteTracks = {}
	for k, v in pairs(toggleStates) do
		if k:match("^anim_") and v then
			toggleStates[k] = false
			if toggleApply[k] then toggleApply[k](false) end
		end
	end
end

createSection(pages.Emotes, "🎬  Animator Packs", 1)

createBtn(pages.Emotes, "⏹  Stop All Emotes", currentTheme.Danger, 2, function()
	stopAllEmotes()
	showNotification("⏹  Toutes les emotes arrêtées", 2)
end)

createSlider(pages.Emotes, "⚡  Speed Animation", 10, 300, 100, 3, function(val)
	emoteSpeed = val / 100
	for _, track in pairs(emoteTracks) do
		pcall(function() track:AdjustSpeed(emoteSpeed) end)
	end
end)

local animEmotes = {
	{"Wave", 18455766909},
	{"Point", 18455774293},
	{"Dance", 18455789433},
	{"Dance 2", 18378430756},
	{"Dance 3", 18378426625},
	{"Laugh", 18455781785},
	{"Cheer", 18455778635},
	{"Idle", 18376648560},
	{"Walk Style", 18376651750},
	{"Run Style", 18376654895},
	{"Fall", 18376657688},
	{"Sit", 18376662353},
}

for i, em in ipairs(animEmotes) do
	createEmoteToggle(pages.Emotes, em[1], i + 1, em[2], "anim_" .. em[1]:gsub("%s+", ""))
end

createSection(pages.Personal, "🛡  Survival", 10)


godConn        = nil
godHumConn     = nil
godRespawnConn = nil
godEnabled     = false

function applyGodToHum(hum)
	if not hum then return end
	
	pcall(function()
		hum.MaxHealth = math.huge
		hum.Health    = math.huge
	end)
	
	pcall(function()
		if hum.MaxHealth < 1e5 then
			hum.MaxHealth = 1e6
			hum.Health    = 1e6
		end
	end)
	
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

function enableGod()
	godEnabled = true
	
	local char = player.Character
	if char then
		local hum = char:FindFirstChildOfClass("Humanoid")
		applyGodToHum(hum)
	end
	
	if godRespawnConn then godRespawnConn:Disconnect() end
	godRespawnConn = player.CharacterAdded:Connect(function(c)
		task.wait(0.15)
		if godEnabled then
			applyGodToHum(c:FindFirstChildOfClass("Humanoid"))
		end
	end)
	
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

function disableGod()
	godEnabled = false
	if godConn        then godConn:Disconnect();        godConn        = nil end
	if godHumConn     then godHumConn:Disconnect();     godHumConn     = nil end
	if godRespawnConn then godRespawnConn:Disconnect(); godRespawnConn = nil end
end

createToggle(pages.Personal, "🛡  God Mode (invincible)", 11, function(state)
	if state then enableGod() else disableGod() end
end, "godMode")


antiKickEnabled = false
antiKickConns = {}

function stopAntiKick()
	antiKickEnabled = false
	for _, c in ipairs(antiKickConns) do pcall(c.Disconnect, c) end
	antiKickConns = {}
end

function startAntiKick()
	stopAntiKick()
	antiKickEnabled = true
	
	local c1 = player:GetPropertyChangedSignal("Parent"):Connect(function()
		if not antiKickEnabled then return end
		if player.Parent ~= Players then
			pcall(function() player.Parent = Players end)
		end
	end)
	table.insert(antiKickConns, c1)
	
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


noFallEnabled = false
noFallConn = nil

function enableNoFall()
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

function disableNoFall()
	noFallEnabled = false
	if noFallConn then noFallConn:Disconnect(); noFallConn = nil end
end

createToggle(pages.Personal, "🦶  No Fall Damage", 13, function(state)
	if state then enableNoFall() else disableNoFall() end
end, "noFall")


antiGrabEnabled = false
antiGrabConn = nil

function enableAntiGrab()
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

function disableAntiGrab()
	antiGrabEnabled = false
	if antiGrabConn then antiGrabConn:Disconnect(); antiGrabConn = nil end
	pcall(function()
		local char = player.Character
		if char then
			for _, t in ipairs(char:GetChildren()) do
				if t:IsA("Tool") then pcall(function() t.Parent = player.Backpack end) end
			end
		end
	end)
end

createToggle(pages.Personal, "🔒  Anti-Tool Grab", 14, function(state)
	if state then enableAntiGrab() else disableAntiGrab() end
end, "antiGrab")


antiCheatEnabled = false
antiCheatConns = {}

function stopAntiCheat()
	antiCheatEnabled = false
	for _, c in ipairs(antiCheatConns) do pcall(c.Disconnect, c) end
	antiCheatConns = {}
end

function startAntiCheat()
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


jumpConn = nil
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


ammoEnabled   = false
ammoConns     = {}

function ammoCleanup()
	for _, c in ipairs(ammoConns) do pcall(function() c:Disconnect() end) end
	ammoConns = {}
end

function patchAmmoTool(tool)
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
	
	for _, v in ipairs(tool:GetDescendants()) do
		if v:IsA("RemoteEvent") then
			local n = v.Name:lower()
			if n:find("ammo") or n:find("setammo") or n:find("refill") then
				pcall(function() v:FireServer(999999) end)
			end
		end
	end
	
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

function watchAmmoChar(char)
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


reloadEnabled = false
reloadConns   = {}

function reloadCleanup()
	for _, c in ipairs(reloadConns) do pcall(function() c:Disconnect() end) end
	reloadConns = {}
end

function patchReloadTool(tool)
	
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
	
	for _, v in ipairs(tool:GetDescendants()) do
		if v:IsA("RemoteEvent") and v.Name:lower():find("reload") then
			pcall(function() v:FireServer() end)
		end
	end
	
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

function watchReloadChar(char)
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


recoilEnabled  = false
recoilConn     = nil
recoilConns    = {}

function recoilPatchTool(tool)
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
	
	if recoilConn then recoilConn:Disconnect(); recoilConn = nil end
	for _, c in ipairs(recoilConns) do pcall(function() c:Disconnect() end) end
	recoilConns = {}
	if not state then return end

	local cam    = workspace.CurrentCamera
	
	local lastYaw, lastPitch = 0, 0
	local function getCamAngles()
		local _, y, _ = cam.CFrame:ToEulerAnglesYXZ()
		local x, _, _ = cam.CFrame:ToEulerAnglesYXZ()
		return x, y
	end
	local initP, initY = getCamAngles()
	lastPitch, lastYaw = initP, initY

	
	
	recoilConn = RunService.RenderStepped:Connect(function()
		if not recoilEnabled then return end
		local curP, curY = getCamAngles()
		local dPitch = curP - lastPitch
		
		
		if dPitch > 0.008 then
			
			local pos   = cam.CFrame.Position
			local look  = cam.CFrame.LookVector
			
			local corrected = CFrame.new(pos) * CFrame.Angles(lastPitch, curY, 0)
			pcall(function() cam.CFrame = corrected end)
		else
			lastPitch = curP
			lastYaw   = curY
		end
	end)

	
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


autoParryEnabled = false
autoParryConn = nil

function enableAutoParry()
	autoParryEnabled = true
	autoParryConn = RunService.RenderStepped:Connect(function()
		if not autoParryEnabled then return end
		local char = player.Character
		if not char then return end
		
		local torso = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
		if torso then
			pcall(function()
				torso.CFrame = torso.CFrame * CFrame.Angles(0.15, 0, 0)
			end)
		end
	end)
end

function disableAutoParry()
	autoParryEnabled = false
	if autoParryConn then autoParryConn:Disconnect(); autoParryConn = nil end
end

createToggle(pages.Personal, "⚔  Auto Parry (block)", 20, function(state)
	if state then enableAutoParry() else disableAutoParry() end
end, "autoParry")




aimEnabled   = false
aimActive    = false
aimConn      = nil
aimMode      = "hold"
aimKey       = "Mouse2"
botList      = {}
botListTimer = 0
aimSmooth    = 0.08
aimFOV       = 250
aimDistance    = 0
aimShowCircle  = false
aimCircleGui   = nil
aimTargetPlayers  = true
aimTargetBots     = true
aimTargetVehicles = false
aimTargetObjects  = false


MOUSE_KEYS = {
	{ label = "Right Click  (Mouse2)",   id = "Mouse2"  },
	{ label = "Left Click  (Mouse1)",  id = "Mouse1"  },
	{ label = "Middle Click  (Mouse3)", id = "Mouse3"  },
}


KEYBOARD_KEYS = {
	
	"A","B","C","D","E","F","G","H","I","J","K","L","M",
	"N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
	
	"Zero","One","Two","Three","Four","Five","Six","Seven","Eight","Nine",
	
	"F1","F2","F3","F4","F5","F6","F7","F8","F9","F10","F11","F12",
	
	"LeftShift","RightShift","LeftControl","RightControl","LeftAlt","RightAlt",
	
	"Up","Down","Left","Right","Home","End","PageUp","PageDown","Insert","Delete",
	
	"KeypadZero","KeypadOne","KeypadTwo","KeypadThree","KeypadFour",
	"KeypadFive","KeypadSix","KeypadSeven","KeypadEight","KeypadNine",
	"KeypadPlus","KeypadMinus","KeypadAsterisk","KeypadSlash","KeypadPeriod",
	
	"Tab","CapsLock","Space","BackSpace","Return","Escape",
	"Minus","Equals","LeftBracket","RightBracket","BackSlash",
	"Semicolon","Quote","Comma","Period","Slash","Backquote",
}


function createFOVCircle()
	if aimCircleGui and aimCircleGui.Parent then aimCircleGui:Destroy() end
	local sg = Instance.new("ScreenGui")
	sg.Name = "AimFOVCircle"
	sg.DisplayOrder = 1000
	sg.ResetOnSpawn = false
	sg.IgnoreGuiInset = true
	sg.Parent = playerGui
	aimCircleGui = sg

	local frame = Instance.new("Frame", sg)
	frame.Name = "Circle"
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	frame.BackgroundTransparency = 1
	frame.BorderSizePixel = 0
	local size = aimFOV * 2
	frame.Size = UDim2.new(0, size, 0, size)

	local corner = Instance.new("UICorner", frame)
	corner.CornerRadius = UDim.new(1, 0)

	local stroke = Instance.new("UIStroke", frame)
	stroke.Color = ESP_COLOR_SELF
	stroke.Thickness = 1.5
	stroke.Transparency = 0.3
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
end


function destroyFOVCircle()
	if aimCircleGui then
		pcall(function() aimCircleGui:Destroy() end)
		aimCircleGui = nil
	end
end


function updateFOVCircle()
	if not aimShowCircle or not aimEnabled then
		destroyFOVCircle()
		return
	end
	if not aimCircleGui or not aimCircleGui.Parent then
		createFOVCircle()
	end
	local circle = aimCircleGui and aimCircleGui:FindFirstChild("Circle")
	if circle then
		local size = aimFOV * 2
		circle.Size = UDim2.new(0, size, 0, size)
	end
end


function isAimInput(input, began)
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


function refreshBotList()
	botList = {}
	for _, model in ipairs(workspace:GetDescendants()) do
		if isBot(model) then
			table.insert(botList, model)
		end
	end
end

function getTarget()
	local cam   = workspace.CurrentCamera
	local myHRP = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if not myHRP then return nil end

	local best, bestScore = nil, math.huge
	local vp = cam.ViewportSize
	local cx, cy = vp.X / 2, vp.Y / 2
	local targetPartName = aimTargetPart or "Head"
	local targetPartNames = {"Head", "UpperTorso", "Torso", "HumanoidRootPart"}
	local myPos = myHRP.Position

	if aimTargetPlayers then
		for _, p in ipairs(Players:GetPlayers()) do
			if p ~= player and p.Character then
				local myTeam     = player.Team
				local theirTeam  = p.Team
				if not (myTeam and theirTeam and myTeam == theirTeam) then
					local hum  = p.Character:FindFirstChildOfClass("Humanoid")
					if hum and hum.Health > 0 then
						local targetPart = nil
						if aimTargetPart and p.Character:FindFirstChild(aimTargetPart) then
							targetPart = p.Character:FindFirstChild(aimTargetPart)
						else
							for _, pn in ipairs(targetPartNames) do
								local part = p.Character:FindFirstChild(pn)
								if part then targetPart = part; break end
							end
						end
						if targetPart then
							if aimDistance > 0 and (targetPart.Position - myPos).Magnitude > aimDistance then
							else
								local sp, onScreen = cam:WorldToViewportPoint(targetPart.Position)
								if onScreen and sp.Z > 0 then
									local dx = sp.X - cx
									local dy = sp.Y - cy
									local fovDist = math.sqrt(dx*dx + dy*dy)
									if fovDist < aimFOV and fovDist < bestScore then
										bestScore = fovDist; best = p
									end
								end
							end
						end
					end
				end
			end
		end
	end

	if aimTargetBots then
		for _, model in ipairs(botList) do
			if model and model.Parent then
				local hum = model:FindFirstChildOfClass("Humanoid")
				if hum and hum.Health > 0 then
					local targetPart = model:FindFirstChild(aimTargetPart or "Head")
					if not targetPart then targetPart = model:FindFirstChild("Head") or model:FindFirstChild("HumanoidRootPart") end
					if targetPart then
						if aimDistance > 0 and (targetPart.Position - myPos).Magnitude > aimDistance then
						else
							local sp, onScreen = cam:WorldToViewportPoint(targetPart.Position)
							if onScreen and sp.Z > 0 then
								local dx = sp.X - cx
								local dy = sp.Y - cy
								local fovDist = math.sqrt(dx*dx + dy*dy)
								if fovDist < aimFOV and fovDist < bestScore then
									bestScore = fovDist; best = model
								end
							end
						end
					end
				end
			end
		end
	end

	if aimTargetVehicles then
		for _, obj in ipairs(workspace:GetDescendants()) do
			if obj:IsA("VehicleSeat") or obj:IsA("TankSeat") or obj:IsA("Seat") then
				local inChar = false
				for _, p in ipairs(Players:GetPlayers()) do
					if p.Character and (obj:IsDescendantOf(p.Character) or obj:IsDescendantOf(p)) then
						inChar = true; break
					end
				end
				if not inChar and obj:IsA("BasePart") then
					if aimDistance > 0 and (obj.Position - myPos).Magnitude > aimDistance then
					else
						local sp, onScreen = cam:WorldToViewportPoint(obj.Position)
						if onScreen and sp.Z > 0 then
							local dx = sp.X - cx
							local dy = sp.Y - cy
							local fovDist = math.sqrt(dx*dx + dy*dy)
							if fovDist < aimFOV and fovDist < bestScore then
								bestScore = fovDist; best = obj
							end
						end
					end
				end
			end
		end
	end

	if aimTargetObjects then
		for _, obj in ipairs(workspace:GetDescendants()) do
			if obj:IsA("Seat") and not obj:IsA("VehicleSeat") and not obj:IsA("TankSeat") then
				local inChar = false
				for _, p in ipairs(Players:GetPlayers()) do
					if p.Character and (obj:IsDescendantOf(p.Character) or obj:IsDescendantOf(p)) then
						inChar = true; break
					end
				end
				if not inChar and obj:IsA("BasePart") then
					if aimDistance > 0 and (obj.Position - myPos).Magnitude > aimDistance then
					else
						local sp, onScreen = cam:WorldToViewportPoint(obj.Position)
						if onScreen and sp.Z > 0 then
							local dx = sp.X - cx
							local dy = sp.Y - cy
							local fovDist = math.sqrt(dx*dx + dy*dy)
							if fovDist < aimFOV and fovDist < bestScore then
								bestScore = fovDist; best = obj
							end
						end
					end
				end
			end
		end
	end

	return best
end





aimMethod = 1   

aimPrediction = 0.15
aimTargetPart = "Head"

function applyAim(targetPart)
	local cam = workspace.CurrentCamera
	if not targetPart or not targetPart.Parent then return end

	local targetPos = targetPart.Position
	local char = targetPart.Parent
	local hrpTarget = char:FindFirstChild("HumanoidRootPart")
	local hum = char:FindFirstChildOfClass("Humanoid")

	if hrpTarget and aimPrediction > 0 then
		local vel = hrpTarget.Velocity
		if hum and hum.WalkSpeed then
			local speed = hum.WalkSpeed
			if speed > 0 then
				vel = vel * (aimPrediction * 1.2)
			end
		end
		targetPos = targetPos + vel * aimPrediction
	end

	local smoothFactor = math.clamp(aimSmooth, 0.01, 0.95)

	if aimMethod == 1 then
		local targetCF = CFrame.new(cam.CFrame.Position, targetPos)
		cam.CFrame = cam.CFrame:Lerp(targetCF, smoothFactor)

	elseif aimMethod == 2 then
		local prev = cam.CameraType
		cam.CameraType = Enum.CameraType.Scriptable
		local targetCF = CFrame.new(cam.CFrame.Position, targetPos)
		cam.CFrame = cam.CFrame:Lerp(targetCF, smoothFactor)
		cam.CameraType = prev

	elseif aimMethod == 3 then
		local myHrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if myHrp then
			local dir = (targetPos - myHrp.Position) * Vector3.new(1, 0, 1)
			if dir.Magnitude > 0.1 then
				myHrp.CFrame = myHrp.CFrame:Lerp(
					CFrame.new(myHrp.Position, myHrp.Position + dir),
					smoothFactor * 2
				)
			end
		end
	end
end

function startAim()
	if aimConn then return end
	aimConn = RunService.RenderStepped:Connect(function()
		updateFOVCircle()
		if not aimActive then return end
		botListTimer = botListTimer + 1
		if botListTimer >= 120 then
			botListTimer = 0
			refreshBotList()
		end
		local t = getTarget()
		if not t then return end
		local targetPart = nil
		local char = nil
		if t:IsA("Player") then
			char = t.Character
		else
			char = t
		end
		if not char then return end
		targetPart = char:FindFirstChild(aimTargetPart or "Head")
		if not targetPart then targetPart = char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart") end
		if not targetPart then return end
		pcall(applyAim, targetPart)
	end)
end

function stopAim()
	if aimConn then aimConn:Disconnect(); aimConn = nil end
	aimActive = false
	destroyFOVCircle()
end


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




createSection(pages.Personal, "📐  Appearance", 20)

currentScale = 1.0

function applyScale(val)
	currentScale = val / 100
	local char = player.Character
	if not char then return end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if not hum then return end

	local function setScale()
		
		local bd = hum:FindFirstChild("BodyDepthScale")
		local bh = hum:FindFirstChild("BodyHeightScale")
		local bw = hum:FindFirstChild("BodyWidthScale")
		local hs = hum:FindFirstChild("HeadScale")
		if bd then bd.Value = currentScale end
		if bh then bh.Value = currentScale end
		if bw then bw.Value = currentScale end
		if hs then hs.Value = currentScale end

		
		local bt = hum:FindFirstChild("BodyTypeScale")
		if bt then bt.Value = math.clamp(currentScale, 0, 1) end

		
		local hrp = char:FindFirstChild("HumanoidRootPart")
		if hrp and not bd then  
			for _, part in ipairs(char:GetDescendants()) do
				if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
					pcall(function()
						part.Size = part.Size * currentScale
					end)
				end
			end
		end

		
		pcall(function()
			if char.ScaleTo then
				char:ScaleTo(currentScale)
			end
		end)
	end

	setScale()
	
	task.delay(0.3, setScale)
	task.delay(1.0, setScale)
end


player.CharacterAdded:Connect(function(char)
	task.wait(0.5)
	applyScale(currentScale * 100)
end)

createNumberInput(pages.Personal, "📐  Character Size", 100, 21, function(val)
	applyScale(val)
end)



createSection(pages.Aim, "🎯  Aim Lock", 0)


aimStatusLabel = Instance.new("TextLabel", pages.Aim)
aimStatusLabel.Size  = UDim2.new(1, 0, 0, 18)
aimStatusLabel.BackgroundTransparency = 1
aimStatusLabel.TextColor3 = currentTheme.SubText
aimStatusLabel.Font  = Enum.Font.Gotham
aimStatusLabel.TextSize = 11
aimStatusLabel.TextXAlignment = Enum.TextXAlignment.Left
aimStatusLabel.LayoutOrder = 1
function updateAimStatus()
	aimStatusLabel.Text = "  Key: " .. aimKey
		.. "   Mode: " .. aimMode
		.. "   Smooth: " .. math.floor(aimSmooth * 100) .. "%"
end
updateAimStatus()


createToggle(pages.Aim, "🎯  Aim Lock ON / OFF", 2, function(state)
	aimEnabled = state
	if state then startAim() else stopAim() end
end, "aimLock")


createSlider(pages.Aim, "🎚  Smooth (aim speed)", 1, 30, 8, 3, function(val)
	aimSmooth = val / 100
	updateAimStatus()
end)


createNumberInput(pages.Aim, "🔵  FOV (radius pixels)", 250, 4, function(val)
	aimFOV = val
end)

createSlider(pages.Aim, "🎯  Prediction (lead)", 0, 50, 15, 5, function(val)
	aimPrediction = val / 100
end)


local aimModeBtn = nil
aimModeBtn = createBtn(pages.Aim, "🔄  Mode: " .. aimMode, currentTheme.Button, 6, function(btn)
	aimMode = (aimMode == "hold") and "toggle" or "hold"
	aimModeBtn.Text = "🔄  Mode: " .. aimMode
	updateAimStatus()
	showNotification("🎯  Mode: " .. aimMode, 2)
end)

methodNames = {"1 - Direct Cam", "2 - Scriptable Cam", "3 - HRP Orient"}
local aimMethodBtn = nil
aimMethodBtn = createBtn(pages.Aim, "🔧  Method: " .. methodNames[aimMethod], currentTheme.Button, 7, function()
	aimMethod = (aimMethod % 3) + 1
	aimMethodBtn.Text = "🔧  Method: " .. methodNames[aimMethod]
	showNotification("🎯  Method: " .. methodNames[aimMethod], 2)
end)


function mkDropdown(parent, label, items, defaultIdx, order, onPick)
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


MOUSE_LABELS = {}
for _, m in ipairs(MOUSE_KEYS) do table.insert(MOUSE_LABELS, m.label) end

mkDropdown(pages.Aim, "🖱  Mouse", MOUSE_LABELS, 1, 8, function(lbl)
	for _, m in ipairs(MOUSE_KEYS) do
		if m.label == lbl then aimKey = m.id; break end
	end
	updateAimStatus()
end)

mkDropdown(pages.Aim, "⌨  Keyboard", KEYBOARD_KEYS, 1, 9, function(key)
	aimKey = key
	updateAimStatus()
end)

aimTargetPart = aimTargetPart or "Head"
local aimPartItems = {"Head", "UpperTorso", "Torso", "HumanoidRootPart"}
mkDropdown(pages.Aim, "🎯  Target Part", aimPartItems, 1, 10, function(selected)
	aimTargetPart = selected
	showNotification("🎯  Target: " .. selected, 2)
end)


createSection(pages.Aim, "🎯  Target Types", 15)
createToggle(pages.Aim, "👤  Players", 16, function(state)
	aimTargetPlayers = state
end, "aimTargetPlayers")
createToggle(pages.Aim, "🤖  Bots / AI", 17, function(state)
	aimTargetBots = state
end, "aimTargetBots")
createToggle(pages.Aim, "🚗  Vehicles", 18, function(state)
	aimTargetVehicles = state
end, "aimTargetVehicles")
createToggle(pages.Aim, "📦  Objects", 19, function(state)
	aimTargetObjects = state
end, "aimTargetObjects")


createSection(pages.Aim, "🎯  Visuals", 20)
createToggle(pages.Aim, "⭕  Show FOV Circle", 21, function(state)
	aimShowCircle = state
	if state then updateFOVCircle() else destroyFOVCircle() end
end, "aimShowCircle")


createSection(pages.Aim, "📏  Aim Distance", 25)
createSlider(pages.Aim, "📏  Max Distance (0 = infinite)", 0, 500, 0, 26, function(val)
	aimDistance = val
end)


createSection(pages.World, "☀  Environment", 0)

shader = nil
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


createSection(pages.World, "🌫  Fog & Effects", 4)

function getAtmo()
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


createToggle(pages.World, "🌧  Rain", 7, function(state)
	RunService:UnbindFromRenderStep("AdminRain")
	for _, v in ipairs(workspace:GetChildren()) do
		if v.Name == "AdminRain" or v.Name == "AdminRainFar" or v.Name == "AdminRainSplash" then v:Destroy() end
	end
	if not state then
		
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

	
	TweenService:Create(Lighting, TweenInfo.new(2), {
		Brightness = 0.6,
		Ambient = Color3.fromRGB(80, 95, 120),
		OutdoorAmbient = Color3.fromRGB(90, 105, 130),
	}):Play()
	local atmo = Lighting:FindFirstChildOfClass("Atmosphere")
	if not atmo then atmo = Instance.new("Atmosphere", Lighting) end
	TweenService:Create(atmo, TweenInfo.new(2), { Density = 0.45 }):Play()

	
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

	
	RunService:BindToRenderStep("AdminRain", 1, function()
		local c = player.Character
		if c and c:FindFirstChild("HumanoidRootPart") then
			local pos = c.HumanoidRootPart.Position
			rain.CFrame    = CFrame.new(pos + Vector3.new(0, 45, 0))
			rainFar.CFrame = CFrame.new(pos + Vector3.new(0, 50, 0))
		end
	end)
end, "rain")


createToggle(pages.World, "❄  Snow", 8, function(state)
	RunService:UnbindFromRenderStep("AdminSnow")
	for _, v in ipairs(workspace:GetChildren()) do
		if v.Name == "AdminSnow" or v.Name == "AdminSnowFar" or v.Name == "AdminSnowGround" then v:Destroy() end
	end

	if state then
		
		TweenService:Create(Lighting, TweenInfo.new(2), {
			Brightness = 1.4,
			Ambient = Color3.fromRGB(170, 185, 215),
			OutdoorAmbient = Color3.fromRGB(185, 200, 230),
		}):Play()
		local atmo = Lighting:FindFirstChildOfClass("Atmosphere")
		if not atmo then atmo = Instance.new("Atmosphere", Lighting) end
		TweenService:Create(atmo, TweenInfo.new(2), { Density = 0.25, Color = Color3.fromRGB(200, 215, 240) }):Play()

		
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






menuW, menuH = 380, 500

function applyMenuSize(w, h)
	menuW, menuH = w, h
	main.Size = UDim2.new(0, menuW, 0, menuH)
end


function applyTheme(t)
	currentTheme = t
	main.BackgroundColor3 = t.BG
	stroke.Color = t.Accent
	header.BackgroundColor3 = t.Panel
	accentBar.BackgroundColor3 = t.Accent
	headerFix.BackgroundColor3 = t.Panel
	title.TextColor3 = t.Text
	subtitle.TextColor3 = t.SubText
	closeBtn.BackgroundColor3 = t.Danger
	lockBtn.BackgroundColor3 = interfaceLocked and t.Success or t.Button
	glassOverlay.BackgroundColor3 = t.BG
	tabBar.BackgroundColor3 = t.Tab
	for name, btn in pairs(tabBtns) do
		btn.BackgroundColor3 = (name == activeTab) and t.TabActive or t.Tab
		btn.TextColor3 = (name == activeTab) and Color3.new(1,1,1) or t.SubText
		btn:FindFirstChildOfClass("TextLabel").TextColor3 = (name == activeTab) and Color3.new(1,1,1) or t.SubText
	end
	
	ddFrame.BackgroundColor3 = t.Button
	searchBox.TextColor3 = t.Text
	searchBox.PlaceholderColor3 = t.SubText
	refreshFrame.BackgroundColor3 = t.Accent
	ddList.BackgroundColor3 = t.Panel
	infoPanel.BackgroundColor3 = t.Panel
	infoName.TextColor3 = t.Text
	infoStats.TextColor3 = t.SubText
	
	for _, page in pairs(pages) do
		page.ScrollBarImageColor3 = t.Accent
	end
	
	for _, cb in pairs(themeListeners) do
		pcall(cb, t)
	end
end

createSection(pages.Settings, "🎨  Theme", 0)
local themeItems = {"🟣  Purple", "⭐  Gold", "🌊  Ocean", "💎  Neon", "🟠  Orange", "💗  Pink", "🌑  Dark", "🌕  Light", "💠  Cyber", "🔴  Red", "🟢  Green", "🔵  Blue", "🌐  Matrix"}
mkDropdown(pages.Settings, "🎨  Theme", themeItems, 7, 1, function(selected)
    local themeMap = {
        ["🟣  Purple"]="Purple", ["⭐  Gold"]="Gold", ["🌊  Ocean"]="Ocean", ["💎  Neon"]="Neon",
        ["🟠  Orange"]="Orange", ["💗  Pink"]="Pink", ["🌑  Dark"]="Dark", ["🌕  Light"]="Light",
        ["💠  Cyber"]="Cyber", ["🔴  Red"]="Rouge", ["🟢  Green"]="Vert", ["🔵  Blue"]="Blue",
        ["🌐  Matrix"]="Matrix",
    }
    local key = themeMap[selected]
    if key and Themes[key] then
        applyTheme(Themes[key])
        autoSave()
        showNotification("🎨  Theme: " .. selected, 2)
    end
end)

createSection(pages.Settings, "🎆  Menu Effects", 50)

local fxContainer = Instance.new("Frame", pages.Settings)
fxContainer.Name = "FxContainer"
fxContainer.Size = UDim2.new(1, 0, 0, 0)
fxContainer.AutomaticSize = Enum.AutomaticSize.Y
fxContainer.BackgroundTransparency = 1
fxContainer.BorderSizePixel = 0
fxContainer.LayoutOrder = 51
fxContainer.Visible = true
fxContainer.ClipsDescendants = true
local fxLayout = Instance.new("UIListLayout", fxContainer)
fxLayout.Padding = UDim.new(0, 6)
fxLayout.SortOrder = Enum.SortOrder.LayoutOrder

local menuFx = {snow={}, rain={}, fire={}, rocket={}, steve={}, matrixRain={}}
local menuFxGui = nil
local blackBgFrame = nil
local menuBorderParts = {}
local menuBorderGlowEnabled = false

local matrixChars = {"ﾊ","ﾐ","ﾋ","ｰ","ｳ","ｼ","ﾅ","ﾓ","ﾆ","ｻ","ﾏ","ﾉ","ﾘ","ｹ","ﾁ","ｷ","ﾄ","ﾟ","ﾞ","ﾌ","ﾎ","ﾍ","ﾑ","ﾚ","ﾕ"}

local function ensureFxGui()
	if not menuFxGui or not menuFxGui.Parent then
		menuFxGui = Instance.new("Frame")
		menuFxGui.Size = UDim2.new(1, 0, 1, 0)
		menuFxGui.BackgroundTransparency = 1
		menuFxGui.ZIndex = 0
		menuFxGui.Active = false
		menuFxGui.Position = UDim2.new(0, 0, 0, 0)
		menuFxGui.Parent = main
	end
	return menuFxGui
end

local function clearFx(name)
	for _, p in ipairs(menuFx[name]) do
		pcall(function() p:Destroy() end)
	end
	menuFx[name] = {}
end

local function spawnSnowFlake()
	if not menuFx.snow then return end
	local fx = ensureFxGui()
	local s = Instance.new("Frame")
	s.Size = UDim2.new(0, math.random(4, 8), 0, math.random(4, 8))
	s.Position = UDim2.new(math.random(), -10, -0.05, 0)
	s.BackgroundColor3 = Color3.new(1, 1, 1)
	s.BorderSizePixel = 0
	s.BackgroundTransparency = 0.2 + math.random() * 0.3
	s.ZIndex = 0
	Instance.new("UICorner", s).CornerRadius = UDim.new(1, 0)
	s.Parent = fx
	table.insert(menuFx.snow, s)
	local dur = math.random(6, 14)
	local endY = 1.05 + math.random() * 0.1
	local drift = (math.random() - 0.5) * 0.1
	TweenService:Create(s, TweenInfo.new(dur, Enum.EasingStyle.Linear), {
		Position = UDim2.new(s.Position.X.Scale + drift, -10, endY, 0),
		BackgroundTransparency = 0.9,
	}):Play()
	task.delay(dur, function()
		pcall(function() s:Destroy() end)
		for i, v in ipairs(menuFx.snow) do if v == s then table.remove(menuFx.snow, i) end end
	end)
end

local function spawnRainDrop()
	if not menuFx.rain then return end
	local fx = ensureFxGui()
	local r = Instance.new("TextLabel")
	r.Size = UDim2.new(0, 2, 0, math.random(14, 28))
	r.Position = UDim2.new(math.random(), 0, -0.05, 0)
	r.BackgroundTransparency = 1
	r.Text = "│"
	r.TextSize = math.random(14, 28)
	r.TextColor3 = Color3.fromRGB(160, 200, 255)
	r.Font = Enum.Font.Gotham
	r.ZIndex = 0
	r.Parent = fx
	table.insert(menuFx.rain, r)
	local dur = math.random(2, 5)
	local speed = 0.9 + math.random() * 0.2
	TweenService:Create(r, TweenInfo.new(dur / speed, Enum.EasingStyle.Linear), {
		Position = UDim2.new(r.Position.X.Scale, 0, 1.05, 0),
		TextTransparency = 0.8,
	}):Play()
	task.delay(dur / speed, function()
		pcall(function() r:Destroy() end)
		for i, v in ipairs(menuFx.rain) do if v == r then table.remove(menuFx.rain, i) end end
	end)
end

local function spawnFire()
	if not menuFx.fire then return end
	local fx = ensureFxGui()
	local f = Instance.new("Frame")
	local size = math.random(8, 22)
	f.Size = UDim2.new(0, size, 0, size)
	f.Position = UDim2.new(math.random(), 0, 1.0, math.random(10, 30))
	f.BackgroundColor3 = Color3.fromRGB(math.random(200,255), math.random(40,120), 0)
	f.BorderSizePixel = 0
	f.BackgroundTransparency = 0.2 + math.random() * 0.3
	f.ZIndex = 0
	Instance.new("UICorner", f).CornerRadius = UDim.new(1, 0)
	f.Parent = fx
	table.insert(menuFx.fire, f)
	local dur = math.random(2, 4)
	local endY = -0.05 - math.random() * 0.1
	local drift = (math.random() - 0.5) * 0.12
	TweenService:Create(f, TweenInfo.new(dur, Enum.EasingStyle.Linear), {
		Position = UDim2.new(f.Position.X.Scale + drift, 0, endY, 0),
		BackgroundTransparency = 0.95,
	}):Play()
	task.delay(dur, function()
		pcall(function() f:Destroy() end)
		for i, v in ipairs(menuFx.fire) do if v == f then table.remove(menuFx.fire, i) end end
	end)
end

local function spawnRocket()
	if not menuFx.rocket then return end
	local fx = ensureFxGui()
	local r = Instance.new("TextLabel")
	r.Size = UDim2.new(0, 20, 0, 26)
	r.Position = UDim2.new(math.random(), 0, 1.0, 0)
	r.BackgroundTransparency = 1
	r.Text = "▲"
	r.TextSize = 20
	r.TextColor3 = Color3.fromRGB(255, math.random(100,200), 0)
	r.Font = Enum.Font.Gotham
	r.ZIndex = 0
	r.Parent = fx
	table.insert(menuFx.rocket, r)
	local dur = math.random(2, 4)
	TweenService:Create(r, TweenInfo.new(dur, Enum.EasingStyle.Linear), {
		Position = UDim2.new(r.Position.X.Scale, 0, -0.05, 0),
		TextTransparency = 0.9,
	}):Play()
	task.delay(dur, function()
		pcall(function() r:Destroy() end)
		for i, v in ipairs(menuFx.rocket) do if v == r then table.remove(menuFx.rocket, i) end end
	end)
end

local function spawnSteveHead()
	if not menuFx.steve then return end
	local fx = ensureFxGui()
	local s = Instance.new("Frame")
	s.Size = UDim2.new(0, 18, 0, 18)
	s.Position = UDim2.new(math.random(), 0, -0.05, 0)
	s.BackgroundColor3 = Color3.fromRGB(180, 140, 100)
	s.BorderSizePixel = 1
	s.BorderColor3 = Color3.fromRGB(100, 70, 40)
	s.ZIndex = 0
	s.Parent = fx
	table.insert(menuFx.steve, s)
	local dur = math.random(4, 8)
	local endY = 1.05 + math.random() * 0.1
	local drift = (math.random() - 0.5) * 0.15
	TweenService:Create(s, TweenInfo.new(dur, Enum.EasingStyle.Linear), {
		Position = UDim2.new(s.Position.X.Scale + drift, 0, endY, 0),
	}):Play()
	task.delay(dur, function()
		pcall(function() s:Destroy() end)
		for i, v in ipairs(menuFx.steve) do if v == s then table.remove(menuFx.steve, i) end end
	end)
end

local function spawnMatrixRain()
	if not menuFx.matrixRain then return end
	local fx = ensureFxGui()
	local char = matrixChars[math.random(#matrixChars)]
	local r = Instance.new("TextLabel")
	r.Size = UDim2.new(0, 14, 0, 18)
	r.Position = UDim2.new(math.random(), 0, -0.05, 0)
	r.BackgroundTransparency = 1
	r.Text = char
	r.TextSize = math.random(12, 20)
	r.TextColor3 = Color3.fromRGB(0, 255, 65)
	r.Font = Enum.Font.Code
	r.ZIndex = 0
	r.Parent = fx
	table.insert(menuFx.matrixRain, r)
	local dur = math.random(2, 6)
	TweenService:Create(r, TweenInfo.new(dur, Enum.EasingStyle.Linear), {
		Position = UDim2.new(r.Position.X.Scale, 0, 1.05 + math.random() * 0.1, 0),
		TextTransparency = 0.9,
	}):Play()
	task.delay(dur, function()
		pcall(function() r:Destroy() end)
		for i, v in ipairs(menuFx.matrixRain) do if v == r then table.remove(menuFx.matrixRain, i) end end
	end)
end

local menuFxLoops = {}
local menuFxFlags = {}

local function startFxLoop(name, fn, interval)
	if menuFxLoops[name] then
		menuFxFlags[name] = false
		pcall(function() task.cancel(menuFxLoops[name]) end)
		menuFxLoops[name] = nil
	end
	menuFxFlags[name] = true
	menuFxLoops[name] = task.spawn(function()
		while menuFxFlags[name] do
			pcall(fn)
			task.wait(interval)
		end
		menuFxLoops[name] = nil
	end)
end

local function stopFxLoop(name)
	menuFxFlags[name] = false
	if menuFxLoops[name] then
		pcall(function() task.cancel(menuFxLoops[name]) end)
		menuFxLoops[name] = nil
	end
end

local function stopFxLoops()
	for k, _ in pairs(menuFxLoops) do
		menuFxFlags[k] = false
		pcall(function() task.cancel(menuFxLoops[k]) end)
	end
	menuFxLoops = {}
	menuFxFlags = {}
end

local function enableBlackBg()
	if blackBgFrame then return end
	blackBgFrame = Instance.new("Frame")
	blackBgFrame.Size = UDim2.new(1, 0, 1, 0)
	blackBgFrame.BackgroundColor3 = Color3.new(0, 0, 0)
	blackBgFrame.BackgroundTransparency = 0.65
	blackBgFrame.BorderSizePixel = 0
	blackBgFrame.ZIndex = 0
	blackBgFrame.Active = false
	blackBgFrame.Parent = gui
end

local function disableBlackBg()
	if blackBgFrame then
		blackBgFrame:Destroy()
		blackBgFrame = nil
	end
end

local function enableMenuBorderGlow()
	if #menuBorderParts > 0 then return end
	menuBorderGlowEnabled = true
	local pad = 3
	local th = 3
	local function makeBar(szX, szY, pos)
		local b = Instance.new("Frame")
		b.Size = szX and UDim2.new(szX, pad*2, 0, th) or UDim2.new(0, th, szY, pad*2)
		b.Position = pos
		b.BackgroundColor3 = currentTheme.Accent
		b.BorderSizePixel = 0
		b.BackgroundTransparency = 0.5
		b.ZIndex = 5
		b.Parent = main
		table.insert(menuBorderParts, b)
		return b
	end
	makeBar(1, nil, UDim2.new(0, -pad, 0, -pad)) -- top
	local bb = makeBar(1, nil, UDim2.new(0, -pad, 1, pad-th)) -- bottom
	local lb = makeBar(nil, 1, UDim2.new(0, -pad, 0, -pad)) -- left
	local rb = makeBar(nil, 1, UDim2.new(1, pad-th, 0, -pad)) -- right
	task.spawn(function()
		while menuBorderGlowEnabled do
			local dur = 1.5
			for _, b in ipairs(menuBorderParts) do
				TweenService:Create(b, TweenInfo.new(dur, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
					BackgroundTransparency = 0.3,
					BackgroundColor3 = currentTheme.Accent,
				}):Play()
			end
			task.wait(dur)
			for _, b in ipairs(menuBorderParts) do
				TweenService:Create(b, TweenInfo.new(dur, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
					BackgroundTransparency = 0.6,
					BackgroundColor3 = currentTheme.Success,
				}):Play()
			end
			task.wait(dur)
		end
	end)
end

local function disableMenuBorderGlow()
	menuBorderGlowEnabled = false
	for _, b in ipairs(menuBorderParts) do
		pcall(function() b:Destroy() end)
	end
	menuBorderParts = {}
end

createToggle(fxContainer, "❄  Menu Snow", 1, function(state)
	if state then
		clearFx("snow")
		startFxLoop("snow", spawnSnowFlake, 0.3)
	else
		stopFxLoop("snow")
		clearFx("snow")
	end
	autoSave()
end, "menuSnow")

createToggle(fxContainer, "🌧  Menu Rain", 2, function(state)
	if state then
		clearFx("rain")
		startFxLoop("rain", spawnRainDrop, 0.06)
	else
		stopFxLoop("rain")
		clearFx("rain")
	end
	autoSave()
end, "menuRain")

createToggle(fxContainer, "🔥  Menu Fire", 3, function(state)
	if state then
		clearFx("fire")
		startFxLoop("fire", spawnFire, 0.12)
	else
		stopFxLoop("fire")
		clearFx("fire")
	end
	autoSave()
end, "menuFire")

createToggle(fxContainer, "🚀  Menu Rocket", 4, function(state)
	if state then
		clearFx("rocket")
		startFxLoop("rocket", spawnRocket, 0.8)
	else
		stopFxLoop("rocket")
		clearFx("rocket")
	end
	autoSave()
end, "menuRocket")

createToggle(fxContainer, "🧑  Steve Head", 5, function(state)
	if state then
		clearFx("steve")
		startFxLoop("steve", spawnSteveHead, 0.4)
	else
		stopFxLoop("steve")
		clearFx("steve")
	end
	autoSave()
end, "menuSteve")

createToggle(fxContainer, "⬛  Black Background", 6, function(state)
	if state then enableBlackBg() else disableBlackBg() end
	autoSave()
end, "menuBlackBg")

createToggle(fxContainer, "🌐  Matrix Rain", 7, function(state)
	if state then
		clearFx("matrixRain")
		startFxLoop("matrixRain", spawnMatrixRain, 0.08)
	else
		stopFxLoop("matrixRain")
		clearFx("matrixRain")
	end
	autoSave()
end, "menuMatrixRain")

createToggle(fxContainer, "✨  Background Animation", 8, function(state)
	bgAnimEnabled = state
	if state then enableBgAnim() else disableBgAnim() end
	autoSave()
end, "bgAnim")

createToggle(fxContainer, "🖼  Menu Border Glow", 9, function(state)
	if state then enableMenuBorderGlow() else disableMenuBorderGlow() end
	autoSave()
end, "menuBorderGlow")

createSection(pages.Settings, "📐  Menu & Lock", 80)
createToggle(pages.Settings, "🔒  Lock Interface", 81, function(state)
	interfaceLocked = state
	lockBtn.Text = state and "🔒" or "🔓"
	lockBtn.BackgroundColor3 = state and currentTheme.Success or currentTheme.Button
	showNotification(state and "🔒 Interface locked" or "🔓 Interface unlocked", 1.5)
	autoSave()
end, "lockInterface")
createSlider(pages.Settings, "🔲  Menu Opacity", 20, 100, 100, 82, function(val)
	savedOpacity = val
	main.BackgroundTransparency = 1 - (val / 100)
	autoSave()
end)
createBtn(pages.Settings, "↩  Reset Size",  currentTheme.Button, 83, function() applyMenuSize(380, 500) autoSave() end)
createBtn(pages.Settings, "🏠  Recenter Menu", currentTheme.Button, 84, function()
	main.Position = UDim2.new(0.5, -menuW/2, 0.5, -menuH/2)
end)

createSection(pages.Settings, "👁  Camera", 90)
createSlider(pages.Settings, "👁  FOV", 30, 120, 70, 91, function(val)
	local cam = workspace.CurrentCamera
	if cam then cam.FieldOfView = val end
end)

createSection(pages.Settings, "💾  Configuration", 100)

local CONFIG_FILE = "AdminMenu_config.json"
local autoSaveTimer = nil

function autoSave()
	if not writefile then return end
	if autoSaveTimer then autoSaveTimer:Cancel() end
	autoSaveTimer = task.delay(1, function()
		pcall(function()
			local data = game:GetService("HttpService"):JSONEncode(getConfig())
			writefile(CONFIG_FILE, data)
		end)
	end)
end


function enableBgAnim()
	if #bgAnimParts > 0 then return end
	local colors = {currentTheme.Accent, currentTheme.Success, currentTheme.Warn}
	local function createGlow()
		local g = Instance.new("Frame")
		g.Size = UDim2.new(0, math.random(80, 160), 0, math.random(80, 160))
		g.Position = UDim2.new(math.random(), -80, math.random(), -80)
		g.BackgroundColor3 = colors[math.random(#colors)]
		g.BorderSizePixel = 0
		g.BackgroundTransparency = 0.85
		Instance.new("UICorner", g).CornerRadius = UDim.new(1, 0)
		g.Parent = main
		g.ZIndex = 0
		table.insert(bgAnimParts, g)
		local xDir = math.random() > 0.5 and 1 or -1
		local yDir = math.random() > 0.5 and 1 or -1
		task.spawn(function()
			while bgAnimEnabled and g.Parent do
				local dur = math.random(6, 12)
				local targetX = g.Position.X.Scale + xDir * math.random(5, 15) / 100
				local targetY = g.Position.Y.Scale + yDir * math.random(5, 15) / 100
				TweenService:Create(g, TweenInfo.new(dur, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
					Position = UDim2.new(targetX, -80, targetY, -80),
					BackgroundTransparency = 0.8 + math.random() * 0.15,
				}):Play()
				task.wait(dur)
				xDir = -xDir
				yDir = -yDir
			end
		end)
	end
	for i = 1, 4 do createGlow() end
end

function disableBgAnim()
	bgAnimEnabled = false
	for _, g in ipairs(bgAnimParts) do
		pcall(function() g:Destroy() end)
	end
	bgAnimParts = {}
end

onThemeChanged(function(t)
	for _, g in ipairs(bgAnimParts) do
		pcall(function() g.BackgroundColor3 = t.Accent end)
	end
end)

onThemeChanged(function(t)
	for _, g in ipairs(menuBorderParts) do
		pcall(function() g.BackgroundColor3 = t.Accent end)
	end
end)

function getConfig()
	local toggles = {}
	for k, v in pairs(toggleStates) do toggles[k] = v end
	return {
		theme     = (function()
			for name, t in pairs(Themes) do if t == currentTheme then return name end end
			return "Dark"
		end)(),
		menuW     = menuW,
		menuH     = menuH,
		fov       = workspace.CurrentCamera and workspace.CurrentCamera.FieldOfView or 70,
		opacity   = savedOpacity,
		keyLayout = keyLayout,
		aimKey    = aimKey,
		aimMode   = aimMode,
		aimMethod = aimMethod,
		aimSmooth = aimSmooth,
		aimPrediction = aimPrediction,
		aimTargetPart = aimTargetPart,
		flySpeed  = flySpeed,
		walkSpeed = savedWalkSpeed,
		jumpPower = savedJumpPower,
		bgAnim    = bgAnimEnabled,
		freecamSpeed = freecamSpeed,
		aimDistance    = aimDistance,
		aimShowCircle = aimShowCircle,
		aimTargetPlayers  = aimTargetPlayers,
		aimTargetBots     = aimTargetBots,
		aimTargetVehicles = aimTargetVehicles,
		aimTargetObjects  = aimTargetObjects,
		espColors = {
			enemy = ESP_COLOR_ENEMY,
			ally  = ESP_COLOR_ALLY,
			bot   = ESP_COLOR_BOT,
			self  = ESP_COLOR_SELF,
		},
		espMaxDist = {
			player = ESP_MAX_DIST_PLAYER,
			bot    = ESP_MAX_DIST_BOT,
		},
		espStyle = {
			fillTransparency = ESP_FILL_TRANSPARENCY,
			boxStyle = ESP_BOX_STYLE,
			skeletonWidth = ESP_SKELETON_WIDTH,
		},
		emoteSpeed = emoteSpeed,
		toggles   = toggles,
	}
end

function applyConfig(cfg)
	if cfg.theme and Themes[cfg.theme] then applyTheme(Themes[cfg.theme]) end
	if cfg.menuW and cfg.menuH then applyMenuSize(cfg.menuW, cfg.menuH) end
	if cfg.fov then local cam = workspace.CurrentCamera; if cam then cam.FieldOfView = cfg.fov end end
	if cfg.opacity then
		savedOpacity = cfg.opacity
		main.BackgroundTransparency = 1 - (cfg.opacity / 100)
	end
	if cfg.keyLayout then keyLayout = cfg.keyLayout end
	if cfg.aimKey   then aimKey   = cfg.aimKey   end
	if cfg.aimMode  then aimMode  = cfg.aimMode  end
	if cfg.aimMethod then aimMethod = cfg.aimMethod end
	if cfg.aimSmooth then aimSmooth = cfg.aimSmooth end
	if cfg.aimPrediction then aimPrediction = cfg.aimPrediction end
	if cfg.aimTargetPart then aimTargetPart = cfg.aimTargetPart end
	if cfg.flySpeed then flySpeed = cfg.flySpeed end
	if cfg.walkSpeed then savedWalkSpeed = cfg.walkSpeed; applyMovement(player.Character) end
	if cfg.jumpPower then savedJumpPower = cfg.jumpPower; applyMovement(player.Character) end
	if cfg.bgAnim ~= nil then
		bgAnimEnabled = cfg.bgAnim
		if bgAnimEnabled then enableBgAnim() end
	end
	if cfg.freecamSpeed then freecamSpeed = cfg.freecamSpeed end
	if cfg.aimDistance    then aimDistance    = cfg.aimDistance    end
	if cfg.aimShowCircle ~= nil then aimShowCircle = cfg.aimShowCircle end
	if cfg.aimTargetPlayers  ~= nil then aimTargetPlayers  = cfg.aimTargetPlayers  end
	if cfg.aimTargetBots     ~= nil then aimTargetBots     = cfg.aimTargetBots     end
	if cfg.aimTargetVehicles ~= nil then aimTargetVehicles = cfg.aimTargetVehicles end
	if cfg.aimTargetObjects  ~= nil then aimTargetObjects  = cfg.aimTargetObjects  end
	if cfg.espColors then
		if cfg.espColors.enemy then ESP_COLOR_ENEMY = cfg.espColors.enemy end
		if cfg.espColors.ally  then ESP_COLOR_ALLY  = cfg.espColors.ally  end
		if cfg.espColors.bot   then ESP_COLOR_BOT   = cfg.espColors.bot   end
		if cfg.espColors.self  then ESP_COLOR_SELF  = cfg.espColors.self  end
	end
	if cfg.espMaxDist then
		if cfg.espMaxDist.player then ESP_MAX_DIST_PLAYER = cfg.espMaxDist.player end
		if cfg.espMaxDist.bot    then ESP_MAX_DIST_BOT    = cfg.espMaxDist.bot    end
	end
	if cfg.espStyle then
		if cfg.espStyle.fillTransparency then ESP_FILL_TRANSPARENCY = cfg.espStyle.fillTransparency end
		if cfg.espStyle.boxStyle then ESP_BOX_STYLE = cfg.espStyle.boxStyle end
		if cfg.espStyle.skeletonWidth then ESP_SKELETON_WIDTH = cfg.espStyle.skeletonWidth end
	end
	if cfg.emoteSpeed then emoteSpeed = cfg.emoteSpeed end
	if cfg.toggles then
		for k, v in pairs(cfg.toggles) do
			toggleStates[k] = v
		end
		
		for k, v in pairs(cfg.toggles) do
			if toggleApply[k] then
				task.spawn(function() toggleApply[k](v) end)
			end
		end
	end
	updateAimStatus()
end

function saveConfig()
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

function loadConfig()
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

createBtn(pages.Settings, "💾  Save Config",  currentTheme.Success, 101, saveConfig)
createBtn(pages.Settings, "📂  Load Config",  currentTheme.Button,  102, loadConfig)
createBtn(pages.Settings, "🗑  Reset Config", currentTheme.Danger,  103, function()
	applyTheme(Themes.Dark)
	applyMenuSize(380, 500)
	keyLayout = "QWERTY"
	local cam = workspace.CurrentCamera
	if cam then cam.FieldOfView = 70 end
	aimKey = "Mouse2"; aimMode = "hold"; flySpeed = 40
	aimMethod = 1; aimSmooth = 0.08; aimPrediction = 0.15; aimTargetPart = "Head"
	savedWalkSpeed = 16; savedJumpPower = 50
	savedOpacity = 100
	main.BackgroundTransparency = 0
	if bgAnimEnabled then disableBgAnim() end
	aimDistance = 0; aimShowCircle = false; destroyFOVCircle()
	aimTargetPlayers = true; aimTargetBots = true; aimTargetVehicles = false; aimTargetObjects = false
	freecamSpeed = 50
	ESP_COLOR_ENEMY = Color3.fromRGB(255, 40, 50)
	ESP_COLOR_ALLY  = Color3.fromRGB(50, 200, 100)
	ESP_COLOR_BOT   = Color3.fromRGB(255, 200, 0)
	ESP_COLOR_SELF  = Color3.fromRGB(80, 160, 255)
	ESP_MAX_DIST_PLAYER = 0; ESP_MAX_DIST_BOT = 0
	ESP_FILL_TRANSPARENCY = 0.85; ESP_BOX_STYLE = "corners"
	ESP_SKELETON_WIDTH = 0.15; ESP_HEAD_DOT = false
	emoteSpeed = 1.0
	stopAllEmotes()
	applyMovement(player.Character)
	updateAimStatus()
	showNotification("↩  Config reset", 2)
end)




local toastGui = nil
local toastContainer = nil
local activeToasts = {}

showNotification = function(message, duration)
	duration = duration or 4

	if not toastGui or not toastGui.Parent then
		toastGui = Instance.new("ScreenGui", playerGui)
		toastGui.Name = "AdminToast"
		toastGui.ResetOnSpawn = false
		toastGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		toastGui.DisplayOrder = 1001
		toastContainer = Instance.new("Frame", toastGui)
		toastContainer.Name = "ToastContainer"
		toastContainer.Size = UDim2.new(0, 280, 1, -20)
		toastContainer.Position = UDim2.new(1, -290, 0, 10)
		toastContainer.BackgroundTransparency = 1
		toastContainer.BorderSizePixel = 0
	end

	local toast = Instance.new("Frame", toastContainer)
	toast.Size = UDim2.new(1, 0, 0, 48)
	toast.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
	toast.BorderSizePixel = 0
	toast.AnchorPoint = Vector2.new(0, 1)
	toast.Position = UDim2.new(0, 0, 1, 0)
	toast.ZIndex = 10
	Instance.new("UICorner", toast).CornerRadius = UDim.new(0, 12)

	local toastStroke = Instance.new("UIStroke", toast)
	toastStroke.Color = Color3.fromRGB(100, 80, 255)
	toastStroke.Thickness = 1.5
	toastStroke.Transparency = 0.3

	local icon = Instance.new("Frame", toast)
	icon.Size = UDim2.new(0, 4, 1, -14)
	icon.Position = UDim2.new(0, 8, 0.5, 0)
	icon.AnchorPoint = Vector2.new(0, 0.5)
	icon.BackgroundColor3 = Color3.fromRGB(100, 80, 255)
	icon.BorderSizePixel = 0
	Instance.new("UICorner", icon).CornerRadius = UDim.new(1, 0)

	local toastLabel = Instance.new("TextLabel", toast)
	toastLabel.Text = message
	toastLabel.Size = UDim2.new(1, -26, 1, 0)
	toastLabel.Position = UDim2.new(0, 22, 0, 0)
	toastLabel.BackgroundTransparency = 1
	toastLabel.TextColor3 = Color3.fromRGB(220, 220, 240)
	toastLabel.Font = Enum.Font.GothamSemibold
	toastLabel.TextSize = 12
	toastLabel.TextXAlignment = Enum.TextXAlignment.Left
	toastLabel.TextWrapped = true
	toastLabel.RichText = true

	local progress = Instance.new("Frame", toast)
	progress.Size = UDim2.new(1, 0, 0, 3)
	progress.Position = UDim2.new(0, 0, 1, -3)
	progress.BackgroundColor3 = Color3.fromRGB(100, 80, 255)
	progress.BorderSizePixel = 0
	progress.ZIndex = 11
	Instance.new("UICorner", progress).CornerRadius = UDim.new(0, 12)

	table.insert(activeToasts, toast)

	toast.Position = UDim2.new(0, 0, 1, 54)
	TweenService:Create(toast, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Position = UDim2.new(0, 0, 1, 0)
	}):Play()

	TweenService:Create(progress, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
		Size = UDim2.new(0, 0, 0, 3)
	}):Play()

	local totalH = 0
	for i, t in ipairs(activeToasts) do
		local targetY = 0
		for j = i, #activeToasts do
			targetY = targetY - 54
		end
		TweenService:Create(t, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Position = UDim2.new(0, 0, 1, targetY)
		}):Play()
	end

	task.delay(duration, function()
		TweenService:Create(toast, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			Position = UDim2.new(1, 10, 0, 0)
		}):Play()
		task.wait(0.3)
		for i, t in ipairs(activeToasts) do
			if t == toast then
				table.remove(activeToasts, i)
				break
			end
		end
		toast:Destroy()
	end)
end


showNotification("👉𝐁 Press <b>[B]</b> to open the menu", 5)



function openMenu()
	gui.Enabled = true
	main.Size = UDim2.new(0, menuW, 0, 0)
	main.BackgroundTransparency = 0.4
	main.Position = UDim2.new(0.5, -190, 0.5, -130)
	TweenService:Create(main, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, menuW, 0, menuH),
		Position = UDim2.new(0.5, -menuW/2, 0.5, -menuH/2),
		BackgroundTransparency = 0
	}):Play()
end

function closeMenu()
	TweenService:Create(main, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
		Size = UDim2.new(0, menuW, 0, 0),
		Position = UDim2.new(0.5, -190, 0.5, -130),
		BackgroundTransparency = 0.35
	}):Play()
	task.wait(0.15)
	gui.Enabled = false
	main.Size = UDim2.new(0, menuW, 0, menuH)
	main.Position = UDim2.new(0.5, -menuW/2, 0.5, -menuH/2)
	main.BackgroundTransparency = 0
end

closeBtn.MouseButton1Click:Connect(function()
	closeMenu()
end)

UIS.InputBegan:Connect(function(input, gpe)
	if not gpe and input.KeyCode == Enum.KeyCode.B then
		if gui.Enabled then closeMenu() else openMenu() end
	end
end)



nukeEnabled = false
nukeConn = nil

function spawnExplosionFX(pos)
	
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

	
end

function startNuke()
	local char = player.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum then hum:ChangeState(Enum.HumanoidStateType.Physics) end

	
	local att = Instance.new("Attachment", hrp)
	att.Name = "NukeAtt"
	local lv = Instance.new("LinearVelocity", hrp)
	lv.Name = "NukeBV"
	lv.Attachment0 = att
	lv.VectorVelocity = Vector3.new(0, 150, 0)
	lv.MaxForce = math.huge

	
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

function stopNuke()
	if nukeConn then nukeConn:Disconnect(); nukeConn = nil end
	local char = player.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if hrp then
		local bv  = hrp:FindFirstChild("NukeBV");  if bv  then bv:Destroy()  end
		local att = hrp:FindFirstChild("NukeAtt"); if att then att:Destroy() end
	end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum then hum:ChangeState(Enum.HumanoidStateType.Freefall) end
	
	task.spawn(function()
		task.wait(1.2)
		if char and hrp then
			spawnExplosionFX(hrp.Position)
		end
	end)
end


createSection(pages.Personal, "💥  Chaos & Fun", 30)
createToggle(pages.Personal, "🚀  NUKE MODE  (propulsion + explosion)", 31, function(state)
	nukeEnabled = state
	if state then startNuke() else stopNuke() end
end, "nukeMode")
createBtn(pages.Personal, "💣  Explode in Place", currentTheme.Danger, 32, function()
	local char = player.Character
	local hrp  = char and char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	spawnExplosionFX(hrp.Position)

	
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum then
		task.delay(0.1, function()
			hum.Health = 0
		end)
	end
end)
createBtn(pages.Personal, "🔄  Reset Character", currentTheme.Button, 33, function()
	if player.Character then
		local hum = player.Character:FindFirstChildOfClass("Humanoid")
		if hum then hum.Health = 0 end
	end
end)



espState = {
	playerBoxes     = false,
	playerNames     = false,
	playerHealth    = false,
	playerDistance   = false,
	playerSkeletons = false,
	playerChams     = false,
	playerHealthBar = false,
	playerSnaplines = false,
	playerHeadDot   = false,
	botBoxes     = false,
	botNames     = false,
	botHealth    = false,
	botDistance   = false,
	botSkeletons = false,
	botChams     = false,
	botHealthBar = false,
	botSnaplines = false,
	botHeadDot   = false,
	selfESP       = false,
}
espObjects      = {}
espBotObjects   = {}
espSelfObjects  = {}

ESP_COLOR_ALLY  = Color3.fromRGB(50, 200, 100)
ESP_COLOR_ENEMY = Color3.fromRGB(255, 40, 50)
ESP_COLOR_BOT   = Color3.fromRGB(255, 200, 0)
ESP_COLOR_SELF  = Color3.fromRGB(80, 160, 255)

ESP_MAX_DIST_PLAYER = 0
ESP_MAX_DIST_BOT    = 0

ESP_FILL_TRANSPARENCY = 0.85
ESP_BOX_STYLE = "corners"
ESP_SKELETON_WIDTH = 0.15
ESP_HEAD_DOT = false


function clearESPFor(p)
	if espObjects[p] then
		for _, obj in ipairs(espObjects[p]) do
			pcall(function() if obj and obj.Parent then obj:Destroy() end end)
		end
		espObjects[p] = nil
	end
end


function clearAllBotESP()
	for model, objs in pairs(espBotObjects) do
		for _, obj in ipairs(objs) do
			pcall(function() if obj and obj.Parent then obj:Destroy() end end)
		end
	end
	espBotObjects = {}
end


function isBot(model)
	if not model:IsA("Model") then return false end
	local hum = model:FindFirstChildOfClass("Humanoid")
	if not hum then return false end
	local hrp = model:FindFirstChild("HumanoidRootPart")
	if not hrp then return false end
	
	for _, p in ipairs(Players:GetPlayers()) do
		if p.Character == model then return false end
	end
	return true
end


function buildHealthBar(hrp, hum, bbName, objs, guardKey)
	local bb = mkBB(hrp, bbName, 5, 54, 0)
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
		if guardKey and not espState[guardKey] then return end
		local pct = math.clamp(h / math.max(hum.MaxHealth,1), 0, 1)
		fill.Size             = UDim2.new(1,0,pct,0)
		fill.BackgroundColor3 = Color3.fromRGB(math.floor(255*(1-pct)), math.floor(220*pct+35), 40)
	end)
	table.insert(objs, bb)
end


function buildESPBot(model)
	if espBotObjects[model] then return end
	local hum = model:FindFirstChildOfClass("Humanoid")
	local hrp = model:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	local color = ESP_COLOR_BOT
	local objs  = {}

	if espState.botChams then
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
	end

	if espState.botBoxes then
		local bb = mkBB(hrp, "ESP_BotBox", 70, 100, 0)
		bb.StudsOffset = Vector3.new(0, 0.3, 0)
		bb.AlwaysOnTop = true
		local bg = Instance.new("Frame", bb)
		bg.Size = UDim2.new(1,0,1,0)
		bg.BackgroundColor3 = color
		bg.BackgroundTransparency = ESP_FILL_TRANSPARENCY
		bg.BorderSizePixel = 0
		Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 4)
		local outline = Instance.new("UIStroke", bg)
		outline.Color = color
		outline.Thickness = 1.5
		outline.Transparency = 0.15
		if ESP_BOX_STYLE ~= "corners" then
			outline.Thickness = 2
		end
		table.insert(objs, bb)
	end

	if espState.botHeadDot then
		local head = model:FindFirstChild("Head")
		if head then
			local bb = mkBB(head, "ESP_BotHeadDot", 6, 6, 0)
			local dot = Instance.new("Frame", bb)
			dot.Size = UDim2.new(1,0,1,0)
			dot.BackgroundColor3 = color
			dot.BorderSizePixel = 0
			Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)
			local glow = Instance.new("UIStroke", dot)
			glow.Color = color
			glow.Thickness = 1
			glow.Transparency = 0.3
			table.insert(objs, bb)
		end
	end

	if espState.botNames then
		local bb = mkBB(hrp, "ESP_BotName", 120, 18, 3.4)
		mkLbl(bb, "[BOT] " .. model.Name, 10, color)
		table.insert(objs, bb)
	end

	if espState.botHealth and hum then
		local bb  = mkBB(hrp, "ESP_BotHP", 90, 13, 2.7)
		local lbl = mkLbl(bb, math.floor(hum.Health) .. " hp", 9,
			Color3.fromRGB(80 + math.floor(175*(1 - hum.Health/math.max(hum.MaxHealth,1))),
			200 - math.floor(150*(1 - hum.Health/math.max(hum.MaxHealth,1))), 50))
		hum.HealthChanged:Connect(function(h)
			if not espState.botHealth then return end
			local pct = math.clamp(h / math.max(hum.MaxHealth,1), 0, 1)
			lbl.Text       = math.floor(h) .. " hp"
			lbl.TextColor3 = Color3.fromRGB(80+math.floor(175*(1-pct)), 200-math.floor(150*(1-pct)), 50)
		end)
		table.insert(objs, bb)
	end

	if espState.botHealthBar and hum then
		buildHealthBar(hrp, hum, "ESP_BotBar", objs, "botHealthBar")
	end

	if espState.botDistance then
		local bb = mkBB(hrp, "ESP_BotDist", 70, 12, 2.1)
		mkLbl(bb, "?m", 9, Color3.fromRGB(180,180,255))
		table.insert(objs, bb)
	end

	if espState.botSkeletons then
		local isR15 = model:FindFirstChild("UpperTorso") ~= nil
		local skelFolder = Instance.new("Folder", workspace.Terrain)
		skelFolder.Name = "ESP_BotSkel_" .. model.Name

		local function makeBeam(part0, part1, attName)
			local a0 = part0:FindFirstChild(attName) or Instance.new("Attachment", part0)
			a0.Name = attName
			local a1 = part1:FindFirstChild(attName) or Instance.new("Attachment", part1)
			a1.Name = attName
			local beam = Instance.new("Beam", skelFolder)
			beam.Attachment0 = a0
			beam.Attachment1 = a1
			beam.FaceCamera = true
			beam.Width0 = ESP_SKELETON_WIDTH
			beam.Width1 = ESP_SKELETON_WIDTH
			beam.Color = ColorSequence.new(color)
			beam.Transparency = NumberSequence.new(0)
			beam.LightEmission = 1
			beam.LightInfluence = 0
			beam.Brightness = 2
			beam.ZIndex = 100
			table.insert(objs, beam)
		end

		local function getPart(name) return model:FindFirstChild(name) end

		if isR15 then
			local head = getPart("Head")
			local ut = getPart("UpperTorso")
			local lt = getPart("LowerTorso")
			local rua = getPart("RightUpperArm")
			local rla = getPart("RightLowerArm")
			local rh = getPart("RightHand")
			local lua = getPart("LeftUpperArm")
			local lla = getPart("LeftLowerArm")
			local lh = getPart("LeftHand")
			local rul = getPart("RightUpperLeg")
			local rll = getPart("RightLowerLeg")
			local rf = getPart("RightFoot")
			local lul = getPart("LeftUpperLeg")
			local lll = getPart("LeftLowerLeg")
			local lf = getPart("LeftFoot")
			if head and ut then makeBeam(head, ut, "ESP_BotSkel_Att") end
			if ut and lt then makeBeam(ut, lt, "ESP_BotSkel_Att") end
			if ut and rua then makeBeam(ut, rua, "ESP_BotSkel_Att") end
			if rua and rla then makeBeam(rua, rla, "ESP_BotSkel_Att") end
			if rla and rh then makeBeam(rla, rh, "ESP_BotSkel_Att") end
			if ut and lua then makeBeam(ut, lua, "ESP_BotSkel_Att") end
			if lua and lla then makeBeam(lua, lla, "ESP_BotSkel_Att") end
			if lla and lh then makeBeam(lla, lh, "ESP_BotSkel_Att") end
			if lt and rul then makeBeam(lt, rul, "ESP_BotSkel_Att") end
			if rul and rll then makeBeam(rul, rll, "ESP_BotSkel_Att") end
			if rll and rf then makeBeam(rll, rf, "ESP_BotSkel_Att") end
			if lt and lul then makeBeam(lt, lul, "ESP_BotSkel_Att") end
			if lul and lll then makeBeam(lul, lll, "ESP_BotSkel_Att") end
			if lll and lf then makeBeam(lll, lf, "ESP_BotSkel_Att") end
		else
			local head = getPart("Head")
			local torso = getPart("Torso")
			local la = getPart("Left Arm")
			local ra = getPart("Right Arm")
			local ll = getPart("Left Leg")
			local rl = getPart("Right Leg")
			if head and torso then makeBeam(head, torso, "ESP_BotSkel_Att") end
			if torso and la then makeBeam(torso, la, "ESP_BotSkel_Att") end
			if torso and ra then makeBeam(torso, ra, "ESP_BotSkel_Att") end
			if torso and ll then makeBeam(torso, ll, "ESP_BotSkel_Att") end
			if torso and rl then makeBeam(torso, rl, "ESP_BotSkel_Att") end
		end
		table.insert(objs, skelFolder)
	end

	if espState.botSnaplines then
		local attTop = Instance.new("Attachment", hrp)
		attTop.Name = "ESP_BotSnapTop"
		attTop.Position = Vector3.new(0, -0.5, 0)
		local attBot = Instance.new("Attachment", hrp)
		attBot.Name = "ESP_BotSnapBot"
		attBot.Position = Vector3.new(0, -6, 0)
		local beam = Instance.new("Beam", workspace.Terrain)
		beam.Attachment0 = attTop
		beam.Attachment1 = attBot
		beam.FaceCamera = false
		beam.Width0 = 1.5
		beam.Width1 = 0.3
		beam.Color = ColorSequence.new(color)
		beam.Transparency = NumberSequence.new(0.3)
		beam.LightEmission = 1
		beam.LightInfluence = 0
		beam.Brightness = 2
		beam.ZIndex = 100
		table.insert(objs, attTop)
		table.insert(objs, attBot)
		table.insert(objs, beam)
	end

	espBotObjects[model] = objs

	model.AncestryChanged:Connect(function()
		if not model.Parent then
			for _, obj in ipairs(espBotObjects[model] or {}) do
				pcall(function() if obj and obj.Parent then obj:Destroy() end end)
			end
			espBotObjects[model] = nil
		end
	end)
end


function refreshBotESP()
	clearAllBotESP()
	local anyBot = espState.botBoxes or espState.botNames or espState.botHealth or espState.botDistance or espState.botSkeletons or espState.botChams or espState.botHealthBar or espState.botSnaplines
	if not anyBot then return end
	for _, model in ipairs(workspace:GetDescendants()) do
		if isBot(model) then
			pcall(function() buildESPBot(model) end)
		end
	end
end


function mkBB(parent, name, w, h, offsetY)
	local bb = Instance.new("BillboardGui", parent)
	bb.Name          = name
	bb.AlwaysOnTop   = true
	bb.Size          = UDim2.new(0, w, 0, h)
	bb.StudsOffset   = Vector3.new(0, offsetY, 0)
	bb.MaxDistance   = 0        
	bb.LightInfluence = 0
	bb.ResetOnSpawn  = false
	return bb
end


function mkLbl(parent, txt, size, color)
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

function buildESPFor(p)
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

	for _, part in ipairs(char:GetDescendants()) do
		if part:IsA("BasePart") and part.Transparency >= 0.9 then
			part.LocalTransparencyModifier = 0
		end
	end

	
	if espState.playerChams then
		local old = char:FindFirstChild("ESP_Highlight")
		if old then old:Destroy() end
		local hl = Instance.new("Highlight", char)
		hl.Name              = "ESP_Highlight"
		hl.FillColor         = color
		hl.OutlineColor      = Color3.new(1,1,1)
		hl.FillTransparency  = 0.55
		hl.OutlineTransparency = 0.2
		hl.DepthMode         = Enum.HighlightDepthMode.AlwaysOnTop
		
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

	
	if espState.playerBoxes then
		local bb = mkBB(hrp, "ESP_Box", 70, 100, 0)
		bb.StudsOffset = Vector3.new(0, 0.3, 0)
		bb.AlwaysOnTop = true

		local bg = Instance.new("Frame", bb)
		bg.Size = UDim2.new(1,0,1,0)
		bg.BackgroundColor3 = color
		bg.BackgroundTransparency = ESP_FILL_TRANSPARENCY
		bg.BorderSizePixel = 0
		Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 4)

		local outline = Instance.new("UIStroke", bg)
		outline.Color = color
		outline.Thickness = 1.5
		outline.Transparency = 0.15

		if ESP_BOX_STYLE == "corners" then
			local CORNER = 18
			local THICK  = 3.5
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
				Instance.new("UICorner", f).CornerRadius = UDim.new(0, 2)
				local sh = Instance.new("UIStroke", f)
				sh.Color = Color3.new(0,0,0)
				sh.Thickness = 1.5
				sh.Transparency = 0.4
			end
		else
			outline.Thickness = 2
		end

		table.insert(objs, bb)
	end

	if espState.playerHeadDot and head then
		local bb = mkBB(head, "ESP_HeadDot", 6, 6, 0)
		local dot = Instance.new("Frame", bb)
		dot.Size = UDim2.new(1,0,1,0)
		dot.BackgroundColor3 = color
		dot.BorderSizePixel = 0
		Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)
		local glow = Instance.new("UIStroke", dot)
		glow.Color = color
		glow.Thickness = 1
		glow.Transparency = 0.3
		table.insert(objs, bb)
	end

	
	if espState.playerNames then
		local bb  = mkBB(hrp, "ESP_Name", 120, 18, 3.4)
		local lbl = mkLbl(bb, (isAlly and "[A] " or "[E] ") .. p.Name, 10, color)
		lbl.Text = (isAlly and "[A] " or "[E] ") .. p.Name
		table.insert(objs, bb)
	end

	
	if espState.playerHealth and hum then
		local bb  = mkBB(hrp, "ESP_HP", 90, 13, 2.7)
		local lbl = mkLbl(bb, math.floor(hum.Health) .. " hp", 9,
			Color3.fromRGB(80 + math.floor(175*(1 - hum.Health/math.max(hum.MaxHealth,1))),
			200 - math.floor(150*(1 - hum.Health/math.max(hum.MaxHealth,1))), 50))
		hum.HealthChanged:Connect(function(h)
			if not espState.playerHealth then return end
			local pct = math.clamp(h / math.max(hum.MaxHealth,1), 0, 1)
			lbl.Text       = math.floor(h) .. " hp"
			lbl.TextColor3 = Color3.fromRGB(80+math.floor(175*(1-pct)), 200-math.floor(150*(1-pct)), 50)
		end)
		table.insert(objs, bb)
	end

	
	if espState.playerHealthBar and hum then
		buildHealthBar(hrp, hum, "ESP_Bar", objs, "playerHealthBar")
	end

	
	if espState.playerDistance then
		local bb = mkBB(hrp, "ESP_Dist", 70, 12, 2.1)
		mkLbl(bb, "?m", 9, Color3.fromRGB(180,180,255))
		table.insert(objs, bb)
	end

	
	if espState.playerSkeletons then
		local isR15 = char:FindFirstChild("UpperTorso") ~= nil

		local skelFolder = Instance.new("Folder", workspace.Terrain)
		skelFolder.Name = "ESP_Skel_" .. p.Name

		local function makeBeam(part0, part1, attName)
			local a0 = part0:FindFirstChild(attName) or Instance.new("Attachment", part0)
			a0.Name = attName
			local a1 = part1:FindFirstChild(attName) or Instance.new("Attachment", part1)
			a1.Name = attName
			local beam = Instance.new("Beam", skelFolder)
			beam.Attachment0 = a0
			beam.Attachment1 = a1
			beam.FaceCamera = true
			beam.Width0 = ESP_SKELETON_WIDTH
			beam.Width1 = ESP_SKELETON_WIDTH
			beam.Color = ColorSequence.new(color)
			beam.Transparency = NumberSequence.new(0)
			beam.LightEmission = 1
			beam.LightInfluence = 0
			beam.Brightness = 2
			beam.ZIndex = 100
			table.insert(objs, beam)
		end

		local function getPart(name)
			return char:FindFirstChild(name)
		end

		if isR15 then
			local head = getPart("Head")
			local ut = getPart("UpperTorso")
			local lt = getPart("LowerTorso")
			local rua = getPart("RightUpperArm")
			local rla = getPart("RightLowerArm")
			local rh = getPart("RightHand")
			local lua = getPart("LeftUpperArm")
			local lla = getPart("LeftLowerArm")
			local lh = getPart("LeftHand")
			local rul = getPart("RightUpperLeg")
			local rll = getPart("RightLowerLeg")
			local rf = getPart("RightFoot")
			local lul = getPart("LeftUpperLeg")
			local lll = getPart("LeftLowerLeg")
			local lf = getPart("LeftFoot")

			if head and ut then makeBeam(head, ut, "ESP_Skel_Att") end
			if ut and lt then makeBeam(ut, lt, "ESP_Skel_Att") end
			if ut and rua then makeBeam(ut, rua, "ESP_Skel_Att") end
			if rua and rla then makeBeam(rua, rla, "ESP_Skel_Att") end
			if rla and rh then makeBeam(rla, rh, "ESP_Skel_Att") end
			if ut and lua then makeBeam(ut, lua, "ESP_Skel_Att") end
			if lua and lla then makeBeam(lua, lla, "ESP_Skel_Att") end
			if lla and lh then makeBeam(lla, lh, "ESP_Skel_Att") end
			if lt and rul then makeBeam(lt, rul, "ESP_Skel_Att") end
			if rul and rll then makeBeam(rul, rll, "ESP_Skel_Att") end
			if rll and rf then makeBeam(rll, rf, "ESP_Skel_Att") end
			if lt and lul then makeBeam(lt, lul, "ESP_Skel_Att") end
			if lul and lll then makeBeam(lul, lll, "ESP_Skel_Att") end
			if lll and lf then makeBeam(lll, lf, "ESP_Skel_Att") end
		else
			local head = getPart("Head")
			local torso = getPart("Torso")
			local la = getPart("Left Arm")
			local ra = getPart("Right Arm")
			local ll = getPart("Left Leg")
			local rl = getPart("Right Leg")

			if head and torso then makeBeam(head, torso, "ESP_Skel_Att") end
			if torso and la then makeBeam(torso, la, "ESP_Skel_Att") end
			if torso and ra then makeBeam(torso, ra, "ESP_Skel_Att") end
			if torso and ll then makeBeam(torso, ll, "ESP_Skel_Att") end
			if torso and rl then makeBeam(torso, rl, "ESP_Skel_Att") end
		end

		table.insert(objs, skelFolder)

		local hl2 = Instance.new("Highlight", char)
		hl2.Name = "ESP_SkelHL"
		hl2.FillTransparency = 1
		hl2.OutlineColor = color
		hl2.OutlineTransparency = 0.5
		hl2.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		table.insert(objs, hl2)
	end

	if espState.playerSnaplines then
		local attTop = Instance.new("Attachment", hrp)
		attTop.Name = "ESP_SnapTop"
		attTop.Position = Vector3.new(0, -0.5, 0)
		local attBot = Instance.new("Attachment", hrp)
		attBot.Name = "ESP_SnapBot"
		attBot.Position = Vector3.new(0, -6, 0)
		local beam = Instance.new("Beam", workspace.Terrain)
		beam.Attachment0 = attTop
		beam.Attachment1 = attBot
		beam.FaceCamera = false
		beam.Width0 = 1.5
		beam.Width1 = 0.3
		beam.Color = ColorSequence.new(color)
		beam.Transparency = NumberSequence.new(0.3)
		beam.LightEmission = 1
		beam.LightInfluence = 0
		beam.Brightness = 2
		beam.ZIndex = 100
		table.insert(objs, attTop)
		table.insert(objs, attBot)
		table.insert(objs, beam)
	end

	espObjects[p] = objs
end


function updateDistances()
	local myHRP = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if not myHRP then return end

	
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

	
	for model, objs in pairs(espBotObjects) do
		if model and model.Parent then
			local hrp = model:FindFirstChild("HumanoidRootPart")
			if hrp then
				local dist = math.floor((hrp.Position - myHRP.Position).Magnitude)
				local visible = (ESP_MAX_DIST_BOT == 0) or (dist <= ESP_MAX_DIST_BOT)
				for _, obj in ipairs(objs) do
					if obj:IsA("BillboardGui") then
						obj.Enabled = visible
						if obj.Name == "ESP_BotDist" then
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
end


function refreshAllESP()
	for _, p in ipairs(Players:GetPlayers()) do
		buildESPFor(p)
	end
	local anyBot = espState.botBoxes or espState.botNames or espState.botHealth or espState.botDistance or espState.botSkeletons or espState.botChams or espState.botHealthBar
	if anyBot then refreshBotESP() end
	buildSelfESP()
end



function toggleESP(key, state)
	espState[key] = state
	if key == "selfESP" then
		buildSelfESP()
	end
	refreshAllESP()
end


function clearSelfESP()
	for _, obj in ipairs(espSelfObjects) do
		pcall(function() if obj and obj.Parent then obj:Destroy() end end)
	end
	espSelfObjects = {}
end


function buildSelfESP()
	clearSelfESP()
	if not espState.selfESP then return end
	local char = player.Character
	if not char then return end
	local hum  = char:FindFirstChildOfClass("Humanoid")
	local hrp  = char:FindFirstChild("HumanoidRootPart")
	if not hrp or not hum then return end

	local color = ESP_COLOR_SELF
	local objs  = {}

	local bb = mkBB(hrp, "ESP_SelfName", 140, 18, -2.5)
	mkLbl(bb, player.Name .. " (You)", 10, color)
	table.insert(objs, bb)

	local hpBB = mkBB(hrp, "ESP_SelfHP", 90, 13, -3.2)
	local hpLbl = mkLbl(hpBB, math.floor(hum.Health) .. " hp", 9, color)
	hum.HealthChanged:Connect(function(h)
		if not espState.selfESP then return end
		local pct = math.clamp(h / math.max(hum.MaxHealth,1), 0, 1)
		hpLbl.Text       = math.floor(h) .. " hp"
		hpLbl.TextColor3 = Color3.fromRGB(80+math.floor(175*(1-pct)), 200-math.floor(150*(1-pct)), 50)
	end)
	table.insert(objs, hpBB)

	local hl = Instance.new("Highlight", char)
	hl.Name = "ESP_SelfHL"
	hl.FillColor = color
	hl.OutlineColor = color
	hl.FillTransparency = 0.7
	hl.OutlineTransparency = 0.3
	hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	table.insert(objs, hl)

	espSelfObjects = objs
end


function createColorDropdown(parent, label, order, defaultColor, onChange)
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


createSection(pages.ESP, "👤  Players", 0)
createToggle(pages.ESP, "✅  TOUT Joueurs", 1, function(s)
	toggleESP("playerBoxes", s); toggleESP("playerNames", s)
	toggleESP("playerHealth", s); toggleESP("playerHealthBar", s)
	toggleESP("playerDistance", s); toggleESP("playerSkeletons", s)
	toggleESP("playerChams", s); toggleESP("playerSnaplines", s)
	toggleESP("playerHeadDot", s)
end, nil)
createToggle(pages.ESP, "📦  Boxes", 10, function(s) toggleESP("playerBoxes", s) end, "espPlayerBoxes")
createToggle(pages.ESP, "🏷  Names + Team", 11, function(s) toggleESP("playerNames", s) end, "espPlayerNames")
createToggle(pages.ESP, "❤  Health (text)", 12, function(s) toggleESP("playerHealth", s) end, "espPlayerHealth")
createToggle(pages.ESP, "📊  Health Bar", 13, function(s) toggleESP("playerHealthBar", s) end, "espPlayerHealthBar")
createToggle(pages.ESP, "📏  Distance", 14, function(s) toggleESP("playerDistance", s) end, "espPlayerDistance")
createToggle(pages.ESP, "⚫  Head Dot", 15, function(s) toggleESP("playerHeadDot", s) end, "espPlayerHeadDot")
createToggle(pages.ESP, "💀  Skeleton", 16, function(s) toggleESP("playerSkeletons", s) end, "espPlayerSkeletons")
createToggle(pages.ESP, "🔆  Chams", 17, function(s) toggleESP("playerChams", s) end, "espPlayerChams")
createToggle(pages.ESP, "📐  Snaplines", 18, function(s) toggleESP("playerSnaplines", s) end, "espPlayerSnaplines")

createSection(pages.ESP, "🤖  Bots / NPC", 20)
createToggle(pages.ESP, "✅  TOUT Bots", 21, function(s)
	toggleESP("botBoxes", s); toggleESP("botNames", s)
	toggleESP("botHealth", s); toggleESP("botHealthBar", s)
	toggleESP("botDistance", s); toggleESP("botSkeletons", s)
	toggleESP("botChams", s); toggleESP("botSnaplines", s)
	toggleESP("botHeadDot", s)
end, nil)
createToggle(pages.ESP, "📦  Bot Boxes", 30, function(s) toggleESP("botBoxes", s) end, "espBotBoxes")
createToggle(pages.ESP, "🏷  Bot Names", 31, function(s) toggleESP("botNames", s) end, "espBotNames")
createToggle(pages.ESP, "❤  Bot Health", 32, function(s) toggleESP("botHealth", s) end, "espBotHealth")
createToggle(pages.ESP, "📊  Bot Health Bar", 33, function(s) toggleESP("botHealthBar", s) end, "espBotHealthBar")
createToggle(pages.ESP, "📏  Bot Distance", 34, function(s) toggleESP("botDistance", s) end, "espBotDistance")
createToggle(pages.ESP, "⚫  Bot Head Dot", 35, function(s) toggleESP("botHeadDot", s) end, "espBotHeadDot")
createToggle(pages.ESP, "💀  Bot Skeleton", 36, function(s) toggleESP("botSkeletons", s) end, "espBotSkeletons")
createToggle(pages.ESP, "🔆  Bot Chams", 37, function(s) toggleESP("botChams", s) end, "espBotChams")
createToggle(pages.ESP, "📐  Bot Snaplines", 38, function(s) toggleESP("botSnaplines", s) end, "espBotSnaplines")
createBtn(pages.ESP, "🔄  Scan Bots Now", currentTheme.Button, 39, function()
	local anyBot = espState.botBoxes or espState.botNames or espState.botHealth or espState.botDistance or espState.botSkeletons or espState.botChams or espState.botHealthBar or espState.botSnaplines or espState.botHeadDot
	if anyBot then refreshBotESP()
	else showNotification("⚠  Active un toggle Bot ESP d'abord", 2) end
end)

createSection(pages.ESP, "👻  Self", 40)
createToggle(pages.ESP, "👻  Show Self ESP", 41, function(s) toggleESP("selfESP", s) end, "espSelf")

createSection(pages.ESP, "🎨  Couleurs", 50)
createColorDropdown(pages.ESP, "🔴  Enemy", 51,
	Color3.fromRGB(255,60,60),
	function(c) ESP_COLOR_ENEMY = c; refreshAllESP() end
)
createColorDropdown(pages.ESP, "🔵  Ally", 52,
	Color3.fromRGB(80,160,255),
	function(c) ESP_COLOR_ALLY = c; refreshAllESP() end
)
createColorDropdown(pages.ESP, "🟡  Bot", 53,
	Color3.fromRGB(255,200,0),
	function(c) ESP_COLOR_BOT = c; local anyBot = espState.botBoxes or espState.botNames or espState.botHealth or espState.botDistance or espState.botSkeletons or espState.botChams or espState.botHealthBar or espState.botSnaplines or espState.botHeadDot; if anyBot then refreshBotESP() end end
)
createColorDropdown(pages.ESP, "🔷  Self", 54,
	Color3.fromRGB(80,160,255),
	function(c) ESP_COLOR_SELF = c; buildSelfESP() end
)

createSection(pages.ESP, "⚙  Style", 60)
createSlider(pages.ESP, "🔲  Fill Transparence", 0, 100, 85, 61, function(val)
	ESP_FILL_TRANSPARENCY = val / 100
	refreshAllESP()
end)
local boxStyleBtn = nil
boxStyleBtn = createBtn(pages.ESP, "📦  Box Style: " .. ESP_BOX_STYLE, currentTheme.Button, 62, function(btn)
	ESP_BOX_STYLE = (ESP_BOX_STYLE == "corners") and "full" or "corners"
	btn.Text = "📦  Box Style: " .. ESP_BOX_STYLE
	refreshAllESP()
end)
createSlider(pages.ESP, "💀  Epaisseur Skeleton", 5, 50, 15, 63, function(val)
	ESP_SKELETON_WIDTH = val / 100
	refreshAllESP()
end)

createSection(pages.ESP, "📏  Distance Max", 70)
createSlider(pages.ESP, "👥  Joueurs (0 = infini)", 0, 2000, 0, 71, function(val)
	ESP_MAX_DIST_PLAYER = val
	refreshAllESP()
end)
createSlider(pages.ESP, "🤖  Bots (0 = infini)", 0, 2000, 0, 72, function(val)
	ESP_MAX_DIST_BOT = val
	local anyBot = espState.botBoxes or espState.botNames or espState.botHealth or espState.botDistance or espState.botSkeletons or espState.botChams or espState.botHealthBar or espState.botSnaplines or espState.botHeadDot
	if anyBot then refreshBotESP() end
end)

createSection(pages.Other, "👑  Credits", 60)

credits = {
	{"👑  Owner","bkz"},
	{"🤝  Contributor","All people use menu thx you !"},
}

creditRows = {}
for i, entry in ipairs(credits) do
	local row = Instance.new("Frame", pages.Other)
	row.Size = UDim2.new(1, 0, 0, 44)
	row.BackgroundColor3 = currentTheme.Panel
	row.BorderSizePixel = 0
	row.LayoutOrder = 60 + i
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

	creditRows[i] = {row = row, role = role, nameLbl = nameLbl}
end

onThemeChanged(function(t)
	for _, cr in ipairs(creditRows) do
		cr.row.BackgroundColor3 = t.Panel
		cr.role.TextColor3 = t.Accent
		cr.nameLbl.TextColor3 = t.Text
	end
end)

createSection(pages.Other, "ℹ  Informations", 70)
verFrame = Instance.new("Frame", pages.Other)
verFrame.Size = UDim2.new(1, 0, 0, 90)
verFrame.BackgroundColor3 = currentTheme.Panel
verFrame.BorderSizePixel = 0
verFrame.LayoutOrder = 71
Instance.new("UICorner", verFrame).CornerRadius = UDim.new(0, 10)
verPad = Instance.new("UIPadding", verFrame)
verPad.PaddingLeft = UDim.new(0, 12); verPad.PaddingTop = UDim.new(0, 8)

verLabel = Instance.new("TextLabel", verFrame)
verLabel.Size = UDim2.new(1, -12, 0, 16)
verLabel.BackgroundTransparency = 1
verLabel.Text = "🌐 bkz HUB  v5.7"
verLabel.TextColor3 = currentTheme.Accent
verLabel.Font = Enum.Font.GothamBold
verLabel.TextSize = 14
verLabel.TextXAlignment = Enum.TextXAlignment.Left

controlsLabel = Instance.new("TextLabel", verFrame)
controlsLabel.Size = UDim2.new(1, -12, 0, 36)
controlsLabel.Position = UDim2.new(0, 0, 0, 20)
controlsLabel.BackgroundTransparency = 1
controlsLabel.Text = "🎮  [B]  Open/Close  |  [Edge] Resize\n🖱  Drag title to move  |  🔒 Lock"
controlsLabel.TextColor3 = currentTheme.Text
controlsLabel.Font = Enum.Font.Gotham
controlsLabel.TextSize = 12
controlsLabel.TextXAlignment = Enum.TextXAlignment.Left
controlsLabel.TextWrapped = true

featLabel = Instance.new("TextLabel", verFrame)
featLabel.Size = UDim2.new(1, -12, 0, 16)
featLabel.Position = UDim2.new(0, 0, 0, 58)
featLabel.BackgroundTransparency = 1
featLabel.Text = "🔥 Bypass • Force Modes • ESP HD • Freecam"
featLabel.TextColor3 = currentTheme.SubText
featLabel.Font = Enum.Font.Gotham
featLabel.TextSize = 10
featLabel.TextXAlignment = Enum.TextXAlignment.Left

onThemeChanged(function(t)
	verFrame.BackgroundColor3 = t.Panel
	verLabel.TextColor3 = t.Accent
	controlsLabel.TextColor3 = t.Text
	featLabel.TextColor3 = t.SubText
end)
	





freecamActive = false
freecamMoveConn, freecamRotateConn, freecamScrollConn = nil
freecamKeyBeginConn, freecamKeyEndConn = nil
freecamCamPos, freecamCamRot, freecamZoom = CFrame.new(), Vector2.new(), 50
freecamSpeed = 50
freecamFrozenParts = {}
freecamAnchorConn = nil
keyLayout = "QWERTY"
keyMaps = {
	QWERTY = {[Enum.KeyCode.W]="W",[Enum.KeyCode.A]="A",[Enum.KeyCode.S]="S",[Enum.KeyCode.D]="D",[Enum.KeyCode.Space]="Space",[Enum.KeyCode.LeftShift]="LShift"},
	AZERTY = {[Enum.KeyCode.Z]="W",[Enum.KeyCode.Q]="A",[Enum.KeyCode.S]="S",[Enum.KeyCode.D]="D",[Enum.KeyCode.Space]="Space",[Enum.KeyCode.LeftShift]="LShift"},
}

function startFreecam()
	local cam = workspace.CurrentCamera
	freecamActive = true
	freecamCamPos = cam.CFrame.Position
	freecamCamRot = Vector2.new(cam.CFrame:ToEulerAnglesYXZ())
	freecamZoom = 50
	freecamFrozenParts = {}

	local char = player.Character
	if char then
		local hum = char:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.PlatformStand = true
			hum.WalkSpeed = 0
			hum.JumpPower = 0
			hum.JumpHeight = 0
		end
		for _, part in ipairs(char:GetDescendants()) do
			if part:IsA("BasePart") then
				freecamFrozenParts[part] = {
					Anchored = part.Anchored,
					Velocity = part.Velocity,
					RotVelocity = part.RotVelocity,
					Transparency = part.Transparency,
				}
				part.Anchored = true
				part.Velocity = Vector3.new(0,0,0)
				part.RotVelocity = Vector3.new(0,0,0)
			end
		end
	end
	cam.CameraType = Enum.CameraType.Scriptable
	cam.FieldOfView = 70

	local keys = {W=false, A=false, S=false, D=false, Space=false, LShift=false, Q=false, E=false}
	local mousePressed = false
	local lastMousePos = Vector2.new()
	local freecamMouseSens = 0.0015

	freecamMoveConn = RunService.RenderStepped:Connect(function(dt)
		if not freecamActive then return end
		local forward = (cam.CFrame.LookVector * Vector3.new(1,0,1)).Unit
		local right = (cam.CFrame.RightVector * Vector3.new(1,0,1)).Unit
		local up = Vector3.new(0,1,0)
		local vel = Vector3.new()
		if keys.W then vel = vel + forward end
		if keys.S then vel = vel - forward end
		if keys.A then vel = vel - right end
		if keys.D then vel = vel + right end
		if keys.Space then vel = vel + up end
		if keys.LShift then vel = vel - up end
		if keys.Q then vel = vel - forward:Cross(up).Unit end
		if keys.E then vel = vel + forward:Cross(up).Unit end
		local spd = (keys.LShift or keys.Space) and freecamSpeed * 0.4 or freecamSpeed
		if keys.Q or keys.E then spd = freecamSpeed * 0.5 end
		if vel.Magnitude > 0 then
			vel = vel.Unit * spd * dt
			freecamCamPos = freecamCamPos + vel
		end
		local cf = CFrame.new(freecamCamPos) * CFrame.Angles(0, -freecamCamRot.X, 0) * CFrame.Angles(-freecamCamRot.Y, 0, 0)
		cf = cf + cf.LookVector * freecamZoom
		cam.CFrame = cf
	end)

	freecamRotateConn = UIS.InputChanged:Connect(function(input)
		if not freecamActive or not mousePressed then return end
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = input.Position - lastMousePos
			freecamCamRot = freecamCamRot + Vector2.new(delta.X, delta.Y) * freecamMouseSens
			freecamCamRot = Vector2.new(freecamCamRot.X, math.clamp(freecamCamRot.Y, -1.4, 1.4))
			lastMousePos = input.Position
		end
	end)

	freecamScrollConn = UIS.InputChanged:Connect(function(input)
		if not freecamActive then return end
		if input.UserInputType == Enum.UserInputType.MouseWheel then
			freecamZoom = math.clamp(freecamZoom - input.Position.Z * 3, 1, 200)
		end
	end)

	freecamKeyBeginConn = UIS.InputBegan:Connect(function(input, gpe)
		if gpe or not freecamActive then return end
		local m = keyMaps[keyLayout]
		if m then local k = m[input.KeyCode]; if k then keys[k] = true end end
		if input.KeyCode == Enum.KeyCode.Space then keys.Space = true end
		if input.KeyCode == Enum.KeyCode.LeftShift then keys.LShift = true end
		if input.KeyCode == Enum.KeyCode.Q then keys.Q = true end
		if input.KeyCode == Enum.KeyCode.E then keys.E = true end
		if input.UserInputType == Enum.UserInputType.MouseButton2 then
			mousePressed = true
			lastMousePos = input.Position
		end
	end)

	freecamKeyEndConn = UIS.InputEnded:Connect(function(input, gpe)
		if gpe or not freecamActive then return end
		local m = keyMaps[keyLayout]
		if m then local k = m[input.KeyCode]; if k then keys[k] = false end end
		if input.KeyCode == Enum.KeyCode.Space then keys.Space = false end
		if input.KeyCode == Enum.KeyCode.LeftShift then keys.LShift = false end
		if input.KeyCode == Enum.KeyCode.Q then keys.Q = false end
		if input.KeyCode == Enum.KeyCode.E then keys.E = false end
		if input.UserInputType == Enum.UserInputType.MouseButton2 then
			mousePressed = false
		end
	end)
end

function unfreezeCharacter()
	for part, data in pairs(freecamFrozenParts) do
		pcall(function()
			part.Anchored = data.Anchored
			part.Velocity = data.Velocity
			part.RotVelocity = data.RotVelocity
		end)
	end
	freecamFrozenParts = {}
	local char = player.Character
	if char then
		local hum = char:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.PlatformStand = false
			hum.WalkSpeed = savedWalkSpeed or 16
			hum.JumpPower = savedJumpPower or 50
		end
	end
end

function tpToFreecam()
	local char = player.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end
	hrp.CFrame = CFrame.new(freecamCamPos + Vector3.new(0, 3, 0))
	for part, data in pairs(freecamFrozenParts) do
		pcall(function()
			part.Anchored = data.Anchored
			part.Velocity = data.Velocity
			part.RotVelocity = data.RotVelocity
		end)
	end
	freecamFrozenParts = {}
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum then
		hum.PlatformStand = false
		hum.WalkSpeed = savedWalkSpeed or 16
		hum.JumpPower = savedJumpPower or 50
	end
end

function stopFreecam()
	freecamActive = false
	if freecamMoveConn then freecamMoveConn:Disconnect(); freecamMoveConn = nil end
	if freecamRotateConn then freecamRotateConn:Disconnect(); freecamRotateConn = nil end
	if freecamScrollConn then freecamScrollConn:Disconnect(); freecamScrollConn = nil end
	if freecamKeyBeginConn then freecamKeyBeginConn:Disconnect(); freecamKeyBeginConn = nil end
	if freecamKeyEndConn then freecamKeyEndConn:Disconnect(); freecamKeyEndConn = nil end
	workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
	unfreezeCharacter()
end

createSection(pages.Other, "📷  Freecam", 50)
createToggle(pages.Other, "📷  Freecam (Right Click)", 51, function(state)
	if state then startFreecam() else stopFreecam() end
end, "freecamEnabled")
createSlider(pages.Other, "⚡  Speed Freecam", 10, 500, 50, 52, function(val)
	freecamSpeed = val
end)
createBtn(pages.Other, "📍  TP Joueur → Freecam", currentTheme.Accent, 53, function()
	if freecamActive then
		tpToFreecam()
		showNotification("📍  Téléporté à la freecam", 2)
	else
		showNotification("⚠  Active la freecam d'abord", 2)
	end
end)
createBtn(pages.Other, "⌨  Keys: " .. keyLayout, currentTheme.Button, 54, function(btn)
	local layouts = {"QWERTY", "AZERTY"}
	for i, l in ipairs(layouts) do
		if l == keyLayout then
			keyLayout = layouts[i % #layouts + 1]
			break
		end
	end
	btn.Text = "⌨  Keys: " .. keyLayout
end)




function startESP()
	Players.PlayerAdded:Connect(function(p)
		p.CharacterAdded:Connect(function() task.wait(1); buildESPFor(p) end)
	end)
	Players.PlayerRemoving:Connect(function(p) clearESPFor(p) end)

	player.CharacterAdded:Connect(function()
		task.wait(1)
		if espState.selfESP then buildSelfESP() end
	end)

	
	RunService:BindToRenderStep("ESP_Update", Enum.RenderPriority.Last.Value, function()
		local anyPlayer = espState.playerDistance or espState.playerHealthBar or espState.playerHealth or espState.playerSkeletons or espState.playerBoxes or espState.playerChams or espState.playerNames or espState.playerHeadDot or espState.playerSnaplines
		local anyBot = espState.botBoxes or espState.botNames or espState.botHealth or espState.botDistance or espState.botSkeletons or espState.botChams or espState.botHealthBar or espState.botSnaplines or espState.botHeadDot
		if anyPlayer then
			for _, p in ipairs(Players:GetPlayers()) do
				if p ~= player and p.Character then
					for _, part in ipairs(p.Character:GetDescendants()) do
						if part:IsA("BasePart") and part.Transparency >= 0.9 then
							part.LocalTransparencyModifier = 0
						end
					end
				end
			end
		end
		if anyPlayer or anyBot or espState.selfESP then
			if ESP_MAX_DIST_PLAYER > 0 or ESP_MAX_DIST_BOT > 0 or espState.playerDistance or espState.botDistance then
				updateDistances()
			end
		end
	end)

	
	task.spawn(function()
		while true do
			task.wait(5)
			local anyBot = espState.botBoxes or espState.botNames or espState.botHealth or espState.botDistance or espState.botSkeletons or espState.botChams or espState.botHealthBar
			if anyBot then refreshBotESP() end
		end
	end)

	
	workspace.DescendantAdded:Connect(function(obj)
		local anyBot = espState.botBoxes or espState.botNames or espState.botHealth or espState.botDistance or espState.botSkeletons or espState.botChams or espState.botHealthBar
		if anyBot and obj:IsA("Model") then
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

end)

if UIS.TouchEnabled then
	local mgui = Instance.new("ScreenGui", playerGui)
	mgui.Name = "AdminMenuBtn"
	mgui.ResetOnSpawn = false
	mgui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	mgui.DisplayOrder = 1000
	local mbtn = Instance.new("TextButton", mgui)
	mbtn.Size = UDim2.new(0, 56, 0, 56)
	mbtn.Position = UDim2.new(1, -20, 1, -20)
	mbtn.AnchorPoint = Vector2.new(1, 1)
	mbtn.BackgroundColor3 = currentTheme.Accent
	mbtn.BorderSizePixel = 0
	mbtn.Text = "☰"
	mbtn.TextColor3 = Color3.new(1, 1, 1)
	mbtn.Font = Enum.Font.GothamBold
	mbtn.TextSize = 24
	mbtn.ZIndex = 100
	Instance.new("UICorner", mbtn).CornerRadius = UDim.new(1, 0)
	local mstroke = Instance.new("UIStroke", mbtn)
	mstroke.Color = Color3.new(1,1,1)
	mstroke.Transparency = 0.7
	mstroke.Thickness = 1.5
	mbtn.MouseButton1Click:Connect(function()
		if gui.Enabled then closeMenu() else openMenu() end
	end)
	onThemeChanged(function(t)
		mbtn.BackgroundColor3 = t.Accent
	end)
end

if scrSuccess then
	task.spawn(function()
		task.wait(1.5)
		openMenu()
	end)
end

if not scrSuccess then
	warn("bkz HUB Error:", scrError)
	
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
