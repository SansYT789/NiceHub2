local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/SansYT789/OrionLib/main/source.txt')))()
local Players = game:GetService("Players")
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
local plr = game.Players.LocalPlayer
local Plr = game.Players.LocalPlayer
local Char = plr.Character or plr.CharacterAdded:Wait()
local chr = Char
local character = Char
local char = Char
local HMRP = Char.HumanoidRootPart
local HumanoidRP = HMRP
local hmrp = HMRP
local HM = Char.Humanoid
local humanoid = HM
BypassTP = true
ChangeSpeed = 350
_G.AutoCollectFruit = true

local FruitList = {"Rocket-Rocket","Spike-Spike","Chop-Chop","Spring-Spring","Kilo-Kilo","Spin-Spin","Falcon-Falcon","Smoke-Smoke","Flame-Flame","Ice-Ice","Sand-Sand","Dark-Dark","Revive-Revive","Ghost-Ghost","Diamond-Diamond","Light-Light","Rubber-Rubber","Barrier-Barrier","Magma-Magma","Quake-Quake","Buddha-Buddha","Love-Love","String-String","Spider-Spider","Sound-Sound","Phoenix-Phoenix","Soul-Soul","Portal-Portal","Rumble-Rumble","Paw-Paw","Pain-Pain","Blizzard-Blizzard","Gravity-Gravity","Mammoth-Mammoth","T-Rex-T-Rex","Dough-Dough","Venom-Venom","Shadow-Shadow","Control-Control","Spirit-Spirit","Dragon-Dragon","Leopard-Leopard","Kitsune-Kitsune"}
local NameFruitList = {"Rocket Fruit","Spike Fruit","Chop Fruit","Spring Fruit","Kilo Fruit","Spin Fruit","Falcon Fruit","Smoke Fruit","Flame Fruit","Ice Fruit","Sand Fruit","Dark Fruit","Revive Fruit","Ghost Fruit","Diamond Fruit","Light Fruit","Rubber Fruit","Barrier Fruit","Magma Fruit","Quake Fruit","Buddha Fruit","Love Fruit","String Fruit","Spider Fruit","Sound Fruit","Phoenix Fruit","Soul Fruit","Portal Fruit","Rumble Fruit","Paw Fruit","Pain Fruit","Blizzard Fruit","Gravity Fruit","Mammoth Fruit","T-Rex Fruit","Dough Fruit","Venom Fruit","Shadow Fruit","Control Fruit","Spirit Fruit","Dragon Fruit","Leopard Fruit","Kitsune Fruit"}

---- AntiBan
function destroyScripts(scriptNames, parent)
    for _, scriptName in pairs(scriptNames) do
        for _, script in pairs(parent:GetDescendants()) do
            if script:IsA("LocalScript") and script.Name == scriptName then
                script:Destroy()
            end
        end
    end
end

function AntiBan()
    local character = game:GetService("Players").LocalPlayer.Character
    local playerScripts = game:GetService("Players").LocalPlayer.PlayerScripts
    
    local characterScriptsToRemove = {
        "General", "Shiftlock", "FallDamage", "4444", "CamBob", "JumpCD", "Looking", "Run"
    }

    local playerScriptsToRemove = {
        "RobloxMotor6DBugFix", "Clans", "Codes", "CustomForceField", "MenuBloodSp", "PlayerList"
    }

    pcall(function() 
        destroyScripts(characterScriptsToRemove, character) 
        destroyScripts(playerScriptsToRemove, playerScripts) 
    end)
end

AntiBan()

-- Ensure game is fully loaded with a wait
if not game:IsLoaded() then
    repeat
        wait(0.1)  -- Adding a delay to prevent unnecessary rapid looping
    until game:IsLoaded()
end

-- Load Scripts
repeat wait()
until game.Players 
    and game.Players.LocalPlayer 
    and game.ReplicatedStorage 
    and game.ReplicatedStorage:FindFirstChild("Remotes") 
    and game.Players.LocalPlayer:FindFirstChild("PlayerGui") 
    and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main")

if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") then
    repeat
        task.wait()  -- Add a delay to avoid rapid looping
        local chooseTeamGui = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main")
        if chooseTeamGui and chooseTeamGui.ChooseTeam.Visible then
            local team = _G.Team or "Pirates"
            local container = chooseTeamGui.ChooseTeam.Container
            if team == "Pirates" and container:FindFirstChild("Pirates") then
                for _, v in pairs(getconnections(container.Pirates.Frame.ViewportFrame.TextButton.Activated)) do
                    v.Function()
                end
            elseif team == "Marines" and container:FindFirstChild("Marines") then
                for _, v in pairs(getconnections(container.Marines.Frame.ViewportFrame.TextButton.Activated)) do
                    v.Function()
                end
            else
                for _, v in pairs(getconnections(container.Pirates.Frame.ViewportFrame.TextButton.Activated)) do
                    v.Function()
                end
            end
        end
    until game.Players.LocalPlayer.Team ~= nil or not game:IsLoaded()
end
setfpscap(120)

