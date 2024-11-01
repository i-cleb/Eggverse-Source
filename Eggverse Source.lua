-----------------------------------------------------------------------------------------------imports
local LocalPlayer = game:GetService("Players").LocalPlayer
local TweenService = game:GetService("TweenService")
local GUI = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

local canTele = true
local BlueEvent = ReplicatedStorage:FindFirstChild("BlueAnim")
local RedEvent = ReplicatedStorage:FindFirstChild("RedAnim")
local BlackoutEvent = ReplicatedStorage:FindFirstChild("Blackout")

local BlueA = workspace["Starting Island"]["Portal Podium"]["Blue Portal"].BlueA
local BlueB = workspace["Water Island"]["Blue Portal"].BlueB
local RedA = workspace["Starting Island"]["Portal Podium"]["Red Portal"].RedA
local RedB = workspace["Red Portal"].RedB

local RaftA = workspace["Water Island"].RaftA.Teleport
local RaftAPiv = workspace["Water Island"].RaftA.PrimaryPart
local RaftB = workspace["Water Island"].RaftB.Teleport

local PodiumSpawn = workspace["Starting Island"]["Portal Podium"].PodiumSpawn
local hat1 = workspace["Water Island"].Hat1
local prompt = hat1.ProximityPrompt
local diag2_1 = workspace["Water Island"]["Easter Island Head"].DiagHolder["Dialog2-1"]
local diag2_2 = ServerStorage["Dialog2-2"]
local hatProx = workspace["Water Island"]["Easter Island Head"].ProxHolder.GiveHat
local hat2 = ServerStorage.Hat2

local haveWaterEgg = false
local haveFireEgg = false
local haveGrassEgg = false
local haveSandEgg = false

-----------------------------------------------------------------------------------------------water island code
function blueTeleA(part)
	local humanoid = part.Parent:FindFirstChild("HumanoidRootPart")
	if humanoid then
		if canTele then
			BlueEvent:FireAllClients()
			canTele = false
			wait(2)
			humanoid.CFrame = BlueB.CFrame + Vector3.new(0,0,-5)
			wait(1)
			canTele = true
		end
	end
end
BlueA.Touched:Connect(blueTeleA)
		
function blueTeleB(part)
	local humanoid = part.Parent:FindFirstChild("HumanoidRootPart")
	if humanoid then
		if canTele then
			BlueEvent:FireAllClients()
			canTele = false
			wait(2)
			humanoid.CFrame = BlueA.CFrame + Vector3.new(-5,0,0)
			wait(1)
			canTele = true
		end
	end
end
BlueB.Touched:Connect(blueTeleB)

function destroyHat()
	hat1:Destroy()
	diag2_1:Destroy()
	hatProx.Enabled = true
end
prompt.Triggered:Connect(destroyHat)

function giveHat()
	hatProx.Enabled = false
	local diagCopy = diag2_2:Clone()
	local hat2Copy = hat2:Clone()
	diagCopy.Parent = workspace["Water Island"]["Easter Island Head"].DiagHolder
	hat2Copy.Parent = workspace["Water Island"]["Easter Island Head"].DiagHolder
	
	local RaftUp = CFrame.new(-146.5, -4.2, 146.546)
	
	local Info = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)

	local CFValue = Instance.new("CFrameValue")
	CFValue.Changed:Connect(function(V)
		RaftA:PivotTo(V)
	end)

	local Tween = TweenService:Create(CFValue, Info, {Value = RaftUp})
	CFValue.Value = RaftA:GetPivot()
	Tween:Play()
end
hatProx.Triggered:Connect(giveHat)

function raftTeleA(part)
	local humanoid = part.Parent:FindFirstChild("HumanoidRootPart")
	if humanoid then
		if canTele then
			canTele = false
			wait(1)
			humanoid.CFrame = RaftB.CFrame + Vector3.new(0,0,0)
			wait(5)
			canTele = true
		end
	end
end
RaftA.Touched:Connect(raftTeleA)

function raftTeleB(part)
	local humanoid = part.Parent:FindFirstChild("HumanoidRootPart")
	if humanoid then
		if canTele then
			canTele = false
			wait(1)
			humanoid.CFrame = RaftA.CFrame + Vector3.new(0,0,0)
			wait(5)
			canTele = true
		end
	end
end
RaftB.Touched:Connect(raftTeleB)

local WaterGate = workspace["Water Island"]["Water Temple"].Gate.PrimaryPart
local WaterGatePrompt = workspace["Water Island"]["Water Temple"].Gate.PromptHolder.GatePrompt

function gateDown()
	WaterGatePrompt:Destroy()
	local GateClosed = CFrame.new(-152.77, -5, 2659.198)
	
	local Info = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
	
	local CFValue = Instance.new("CFrameValue")
	CFValue.Changed:Connect(function(V)
		WaterGate:PivotTo(V)
	end)
	
	local Tween = TweenService:Create(CFValue, Info, {Value = GateClosed})
	CFValue.Value = WaterGate:GetPivot()
	Tween:Play()
end
WaterGatePrompt.Triggered:Connect(gateDown)

local WaterEgg = workspace["Water Island"]["Water Temple"]["Egg Pillar"].EggPlaceHolder

function onWaterEggTouch(part)
	local humanoid = part.Parent:FindFirstChild("HumanoidRootPart")
	if humanoid then
		WaterEgg:Destroy()
		haveWaterEgg = true
		RedA.Position = Vector3.new(6.112, 963.566, -196.581)
		wait(2)
		BlackoutEvent:FireAllClients()
		humanoid.CFrame = PodiumSpawn.CFrame + Vector3.new(0,5,0)
		wait(1)
	end
end
WaterEgg.Touched:Connect(onWaterEggTouch)
-----------------------------------------------------------------------------------------------fire island code
function redTeleA(part)
	local humanoid = part.Parent:FindFirstChild("HumanoidRootPart")
	if humanoid then
		if canTele then
			RedEvent:FireAllClients()
			canTele = false
			wait(2)
			humanoid.CFrame = RedB.CFrame + Vector3.new(-5,0,0)
			wait(1)
			canTele = true
		end
	end
end
RedA.Touched:Connect(redTeleA)

function redTeleB(part)
	local humanoid = part.Parent:FindFirstChild("HumanoidRootPart")
	if humanoid then
		if canTele then
			RedEvent:FireAllClients()
			canTele = false
			wait(2)
			humanoid.CFrame = RedA.CFrame + Vector3.new(5,0,0)
			wait(1)
			canTele = true
		end
	end
end
RedB.Touched:Connect(redTeleB)

-----------------------------------------------------------------------------------------------jungle island code

-----------------------------------------------------------------------------------------------dune island code
