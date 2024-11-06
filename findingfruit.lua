local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local Plr = Players.LocalPlayer
local player = Players.LocalPlayer
local Char = plr.Character or plr.CharacterAdded:Wait()
local chr = plr.Character or plr.CharacterAdded:Wait()
local character = plr.Character or plr.CharacterAdded:Wait()
local char = plr.Character or plr.CharacterAdded:Wait()
local HMRP = Char.HumanoidRootPart
local HumanoidRP = Char.HumanoidRootPart
local hmrp = Char.HumanoidRootPart
local HM = Char.Humanoid
local humanoid = Char.Humanoid
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
        task.wait(0.1)  -- Adding a delay to prevent unnecessary rapid looping
    until game:IsLoaded()
end

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

-- Hàm xử lý va chạm
function onFruitTouch(hit)
    local character = hit.Parent
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    
    if humanoid then
        humanoid.Health = humanoid.Health - 50
        print(character.Name .. " đã bị mất 50 máu!")
    end
end

-- Tạo trái cây
local Fruit = Instance.new("Part")
Fruit.Name = "Fake Test Fruit"
Fruit.Size = Vector3.new(5, 5, 5)
Fruit.Color = Color3.fromRGB(255, 165, 0)
Fruit.Anchored = false
Fruit.CanCollide = true
Fruit.Position = Vector3.new(-290.737, 6.729, 5343.553)
Fruit.Parent = game:GetService("Workspace")

-- Kết nối sự kiện Touched
Fruit.Touched:Connect(onFruitTouch)

-- Tạo Handle cho việc tween teleport
local Handle = Instance.new("Part")
Handle.Name = "Handle"
Handle.Size = Vector3.new(1, 1, 1)
Handle.Color = Color3.new(0, 1, 0)
Handle.Anchored = true
Handle.CanCollide = false
Handle.Position = Fruit.Position
Handle.Parent = Fruit

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

spawn(function()
    game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
        if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
            Hop()
        end
    end)
end)

function round(n)
    if type(n) ~= "number" then
        return nil -- Hoặc có thể trả về một giá trị mặc định
    end
    return math.floor(n + 0.5)
end
function UpdateDevilChams()
    for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
        pcall(function()
            if _G.AutoCollectFruit then
                if string.find(v.Name, "Fruit") then
                    if not v.Handle:FindFirstChild('NameEsp'..Number) then
                        local bill = Instance.new('BillboardGui', v.Handle)
                        bill.Name = 'NameEsp'..Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = v.Handle
                        bill.AlwaysOnTop = true
                        
                        local name = Instance.new('TextLabel', bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(173, 216, 230)
                        name.Text = (v.Name .. ' \n' .. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude / 3) .. 'M')
                    else
                        v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name .. ' \n' .. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude / 3) .. 'M')
                    end
                else
                    if v.Handle:FindFirstChild('NameEsp'..Number) then
                        v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
                    end
                end
            end
        end)
    end
end
UpdateDevilChams()

function getPortal(check2)
    local vcspos = check2.Position
    local minDistance = math.huge
    local closestPortal = nil
    local y = game.PlaceId
    local TableLocations = {}

    -- Xác định các tọa độ cổng theo từng game
    if y == 7449423635 then
        TableLocations = {
            ["Caslte On The Sea"] = Vector3.new(-5058.775, 314.516, -3155.883),
            ["Hydra"] = Vector3.new(5756.837, 610.424, -253.925),
            ["Mansion"] = Vector3.new(-12463.874, 374.914, -7523.774),
            ["Great Tree"] = Vector3.new(28282.571, 14896.851, 105.104),
            ["Ngu1"] = Vector3.new(-11993.580, 334.781, -8844.183),
            ["ngu2"] = Vector3.new(5314.582, 25.419, -125.942)
        }
    elseif y == 4442272183 then
        TableLocations = {
            ["Mansion"] = Vector3.new(-288.462, 306.131, 597.999),
            ["Flamingo"] = Vector3.new(2284.912, 15.152, 905.483),
            ["122"] = Vector3.new(923.213, 126.976, 32852.832),
            ["3032"] = Vector3.new(-6508.558, 89.035, -132.84)
        }
    elseif y == 2753915549 then
        TableLocations = {
            ["1"] = Vector3.new(-7894.620, 5545.492, -380.247),
            ["2"] = Vector3.new(-4607.823, 872.542, -1667.557),
            ["3"] = Vector3.new(61163.852, 11.76, 1819.784),
            ["4"] = Vector3.new(3876.281, 35.106, -1939.32)
        }
    end

    -- Tìm cổng gần nhất
    for name, position in pairs(TableLocations) do
        local distance = (position - vcspos).Magnitude
        if distance < minDistance then
            minDistance = distance
            closestPortal = position
        end
    end
    
    -- Kiểm tra khoảng cách so với người chơi để xác định cổng có phù hợp
    if minDistance <= (vcspos - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
        return closestPortal
    end
end
function requestEntrance(check1)
    args = {"requestEntrance", check1}
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y + 50, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
    task.wait(0.5)
end

function BypassTp(p)
    repeat
        task.wait(0.5)
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)  -- Tạm thời vô hiệu hóa các trạng thái mặc định của nhân vật
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
        wait(0.05)

        -- Chuyển máu xuống 0 để chết
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
    until (p.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 1500 and game.Players.LocalPlayer.Character.Humanoid.Health > 0
end

function hasBlacklistItem()
    local BlacklistItemTp = {
        "Torch", "Cup", "Relic", "Hellfire Torch", "Core Brain", "Holy Torch", 
        "Apple", "Banana", "Pineapple", "Flower 1", "Flower 2", "Flower 3", 
        "Sweet Chalice", "God's Chalice", "Fist of Darkness", "Hallow Essence"
    }
    
    for _, item in ipairs(BlacklistItemTp) do
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(item) or Char:FindFirstChild(item) then
            return true
        end
    end
    
    for _, item in ipairs(NameFruitList) do
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(item) or Char:FindFirstChild(item) then
            return true
        end
    end
    
    return false
end

function CheckBypassTrue(P1)
    if BypassTP then
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - P1.Position).Magnitude > 2500 then
            return not hasBlacklistItem()
        else
            return false
        end
    else
        return false
    end