function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    
    function TPReturner()
        local Site
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end

        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        
        for _, v in pairs(Site.data) do
            local ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) and not table.find(AllIDs, ID) then
                table.insert(AllIDs, ID)
                pcall(function()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(1) -- Consider adding a condition to wait instead of a fixed time
            end
        end
    end

    function Teleport() 
        while true do
            pcall(TPReturner)
            wait(1) -- Add a wait to prevent rapid requests
        end
    end

    Teleport()
end

function Notify(H, I)
if H == nil or H == "" then
H = "No Any Descriptions"
end
if type(I) ~= "number" then
I = 5
end
OrionLib:MakeNotification({
	Name = "Notifying",
	Content = H,
	Image = "rbxassetid://4483345998",
	Time = I
})
end

spawn(function()
while wait() do
game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
Hop()
end
end)
end
end)

function UpdateDevilChams()
for i,v in pairs(game.Workspace:GetChildren()) do
pcall(function()
if _G.AutoCollectFruit then
if string.find(v.Name, "Fruit") then   
if not v.Handle:FindFirstChild('NameEsp'..Number) then
local bill = Instance.new('BillboardGui',v.Handle)
bill.Name = 'NameEsp'..Number
bill.ExtentsOffset = Vector3.new(0, 1, 0)
bill.Size = UDim2.new(1,200,1,30)
bill.Adornee = v.Handle
bill.AlwaysOnTop = true
local name = Instance.new('TextLabel',bill)
name.Font = Enum.Font.GothamSemibold
name.FontSize = "Size14"
name.TextWrapped = true
name.Size = UDim2.new(1,0,1,0)
name.TextYAlignment = 'Top'
name.BackgroundTransparency = 1
name.TextStrokeTransparency = 0.5
name.TextColor3 = Color3.fromRGB(173, 216, 230)
name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..'M')
else
v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..'M')
end
end
else
if v.Handle:FindFirstChild('NameEsp'..Number) then
v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
end
end
end)
end
end

