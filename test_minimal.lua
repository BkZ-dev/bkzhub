local scrSuccess, scrError = pcall(function()
wait(1)

local Players = game:GetService("Players")
local player = Players.LocalPlayer

if player and player:FindFirstChild("PlayerGui") then
	local gui = Instance.new("ScreenGui", player.PlayerGui)
	gui.Name = "TestGUI"
	local lbl = Instance.new("TextLabel", gui)
	lbl.Size = UDim2.new(0, 300, 0, 100)
	lbl.Position = UDim2.new(0.5, -150, 0.5, -50)
	lbl.BackgroundColor3 = Color3.fromRGB(30,30,30)
	lbl.TextColor3 = Color3.new(1,1,1)
	lbl.Text = "bkz HUB - Test"
	lbl.Font = Enum.Font.GothamBold
	lbl.TextSize = 20
	lbl.BackgroundTransparency = 0
end

end)
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