end

function Tween(P1)
    local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local Portal = getPortal(P1)
    local BypassCheck = CheckBypassTrue(P1)
    local targetCFrameWithDefaultY = CFrame.new(P1.X, P1.Y, P1.Z)

    -- Set speed based on distance
    local TweenSpeed = Distance <= 250 and 450 or (Distance < 500 and (ChangeSpeed or 450) or (ChangeSpeed or 300))

    -- Teleport if within 250 units
    if Distance <= 250 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P1
    end

    -- Request portal if found
    if Portal then
        requestEntrance(Portal)
    end
    -- Bypass teleport if condition met
    if BypassCheck then
        BypassTp(P1)
    end

    -- Health recovery handling
    if game.Players.LocalPlayer.Character.Humanoid.Health <= game.Players.LocalPlayer.Character.Humanoid.MaxHealth * 0.3 then
        local OldY = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y
        repeat
            task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, math.random(100, 750), game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
            task.wait()
        until not game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") or 
              game.Players.LocalPlayer.Character.Humanoid.Health > game.Players.LocalPlayer.Character.Humanoid.MaxHealth * 0.7
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, OldY, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
    end

    -- Perform tween movement
    local tween
    pcall(function()
        tween = game:GetService("TweenService"):Create(
            game.Players.LocalPlayer.Character.HumanoidRootPart, 
            TweenInfo.new(Distance / TweenSpeed, Enum.EasingStyle.Linear), 
            {CFrame = targetCFrameWithDefaultY}
        )
        tween:Play()
        
        if _G.StopTween then
            tween:Cancel()
        end
    end)
    
    -- Gắn BodyVelocity cho Noclip khi tween đang chạy
    if tween and tween.PlaybackState == Enum.PlaybackState.Playing then
        if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("MightHubTween") then
            local Noclip = Instance.new("BodyVelocity")
            Noclip.Name = "MightHubTween"
            Noclip.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            Noclip.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            Noclip.Velocity = Vector3.new(0, 0, 0)
            Noclip.P = 9000
            for _, v in pairs(Char:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    else
        -- Xóa BodyVelocity nếu tween đã dừng
        if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("MightHubTween") then
            game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("MightHubTween"):Destroy()
        end
    end
    
    -- Update character position after tween
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, P1.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
    
    return tween
end

local blockedNames = {
    "red_game43", "rip_indra", "Axiore", "Polkster", "wenlocktoad", "Daigrock", 
    "toilamvidamme", "oofficialnoobie", "Uzoth", "Azarth", "arlthmetic", 
    "Death_King", "Lunoven", "TheGreateAced", "rip_fud", "drip_mama", 
    "layandikit12", "Hingoi"
}

spawn(function()
    while wait() do
        for i, v in pairs(game.Players:GetPlayers()) do
            if table.find(blockedNames, v.Name) then
                Hop()
            end
        end
    end
end)

assert(getrawmetatable)
local grm = getrawmetatable(game)
setreadonly(grm, false)
local old = grm.__namecall

local blockedMethods = {
    "TeleportDetect", "CHECKER_1", "CHECKER", "GUI_CHECK", 
    "OneMoreTime", "checkingSPEED", "BANREMOTE", 
    "PERMAIDBAN", "KICKREMOTE", "BR_KICKPC", "BR_KICKMOBILE"
}

grm.__namecall = newcclosure(function(self, ...)
    local args = {...}
    if table.find(blockedMethods, tostring(args[1])) then
        return 
    end
    return old(self, ...)
end)

spawn(function()
    while wait() do
        if _G.AutoCollectFruit then
            pcall(function()
                for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if string.find(v.Name, "Fruit") then
                        Tween(v.Handle.CFrame)
                    else
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
            for i, v in pairs(FruitList) do
                for x, y in pairs(NameFruitList) do
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild(y) or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(y) then
                        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("StoreFruit", v, game:GetService("Players").LocalPlayer.Character:FindFirstChild(y) or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(y))
                    end
                end
            end
        end)
    end
end)