-- 🔒 Delta Executor Check & KRNL Suggestion by Zein Corte
local function isUsingDelta()
	return identifyexecutor and string.lower(identifyexecutor() or ""):find("delta")
end

if isUsingDelta() then
	local player = game.Players.LocalPlayer
	local playerGui = player:WaitForChild("PlayerGui")

	local deltaGui = Instance.new("ScreenGui", playerGui)
	deltaGui.Name = "BlockDelta"
	deltaGui.ResetOnSpawn = false

	local frame = Instance.new("Frame", deltaGui)
	frame.Size = UDim2.new(0, 350, 0, 200)
	frame.Position = UDim2.new(0.5, -175, 0.5, -100)
	frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	frame.BorderSizePixel = 0
	frame.AnchorPoint = Vector2.new(0.5, 0.5)

	local label = Instance.new("TextLabel", frame)
	label.Size = UDim2.new(1, 0, 0.4, 0)
	label.Position = UDim2.new(0, 0, 0, 0)
	label.Text = "Delta Executor is blocked.\nUse KRNL instead."
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.GothamSemibold
	label.TextSize = 18
	label.TextWrapped = true

	local copyButton = Instance.new("TextButton", frame)
	copyButton.Size = UDim2.new(0.8, 0, 0.2, 0)
	copyButton.Position = UDim2.new(0.1, 0, 0.45, 0)
	copyButton.Text = "Copy KRNL Download Link"
	copyButton.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
	copyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	copyButton.Font = Enum.Font.Gotham
	copyButton.TextSize = 14

	copyButton.MouseButton1Click:Connect(function()
		setclipboard("https://krnl.place")
		copyButton.Text = "Copied!"
	end)

	local warning = Instance.new("TextLabel", frame)
	warning.Size = UDim2.new(1, 0, 0.2, 0)
	warning.Position = UDim2.new(0, 0, 0.7, 0)
	warning.Text = "You will be kicked in 20 seconds."
	warning.TextColor3 = Color3.fromRGB(255, 85, 85)
	warning.BackgroundTransparency = 1
	warning.Font = Enum.Font.GothamSemibold
	warning.TextSize = 16
	warning.TextWrapped = true

	task.delay(20, function()
		game.Players.LocalPlayer:Kick("Delta is blocked. Use KRNL instead.")
	end)
	return
end

-- ⏳ Fake Loading Screen
local loadingGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
loadingGui.Name = "ZeinLoading"

local bg = Instance.new("Frame", loadingGui)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

local loadingLabel = Instance.new("TextLabel", bg)
loadingLabel.Size = UDim2.new(1, 0, 1, 0)
loadingLabel.Text = "Loading... 0%"
loadingLabel.TextColor3 = Color3.new(1, 1, 1)
loadingLabel.BackgroundTransparency = 1
loadingLabel.Font = Enum.Font.GothamBlack
loadingLabel.TextScaled = true

for i = 1, 100 do
	loadingLabel.Text = "Loading... " .. i .. "%"
	wait(0.015)
end

loadingGui:Destroy()