function getPortal(check2)
    vcspos = check2.Position
    min = math.huge
    min2 = math.huge
    local y = game.PlaceId
    if y == 2753915549 then
        OldWorld = true
    elseif y == 4442272183 then
        NewWorld = true
    elseif y == 7449423635 then
        ThreeWorld = true
    end
    if ThreeWorld then
        TableLocations = {
            ["Caslte On The Sea"] = Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
            ["Hydra"] = Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
            ["Mansion"] = Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
            ["Great Tree"] = Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586),
            ["Ngu1"] = Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875),
            ["ngu2"] = Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656)
        }
    elseif NewWorld then
        TableLocations = {
            ["Mansion"] = Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
            ["Flamingo"] = Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
            ["122"] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
            ["3032"] = Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
        }
    elseif OldWorld then
        TableLocations = {
            ["1"] = Vector3.new(-7894.6201171875, 5545.49169921875, -380.2467346191406),
            ["2"] = Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
            ["3"] = Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
            ["4"] = Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875)
        }
    end
    TableLocations2 = {}
    for r, v in pairs(TableLocations) do
        TableLocations2[r] = (v - vcspos).Magnitude
    end
    for r, v in pairs(TableLocations2) do
        if v < min then
            min = v
            min2 = v
        end
    end
    for r, v in pairs(TableLocations2) do
        if v < min then
            min = v
            min2 = v
        end
    end
    for r, v in pairs(TableLocations2) do
        if v <= min then
            choose = TableLocations[r]
        end
    end
    min3 = (vcspos - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if min2 <= min3 then
        return choose
    end
end 
function request(check1)
    args = {"requestEntrance", check1}
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
    oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    char = game.Players.LocalPlayer.Character.HumanoidRootPart
    char.CFrame = CFrame.new(oldcframe.X, oldcframe.Y + 50, oldcframe.Z)
    task.wait(0.5)
end

function AntiLowHealth(aK)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,aK,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
wait()
end

function BypassTp(p)
    if not humanoid or not HMRP or not character:FindFirstChild("Head") then
        return
    end

    repeat
        task.wait(0.5)
        humanoid:ChangeState(15)  -- Tạm thời vô hiệu hóa các trạng thái mặc định của nhân vật
        HMRP.CFrame = p
        wait(0.05)

        -- Chuyển máu xuống 0 để chết
        HM.Health = 0
        HMRP.CFrame = p
    until (p.Position - rootPart.Position).Magnitude < 1500 and humanoid.Health > 0
end

function Bucac(bu, cu)
    if bu and cu then
        return (cu.Position - bu.Position).Magnitude
    end
    return nil
end

function hasBlacklistItem()
    local BlacklistItemTp = {
        "Torch", "Cup", "Relic", "Hellfire Torch", "Core Brain", "Holy Torch", 
        "Apple", "Banana", "Pineapple", "Flower 1", "Flower 2", "Flower 3", 
        "Sweet Chalice", "God's Chalice", "Fist of Darkness", "Hallow Essence"
    }
    
    for _, item in ipairs(BlacklistItemTp) do
        if plr.Backpack:FindFirstChild(item) or Char:FindFirstChild(item) then
            return true
        end
    end
    
    for _, item in ipairs(NameFruitList) do
        if plr.Backpack:FindFirstChild(item) or Char:FindFirstChild(item) then
            return true
        end
    end
    
    return false
end

function CheckBypassTrue(P1)
    if BypassTP then
        if Bucac(P1, HMRP) > 2500 then
            return not hasBlacklistItem()
        else
            return false
        end
    else
        return false
    end
end

function Tween(P1)
    local Distance = Bucac(HMRP, P1)
    local Portal = getPortal(P1)
    local DefaultY = P1.Y
    local BypassCheck = CheckBypassTrue(P1)
    local targetCFrameWithDefaultY = CFrame.new(P1.X, DefaultY, P1.Z)

    -- Set speed based on distance
    local TweenSpeed = Distance <= 250 and 450 or (Distance < 500 and (ChangeSpeed or 450) or (ChangeSpeed or 300))

    -- Teleport if within 250 units
    if Distance <= 250 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P1
    end

    -- Request portal if found
    if Portal then
        request(Portal)
    end
    -- Bypass teleport if condition met
    if BypassCheck then
        BypassTp(P1)
    end

    -- Health recovery handling
    if game.Players.LocalPlayer.Character.Humanoid.Health <= game.Players.LocalPlayer.Character.Humanoid.MaxHealth * 0.3 then
        local OldY = HMRP.CFrame.Y
        repeat
            wait()
            AntiLowHealth(math.random(100, 750))
        until not game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") or 
              game.Players.LocalPlayer.Character.Humanoid.Health > game.Players.LocalPlayer.Character.Humanoid.MaxHealth * 0.7
        AntiLowHealth(OldY)
    end

    -- Perform tween movement
    pcall(function()
        local tween = game:GetService("TweenService"):Create(
            game.Players.LocalPlayer.Character.HumanoidRootPart, 
            TweenInfo.new(Distance / TweenSpeed, Enum.EasingStyle.Linear), 
            {CFrame = targetCFrameWithDefaultY}
        )
        tween:Play()
        
        if _G.StopTween then
            tween:Cancel()
        end
    end)
    
    -- Update character position after tween
    HMRP.CFrame = CFrame.new(HMRP.CFrame.X, DefaultY, HMRP.CFrame.Z)
end

spawn(function()
while wait() do
for i,v in pairs(game.Players:GetPlayers()) do
if v.Name == "red_game43" or v.Name == "rip_indra" or v.Name == "Axiore" or v.Name == "Polkster" or v.Name == "wenlocktoad" or v.Name == "Daigrock" or v.Name == "toilamvidamme" or v.Name == "oofficialnoobie" or v.Name == "Uzoth" or v.Name == "Azarth" or v.Name == "arlthmetic" or v.Name == "Death_King" or v.Name == "Lunoven" or v.Name == "TheGreateAced" or v.Name == "rip_fud" or v.Name == "drip_mama" or v.Name == "layandikit12" or v.Name == "Hingoi" then
Hop()
end
end
end
end)

assert(getrawmetatable)
grm = getrawmetatable(game)
setreadonly(grm, false)
old = grm.__namecall
grm.__namecall = newcclosure(function(self, ...)
local args = {...}
if tostring(args[1]) == "TeleportDetect" then
return 
elseif tostring(args[1]) == "CHECKER_1" then
return 
elseif tostring(args[1]) == "CHECKER" then
return 
elseif tostring(args[1]) == "GUI_CHECK" then
return 
elseif tostring(args[1]) == "OneMoreTime" then
return 
elseif tostring(args[1]) == "checkingSPEED" then
return 
elseif tostring(args[1]) == "BANREMOTE" then
return 
elseif tostring(args[1]) == "PERMAIDBAN" then
return 
elseif tostring(args[1]) == "KICKREMOTE" then
return 
elseif tostring(args[1]) == "BR_KICKPC" then
return 
elseif tostring(args[1]) == "BR_KICKMOBILE" then
return 
end
return old(self, ...)
end)

function EquipTool(ToolSe)
if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) or game.Players.LocalPlayer.Character:FindFirstChild(ToolSe) then
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) or game.Players.LocalPlayer.Character:FindFirstChild(ToolSe)
wait(0.4)
game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
end
end

spawn(function()
while wait() do
for i,v in pairs(game.Players.LocalPlayer:GetChildren()) do
if v.Name == "DataLoaded" or v.Name == "DataPreloaded" then
v:Destroy()
end
end
end
end)

spawn(function()
while wait() do
if _G.AutoCollectFruit then
pcall(function()
for i,v in pairs(WS:GetChildren()) do
if string.find(v.Name, "Fruit") then
Tween(v.Handle.CFrame)
Notify("Found: ".. v.Name .. ,3)
else
Notify("Hopping Server To Finding Fruit...",3)
wait(.1)
Hop()
end
end
end)
end
end
end)

spawn(function()
while wait() do
pcall(function()
for i,v in pairs(FruitList) do
for x,y in pairs(NameFruitList) do
if game:GetService("Players").LocalPlayer.Character:FindFirstChild(y) or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(y) then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("StoreFruit",v,game:GetService("Players").LocalPlayer.Character:FindFirstChild(y) or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(y))
end
end
end
end)
end
end)