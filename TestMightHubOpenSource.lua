---- Library Hub -----
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/SansYT789/OrionLib/main/source.txt')))()

---- Players
local Players = game:GetService("Players")
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
local plr = game.Players.LocalPlayer
local Plr = game.Players.LocalPlayer
local Char = plr.Character or plr.CharacterAdded:Wait()
local chr = plr.Character or plr.CharacterAdded:Wait()
local HMRP = Char.HumanoidRootPart
local HumanoidRP = HMRP
local hmrp = HMRP
local HM = Char.Humanoid

--- Moon Status Textures
local moon8 = "http://www.roblox.com/asset/?id=9709150401"
local moon7 = "http://www.roblox.com/asset/?id=9709150086"
local moon6 = "http://www.roblox.com/asset/?id=9709149680"
local moon5 = "http://www.roblox.com/asset/?id=9709149431"
local moon4 = "http://www.roblox.com/asset/?id=9709149052"
local moon3 = "http://www.roblox.com/asset/?id=9709143733"
local moon2 = "http://www.roblox.com/asset/?id=9709139597"
local moon1 = "http://www.roblox.com/asset/?id=9709135895"

local FruitList = {"Rocket-Rocket","Spike-Spike","Chop-Chop","Spring-Spring","Kilo-Kilo","Spin-Spin","Falcon-Falcon","Smoke-Smoke","Flame-Flame","Ice-Ice","Sand-Sand","Dark-Dark","Revive-Revive","Ghost-Ghost","Diamond-Diamond","Light-Light","Rubber-Rubber","Barrier-Barrier","Magma-Magma","Quake-Quake","Buddha-Buddha","Love-Love","String-String","Spider-Spider","Sound-Sound","Phoenix-Phoenix","Soul-Soul","Portal-Portal","Rumble-Rumble","Paw-Paw","Pain-Pain","Blizzard-Blizzard","Gravity-Gravity","Mammoth-Mammoth","T-Rex-T-Rex","Dough-Dough","Venom-Venom","Shadow-Shadow","Control-Control","Spirit-Spirit","Dragon-Dragon","Leopard-Leopard","Kitsune-Kitsune"}
local NameFruitList = {"Rocket Fruit","Spike Fruit","Chop Fruit","Spring Fruit","Kilo Fruit","Spin Fruit","Falcon Fruit","Smoke Fruit","Flame Fruit","Ice Fruit","Sand Fruit","Dark Fruit","Revive Fruit","Ghost Fruit","Diamond Fruit","Light Fruit","Rubber Fruit","Barrier Fruit","Magma Fruit","Quake Fruit","Buddha Fruit","Love Fruit","String Fruit","Spider Fruit","Sound Fruit","Phoenix Fruit","Soul Fruit","Portal Fruit","Rumble Fruit","Paw Fruit","Pain Fruit","Blizzard Fruit","Gravity Fruit","Mammoth Fruit","T-Rex Fruit","Dough Fruit","Venom Fruit","Shadow Fruit","Control Fruit","Spirit Fruit","Dragon Fruit","Leopard Fruit","Kitsune Fruit"}
local FruitListBelow1M = {"Rocket-Rocket","Spike-Spike","Chop-Chop","Spring-Spring","Kilo-Kilo","Spin-Spin","Falcon-Falcon","Smoke-Smoke","Flame-Flame","Ice-Ice","Sand-Sand","Dark-Dark","Revive-Revive","Ghost-Ghost","Diamond-Diamond","Light-Light","Rubber-Rubber","Barrier-Barrier"}

--- Status Myself
local MyRace = game:GetService("Players").LocalPlayer.Data.Race.Value
local MyFruit = game:GetService("Players").LocalPlayer.Data.DevilFruit.Value
local MyBeli = game:GetService("Players").LocalPlayer.Data.Beli.Value
local MyFragment = game:GetService("Players").LocalPlayer.Data.Fragments.Value
local MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value

-- Set default team to avoid nil errors
if not _G.Team then
    _G.Team = "Pirates"  -- Default to "Pirates" if _G.Team is not defined
end

---- AntiBan
function AntiBan()
for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
if v:IsA("LocalScript") then
if v.Name == "General" or v.Name == "Shiftlock"  or v.Name == "FallDamage" or v.Name == "4444" or v.Name == "CamBob" or v.Name == "JumpCD" or v.Name == "Looking" or v.Name == "Run" then
v:Destroy()
end
end
end
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerScripts:GetDescendants()) do
if v:IsA("LocalScript") then
if v.Name == "RobloxMotor6DBugFix" or v.Name == "Clans"  or v.Name == "Codes" or v.Name == "CustomForceField" or v.Name == "MenuBloodSp"  or v.Name == "PlayerList" then
v:Destroy()
end
end
end
end
AntiBan()

-- Ensure game is fully loaded with a wait
if not game:IsLoaded() then
    repeat
        wait(0.5)  -- Adding a delay to prevent unnecessary rapid looping
    until game:IsLoaded()
end

local First_Sea, Second_Sea, Third_Sea = false, false, false
local placeId = game.PlaceId
if placeId == 2753915549 then
First_Sea = true
elseif placeId == 4442272183 then
Second_Sea = true
elseif placeId == 7449423635 then
Third_Sea = true
else
game.Players.LocalPlayer:Kick("Not Blox Fruit!")
end

if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") then
    repeat
        wait(0.1)  -- Add a delay to avoid rapid looping
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

--- Check Moon Status Id Textures
function CheckMoonTexturesId()
if First_Sea then
return game:GetService("Lighting").FantasySky.MoonTextureId
elseif Second_Sea then
return game:GetService("Lighting").FantasySky.MoonTextureId
elseif Third_Sea then
return game:GetService("Lighting").Sky.MoonTextureId
end
end

--- Check Boss Quest
function CheckBossQuest()
if First_Sea then
if SelectBoss == "The Gorilla King" then
BossMon = "The Gorilla King"
NameBoss = 'The Gorrila King'
NameQuestBoss = "JungleQuest"
QuestLvBoss = 3
RewardBoss = "Reward:\n$2,000\n7,000 Exp."
CFrameQBoss = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
CFrameBoss = CFrame.new(-1088.75977, 8.13463783, -488.559906, -0.707134247, 0, 0.707079291, 0, 1, 0, -0.707079291, 0, -0.707134247)
elseif SelectBoss == "Bobby" then
BossMon = "Bobby"
NameBoss = 'Bobby'
NameQuestBoss = "BuggyQuest1"
QuestLvBoss = 3
RewardBoss = "Reward:\n$8,000\n35,000 Exp."
CFrameQBoss = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
CFrameBoss = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)
elseif SelectBoss == "The Saw" then
BossMon = "The Saw"
NameBoss = 'The Saw'
CFrameBoss = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)
elseif SelectBoss == "Yeti" then
BossMon = "Yeti"
NameBoss = 'Yeti'
NameQuestBoss = "SnowQuest"
QuestLvBoss = 3
RewardBoss = "Reward:\n$10,000\n180,000 Exp."
CFrameQBoss = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
CFrameBoss = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
elseif SelectBoss == "Mob Leader" then
BossMon = "Mob Leader"
NameBoss = 'Mob Leader'
CFrameBoss = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)
elseif SelectBoss == "Vice Admiral" then
BossMon = "Vice Admiral"
NameBoss = 'Vice Admiral'
NameQuestBoss = "MarineQuest2"
QuestLvBoss = 2
RewardBoss = "Reward:\n$10,000\n180,000 Exp."
CFrameQBoss = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
CFrameBoss = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
elseif SelectBoss == "Saber Expert" then
NameBoss = 'Saber Expert'
BossMon = "Saber Expert"
CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564)
elseif SelectBoss == "Warden" then
BossMon = "Warden"
NameBoss = 'Warden'
NameQuestBoss = "ImpelQuest"
QuestLvBoss = 1
RewardBoss = "Reward:\n$6,000\n850,000 Exp."
CFrameBoss = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, -4.49946401e-06, 0.975376427, -1.95412576e-05, 1, 9.03162072e-06, -0.975376427, -2.10519756e-05, 0.220546961)
CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
elseif SelectBoss == "Chief Warden" then
BossMon = "Chief Warden"
NameBoss = 'Chief Warden'
NameQuestBoss = "ImpelQuest"
QuestLvBoss = 2
RewardBoss = "Reward:\n$10,000\n1,000,000 Exp."
CFrameBoss = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749, 0.00191645394, 0.999998152, -2.80422337e-05, -0.939682961, 0.00181045406, 0.342041939)
CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
elseif SelectBoss == "Swan" then
BossMon = "Swan"
NameBoss = 'Swan'
NameQuestBoss = "ImpelQuest"
QuestLvBoss = 3
RewardBoss = "Reward:\n$15,000\n1,600,000 Exp."
CFrameBoss = CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812)
CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
elseif SelectBoss == "Magma Admiral" then
BossMon = "Magma Admiral"
NameBoss = 'Magma Admiral'
NameQuestBoss = "MagmaQuest"
QuestLvBoss = 3
RewardBoss = "Reward:\n$15,000\n2,800,000 Exp."
CFrameQBoss = CFrame.new(-5314.6220703125, 12.262420654297, 8517.279296875)
CFrameBoss = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)
elseif SelectBoss == "Fishman Lord" then
BossMon = "Fishman Lord"
NameBoss = 'Fishman Lord'
NameQuestBoss = "FishmanQuest"
QuestLvBoss = 3
RewardBoss = "Reward:\n$15,000\n4,000,000 Exp."
CFrameQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
CFrameBoss = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
elseif SelectBoss == "Wysper" then
BossMon = "Wysper"
NameBoss = 'Wysper'
NameQuestBoss = "SkyExp1Quest"
QuestLvBoss = 3
RewardBoss = "Reward:\n$15,000\n4,800,000 Exp."
CFrameQBoss = CFrame.new(-7861.947265625, 5545.517578125, -379.85974121094)
CFrameBoss = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)
elseif SelectBoss == "Thunder God" then
BossMon = "Thunder God"
NameBoss = 'Thunder God'
NameQuestBoss = "SkyExp2Quest"
QuestLvBoss = 3
RewardBoss = "Reward:\n$20,000\n5,800,000 Exp."
CFrameQBoss = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
CFrameBoss = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)
elseif SelectBoss == "Cyborg" then
BossMon = "Cyborg"
NameBoss = 'Cyborg'
NameQuestBoss = "FountainQuest"
QuestLvBoss = 3
RewardBoss = "Reward:\n$20,000\n7,500,000 Exp."
CFrameQBoss = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
CFrameBoss = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
elseif SelectBoss == "Ice Admiral" then
BossMon = "Ice Admiral"
NameBoss = 'Ice Admiral'
CFrameBoss = CFrame.new(1266.08948, 26.1757946, -1399.57678, -0.573599219, 0, -0.81913656, 0, 1, 0, 0.81913656, 0, -0.573599219)
elseif SelectBoss == "Greybeard" then
BossMon = "Greybeard"
NameBoss = 'Greybeard'
CFrameBoss = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
end
end
if Second_Sea then
if SelectBoss == "Diamond" then
BossMon = "Diamond"
NameBoss = 'Diamond'
NameQuestBoss = "Area1Quest"
QuestLvBoss = 3
RewardBoss = "Reward:\n$25,000\n9,000,000 Exp."
CFrameQBoss = CFrame.new(-427.5666809082, 73.313781738281, 1835.4208984375)
CFrameBoss = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
elseif SelectBoss == "Jeremy" then
BossMon = "Jeremy"
NameBoss = 'Jeremy'
NameQuestBoss = "Area2Quest"
QuestLvBoss = 3
RewardBoss = "Reward:\n$25,000\n11,500,000 Exp."
CFrameQBoss = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
CFrameBoss = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
elseif SelectBoss == "Fajita" then
BossMon = "Fajita"
NameBoss = 'Fajita'
NameQuestBoss = "MarineQuest3"
QuestLvBoss = 3
RewardBoss = "Reward:\n$25,000\n15,000,000 Exp."
CFrameQBoss = CFrame.new(-2441.986328125, 73.359344482422, -3217.5324707031)
CFrameBoss = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
elseif SelectBoss == "Don Swan" then
BossMon = "Don Swan"
NameBoss = 'Don Swan'
CFrameBoss = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
elseif SelectBoss == "Smoke Admiral" then
BossMon = "Smoke Admiral"
NameBoss = 'Smoke Admiral'
NameQuestBoss = "IceSideQuest"
QuestLvBoss = 3
RewardBoss = "Reward:\n$20,000\n25,000,000 Exp."
CFrameQBoss = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
CFrameBoss = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
elseif SelectBoss == "Awakened Ice Admiral" then
BossMon = "Awakened Ice Admiral"
NameBoss = 'Awakened Ice Admiral'
NameQuestBoss = "FrostQuest"
QuestLvBoss = 3
RewardBoss = "Reward:\n$20,000\n36,000,000 Exp."
CFrameQBoss = CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813)
CFrameBoss = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)
elseif SelectBoss == "Tide Keeper" then
BossMon = "Tide Keeper"
NameBoss = 'Tide Keeper'
NameQuestBoss = "ForgottenQuest"
QuestLvBoss = 3
RewardBoss = "Reward:\n$12,500\n38,000,000 Exp."
CFrameQBoss = CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625)
CFrameBoss = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)
elseif SelectBoss == "Darkbeard" then
BossMon = "Darkbeard"
NameBoss = 'Darkbeard'
CFrameMon = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
elseif SelectBoss == "Cursed Captain" then
BossMon = "Cursed Captain"
NameBoss = 'Cursed Captain'
CFrameBoss = CFrame.new(916.928589, 181.092773, 33422)
elseif SelectBoss == "Order" then
BossMon = "Order"
NameBoss = 'Order'
CFrameBoss = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
end
end
if Third_Sea then
if SelectBoss == "Stone" then
BossMon = "Stone"
NameBoss = 'Stone'
NameQuestBoss = "PiratePortQuest"
QuestLvBoss = 3
RewardBoss = "Reward:\n$25,000\n40,000,000 Exp."
CFrameQBoss = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
CFrameBoss = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
elseif SelectBoss == "Island Empress" then
BossMon = "Island Empress"
NameBoss = 'Island Empress'
NameQuestBoss = "AmazonQuest2"
QuestLvBoss = 3
RewardBoss = "Reward:\n$30,000\n52,000,000 Exp."
CFrameQBoss = CFrame.new(5445.9541015625, 601.62945556641, 751.43792724609)
CFrameBoss = CFrame.new(5543.86328125, 668.97399902344, 199.0341796875)
elseif SelectBoss == "Kilo Admiral" then
BossMon = "Kilo Admiral"
NameBoss = 'Kilo Admiral'
NameQuestBoss = "MarineTreeIsland"
QuestLvBoss = 3
RewardBoss = "Reward:\n$35,000\n56,000,000 Exp."
CFrameQBoss = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
CFrameBoss = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
elseif SelectBoss == "Captain Elephant" then
BossMon = "Captain Elephant"
NameBoss = 'Captain Elephant'
NameQuestBoss = "DeepForestIsland"
QuestLvBoss = 3
RewardBoss = "Reward:\n$40,000\n67,000,000 Exp."
CFrameQBoss = CFrame.new(-13232.682617188, 332.40396118164, -7626.01171875)
CFrameBoss = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
elseif SelectBoss == "Beautiful Pirate" then
BossMon = "Beautiful Pirate"
NameBoss = 'Beautiful Pirate'
NameQuestBoss = "DeepForestIsland2"
QuestLvBoss = 3
RewardBoss = "Reward:\n$50,000\n70,000,000 Exp."
CFrameQBoss = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
CFrameBoss = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)
elseif SelectBoss == "Cake Queen" then
BossMon = "Cake Queen"
NameBoss = 'Cake Queen'
NameQuestBoss = "IceCreamIslandQuest"
QuestLvBoss = 3
RewardBoss = "Reward:\n$30,000\n112,500,000 Exp."
CFrameQBoss = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
CFrameBoss = CFrame.new(-678.648804, 381.353943, -11114.2012, -0.908641815, 0.00149294338, 0.41757378, 0.00837114919, 0.999857843, 0.0146408929, -0.417492568, 0.0167988986, -0.90852499)
elseif SelectBoss == "Longma" then
BossMon = "Longma"
NameBoss = 'Longma'
CFrameBoss = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
elseif SelectBoss == "Soul Reaper" then
BossMon = "Soul Reaper"
NameBoss = 'Soul Reaper'
CFrameBoss = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
elseif SelectBoss == "rip_indra True Form" then
BossMon = "rip_indra True Form"
NameBoss = 'rip_indra True Form'
CFrameBoss = CFrame.new(-5415.3920898438, 505.74133300781, -2814.0166015625)
end
end
end

--- Check Material Farm
function MaterialMon()
if SelectMaterial == "Radioactive Material" then
MMon = {"Factory Staff"}
MPos = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)
SP = "Default"
elseif SelectMaterial == "Ectoplasm" then
MMon = {"Ship Steward","Ship Engineer","Ship Deckhand","Ship Officer"}
MPos = CFrame.new(921.12365722656, 125.9839553833, 33088.328125) or CFrame.new(886.28179931641, 40.47790145874, 32800.83203125) or CFrame.new(943.85504150391, 129.58183288574, 33444.3671875) or CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
SP = "Default"
if (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
end
elseif SelectMaterial == "Mystic Droplet" then
MMon = {"Sea Soldier","Water Fighter"}
MPos = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875) or CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
SP = "Default"
elseif SelectMaterial == "Magma Ore" then
if First_Sea then
MMon = {"Military Spy","Military Soldier"}
MPos = CFrame.new(-5787.00293, 75.8262634, 8651.69922, 0.838590562, 0, -0.544762194, 0, 1, 0, 0.544762194, 0, 0.838590562) or CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)
SP = "Default"
elseif Second_Sea then
MMon = {"Magma Ninja","Lava Pirate"}
MPos = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438) or CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
SP = "Default"
end
elseif SelectMaterial == "Demonic Wisp" then
MMon = {"Demonic Soul"}
MPos = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
SP = "Default"
elseif SelectMaterial == "Angel Wings" then
MMon = {"Royal Squad","Royal Soldier"}
MPos = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828) or CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
SP = "Default"
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047)).Magnitude >= 5000 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
end
elseif SelectMaterial == "Fish Tail" then
if Third_Sea then
MMon = {"Fishman Raider","Fishman Captain"}
MPos = CFrame.new(-10553.268554688, 521.38439941406, -8176.9458007813) or CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)
SP = "Default"
elseif First_Sea then
MMon = {"Fishman Warrior","Fishman Commando"}
MPos = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703) or CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
SP = "Default"
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)).Magnitude >= 17000 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875))
end
end
elseif SelectMaterial == "Gunpowder" then
MMon = {"Pistol Billionaire"}
MPos = CFrame.new(-236.53652954102, 217.46676635742, 6006.0883789063)
SP = "Default"
elseif SelectMaterial == "Mini Tusk" then
MMon = {"Mythological Pirate"}
MPos = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
SP = "Default"
elseif SelectMaterial == "Vampire Fang" then
MMon = {"Vampire"}
MPos = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)
SP = "Default"
elseif SelectMaterial == "Yeti Fur" then
MMon = {"Yeti"}
MPos = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
SP = "Default"
elseif SelectMaterial == "Meteorite" then
MMon = {"Fajita"}
MPos = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
SP = "Default"
elseif SelectMaterial == "Dragon Scale" then
MMon = {"Dragon Crew Archer","Dragon Crew Warrior"}
MPos = CFrame.new(6831.1171875, 441.76708984375, 446.58615112305) or CFrame.new(6301.9975585938, 104.77153015137, -1082.6075439453)
SP = "Default"
elseif SelectMaterial == "Conjured Cocoa" then
MMon = {"Chocolate Bar Battler","Cocoa Warrior"}
MPos = CFrame.new(701.312073, 25.5824986, -12708.2148, -0.342042685, 0, -0.939684391, 0, 1, 0, 0.939684391, 0, -0.342042685) or CFrame.new(167.978516, 26.2254658, -12238.874, -0.939700961, 0, 0.341998369, 0, 1, 0, -0.341998369, 0, -0.939700961)
SP = "Default"
elseif SelectMaterial == "Leather" then
if First_Sea then
MMon = {"Pirate","Brute"}
MPos = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875) or CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
SP = "Default"
elseif Second_Sea then
MMon = {"Marine Captain","Marine Lieutenant"}
MPos = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406) or CFrame.new(-2489.2622070313, 84.613594055176, -3151.8830566406)
SP = "Default"
elseif Third_Sea then
MMon = {"Jungle Pirate","Forest Pirate"}
MPos = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313) or CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
SP = "Default"
end
elseif SelectMaterial == "Scrap Metal" then
if First_Sea then
MMon = {"Pirate","Brute"}
MPos = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875) or CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
SP = "Default"
elseif Second_Sea then
MMon = {"Swan Pirate","Mercenary"}
MPos = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125) or CFrame.new(-864.85009765625, 122.47104644775, 1453.1505126953)
SP = "Default"
elseif Third_Sea then
MMon = {"Pirate Millionaire"}
MPos = CFrame.new(-435.68109130859, 189.69866943359, 5551.0756835938)
SP = "Default"
end
end
end

function CheckMaterial(matname)
for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
if type(v) == "table" then
if v.Type == "Material" then
if v.Name == matname then
return v.Count
end
end
end
end
return 0
end

function CheckUser(ngu)
TryUserAgain = ngu
if Players:FindFirstChild(ngu) then
if ngu == TryUserAgain then
return true
else
return false
end
else
return false
end
return false
end

function CheckSword(Sword_Name)
for i, v in pairs(game:GetService("ReplicatedStorage").Remotes['CommF_']:InvokeServer("getInventory")) do
if (v.Type == "Sword") then
if v.Name == Sword_Name then
return true
end
end
end
end

function UnEquipTool(Weapon)
if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
_G.NotAutoEquip = true
wait(.5)
game.Players.LocalPlayer.Character:FindFirstChild(Weapon).Parent = game.Players.LocalPlayer.Backpack
wait(.1)
_G.NotAutoEquip = false
end
end

function CheckItem(skibidi)
for k, v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
if v.Name == skibidi then
return v
end
end
end

function Hop()
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
function TPReturner()
local Site;
if foundAnything == "" then
Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
else
Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
end
local ID = ""
if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
foundAnything = Site.nextPageCursor
end
local num = 0;
for i,v in pairs(Site.data) do
local Possible = true
ID = tostring(v.id)
if tonumber(v.maxPlayers) > tonumber(v.playing) then
for _,Existing in pairs(AllIDs) do
if num ~= 0 then
if ID == tostring(Existing) then
Possible = false
end
else
if tonumber(actualHour) ~= tonumber(Existing) then
local delFile = pcall(function()
AllIDs = {}
table.insert(AllIDs, actualHour)
end)
end
end
num = num + 1
end
if Possible == true then
table.insert(AllIDs, ID)
wait()
pcall(function()
wait()
game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
end)
wait(4)
end
end
end
end
function Teleport() 
while wait() do
pcall(function()
TPReturner()
if foundAnything ~= "" then
TPReturner()
end
end)
end
end
Teleport()
end

function NormalAttack()
if not _G.NormalAttack then
local Module = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework)
local CombatFramework = debug.getupvalues(Module)[2]
require(game.ReplicatedStorage.Util.CameraShaker):Stop()
CombatFramework.activeController.attacking = false
CombatFramework.activeController.timeToNextAttack = 0.25
CombatFramework.activeController.increment = 3
CombatFramework.activeController.hitboxMagnitude = 100
CombatFramework.activeController.blocking = false
CombatFramework.activeController.timeToNextBlock = 0
CombatFramework.activeController.focusStart = 0
CombatFramework.activeController.humanoid.AutoRotate = true
game:GetService'VirtualUser':CaptureController()
game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
end
end

function function7()
GameTime = "Error"
local ao = game.Lighting.ClockTime
if ao >= 18 or ao < 5 then
GameTime = "Night"
else
GameTime = "Day"
end
return GameTime
end
function function6()
return math.floor(game.Lighting.ClockTime)
end
function getServerTime()
RealTime = tostring(math.floor(game.Lighting.ClockTime * 100) / 100)
RealTime = tostring(game.Lighting.ClockTime)
RealTimeTable = RealTime:split(".")
Minute, Second = RealTimeTable[1], tonumber(0 + tonumber(RealTimeTable[2] / 100)) * 60
return Minute, Second
end

function CheckMonStatus()
    local ClockTime = game.Lighting.ClockTime
    local MonTexture = CheckMoonTexturesId()

    if MonTexture == moon1 then
        return "1/8"
    elseif MonTexture == moon2 then
        return "2/8"
    elseif MonTexture == moon3 then
        return "3/8"
    elseif MonTexture == moon4 then
        if ClockTime < 12 then
            return "4/8 (Will Full Moon In " .. math.floor(18 - ClockTime) .. " Minutes)"
        elseif ClockTime > 12 then
            return "4/8 (Will Full Moon In " .. math.floor(18 + 12 - ClockTime) .. " Minutes)"
        else
            return "4/8 (Near Full Moon)"
        end
    elseif MonTexture == moon5 then
        if ClockTime <= 5 then
            return "5/8 (Will End Moon In " .. math.floor(5 - ClockTime) .. " Minutes)"
        elseif ClockTime > 5 and ClockTime < 12 then
            return "5/8 (Fake Moon)"
        elseif ClockTime > 12 and ClockTime < 18 then
            return "5/8 (Will Full Moon In " .. math.floor(18 - ClockTime) .. " Minutes)"
        elseif ClockTime > 18 and ClockTime <= 24 then
            return "5/8 (Will End Moon In " .. math.floor(24 + 6 - ClockTime) .. " Minutes)"
        else
            return "5/8 (Full Moon)"
        end
    elseif MonTexture == moon6 then
        return "6/8 (After Full Moon)"
    elseif MonTexture == moon7 then
        return "7/8"
    elseif MonTexture == moon8 then
        return "8/8"
    end

    return "nil"
end

spawn(function()
local gg = getrawmetatable(game)
local old = gg.__namecall
setreadonly(gg,false)
gg.__namecall = newcclosure(function(...)
local method = getnamecallmethod()
local args = {...}
if tostring(method) == "FireServer" then
if tostring(args[1]) == "RemoteEvent" then
if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
if _G.UseSkill and _G.AutoFruitMastery then
if type(args[2]) == "vector" then
args[2] = PositionSkillMasteryDevilFruit
else
args[2] = CFrame.new(PositionSkillMasteryDevilFruit)
end
return old(unpack(args))
end
end
end
end
return old(...)
end)
end)

spawn(function()
local gt = getrawmetatable(game)
local old = gt.__namecall
setreadonly(gt, false)
gt.__namecall = newcclosure(function(...)
local method = getnamecallmethod()
local args = { ... }
if tostring(method) == "InvokeServer" then
if CurrentEquipGun == "Soul Guitar" then
if tostring(args[2]) == "TAP" then
if _G.AutoGunMastery and _G.UseSkillGun then
args[3] = PositionSkillMasteryGun.Position
end
return old(unpack(args))
end
end
end
return old(...)
end)
end)

function UseCode(Text)
game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
end

function FPSBooster()
local decalsyeeted = true
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
sethiddenproperty(l,"Technology",2)
sethiddenproperty(t,"Decoration",false)
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(g:GetDescendants()) do
if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
v.Material = "Plastic"
v.Reflectance = 0
elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
v.Transparency = 1
elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
v.Lifetime = NumberRange.new(0)
elseif v:IsA("Explosion") then
v.BlastPressure = 1
v.BlastRadius = 1
elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
v.Enabled = false
elseif v:IsA("MeshPart") then
v.Material = "Plastic"
v.Reflectance = 0
v.TextureID = 10385902758728957
end
end
for i, e in pairs(l:GetChildren()) do
if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
e.Enabled = false
end
end
end

Memayto = false
DaGatCan = false
if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") then
DaGatCan = true
end
function IsMirageIsland2()
if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
return true
else
return false
end
end

function ClickCamera()
game:GetService("VirtualUser"):CaptureController()
game:GetService("VirtualUser"):ClickButton1(Vector2.new(851,158),game:GetService("Workspace").Camera.CFrame)
end

function AutoHaki()
if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
end
end

function Click()
if not _G.Click then
game:GetService('VirtualUser'):CaptureController()
game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
end
end

_G.FastAttackDelay = _G.FastAttackDelay or 0.2
_G.FastAttackNice = _G.FastAttackNice or true

local CameraShaker = require(game.ReplicatedStorage.Util.CameraShaker)
local CbFw = debug.getupvalues(require(game.Players.LocalPlayer.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]
CombatFrameworkR = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
y = debug.getupvalues(CombatFrameworkR)[2]
spawn(function()
game:GetService("RunService").RenderStepped:Connect(function()
if _G.FastAttackNice then
if typeof(y) == "table" then
pcall(function()
CameraShaker:Stop()
y.activeController.timeToNextAttack = (math.huge^math.huge^math.huge)
y.activeController.hitboxMagnitude = 60
y.activeController.active = false
y.activeController.timeToNextBlock = 0
y.activeController.focusStart = 1655503339.0980349
y.activeController.increment = 1
y.activeController.blocking = false
y.activeController.attacking = false
y.activeController.humanoid.AutoRotate = true
end)
end
end
end)
end)

spawn(function()
game:GetService("RunService").RenderStepped:Connect(function()
if _G.FastAttackNice then
game.Players.LocalPlayer.Character.Stun.Value = 0
game.Players.LocalPlayer.Character.Busy.Value = false        
end
end)
end)

local Client = game.Players.LocalPlayer
local STOP = require(Client.PlayerScripts.CombatFramework.Particle)
local STOPRL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
spawn(function()
while task.wait() do
pcall(function()
if not shared.orl then shared.orl = STOPRL.wrapAttackAnimationAsync end
if not shared.cpc then shared.cpc = STOP.play end
STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
local Hits = STOPRL.getBladeHits(b,c,d)
if Hits then
if _G.FastAttackNice then
STOP.play = function() end
a:Play(0.01,0.01,0.01)
func(Hits)
STOP.play = shared.cpc
wait(a.length * 0.5)
a:Stop()
else
a:Play()
end
end
end
end)
end
end)

function GetCurrentBlade() 
local p13 = CbFw2.activeController
local ret = p13.blades[1]
if not ret then return end
while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
return ret
end
function AttackNoCD() 
CameraShaker:Stop()
local AC = CbFw2.activeController
for i = 1, 1 do 
local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(game.Players.LocalPlayer.Character,{game.Players.LocalPlayer.Character.HumanoidRootPart},60)
local cac = {}
local hash = {}
for k, v in pairs(bladehit) do
if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
table.insert(cac, v.Parent.HumanoidRootPart)
hash[v.Parent] = true
end
end
bladehit = cac
if #bladehit > 0 then
CbFw2.activeController.timeToNextAttack = 1
CbFw2.activeController.attacking = false
CbFw2.activeController.blocking = false
CbFw2.activeController.timeToNextBlock = 0
CbFw2.activeController.increment = 3
CbFw2.activeController.hitboxMagnitude = 60
CbFw2.activeController.focusStart = 0
game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "") 
end
end
end
spawn(function()
while wait() do
if _G.FastAttackNice then
pcall(function()
repeat task.wait(_G.FastAttackDelay)
AttackNoCD()
until not _G.FastAttackNice
end)
end
end
end)

task.spawn(function()
while task.wait() do
if _G.FastAttackNice then
pcall(function()
if _G.AutoGunMastery or _G.AutoFruitMastery then
for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid").Health > 0 then
if v.Name == MonFarm and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= posY + 35 then
repeat task.wait()
AutoHaki()
NormalAttack()
until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude > posY + 35 or not v.Parent or v.Humanoid.Health <= 0 or v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100
end
end
end
else
for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid").Health > 0 then
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= posY + 55 then
repeat task.wait()
AutoHaki()
Click()
until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude > posY + 55 or not v.Parent or v.Humanoid.Health <= 0
end
end
end
end
end)
end
end
end)

task.spawn(function()
while task.wait() do
if _G.BringMob then
pcall(function()
for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
if v.Name == MonFarm and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 400 then
if InMyNetWork(v.HumanoidRootPart) then
v.HumanoidRootPart.CFrame = FarmPos
v.HumanoidRootPart.CanCollide = false
v.HumanoidRootPart.Size = Vector3.new(posY + 30,posY + 30,posY + 30)
v.HumanoidRootPart.Transparency = 1
if v:FindFirstChild("Humanoid") then
v.Humanoid:ChangeState(11)
v.Humanoid:ChangeState(14)
v.Humanoid:ChangeState(15)
v.Humanoid:ChangeState(16)
v.Humanoid.JumpPower = 0
v.Humanoid.WalkSpeed = 0
if v.Humanoid:FindFirstChild("Animator") then
v.Humanoid.Animator:Destroy()
end
end
end
end
end
end)
end
end
end)
task.spawn(function()
while true do wait()
if setscriptable then
setscriptable(game.Players.LocalPlayer,"SimulationRadius",true)
end
if sethiddenproperty then
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
end
end
end)
function InMyNetWork(object)
if isnetworkowner then
return isnetworkowner(object)
else
if (object.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 300 then
return true
end
return false
end
end

spawn(function()
pcall(function()
while task.wait() do
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
if v:IsA("Tool") then
if v:FindFirstChild("RemoteFunctionShoot") then
CurrentEquipGun = v.Name
end
end
end
end
end)
end)

spawn(function()
while wait() do
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
if v:IsA("Tool") then
if v.ToolTip == "Gun" then
CurrentEquipGun = v.Name
end
end
end
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
if v:IsA("Tool") then
if v.ToolTip == "Gun" then
CurrentEquipGun = v.Name
end
end
end
end
end)

function CheckLevel()
local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
if First_Sea then
if Lv == 1 or Lv <= 9 or SelectMonster == "Bandit" or SelectArea == 'Jungle' then -- Bandit
Ms = "Bandit"
NameQuest = "BanditQuest1"
QuestLv = 1
NameMon = "Bandit"
CFrameQ = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
elseif Lv == 10 or Lv <= 14 or SelectMonster == "Monkey" or SelectArea == 'Jungle' then -- Monkey
Ms = "Monkey"
NameQuest = "JungleQuest"
QuestLv = 1
NameMon = "Monkey"
CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
CFrameMon = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)
elseif Lv == 15 or Lv <= 29 or SelectMonster == "Gorilla" or SelectArea == 'Jungle' then -- Gorilla
Ms = "Gorilla"
NameQuest = "JungleQuest"
QuestLv = 2
NameMon = "Gorilla"
CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
CFrameMon = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)
elseif Lv == 30 or Lv <= 39 or SelectMonster == "Pirate" or SelectArea == 'Buggy' then -- Pirate
Ms = "Pirate"
NameQuest = "BuggyQuest1"
QuestLv = 1
NameMon = "Pirate"
CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
CFrameMon = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
elseif Lv == 40 or Lv <= 59 or SelectMonster == "Brute" or SelectArea == 'Buggy' then -- Brute
Ms = "Brute"
NameQuest = "BuggyQuest1"
QuestLv = 2
NameMon = "Brute"
CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
CFrameMon = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
elseif Lv == 60 or Lv <= 74 or SelectMonster == "Desert Bandit" or SelectArea == 'Desert' then -- Desert Bandit
Ms = "Desert Bandit"
NameQuest = "DesertQuest"
QuestLv = 1
NameMon = "Desert Bandit"
CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
elseif Lv == 75 or Lv <= 89 or SelectMonster == "Desert Officer" or SelectArea == 'Desert' then -- Desert Officer
Ms = "Desert Officer"
NameQuest = "DesertQuest"
QuestLv = 2
NameMon = "Desert Officer"
CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
elseif Lv == 90 or Lv <= 99 or SelectMonster == "Snow Bandit" or SelectArea == 'Snow' then -- Snow Bandit
Ms = "Snow Bandit"
NameQuest = "SnowQuest"
QuestLv = 1
NameMon = "Snow Bandit"
CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)
elseif Lv == 100 or Lv <= 119 or SelectMonster == "Snowman" or SelectArea == 'Snow' then -- Snowman
Ms = "Snowman"
NameQuest = "SnowQuest"
QuestLv = 2
NameMon = "Snowman"
CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
elseif Lv == 120 or Lv <= 149 or SelectMonster == "Chief Petty Officer" or SelectArea == 'Marine' then -- Chief Petty Officer
Ms = "Chief Petty Officer"
NameQuest = "MarineQuest2"
QuestLv = 1
NameMon = "Chief Petty Officer"
CFrameQ = CFrame.new(-5035.49609375, 28.677835464478, 4324.1840820313)
CFrameMon = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
elseif Lv == 150 or Lv <= 174 or SelectMonster == "Sky Bandit" or SelectArea == 'Sky' then -- Sky Bandit
Ms = "Sky Bandit"
NameQuest = "SkyQuest"
QuestLv = 1
NameMon = "Sky Bandit"
CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
CFrameMon = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
elseif Lv == 175 or Lv <= 189 or SelectMonster == "Dark Master" or SelectArea == 'Sky' then -- Dark Master
Ms = "Dark Master"
NameQuest = "SkyQuest"
QuestLv = 2
NameMon = "Dark Master"
CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
CFrameMon = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
elseif Lv == 190 or Lv <= 209 or SelectMonster == "Prisoner" or SelectArea == 'Prison' then -- Prisoner
Ms = "Prisoner"
NameQuest = "PrisonerQuest"
QuestLv = 1
NameMon = "Prisoner"
CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
CFrameMon = CFrame.new(4937.31885, 0.332031399, 649.574524, 0.694649816, 0, -0.719348073, 0, 1, 0, 0.719348073, 0, 0.694649816)
elseif Lv == 210 or Lv <= 249 or SelectMonster == "Dangerous Prisoner" or SelectArea == 'Prison' then -- Dangerous Prisoner
Ms = "Dangerous Prisoner"
NameQuest = "PrisonerQuest"
QuestLv = 2
NameMon = "Dangerous Prisoner"
CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
CFrameMon = CFrame.new(5099.6626, 0.351562679, 1055.7583, 0.898906827, 0, -0.438139856, 0, 1, 0, 0.438139856, 0, 0.898906827)
elseif Lv == 250 or Lv <= 274 or SelectMonster == "Toga Warrior" or SelectArea == 'Colosseum' then -- Toga Warrior
Ms = "Toga Warrior"
NameQuest = "ColosseumQuest"
QuestLv = 1
NameMon = "Toga Warrior"
CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
CFrameMon = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
elseif Lv == 275 or Lv <= 299 or SelectMonster == "Gladiator" or SelectArea == 'Colosseum' then -- Gladiator
Ms = "Gladiator"
NameQuest = "ColosseumQuest"
QuestLv = 2
NameMon = "Gladiator"
CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
CFrameMon = CFrame.new(-1521.3740234375, 81.203170776367, -3066.3139648438)
elseif Lv == 300 or Lv <= 324 or SelectMonster == "Military Soldier" or SelectArea == 'Magma' then -- Military Soldier
Ms = "Military Soldier"
NameQuest = "MagmaQuest"
QuestLv = 1
NameMon = "Military Soldier"
CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
CFrameMon = CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)
elseif Lv == 325 or Lv <= 374 or SelectMonster == "Military Spy" or SelectArea == 'Magma' then -- Military Spy
Ms = "Military Spy"
NameQuest = "MagmaQuest"
QuestLv = 2
NameMon = "Military Spy"
CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
CFrameMon = CFrame.new(-5787.00293, 75.8262634, 8651.69922, 0.838590562, 0, -0.544762194, 0, 1, 0, 0.544762194, 0, 0.838590562)
elseif Lv == 375 or Lv <= 399 or SelectMonster == "Fishman Warrior" or SelectArea == 'Fishman' then -- Fishman Warrior
Ms = "Fishman Warrior"
NameQuest = "FishmanQuest"
QuestLv = 1
NameMon = "Fishman Warrior"
CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
if _G.AutoLevelNoQuest or _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
end
elseif Lv == 400 or Lv <= 449 or SelectMonster == "Fishman Commando" or SelectArea == 'Fishman' then -- Fishman Commando
Ms = "Fishman Commando"
NameQuest = "FishmanQuest"
QuestLv = 2
NameMon = "Fishman Commando"
CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
if _G.AutoLevelNoQuest or _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
end
elseif Lv == 450 or Lv <= 474 or SelectMonster == "God's Guard" or SelectArea == 'Sky Island' then -- God's Guard
Ms = "God's Guard"
NameQuest = "SkyExp1Quest"
QuestLv = 1
NameMon = "God's Guard"
CFrameQ = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
CFrameMon = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
if _G.AutoLevelNoQuest or _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
end
elseif Lv == 475 or Lv <= 524 or SelectMonster == "Shanda" or SelectArea == 'Sky Island' then -- Shanda
Ms = "Shanda"
NameQuest = "SkyExp1Quest"
QuestLv = 2
NameMon = "Shanda"
CFrameQ = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
CFrameMon = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
if _G.AutoLevelNoQuest or _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
end
elseif Lv == 525 or Lv <= 549 or SelectMonster == "Royal Squad" or SelectArea == 'Sky Island' then -- Royal Squad
Ms = "Royal Squad"
NameQuest = "SkyExp2Quest"
QuestLv = 1
NameMon = "Royal Squad"
CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
CFrameMon = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
if _G.AutoLevelNoQuest or _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
end
elseif Lv == 550 or Lv <= 624 or SelectMonster == "Royal Soldier" or SelectArea == 'Sky Island' then -- Royal Soldier
Ms = "Royal Soldier"
NameQuest = "SkyExp2Quest"
QuestLv = 2
NameMon = "Royal Soldier"
CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
CFrameMon = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
if _G.AutoLevelNoQuest or _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
end
elseif Lv == 625 or Lv <= 649 or SelectMonster == "Galley Pirate" or SelectArea == 'Fountain' then -- Galley Pirate
Ms = "Galley Pirate"
NameQuest = "FountainQuest"
QuestLv = 1
NameMon = "Galley Pirate"
CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
elseif Lv >= 650 or SelectMonster == "Galley Captain" or SelectArea == 'Fountain' then -- Galley Captain
Ms = "Galley Captain"
NameQuest = "FountainQuest"
QuestLv = 2
NameMon = "Galley Captain"
CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
end
end
if Second_Sea then
if Lv == 700 or Lv <= 724 or SelectMonster == "Raider" or SelectArea == 'Area 1' then -- Raider
Ms = "Raider"
NameQuest = "Area1Quest"
QuestLv = 1
NameMon = "Raider"
CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
CFrameMon = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
elseif Lv == 725 or Lv <= 774 or SelectMonster == "Mercenary" or SelectArea == 'Area 1' then -- Mercenary
Ms = "Mercenary"
NameQuest = "Area1Quest"
QuestLv = 2
NameMon = "Mercenary"
CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
CFrameMon = CFrame.new(-864.85009765625, 122.47104644775, 1453.1505126953)
elseif Lv == 775 or Lv <= 799 or SelectMonster == "Swan Pirate" or SelectArea == 'Area 2' then -- Swan Pirate
Ms = "Swan Pirate"
NameQuest = "Area2Quest"
QuestLv = 1
NameMon = "Swan Pirate"
CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
CFrameMon = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
elseif Lv == 800 or Lv <= 874 or SelectMonster == "Factory Staff" or SelectArea == 'Area 2' then -- Factory Staff
Ms = "Factory Staff"
NameQuest = "Area2Quest"
QuestLv = 2
NameMon = "Factory Staff"
CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
CFrameMon = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)
elseif Lv == 875 or Lv <= 899 or SelectMonster == "Marine Lieutenan" or SelectArea == 'Marine' then -- Marine Lieutenant
Ms = "Marine Lieutenant"
NameQuest = "MarineQuest3"
QuestLv = 1
NameMon = "Marine Lieutenant"
CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
CFrameMon = CFrame.new(-2489.2622070313, 84.613594055176, -3151.8830566406)
elseif Lv == 900 or Lv <= 949 or SelectMonster == "Marine Captain" or SelectArea == 'Marine' then -- Marine Captain
Ms = "Marine Captain"
NameQuest = "MarineQuest3"
QuestLv = 2
NameMon = "Marine Captain"
CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
CFrameMon = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406)
elseif Lv == 950 or Lv <= 974 or SelectMonster == "Zombie" or SelectArea == 'Zombie' then -- Zombie
Ms = "Zombie"
NameQuest = "ZombieQuest"
QuestLv = 1
NameMon = "Zombie"
CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
CFrameMon = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)
elseif Lv == 975 or Lv <= 999 or SelectMonster == "Vampire" or SelectArea == 'Zombie' then -- Vampire
Ms = "Vampire"
NameQuest = "ZombieQuest"
QuestLv = 2
NameMon = "Vampire"
CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
CFrameMon = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)
elseif Lv == 1000 or Lv <= 1049 or SelectMonster == "Snow Trooper" or SelectArea == 'Snow Mountain' then -- Snow Trooper
Ms = "Snow Trooper"
NameQuest = "SnowMountainQuest"
QuestLv = 1
NameMon = "Snow Trooper"
CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
CFrameMon = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)
elseif Lv == 1050 or Lv <= 1099 or SelectMonster == "Winter Warrior" or SelectArea == 'Snow Mountain' then -- Winter Warrior
Ms = "Winter Warrior"
NameQuest = "SnowMountainQuest"
QuestLv = 2
NameMon = "Winter Warrior"
CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)
elseif Lv == 1100 or Lv <= 1124 or SelectMonster == "Lab Subordinate" or SelectArea == 'Ice Fire' then -- Lab Subordinate
Ms = "Lab Subordinate"
NameQuest = "IceSideQuest"
QuestLv = 1
NameMon = "Lab Subordinate"
CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
CFrameMon = CFrame.new(-5720.5576171875, 63.309471130371, -4784.6103515625)
elseif Lv == 1125 or Lv <= 1174 or SelectMonster == "Horned Warrior" or SelectArea == 'Ice Fire' then -- Horned Warrior
Ms = "Horned Warrior"
NameQuest = "IceSideQuest"
QuestLv = 2
NameMon = "Horned Warrior"
CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
CFrameMon = CFrame.new(-6292.751953125, 91.181983947754, -5502.6499023438)
elseif Lv == 1175 or Lv <= 1199 or SelectMonster == "Magma Ninja" or SelectArea == 'Ice Fire' then -- Magma Ninja
Ms = "Magma Ninja"
NameQuest = "FireSideQuest"
QuestLv = 1
NameMon = "Magma Ninja"
CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
CFrameMon = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
elseif Lv == 1200 or Lv <= 1249 or SelectMonster == "Lava Pirate" or SelectArea == 'Ice Fire' then -- Lava Pirate
Ms = "Lava Pirate"
NameQuest = "FireSideQuest"
QuestLv = 2
NameMon = "Lava Pirate"
CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
CFrameMon = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
elseif Lv == 1250 or Lv <= 1274 or SelectMonster == "Ship Deckhand" or SelectArea == 'Ship' then -- Ship Deckhand
Ms = "Ship Deckhand"
NameQuest = "ShipQuest1"
QuestLv = 1
NameMon = "Ship Deckhand"
CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
if _G.AutoLevel or _G.AutoLevelNoQuest and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
end
elseif Lv == 1275 or Lv <= 1299 or SelectMonster == "Ship Engineer" or SelectArea == 'Ship' then -- Ship Engineer
Ms = "Ship Engineer"
NameQuest = "ShipQuest1"
QuestLv = 2
NameMon = "Ship Engineer"
CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
if _G.AutoLevelNoQuest or _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
end
elseif Lv == 1300 or Lv <= 1324 or SelectMonster == "Ship Steward" or SelectArea == 'Ship' then -- Ship Steward
Ms = "Ship Steward"
NameQuest = "ShipQuest2"
QuestLv = 1
NameMon = "Ship Steward"
CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
if _G.AutoLevelNoQuest or _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
end
elseif Lv == 1325 or Lv <= 1349 or SelectMonster == "Ship Officer" or SelectArea == 'Ship' then -- Ship Officer
Ms = "Ship Officer"
NameQuest = "ShipQuest2"
QuestLv = 2
NameMon = "Ship Officer"
CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
if _G.AutoLevelNoQuest or _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
end
elseif Lv == 1350 or Lv <= 1374 or SelectMonster == "Arctic Warrior" or SelectArea == 'Frost' then -- Arctic Warrior
Ms = "Arctic Warrior"
NameQuest = "FrostQuest"
QuestLv = 1
NameMon = "Arctic Warrior"
CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)
elseif Lv == 1375 or Lv <= 1424 or SelectMonster == "Snow Lurker" or SelectArea == 'Frost' then -- Snow Lurker
Ms = "Snow Lurker"
NameQuest = "FrostQuest"
QuestLv = 2
NameMon = "Snow Lurker"
CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
CFrameMon = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)
elseif Lv == 1425 or Lv <= 1449 or SelectMonster == "Sea Soldier" or SelectArea == 'Forgotten' then -- Sea Soldier
Ms = "Sea Soldier"
NameQuest = "ForgottenQuest"
QuestLv = 1
NameMon = "Sea Soldier"
CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
CFrameMon = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
elseif Lv >= 1450 or SelectMonster == "Water Fighter" or SelectArea == 'Forgotten' then -- Water Fighter
Ms = "Water Fighter"
NameQuest = "ForgottenQuest"
QuestLv = 2
NameMon = "Water Fighter"
CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
CFrameMon = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)
end
end
if Third_Sea then
if Lv == 1500 or Lv <= 1524 or SelectMonster == "Pirate Millionaire" or SelectArea == 'Pirate Port' then -- Pirate Millionaire
Ms = "Pirate Millionaire"
NameQuest = "PiratePortQuest"
QuestLv = 1
NameMon = "Pirate Millionaire"
CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
CFrameMon = CFrame.new(-435.68109130859, 189.69866943359, 5551.0756835938)
elseif Lv == 1525 or Lv <= 1574 or SelectMonster == "Pistol Billionaire" or SelectArea == 'Pirate Port' then -- Pistol Billoonaire
Ms = "Pistol Billionaire"
NameQuest = "PiratePortQuest"
QuestLv = 2
NameMon = "Pistol Billionaire"
CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
CFrameMon = CFrame.new(-236.53652954102, 217.46676635742, 6006.0883789063)
elseif Lv == 1575 or Lv <= 1599 or SelectMonster == "Dragon Crew Warrior" or SelectArea == 'Amazon' then -- Dragon Crew Warrior
Ms = "Dragon Crew Warrior"
NameQuest = "AmazonQuest"
QuestLv = 1
NameMon = "Dragon Crew Warrior"
CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
CFrameMon = CFrame.new(6301.9975585938, 104.77153015137, -1082.6075439453)
elseif Lv == 1600 or Lv <= 1624 or SelectMonster == "Dragon Crew Archer" or SelectArea == 'Amazon' then -- Dragon Crew Archer
Ms = "Dragon Crew Archer"
NameQuest = "AmazonQuest"
QuestLv = 2
NameMon = "Dragon Crew Archer"
CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
CFrameMon = CFrame.new(6831.1171875, 441.76708984375, 446.58615112305)
elseif Lv == 1625 or Lv <= 1649 or SelectMonster == "Female Islander" or SelectArea == 'Amazon' then -- Female Islander
Ms = "Female Islander"
NameQuest = "AmazonQuest2"
QuestLv = 1
NameMon = "Female Islander"
CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
CFrameMon = CFrame.new(5792.5166015625, 848.14392089844, 1084.1818847656)
elseif Lv == 1650 or Lv <= 1699 or SelectMonster == "Giant Islander" or SelectArea == 'Amazon' then -- Giant Islander
Ms = "Giant Islander"
NameQuest = "AmazonQuest2"
QuestLv = 2
NameMon = "Giant Islander"
CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
CFrameMon = CFrame.new(5009.5068359375, 664.11071777344, -40.960144042969)
elseif Lv == 1700 or Lv <= 1724 or SelectMonster == "Marine Commodore" or SelectArea == 'Marine Tree' then -- Marine Commodore
Ms = "Marine Commodore"
NameQuest = "MarineTreeIsland"
QuestLv = 1
NameMon = "Marine Commodore"
CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)
elseif Lv == 1725 or Lv <= 1774 or SelectMonster == "Marine Rear Admiral" or SelectArea == 'Marine Tree' then -- Marine Rear Admiral
Ms = "Marine Rear Admiral"
NameQuest = "MarineTreeIsland"
QuestLv = 2
NameMon = "Marine Rear Admiral"
CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, -7048.6342773438)
elseif Lv == 1775 or Lv <= 1799 or SelectMonster == "Fishman Raider" or SelectArea == 'Deep Forest' then -- Fishman Raide
Ms = "Fishman Raider"
NameQuest = "DeepForestIsland3"
QuestLv = 1
NameMon = "Fishman Raider"
CFrameQ = CFrame.new(-10582.759765625, 331.78845214844, -8757.666015625)
CFrameMon = CFrame.new(-10553.268554688, 521.38439941406, -8176.9458007813)
elseif Lv == 1800 or Lv <= 1824 or SelectMonster == "Fishman Captain" or SelectArea == 'Deep Forest' then -- Fishman Captain
Ms = "Fishman Captain"
NameQuest = "DeepForestIsland3"
QuestLv = 2
NameMon = "Fishman Captain"
CFrameQ = CFrame.new(-10583.099609375, 331.78845214844, -8759.4638671875)
CFrameMon = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)
elseif Lv == 1825 or Lv <= 1849 or SelectMonster == "Forest Pirate" or SelectArea == 'Deep Forest' then -- Forest Pirate
Ms = "Forest Pirate"
NameQuest = "DeepForestIsland"
QuestLv = 1
NameMon = "Forest Pirate"
CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
CFrameMon = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
elseif Lv == 1850 or Lv <= 1899 or SelectMonster == "Mythological Pirate" or SelectArea == 'Deep Forest' then -- Mythological Pirate
Ms = "Mythological Pirate"
NameQuest = "DeepForestIsland"
QuestLv = 2
NameMon = "Mythological Pirate"
CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
CFrameMon = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
elseif Lv == 1900 or Lv <= 1924 or SelectMonster == "Jungle Pirate" or SelectArea == 'Deep Forest' then -- Jungle Pirate
Ms = "Jungle Pirate"
NameQuest = "DeepForestIsland2"
QuestLv = 1
NameMon = "Jungle Pirate"
CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
CFrameMon = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)
elseif Lv == 1925 or Lv <= 1974 or SelectMonster == "Musketeer Pirate" or SelectArea == 'Deep Forest' then -- Musketeer Pirate
Ms = "Musketeer Pirate"
NameQuest = "DeepForestIsland2"
QuestLv = 2
NameMon = "Musketeer Pirate"
CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
CFrameMon = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
elseif Lv == 1975 or Lv <= 1999 or SelectMonster == "Reborn Skeleton" or SelectArea == 'Haunted Castle' then
Ms = "Reborn Skeleton"
NameQuest = "HauntedQuest1"
QuestLv = 1
NameMon = "Reborn Skeleton"
CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
CFrameMon = CFrame.new(-8761.77148, 183.431747, 6168.33301, 0.978073597, -1.3950732e-05, -0.208259016, -1.08073925e-06, 1, -7.20630269e-05, 0.208259016, 7.07080399e-05, 0.978073597)
elseif Lv == 2000 or Lv <= 2024 or SelectMonster == "Living Zombie" or SelectArea == 'Haunted Castle' then
Ms = "Living Zombie"
NameQuest = "HauntedQuest1"
QuestLv = 2
NameMon = "Living Zombie"
CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
CFrameMon = CFrame.new(-10103.7529, 238.565979, 6179.75977, 0.999474227, 2.77547141e-08, 0.0324240364, -2.58006327e-08, 1, -6.06848474e-08, -0.0324240364, 5.98163865e-08, 0.999474227)
elseif Lv == 2025 or Lv <= 2049 or SelectMonster == "Demonic Soul" or SelectArea == 'Haunted Castle' then
Ms = "Demonic Soul"
NameQuest = "HauntedQuest2"
QuestLv = 1
NameMon = "Demonic Soul"
CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
CFrameMon = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
elseif Lv == 2050 or Lv <= 2074 or SelectMonster == "Posessed Mummy" or SelectArea == 'Haunted Castle' then
Ms = "Posessed Mummy"
NameQuest = "HauntedQuest2"
QuestLv = 2
NameMon = "Posessed Mummy"
CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
CFrameMon = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)
elseif Lv == 2075 or Lv <= 2099 or SelectMonster == "Peanut Scout" or SelectArea == 'Nut Island' then
Ms = "Peanut Scout"
NameQuest = "NutsIslandQuest"
QuestLv = 1
NameMon = "Peanut Scout"
CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
elseif Lv == 2100 or Lv <= 2124 or SelectMonster == "Peanut President" or SelectArea == 'Nut Island' then
Ms = "Peanut President"
NameQuest = "NutsIslandQuest"
QuestLv = 2
NameMon = "Peanut President"
CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
elseif Lv == 2125 or Lv <= 2149 or SelectMonster == "Ice Cream Chef" or SelectArea == 'Ice Cream Island' then
Ms = "Ice Cream Chef"
NameQuest = "IceCreamIslandQuest"
QuestLv = 1
NameMon = "Ice Cream Chef"
CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, -0, -0.997525156, -0, 1.00000012, -0, 0.997525275, 0, -0.0703101456)
elseif Lv == 2150 or Lv <= 2199 or SelectMonster == "Ice Cream Commander" or SelectArea == 'Ice Cream Island' then
Ms = "Ice Cream Commander"
NameQuest = "IceCreamIslandQuest"
QuestLv = 2
NameMon = "Ice Cream Commander"
CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, -0, -0.997525156, -0, 1.00000012, -0, 0.997525275, 0, -0.0703101456)
elseif Lv == 2200 or Lv <= 2224 or SelectMonster == "Cookie Crafter" or SelectArea == 'Cake Island' then
Ms = "Cookie Crafter"
NameQuest = "CakeQuest1"
QuestLv = 1
NameMon = "Cookie Crafter"
CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
CFrameMon = CFrame.new(-2321.71216, 36.699482, -12216.7871, -0.780074954, 0, 0.625686109, 0, 1, 0, -0.625686109, 0, -0.780074954)
elseif Lv == 2225 or Lv <= 2249 or SelectMonster == "Cake Guard" or SelectArea == 'Cake Island' then
Ms = "Cake Guard"
NameQuest = "CakeQuest1"
QuestLv = 2
NameMon = "Cake Guard"
CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
CFrameMon = CFrame.new(-1418.11011, 36.6718941, -12255.7324, 0.0677844882, 0, 0.997700036, 0, 1, 0, -0.997700036, 0, 0.0677844882)
elseif Lv == 2250 or Lv <= 2274 or SelectMonster == "Baking Staff" or SelectArea == 'Cake Island' then
Ms = "Baking Staff"
NameQuest = "CakeQuest2"
QuestLv = 1
NameMon = "Baking Staff"
CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401)
CFrameMon = CFrame.new(-1980.43848, 36.6716766, -12983.8418, -0.254443765, 0, -0.967087567, 0, 1, 0, 0.967087567, 0, -0.254443765)
elseif Lv == 2275 or Lv <= 2299 or SelectMonster == "Head Baker" or SelectArea == 'Cake Island' then
Ms = "Head Baker"
NameQuest = "CakeQuest2"
QuestLv = 2
NameMon = "Head Baker"
CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401)
CFrameMon = CFrame.new(-2251.5791, 52.2714615, -13033.3965, -0.991971016, 0, -0.126466095, 0, 1, 0, 0.126466095, 0, -0.991971016)
elseif Lv == 2300 or Lv <= 2324 or SelectMonster == "Cocoa Warrior" or SelectArea == 'Choco Island' then
Ms = "Cocoa Warrior"
NameQuest = "ChocQuest1"
QuestLv = 1
NameMon = "Cocoa Warrior"
CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
CFrameMon = CFrame.new(167.978516, 26.2254658, -12238.874, -0.939700961, 0, 0.341998369, 0, 1, 0, -0.341998369, 0, -0.939700961)
elseif Lv == 2325 or Lv <= 2349 or SelectMonster == "Chocolate Bar Battler" or SelectArea == 'Choco Island' then
Ms = "Chocolate Bar Battler"
NameQuest = "ChocQuest1"
QuestLv = 2
NameMon = "Chocolate Bar Battler"
CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
CFrameMon = CFrame.new(701.312073, 25.5824986, -12708.2148, -0.342042685, 0, -0.939684391, 0, 1, 0, 0.939684391, 0, -0.342042685)
elseif Lv == 2350 or Lv <= 2374 or SelectMonster == "Sweet Thief" or SelectArea == 'Choco Island' then
Ms = "Sweet Thief"
NameQuest = "ChocQuest2"
QuestLv = 1
NameMon = "Sweet Thief"
CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
CFrameMon = CFrame.new(-140.258301, 25.5824986, -12652.3115, 0.173624337, -0, -0.984811902, 0, 1, -0, 0.984811902, 0, 0.173624337)
elseif Lv == 2375 or Lv <= 2400 or SelectMonster == "Candy Rebel" or SelectArea == 'Choco Island' then
Ms = "Candy Rebel"
NameQuest = "ChocQuest2"
QuestLv = 2
NameMon = "Candy Rebel"
CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
CFrameMon = CFrame.new(47.9231453, 25.5824986, -13029.2402, -0.819156051, 0, -0.573571265, 0, 1, 0, 0.573571265, 0, -0.819156051)
elseif Lv == 2400 or Lv <= 2424 or SelectMonster == "Candy Pirate" or SelectArea == 'Candy Island' then
Ms = "Candy Pirate"
NameQuest = "CandyQuest1"
QuestLv = 1
NameMon = "Candy Pirate"
CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
CFrameMon = CFrame.new(-1437.56348, 17.1481285, -14385.6934, 0.173624337, -0, -0.984811902, 0, 1, -0, 0.984811902, 0, 0.173624337)
elseif Lv == 2425 or Lv <= 2449 or SelectMonster == "Snow Demon" or SelectArea == 'Candy Island' then
Ms = "Snow Demon"
NameQuest = "CandyQuest1"
QuestLv = 2
NameMon = "Snow Demon"
CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
CFrameMon = CFrame.new(-916.222656, 17.1481285, -14638.8125, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
elseif Lv == 2450 or Lv <= 2474 or SelectMonster == "Isle Outlaw" or SelectArea == 'Tiki Outpost' then
Ms = "Isle Outlaw"
NameQuest = "TikiQuest1"
QuestLv = 1
NameMon = "Isle Outlaw"
CFrameQ = CFrame.new(-16549.890625, 55.68635559082031, -179.91360473632812)
CFrameMon = CFrame.new(-16162.8193359375, 11.6863374710083, -96.45481872558594)
elseif Lv == 2475 or Lv <= 2499 or SelectMonster == "Island Boy" or SelectArea == 'Tiki Outpost' then
Ms = "Island Boy"
NameQuest = "TikiQuest1"
QuestLv = 2
NameMon = "Island Boy"
CFrameQ = CFrame.new(-16549.890625, 55.68635559082031, -179.91360473632812)
CFrameMon = CFrame.new(-16912.130859375, 11.787443161010742, -133.0850830078125)
elseif Lv == 2500 or Lv <= 2524 or SelectMonster == "Sun-kissed Warrior" or SelectArea == 'Tiki Outpost' then
Ms = "Sun-kissed Warrior"
NameQuest = "TikiQuest2"
QuestLv = 1
NameMon = "Sun-kissed Warrior"
CFrameQ = CFrame.new(-16542.447265625, 55.68632888793945, 1044.41650390625)
CFrameMon = CFrame.new(-16206.720703125, 93.7525863647461, 1142.5855712890625)
elseif Lv >= 2525 or SelectMonster == "Isle Champion" or SelectArea == 'Tiki Outpost' then
Ms = "Isle Champion"
NameQuest = "TikiQuest2"
QuestLv = 2
NameMon = "Isle Champion"
CFrameQ = CFrame.new(-16542.447265625, 55.68632888793945, 1044.41650390625)
CFrameMon = CFrame.new(-16848.94140625, 21.68633460998535, 1041.4490966796875)
end
end
end

function isnil(thing)
return (thing == nil)
end
local function round(n)
return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
for i,v in pairs(game:GetService'Players':GetChildren()) do
pcall(function()
if not isnil(v.Character) then
if _G.EspPlayer then
if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
local bill = Instance.new('BillboardGui',v.Character.Head)
bill.Name = 'NameEsp'..Number
bill.ExtentsOffset = Vector3.new(0, 1, 0)
bill.Size = UDim2.new(1,200,1,30)
bill.Adornee = v.Character.Head
bill.AlwaysOnTop = true
local name = Instance.new('TextLabel',bill)
name.Font = Enum.Font.GothamSemibold
name.FontSize = "Size14"
name.TextWrapped = true
name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..'M')
name.Size = UDim2.new(1,0,1,0)
name.TextYAlignment = 'Top'
name.BackgroundTransparency = 1
name.TextStrokeTransparency = 0.5
if v.Team == game.Players.LocalPlayer.Team then
name.TextColor3 = Color3.new(0,255,0)
else
name.TextColor3 = Color3.new(255,0,0)
end
else
v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..' | '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..'M\nHealth : ' .. round(v.Character.Humanoid.Health*100/v.Character.Humanoid.MaxHealth) .. '%')
end
else
if v.Character.Head:FindFirstChild('NameEsp'..Number) then
v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
end
end
end
end)
end
end

function UpdateChestChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
pcall(function()
if string.find(v.Name,"Chest") then
if _G.EspChest then
if string.find(v.Name,"Chest") then
if not v:FindFirstChild('NameEsp'..Number) then
local bill = Instance.new('BillboardGui',v)
bill.Name = 'NameEsp'..Number
bill.ExtentsOffset = Vector3.new(0, 1, 0)
bill.Size = UDim2.new(1,200,1,30)
bill.Adornee = v
bill.AlwaysOnTop = true
local name = Instance.new('TextLabel',bill)
name.Font = Enum.Font.GothamSemibold
name.FontSize = "Size14"
name.TextWrapped = true
name.Size = UDim2.new(1,0,1,0)
name.TextYAlignment = 'Top'
name.BackgroundTransparency = 1
name.TextStrokeTransparency = 0.5
if v.Name == "Chest1" then
name.TextColor3 = Color3.fromRGB(109, 109, 109)
name.Text = ("Chest 1" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..'M')
end
if v.Name == "Chest2" then
name.TextColor3 = Color3.fromRGB(173, 158, 21)
name.Text = ("Chest 2" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..'M')
end
if v.Name == "Chest3" then
name.TextColor3 = Color3.fromRGB(85, 255, 255)
name.Text = ("Chest 3" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..'M')
end
else
v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..'M')
end
end
else
if v:FindFirstChild('NameEsp'..Number) then
v:FindFirstChild('NameEsp'..Number):Destroy()
end
end
end
end)
end
end

function UpdateDevilChams()
for i,v in pairs(game.Workspace:GetChildren()) do
pcall(function()
if _G.EspFruit then
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
name.TextColor3 = Color3.fromRGB(255, 255, 255)
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

function UpdateIslandESP()
for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
pcall(function()
if _G.EspIsland then 
if v.Name ~= "Sea" then
if not v:FindFirstChild('NameEsp') then
local bill = Instance.new('BillboardGui',v)
bill.Name = 'NameEsp'
bill.ExtentsOffset = Vector3.new(0, 1, 0)
bill.Size = UDim2.new(1,200,1,30)
bill.Adornee = v
bill.AlwaysOnTop = true
local name = Instance.new('TextLabel',bill)
name.Font = "GothamBold"
name.FontSize = "Size14"
name.TextWrapped = true
name.Size = UDim2.new(1,0,1,0)
name.TextYAlignment = 'Top'
name.BackgroundTransparency = 1
name.TextStrokeTransparency = 0.5
name.TextColor3 = Color3.fromRGB(7, 236, 240)
else
v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..'M')
end
end
else
if v:FindFirstChild('NameEsp') then
v:FindFirstChild('NameEsp'):Destroy()
end
end
end)
end
end

function UpdateFlowerChams()
for i,v in pairs(game.Workspace:GetChildren()) do
pcall(function()
if v.Name == "Flower2" or v.Name == "Flower1" then
if _G.EspFlower then 
if not v:FindFirstChild('NameEsp'..Number) then
local bill = Instance.new('BillboardGui',v)
bill.Name = 'NameEsp'..Number
bill.ExtentsOffset = Vector3.new(0, 1, 0)
bill.Size = UDim2.new(1,200,1,30)
bill.Adornee = v
bill.AlwaysOnTop = true
local name = Instance.new('TextLabel',bill)
name.Font = Enum.Font.GothamSemibold
name.FontSize = "Size14"
name.TextWrapped = true
name.Size = UDim2.new(1,0,1,0)
name.TextYAlignment = 'Top'
name.BackgroundTransparency = 1
name.TextStrokeTransparency = 0.5
name.TextColor3 = Color3.fromRGB(255, 0, 0)
if v.Name == "Flower1" then 
name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..'M')
name.TextColor3 = Color3.fromRGB(0, 0, 255)
end
if v.Name == "Flower2" then
name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..'M')
name.TextColor3 = Color3.fromRGB(255, 0, 0)
end
else
v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..'M')
end
else
if v:FindFirstChild('NameEsp'..Number) then
v:FindFirstChild('NameEsp'..Number):Destroy()
end
end
end   
end)
end
end

function UpdateRealFruitChams() 
for i,v in pairs(game.Workspace.AppleSpawner:GetChildren()) do
if v:IsA("Tool") then
if _G.EspRealFruit then 
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
name.TextColor3 = Color3.fromRGB(255, 0, 0)
name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..'M')
else
v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..'M')
end
else
if v.Handle:FindFirstChild('NameEsp'..Number) then
v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
end
end 
end
end
for i,v in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
if v:IsA("Tool") then
if _G.EspRealFruit then 
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
name.TextColor3 = Color3.fromRGB(255, 174, 0)
name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..'M')
else
v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..'M')
end
else
if v.Handle:FindFirstChild('NameEsp'..Number) then
v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
end
end 
end
end
for i,v in pairs(game.Workspace.BananaSpawner:GetChildren()) do
if v:IsA("Tool") then
if _G.EspRealFruit then 
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
name.TextColor3 = Color3.fromRGB(251, 255, 0)
name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..'M')
else
v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..'M')
end
else
if v.Handle:FindFirstChild('NameEsp'..Number) then
v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
end
end 
end
end
end

function UpdateIslandMirageESP()
for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
pcall(function()
if _G.EspMirageIsland then 
if v.Name == "Mirage Island" then
if not v:FindFirstChild('NameEsp') then
local bill = Instance.new('BillboardGui',v)
bill.Name = 'NameEsp'
bill.ExtentsOffset = Vector3.new(0, 1, 0)
bill.Size = UDim2.new(1,200,1,30)
bill.Adornee = v
bill.AlwaysOnTop = true
local name = Instance.new('TextLabel',bill)
name.Font = "Code"
name.FontSize = "Size14"
name.TextWrapped = true
name.Size = UDim2.new(1,0,1,0)
name.TextYAlignment = 'Top'
name.BackgroundTransparency = 1
name.TextStrokeTransparency = 0.5
name.TextColor3 = Color3.fromRGB(80, 245, 245)
else
v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..'M')
end
end
else
if v:FindFirstChild('NameEsp') then
v:FindFirstChild('NameEsp'):Destroy()
end
end
end)
end
end

function UpdateIslandKitsuneESP()
for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
pcall(function()
if _G.EspKitsuneIsland then 
if v.Name == "Kitsune Island" then
if not v:FindFirstChild('NameEsp') then
local bill = Instance.new('BillboardGui',v)
bill.Name = 'NameEsp'
bill.ExtentsOffset = Vector3.new(0, 1, 0)
bill.Size = UDim2.new(1,200,1,30)
bill.Adornee = v
bill.AlwaysOnTop = true
local name = Instance.new('TextLabel',bill)
name.Font = "Code"
name.FontSize = "Size14"
name.TextWrapped = true
name.Size = UDim2.new(1,0,1,0)
name.TextYAlignment = 'Top'
name.BackgroundTransparency = 1
name.TextStrokeTransparency = 0.5
name.TextColor3 = Color3.fromRGB(120, 253, 245)
else
v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..'M')
end
end
else
if v:FindFirstChild('NameEsp') then
v:FindFirstChild('NameEsp'):Destroy()
end
end
end)
end
end

function UpdateAfdESP()
for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
pcall(function()
if _G.EspAdvanceDealer then 
if v.Name == "Advanced Fruit Dealer" then
if not v:FindFirstChild('NameEsp') then
local bill = Instance.new('BillboardGui',v)
bill.Name = 'NameEsp'
bill.ExtentsOffset = Vector3.new(0, 1, 0)
bill.Size = UDim2.new(1,200,1,30)
bill.Adornee = v
bill.AlwaysOnTop = true
local name = Instance.new('TextLabel',bill)
name.Font = "Code"
name.FontSize = "Size14"
name.TextWrapped = true
name.Size = UDim2.new(1,0,1,0)
name.TextYAlignment = 'Top'
name.BackgroundTransparency = 1
name.TextStrokeTransparency = 0.5
name.TextColor3 = Color3.fromRGB(80, 245, 245)
else
v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..'M')
end
end
else
if v:FindFirstChild('NameEsp') then
v:FindFirstChild('NameEsp'):Destroy()
end
end
end)
end
end

function UpdateAuraESP()
for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
pcall(function()
if _G.EspMasterAura then 
if v.Name == "Master of Enhancement" then
if not v:FindFirstChild('NameEsp') then
local bill = Instance.new('BillboardGui',v)
bill.Name = 'NameEsp'
bill.ExtentsOffset = Vector3.new(0, 1, 0)
bill.Size = UDim2.new(1,200,1,30)
bill.Adornee = v
bill.AlwaysOnTop = true
local name = Instance.new('TextLabel',bill)
name.Font = "Code"
name.FontSize = "Size14"
name.TextWrapped = true
name.Size = UDim2.new(1,0,1,0)
name.TextYAlignment = 'Top'
name.BackgroundTransparency = 1
name.TextStrokeTransparency = 0.5
name.TextColor3 = Color3.fromRGB(80, 245, 245)
else
v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..'M')
end
end
else
if v:FindFirstChild('NameEsp') then
v:FindFirstChild('NameEsp'):Destroy()
end
end
end)
end
end

function UpdateLSDESP()
for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
pcall(function()
if _G.EspLegendDealer then 
if v.Name == "Legendary Sword Dealer" then
if not v:FindFirstChild('NameEsp') then
local bill = Instance.new('BillboardGui',v)
bill.Name = 'NameEsp'
bill.ExtentsOffset = Vector3.new(0, 1, 0)
bill.Size = UDim2.new(1,200,1,30)
bill.Adornee = v
bill.AlwaysOnTop = true
local name = Instance.new('TextLabel',bill)
name.Font = "Code"
name.FontSize = "Size14"
name.TextWrapped = true
name.Size = UDim2.new(1,0,1,0)
name.TextYAlignment = 'Top'
name.BackgroundTransparency = 1
name.TextStrokeTransparency = 0.5
name.TextColor3 = Color3.fromRGB(80, 245, 245)
else
v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..'M')
end
end
else
if v:FindFirstChild('NameEsp') then
v:FindFirstChild('NameEsp'):Destroy()
end
end
end)
end
end

function UpdateGearESP()
for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do 
pcall(function()
if _G.EspGear then 
if v.Name == "MeshPart" then
if not v:FindFirstChild('NameEsp') then
local bill = Instance.new('BillboardGui',v)
bill.Name = 'NameEsp'
bill.ExtentsOffset = Vector3.new(0, 1, 0)
bill.Size = UDim2.new(1,200,1,30)
bill.Adornee = v
bill.AlwaysOnTop = true
local name = Instance.new('TextLabel',bill)
name.Font = "Code"
name.FontSize = "Size14"
name.TextWrapped = true
name.Size = UDim2.new(1,0,1,0)
name.TextYAlignment = 'Top'
name.BackgroundTransparency = 1
name.TextStrokeTransparency = 0.5
name.TextColor3 = Color3.fromRGB(80, 245, 245)
else
v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..'M')
end
end
else
if v:FindFirstChild('NameEsp') then
v:FindFirstChild('NameEsp'):Destroy()
end
end
end)
end
end

function CheckRace()
    local bf = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
    local c4 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1")
    if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V4"
    end
    if bf == -2 then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V3"
    end
    if c4 == -2 then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V2"
    end
    return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V1"
end

function CheckNearestTeleporter(aI)
    vcspos = aI.Position
    min, min2 = math.huge, math.huge
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
            ["Castle On The Sea"] = Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
            ["Hydra Island"] = Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
            ["Mansion"] = Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
            ["Great Tree"] = Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586),
            ["Beautiful Room Gate"] = Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875),
            ["Beautiful Room Domain"] = Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656)
        }
    elseif NewWorld then
        TableLocations = {
            ["Mansion"] = Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
            ["Swan Room"] = Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
            ["Cursed Ship Domain"] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
            ["Cursed Ship Gate"] = Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
        }
    elseif OldWorld then
        TableLocations = {
            ["Sky Island 3"] = Vector3.new(-7894.6201171875, 5545.49169921875, -380.2467346191406),
            ["Sky Island 2"] = Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
            ["Under Water Island"] = Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
            ["4"] = Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875)
        }
    end
    TableLocations2 = {}
    for r, v in pairs(TableLocations) do
        TableLocations2[r] = (v - vcspos).Magnitude
    end
    for r, v in pairs(TableLocations2) do
        if v < min then
            min, min2 = v, v
        end
        if v <= min then
            choose = TableLocations[r]
        end
    end
    min3 = (vcspos - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if min2 <= min3 then
        return choose
    end
end

function requestEntrance(aJ)
    args = {"requestEntrance", aJ}
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
    oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    char = game.Players.LocalPlayer.Character.HumanoidRootPart
    char.CFrame = CFrame.new(oldcframe.X, oldcframe.Y + 50, oldcframe.Z)
    task.wait(0.5)
end

function CheckBypassTrue(bucu)
local BlacklistItemTp = {"Torch","Cup","Relic","Hellfire Torch","Core Brain","Holy Torch","Apple","Banana","Pineapple","Flower 1","Flower 2","Flower 3","Sweet Chalice","God's Chalice","Fist of Darkness","Hallow Essence"}
if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(BlacklistItemTp) or game:GetService("Players").LocalPlayer.Character:FindFirstChild(BlacklistItemTp) or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(NameFruitList) or game:GetService("Players").LocalPlayer.Character:FindFirstChild(NameFruitList) then
return "Tween"
end

if BypassTP then
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - bucu.Position).Magnitude > 2500 then
return "Bypass"
elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - bucu.Position).Magnitude < 2500 then
return "Tween"
end
else
return "Tween"
end

return "Tween"
end

function AntiLowHealth(aK)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,aK,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
wait()
end

function BTP(p)
repeat wait(0.5)
game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
wait(.05)
game.Players.LocalPlayer.Character.Head:Destroy()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
until (p.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 and game.Players.LocalPlayer.Character.Humanoid.Health > 0
wait()
end

function TweenBoat(P1)
local Distance = (P1.Position - MyShip.Position).Magnitude
if Distance < 25 then
Speed = 2500
elseif Distance < 50 then
Speed = 1000
elseif Distance < 150 then
Speed = 450
elseif Distance >= 1000 then
Speed = _G.TweenSpeedBoat
end
game:GetService("TweenService"):Create(MyShip,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear), {
CFrame = P1
}):Play()
if _G.StopTween then
game:GetService("TweenService"):Create(MyShip,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear), {
CFrame = P1
}):Cancel()
end
end

function Tween(P1)
pcall(function()
if plr and Char and Char:FindFirstChild("Humanoid") and Char:FindFirstChild("HumanoidRootPart") and HM.Health > 0 and HumanoidRP then
TweenSpeed = TweenSpeed or ChangeSpeed or 325

local DefaultY = P1.Y
local targetCFrameWithDefaultY = CFrame.new(P1.X, DefaultY, P1.Z)
local OldY = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y 
local b1 = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,DefaultY,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)

local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if Distance <= 250 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P1
elseif Distance < 500 then
TweenSpeed = 750
elseif Distance < 750 then
TweenSpeed = 425
elseif Distance >= 1000 then
TweenSpeed = ChangeSpeed
end
LowHealth = game.Players.LocalPlayer.Character.Humanoid.MaxHealth * 0.3
NotLowHealth = game.Players.LocalPlayer.Character.Humanoid.MaxHealth * 0.7
if game.Players.LocalPlayer.Character.Humanoid.Health <= LowHealth then
pcall(function()
tween:Cancel()
end)
repeat wait()
AntiLowHealth(math.random(100, 750))
until not game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") or game.Players.LocalPlayer.Character.Humanoid.Health > NotLowHealth
AntiLowHealth(OldY)
end
if CheckNearestTeleporter(P1) then
pcall(function()
tween:Cancel()
end)
requestEntrance(CheckNearestTeleporter(P1))
end

if _G.StopTween then
pcall(function()
tween:Cancel()
end)
end

if CheckBypassTrue(P1) == "Bypass" then
BTP(P1)
elseif CheckBypassTrue(P1) == "Tween" then
if (b1.Position - targetCFrameWithDefaultY.Position).Magnitude > 5 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = b1
local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/TweenSpeed, Enum.EasingStyle.Linear), {CFrame = targetCFrameWithDefaultY})
tween:Play()

if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then
tween:Cancel()
end

tween.Completed:Wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = b1
else
local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/TweenSpeed, Enum.EasingStyle.Linear), {CFrame = P1})
tween:Play()

if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then
tween:Cancel()
end

tween.Completed:Wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = b1
end
end

if not tween then
return tween
end

end
end)
end

function TweenButton(P1)
pcall(function()
if plr and Char and Char:FindFirstChild("Humanoid") and Char:FindFirstChild("HumanoidRootPart") and HM.Health > 0 and HumanoidRP then
if not TweenSpeed or type(TweenSpeed) ~= "number" then
TweenSpeed = 300
end

local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if Distance <= 250 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P1
elseif Distance < 500 then
TweenSpeed = 500
elseif Distance < 750 then
TweenSpeed = 375
elseif Distance >= 1000 then
TweenSpeed = 300
end

local aM = CheckNearestTeleporter(P1)
if aM then
requestEntrance(aM)
end
if CheckBypassTrue(P1) == "Bypass" then
BTP(P1)
elseif CheckBypassTrue(P1) == "Tween" then
local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/TweenSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {CFrame = P1})
tween:Play()
TweenButtonFly = true

if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then
TweenButtonFly = false
end

if _G.StopTween then
tween:Cancel()
TweenButtonFly = false
return
end

function tween:Stop()
tween:Cancel()
TweenButtonFly = false
end

wait(Distance/TweenSpeed)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P1
TweenButtonFly = false
end
end
end)
end

function CancelTween(target)
if not target then
if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("MightHubTweenVip") then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("MightHubTweenVip"):Destroy()
end
_G.StopTween = true
Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
wait(0.1)
_G.StopTween = false
end
end

function TeleportCF(P1)
HMRP.CFrame = P1
HMRP.CFrame = P1
end

spawn(function()
while wait() do
pcall(function()
if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
game.Players.LocalPlayer.Character.Stun.Changed:Connect(function()
pcall(function()
if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
game.Players.LocalPlayer.Character.Stun.Value = 0
end
end)
end)
end
end)
end
end)

function CheckAcientOneStatus()
local bulon, bucac, bucu = nil, nil, nil
bulon, bucac, bucu = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("UpgradeRace","Check")
if not game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
return "You have yet to achieve greatness."
end
if bulon == 0 then
return "You're ready for the next trial."
elseif bulon == 1 or bulon == 3 then
return "Come back when you've trained more."
elseif bulon == 2 then
return "I have no need for it, I'll sell it to you for f" .. bucu .. "."
elseif bulon == 4 then
return "As promised, I'll upgrade your transformation limit for f" .. bucu .. "."
elseif bulon == 7 then
return "You're ready for the next upgrade. This will cost you f" .. bucu .. "."
elseif bulon == 5 then
return "It seems you've made this power your own. I've done all I can for you."
elseif bulon == 6 then
return "Upgrades completed: ".. bucac - 2 .. "/3, need trained more."
else
return "Remaining " .. 10 - bucac .. " training sessions, need trained more."
end
end

function KeyPress(a)
game:GetService("VirtualInputManager"):SendKeyEvent(true,a,false,game)
game:GetService("VirtualInputManager"):SendKeyEvent(false,a,false,game)
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

function GetWeaponInventory(Weaponname)
for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
if type(v) == "table" then
if v.Type == "Sword" or v.Type == "Gun" then
if v.Name == Weaponname then
return true
end
end
end
end
return false
end

function EquipTool(ToolSe)
if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) or game.Players.LocalPlayer.Character:FindFirstChild(ToolSe) then
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) or game.Players.LocalPlayer.Character:FindFirstChild(ToolSe)
wait(0.4)
game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
end
end

TypeFarm = 1
spawn(function()
while wait(.1) do
if TypeFarm == 1 then
MethodFarm = CFrame.new(0,posY,0)
elseif TypeFarm == 2 then
MethodFarm = CFrame.new(0,-15,0)
elseif TypeFarm == 3 then
MethodFarm = CFrame.new(30,0,0)
elseif TypeFarm == 4 then
MethodFarm = CFrame.new(0,0,30)	
elseif TypeFarm == 5 then
MethodFarm = CFrame.new(-30,0,0)
elseif TypeFarm == 6 then
MethodFarm = CFrame.new(0,0,-30)
end
end
end)

spawn(function()
while wait(.1) do
TypeFarm = 1
wait(0.1)
TypeFarm = 2
wait(0.1)
TypeFarm = 3
wait(0.1)
TypeFarm = 4
wait(0.1)
TypeFarm = 5
wait(0.1)
TypeFarm = 6
wait(0.1)
end
end)

spawn(function()
game:GetService("RunService").Stepped:Connect(function()
if tween and tween.PlaybackState == Enum.PlaybackState.Playing then
OrionLib:MakeNotification({
	Name = "Notifying",
	Content = "Tween is running",
	Image = "rbxassetid://4483345998",
	Time = 0.1
})
elseif tween then
OrionLib:MakeNotification({
	Name = "Notifying",
	Content = "Tween is not running",
	Image = "rbxassetid://4483345998",
	Time = 0.1
})
end
if TweenButtonFly or _G.AutoLevel or _G.AutoNearest or _G.AutoBone or _G.AutoHallowScythe or _G.AutoCakePrince or _G.AutoDoughKing or _G.AutoChest or _G.AutoChestBypass or _G.AutoBoss or _G.AutoAllBoss or _G.AutoMaterial or _G.AutoFruitMastery or _G.AutoGunMastery or _G.AutoCollectFruit or _G.AutoPullLever or _G.TweenToMirage or _G.TweenToNpcFruitMirage or _G.TweenToGear or _G.AutoCompleteTrialV4 or _G.AutoKillPlayerAfterTrial or _G.AutoTrains or _G.AutoSaber or _G.AutoPole or _G.AutoSecondSea or _G.AutoFactory or _G.AutoSwanGlasses or _G.AutoRengoku or _G.AutoDarkBeard or _G.AutoBartilo or _G.AutoThirdSea or _G.AutoEvoRace or _G.AutoGhoul or _G.AutoCyborg or _G.AutoItems or _G.AutoObservationV1 or _G.AutoEliteHunter or _G.AutoOpenHakiPad or _G.AutoTushita or _G.AutoCDK or _G.AutoRainbowHaki or _G.AutoRaidCastle or _G.AutoObversationV2 or _G.AutoMusketeerHat or _G.AutoDummy or _G.AutoRipIndra or _G.AutoSoulGuitarVipPro or _G.AutoSeaEvent or _G.AutoLeviathan or _G.TweenToKitsuneIsland or _G.OneClickRaid or _G.AutoNextIsland or _G.AutoLaw or _G.TeleportPlayers or _G.AutoKillPlayers or _G.TeleportIsland then
NoClip = true
else
NoClip = false
end
if NoClip then
if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("MightHubTweenVip") then
local Noclip = Instance.new("BodyVelocity")
Noclip.Name = "MightHubTweenVip"
Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
Noclip.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
Noclip.Velocity = Vector3.new(0,0,0)
Noclip.P = 9000
for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
if v:IsA("BasePart") then
v.CanCollide = false
end
end
end
elseif not NoClip and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("MightHubTweenVip") then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("MightHubTweenVip"):Destroy()
end
end)
end)

spawn(function()
while wait() do
for i,v in pairs(game.Players.LocalPlayer:GetChildren()) do
if v.Name == "DataLoaded" or v.Name == "DataPreloaded" then
v:Destroy()
end
end
end
end)























----------------------------------------------------------------------------
-- Gui Hub
OrionLib:MakeNotification({
	Name = "Notifying",
	Content = "Loading hub, please do not press any function!",
	Image = "rbxassetid://4483345998",
	Time = 3
})

---- Toggle Ui ------
local ToggleUI = Instance.new("ScreenGui")
local ToggleButton = Instance.new("TextButton")
ToggleUI.Name = "ToggleUI"
ToggleUI.Parent = game.CoreGui
ToggleUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ToggleButton.Name = "ToggleMightUiButton"
ToggleButton.Parent = ToggleUI
ToggleButton.BackgroundColor3 = Color3.fromRGB(30,20,20)
ToggleButton.BackgroundTransparency = 0.1
ToggleButton.BorderSizePixel = 0
ToggleButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.Text = "Open Ui"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 14.000
ToggleButton.Draggable = true
ToggleButton.MouseButton1Click:Connect(function()
	KeyPress(305)
end)
local Window = OrionLib:MakeWindow({Name = "Might Hub - Blox Fruit", HidePremium = false, IntroText = "Loading Gui...", SaveConfig = true, ConfigFolder = "MightHubConfig"})

----- Tab Gui --------
local M = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local R = Window:MakeTab({
	Name = "Race V4/Mirage",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local ST = Window:MakeTab({
	Name = "Settings",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local STE = Window:MakeTab({
	Name = "Extra Settings",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local STA = Window:MakeTab({
	Name = "Status",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local S = Window:MakeTab({
	Name = "Stats",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local IQ = Window:MakeTab({
	Name = "Quest/Items",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local EF = Window:MakeTab({
	Name = "Esp/Fruit",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local P = Window:MakeTab({
	Name = "Players",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local RA = Window:MakeTab({
	Name = "Raids",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local TP = Window:MakeTab({
	Name = "Islands",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local SH = Window:MakeTab({
	Name = "Shop",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local SE = Window:MakeTab({
	Name = "Sea Event",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

























----------------------------------------------------------------------------
-- function of tab main
M:AddDropdown({
	Name = "Select Weapon",
	Default = "",
	Options = {"Melee", "Sword", "Fruit", "Gun"},
	Flag = "SelectWeapon",
    Save = true,
	Callback = function(Value)
	ChooseWeapon = Value
	end    
})

task.spawn(function()
while wait() do
pcall(function()
if ChooseWeapon == "Melee" then
for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v.ToolTip == "Melee" then
if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
SelectWeapon = v.Name
end
end
end
elseif ChooseWeapon == "Sword" then
for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v.ToolTip == "Sword" then
if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
SelectWeapon = v.Name
end
end
end
elseif ChooseWeapon == "Fruit" then
for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v.ToolTip == "Blox Fruit" then
if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
SelectWeapon = v.Name
end
end
end
elseif ChooseWeapon == "Gun" then
for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v.ToolTip == "Gun" then
if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
SelectWeapon = v.Name
end
end
end
else
for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v.ToolTip == "Melee" then
if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
SelectWeapon = v.Name
end
end
end
end
end)
end
end)

M:AddToggle({
	Name = "Auto Turn V4",
	Default = false,
	Flag = "TurnV4",
    Save = true,
	Callback = function(Value)
	_G.AutoTurnV4 = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoTurnV4 then
pcall(function()
if game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy") and game.Players.LocalPlayer.Character.RaceEnergy.Value >= 1 and not game.Players.LocalPlayer.Character.RaceTransformed.Value then
game:GetService("Players").LocalPlayer.Character.Awakening.RemoteFunction:InvokeServer()
KeyPress("Y")
end
end)
end
end
end)

M:AddToggle({
	Name = "Auto Turn V3",
	Default = false,
	Flag = "TurnV3",
    Save = true,
	Callback = function(Value)
	_G.AutoTurnV3 = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoTurnV3 then
pcall(function()
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommE"):FireServer("ActivateAbility")
end)
end
end
end)

local MSec = M:AddSection({
	Name = "Misc Farm Level"
})

M:AddToggle({
	Name = "Accept Quest",
	Default = true,
	Flag = "AutoFarmAcceptQuest",
    Save = true,
	Callback = function(Value)
    _G.AutoFarmAcceptQuest = Value
	end    
})

M:AddToggle({
	Name = "Auto Farm Level",
	Default = false,
	Flag = "AutoFarmLevel",
    Save = true,
	Callback = function(Value)
    _G.AutoLevel = Value
	end    
})

spawn(function()
while task.wait() do
if _G.AutoLevel and _G.AutoFarmAcceptQuest then
pcall(function()
CheckLevel()
if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
Tween(CFrameQ)
if (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,QuestLv)
end
elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
if v.Name == Ms then
repeat game:GetService("RunService").Heartbeat:wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoFarmAcceptQuest or not _G.AutoLevel or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name) or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
end   
end
end
for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
if string.find(v.Name,NameMon) then
Tween(v.CFrame * MethodFarm)
end
end
end
end)
end
end
end)

spawn(function()
while task.wait() do
if _G.AutoLevel and not _G.AutoFarmAcceptQuest then
pcall(function()
CheckLevel()
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
if v.Name == Ms then
repeat game:GetService("RunService").Heartbeat:wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until _G.AutoFarmAcceptQuest or not _G.AutoLevel or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name) or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
end
end
end
for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
if string.find(v.Name,NameMon) then
Tween(v.CFrame * MethodFarm)
end
end
end)
end
end
end)

M:AddToggle({
	Name = "Auto Farm Nearest",
	Default = false,
	Flag = "AutoFarmNearest",
    Save = true,
	Callback = function(Value)
    _G.AutoNearest = Value
	end    
})

spawn(function()
while wait(.1) do
if _G.AutoNearest then
pcall(function()
for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000 then
repeat task.wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoNearest or not v.Parent or v.Humanoid.Health <= 0 or not game.Workspace.Enemies:FindFirstChild(v.Name)
end
end
end
end)
end
end
end)

local MSec = M:AddSection({
	Name = "Misc Farm Bone"
})

local Bone = M:AddLabel("Bone : ")

spawn(function()
while wait() do
pcall(function()
Bone:Set("The bones you currently have : "..game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Check"))
end)
end
end)

if Third_Sea then
M:AddToggle({
	Name = "Auto Farm Bone",
	Default = false,
	Flag = "AutoFarmBone",
    Save = true,
	Callback = function(Value)
    _G.AutoBone = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoBone and _G.AutoFarmAcceptQuest then
pcall(function()
local BoneCFrame = CFrame.new(-9515.75, 174.8521728515625, 6079.40625)
if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Posessed Mummy") or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
Tween(CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313))
if (CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","HauntedQuest2",2)
end
elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Posessed Mummy") or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
repeat task.wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoFarmAcceptQuest or not _G.AutoBone or v.Humanoid.Health <= 0 or not v.Parent
end
end
end
else
Tween(BoneCFrame)
end
end
end)
end
end
end)

spawn(function()
while wait() do
if _G.AutoBone and not _G.AutoFarmAcceptQuest then
pcall(function()
local BoneCFrame = CFrame.new(-9515.75, 174.8521728515625, 6079.40625)
if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
repeat task.wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until _G.AutoFarmAcceptQuest or not _G.AutoBone or v.Humanoid.Health <= 0 or not v.Parent
end
end
end
else
Tween(BoneCFrame)
end
end)
end
end
end)

M:AddToggle({
	Name = "Auto Soul Reaper",
	Default = false,
	Flag = "AutoGetHallowScythe",
    Save = true,
	Callback = function(Value)
    _G.AutoHallowScythe = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoHallowScythe then
pcall(function()
if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
if v.Name == "Soul Reaper" then
repeat task.wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until v.Humanoid.Health <= 0 or not _G.AutoHallowScythe or not v.Parent
end
end
end
elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hallow Essence") then
repeat wait()
Tween(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
until (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8
EquipTool("Hallow Essence")
else
if game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper") then
Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame * MethodFarm)
end
end
end)
end
end
end)

spawn(function()
while wait(0.001) do
if _G.AutoHallowScythe then
local args = {
	[1] = "Bones",
	[2] = "Buy",
	[3] = 1,
	[4] = 1
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
end
end)

M:AddToggle({
	Name = "Auto Random Bone",
	Default = false,
	Flag = "AutoTradeBone",
    Save = true,
	Callback = function(Value)
	_G.AutoRandomBone = Value
	end    
})

spawn(function()
while wait(0.0000000000000000000000000000000000000000000000000001) do
if _G.AutoRandomBone then
local args = {
	[1] = "Bones",
	[2] = "Buy",
	[3] = 1,
	[4] = 1
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
end
end)

M:AddToggle({
	Name = "Auto Try Luck",
	Default = false,
	Flag = "AutoTryLuck",
    Save = true,
	Callback = function(Value)
	_G.AutoTryLuck = Value
	end    
})

M:AddToggle({
	Name = "Auto Pray",
	Default = false,
	Flag = "AutoPray",
    Save = true,
	Callback = function(Value)
	_G.AutoPray = Value
	end    
})


spawn(function()
while wait(0.0000000000000000000000000000000000000000000000000001) do
pcall(function()
if _G.AutoTryLuck then
if game:GetService("Workspace").Enemies:FindFirstChild("Ghost") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
if v.Name == "Ghost" then
repeat game:GetService("RunService").Heartbeat:wait()
EquipTool(SelectWeapon)
TweenButton(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoTryLuck or v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart")
end
end
end
else
TweenButton(CFrame.new(-8652.99707, 143.450119, 6170.50879, -0.983064115, -2.48005533e-10, 0.18326205, -1.78910387e-09, 1, -8.24392288e-09, -0.18326205, -8.43218029e-09, -0.983064115))
wait()
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("gravestoneEvent",1)
end
elseif _G.AutoPray then
TweenButton(CFrame.new(-8652.99707, 143.450119, 6170.50879, -0.983064115, -2.48005533e-10, 0.18326205, -1.78910387e-09, 1, -8.24392288e-09, -0.18326205, -8.43218029e-09, -0.983064115))
wait()
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("gravestoneEvent",2)
end
end)
end
end)

local MSec = M:AddSection({
	Name = "Misc Farm Cake Island"
})

M:AddToggle({
	Name = "Auto Cake Prince",
	Default = false,
	Flag = "AutoFarmCakePrince",
    Save = true,
	Callback = function(Value)
    _G.AutoCakePrince = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoCakePrince and _G.AutoFarmAcceptQuest then
pcall(function()
local PosCake = CFrame.new(-2077, 252, -12373)
if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Head Baker") or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
Tween(CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401))
if (CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","CakeQuest2",2)
end
elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Head Baker") or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
repeat game:GetService("RunService").Heartbeat:wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoFarmAcceptQuest or v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not _G.AutoCakePrince
end
end
end
elseif game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
if v.Name == "Cake Prince" or v.Name == "Dough King" then
repeat game:GetService("RunService").Heartbeat:wait()
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
until not _G.AutoFarmAcceptQuest or v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not _G.AutoCakePrince
end
end
end
else
if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") then
Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * MethodFarm)
elseif game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") then
Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Dough King").HumanoidRootPart.CFrame * MethodFarm)
else
Tween(PosCake)
end
end
end
end)
end
end
end)

spawn(function()
while wait() do
if _G.AutoCakePrince and not _G.AutoFarmAcceptQuest then
pcall(function()
local PosCake = CFrame.new(-2077, 252, -12373)
if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
repeat game:GetService("RunService").Heartbeat:wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until _G.AutoFarmAcceptQuest or v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not _G.AutoCakePrince
end
end
end
elseif game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
if v.Name == "Cake Prince" or v.Name == "Dough King" then
repeat game:GetService("RunService").Heartbeat:wait()
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
until _G.AutoFarmAcceptQuest or v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not _G.AutoCakePrince
end
end
end
else
if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") then
Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * MethodFarm)
elseif game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") then
Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Dough King").HumanoidRootPart.CFrame * MethodFarm)
else
Tween(PosCake)
end
end
end)
end
end
end)

M:AddToggle({
	Name = "Auto Dough King",
	Default = false,
	Flag = "AutoDoughKing",
    Save = true,
	Callback = function(Value)
    _G.AutoDoughKing = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoDoughKing then
pcall(function()
local PosCake = CFrame.new(-2077, 252, -12373)
if game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SweetChaliceNpc"),"Where") then
OrionLib:MakeNotification({
	Name = "Notifying",
	Content = "You don't have enough material!",
	Image = "rbxassetid://4483345998",
	Time = 5
})
wait(0.1)
if game:GetService("Workspace").Enemies:FindFirstChild("Cocoa Warrior") or game:GetService("Workspace").Enemies:FindFirstChild("Chocolate Bar Battler") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
if v.Name == "Cocoa Warrior" or v.Name == "Chocolate Bar Battler" then
repeat game:GetService("RunService").Heartbeat:wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not _G.AutoDoughKing or game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") or game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("Sweet Chalice")
else
Tween(CFrame.new(167.978516, 26.2254658, -12238.874, -0.939700961, 0, 0.341998369, 0, 1, 0, -0.341998369, 0, -0.939700961))
end
end
end
else
Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Cocoa Warrior").HumanoidRootPart.CFrame * MethodFarm)
end
else
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SweetChaliceNpc")
end
elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("Sweet Chalice") then
if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),"Do you want to open the portal now?") then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
else
if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
repeat game:GetService("RunService").Heartbeat:wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not _G.AutoDoughKing or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") or game:GetService("ReplicatedStorage"):FindFirstChild("Dough King")
else
Tween(CFrame.new(-1820.0634765625, 210.74781799316406, -12297.49609375))
end
end
end
else
Tween(PosCake)
end
end
elseif game:GetService("Workspace").Enemies:FindFirstChild("Dough King") or game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
if v.Name == "Dough King" or v.Name == "Cake Prince" then
repeat game:GetService("RunService").Heartbeat:wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not _G.AutoDoughKing
else
Tween(CFrame.new(-2009.2802734375, 4532.97216796875, -14937.3076171875))
end
end
end
elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Red Key") or game.Players.LocalPlayer.Character:FindFirstChild("Red Key") then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakeScientist","Check")
else
if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Diablo") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Deandre") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Urban") then
if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
if v.Name == "Diablo" or v.Name == "Deandre" or v.Name == "Urban" then
repeat game:GetService("RunService").Heartbeat:wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoDoughKing or v.Humanoid.Health <= 0 or not v.Parent or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice")
end
end
end
else
if game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame * MethodFarm)
elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame * MethodFarm)
elseif game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame * MethodFarm)
end
end
else
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
end
else
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
end
end
end)
end
end
end)

M:AddToggle({
	Name = "Auto Spawn Katakuri",
	Default = true,
	Callback = function(Value)
    _G.SpawnKatakuri = Value
	end    
})

spawn(function()
while wait() do
if _G.SpawnKatakuri then
pcall(function()
if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),"Do you want to open the portal now?") then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
end
end)
end
end
end)
end

local MSec = M:AddSection({
	Name = "Misc Farm Chest"
})

function GetNearestChest()
if not game.Workspace:FindFirstChild("Chest1") and not game.Workspace:FindFirstChild("Chest2") and not game.Workspace:FindFirstChild("Chest3") then
return nil
end
min = math.huge
chests = {}
for r, v in pairs(game.Workspace:GetChildren()) do
if string.find(v.Name, "Chest") then
table.insert(chests, v.CFrame)
end
end
for r, v in pairs(chests) do
if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < min then
min = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
end
end
for r, v in pairs(chests) do
if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= min then
return v
end
end
end

local ChestSkibidi = M:AddToggle({
	Name = "Auto Chest <Tween>",
	Default = false,
	Flag = "AutoFarmChestTween",
    Save = true,
	Callback = function(Value)
	_G.AutoChest = Value
	end    
})

_G.MagnitudeChestDist = 0
spawn(function()
while wait() do 
if _G.AutoChest then
pcall(function()
local Chest = GetNearestChest()
if Chest then
repeat game:GetService("RunService").Heartbeat:wait()
if not game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or not game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") or not game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or not game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
Tween(Chest)
end
if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
end
until not _G.AutoChest or not Chest
CancelTween(_G.AutoChest)
end
end)
end
end
end)

local ChestSkibidi1 = M:AddToggle({
	Name = "Auto Chest <Instance>",
	Default = false,
	Flag = "AutoFarmChestInstance",
    Save = true,
	Callback = function(Value)
	_G.AutoChestBypass = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoChestBypass then
pcall(function()
local Chest = GetNearestChest()
if Chest then
repeat game:GetService("RunService").Heartbeat:wait()
if not game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or not game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") or not game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or not game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Chest
end
firesignal(Chest.Touched,game.Players.LocalPlayer.Character.HumanoidRootPart)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Chest, 0)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Chest, 1)
if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
end
wait(7.5)
if not game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or not game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") or not game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or not game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
game.Players.LocalPlayer.Character.Head:Destroy()
game.Players.LocalPlayer.Character.Humanoid.Health = 0
end
until not _G.AutoChestBypass or not Chest
CancelTween(_G.AutoChestBypass)
end
end)
end
end
end)

M:AddToggle({
	Name = "Stop Chest When Get Legendary Items",
	Default = true,
	Callback = function(Value)
	_G.StopChest = Value
	end    
})

spawn(function()
while wait() do
if _G.StopChest then
pcall(function()
if game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
_G.AutoChestBypass = false
_G.AutoChest = false
ChestSkibidi:Set(false)
ChestSkibidi1:Set(false)
end
end)
end
end
end)

local MSec = M:AddSection({
	Name = "Misc Farm Boss"
})

if First_Sea then
tableBoss = {"The Gorilla King","Bobby","Yeti","Mob Leader","Vice Admiral","Warden","Chief Warden","Swan","Magma Admiral","Fishman Lord","Wysper","Thunder God","Cyborg","Saber Expert"}
elseif Second_Sea then
tableBoss = {"Diamond","Jeremy","Fajita","Don Swan","Smoke Admiral","Cursed Captain","Darkbeard","Order","Awakened Ice Admiral","Tide Keeper"}
elseif Third_Sea then
tableBoss = {"Stone","Island Empress","Kilo Admiral","Captain Elephant","Beautiful Pirate","rip_indra True Form","Longma","Soul Reaper","Cake Queen"}
end
NameAllBossTable = {"The Gorilla King","Bobby","Yeti","Mob Leader","Vice Admiral","Warden","Chief Warden","Swan","Magma Admiral","Fishman Lord","Wysper","Thunder God","Cyborg","Saber Expert","Diamond","Jeremy","Fajita","Don Swan","Smoke Admiral","Cursed Captain","Darkbeard","Order","Awakened Ice Admiral","Tide Keeper","Stone","Island Empress","Kilo Admiral","Captain Elephant","Beautiful Pirate","rip_indra True Form","Longma","Soul Reaper","Cake Queen"}

local checkbossspawn = M:AddLabel("")

spawn(function()
while wait() do
pcall(function()
for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
if table.find(tableBoss,v.Name) and SelectBoss == v.Name then
checkbossspawn:Set("The boss you want to check has appeared")
else
checkbossspawn:Set("The boss you want to check has not appeared yet")
end
end
end)
end
end)

local SelectedBoss = M:AddDropdown({
	Name = "Select boss",
	Default = "",
	Options = tableBoss,
	Callback = function(Value)
	SelectBoss = Value
	end    
})

M:AddToggle({
	Name = "Auto Farm Boss",
	Default = false,
	Callback = function(Value)
	_G.AutoBoss = Value
	end    
})

spawn(function()
while task.wait() do
if _G.AutoBoss and _G.AutoTakeQuestBoss then
pcall(function()
CheckBossQuest()
if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
Tween(CFrameQBoss)
if (CFrameQBoss.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuestBoss,QuestLvBoss)
end
elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
if v.Name == BossMon then
repeat game:GetService("RunService").Heartbeat:wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoTakeQuestBoss or not _G.AutoBoss or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name) or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
end   
end
end
Tween(CFrameBoss)
end
end)
end
end
end)

spawn(function()
while task.wait() do
if _G.AutoBoss and not _G.AutoTakeQuestBoss then
pcall(function()
CheckBossQuest()
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
if v.Name == BossMon then
repeat game:GetService("RunService").Heartbeat:wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until _G.AutoTakeQuestBoss or not _G.AutoBoss or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
end
end
end
Tween(CFrameBoss)
end)
end
end
end)

M:AddToggle({
	Name = "Get Quest",
	Default = true,
	Callback = function(Value)
	_G.AutoTakeQuestBoss = Value
	end    
})

M:AddToggle({
	Name = "Auto Farm All Boss",
	Default = false,
	Flag = "AutoAllBoss",
    Save = true,
	Callback = function(Value)
	_G.AutoAllBoss = Value
	end    
})

spawn(function()
while task.wait() do
if _G.AutoAllBoss then
pcall(function()
for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
if table.find(NameAllBossTable,v.Name) then
repeat game:GetService("RunService").Heartbeat:wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoAllBoss or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("ReplicatedStorage"):FindFirstChild(v.Name)
end
end
end
end)
end
end
end)

local MSec = M:AddSection({
	Name = "Misc Farm Material"
})

local thgchodenhucailon = M:AddLabel("Material Check Count :")

spawn(function()
while wait() do
pcall(function()
thgchodenhucailon:Set("Check Material Count : "..CheckMaterial(SelectMaterial))
end)
end
end)

if First_Sea then
MaterialList = {"Scrap Metal","Leather","Angel Wings","Magma Ore","Fish Tail","Yeti Fur"}
elseif Second_Sea then
MaterialList = {"Scrap Metal","Leather","Radioactive Material","Mystic Droplet","Meteorite","Magma Ore","Vampire Fang","Ectoplasm"}
elseif Third_Sea then
MaterialList = {"Scrap Metal","Leather","Demonic Wisp","Conjured Cocoa","Dragon Scale","Gunpowder","Fish Tail","Mini Tusk"}
end
table.sort(MaterialList)

M:AddDropdown({
	Name = "Select Material",
	Default = "",
	Options = MaterialList,
	Flag = "SelectMaterial",
    Save = true,
	Callback = function(Value)
    SelectMaterial = Value
	end    
})

M:AddToggle({
	Name = "Auto Farm Material",
	Default = false,
	Flag = "AutoFarmMaterial",
    Save = true,
	Callback = function(Value)
    _G.AutoMaterial = Value
	end    
})

spawn(function()
while task.wait() do
if _G.AutoMaterial then
pcall(function()
MaterialMon()
if game:GetService("Workspace").Enemies:FindFirstChild(MMon) then
for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
if table.find(MMon,v.Name) then
repeat task.wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoMaterial or not v.Parent or v.Humanoid.Health <= 0
end
end
end
else
if game:GetService("ReplicatedStorage"):FindFirstChild(MMon) then
Tween(MPos)
else
for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
if string.find(v.Name,MMon) then
Tween(v.CFrame * MethodFarm)
end
end
end
end
end)
end
end
end)

local MSec = M:AddSection({
	Name = "Misc Farm Mastery"
})

M:AddDropdown({
	Name = "Select Method Farm Mastery",
	Default = "Level",
	Options = {"Level", "Near"},
	Flag = "SelectMethodFarmMastery",
    Save = true,
	Callback = function(Value)
	_G.SelectMethodFarmMastery = Value
	end    
})

M:AddToggle({
	Name = "Auto Fruit Mastery",
	Default = false,
	Flag = "AutoFarmFruitMastery",
    Save = true,
	Callback = function(Value)
	_G.AutoFruitMastery = Value
	end    
})

spawn(function()
while task.wait() do
if _G.AutoFruitMastery and _G.SelectMethodFarmMastery == "Level" then
pcall(function()
CheckLevel()
if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
Tween(CFrameQ)
if (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,QuestLv)
end
elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
if v.Name == Ms then
repeat game:GetService("RunService").Heartbeat:wait()
if v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
_G.UseSkill = true
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v:IsA("Tool") then
if v.ToolTip == "Blox Fruit" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
EquipTool(v.Name)
end
end
end
else
_G.UseSkill = false
_G.FastAttackNice = false
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
end
until not _G.AutoFruitMastery or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name) or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not _G.SelectMethodFarmMastery == "Level"
_G.UseSkill = false
_G.FastAttackNice = true
end   
end
end
else
if game:GetService("ReplicatedStorage"):FindFirstChild(Ms) then
Tween(CFrameMon)
else
for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
if string.find(v.Name,NameMon) then
Tween(v.CFrame * MethodFarm)
end
end
end
end
end
end)
elseif _G.AutoFruitMastery and _G.SelectMethodFarmMastery == "Near" then
pcall(function()
for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000 then
repeat task.wait()
if v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
_G.UseSkill = true
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v:IsA("Tool") then
if v.ToolTip == "Blox Fruit" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
EquipTool(v.Name)
end
end
end
else
_G.UseSkill = false
_G.FastAttackNice = false
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
end
until not _G.AutoFruitMastery or not v.Parent or v.Humanoid.Health <= 0 or not game.Workspace.Enemies:FindFirstChild(v.Name) or not _G.SelectMethodFarmMastery == "Near"
_G.UseSkill = false
_G.FastAttackNice = true
end
end
end
end)
else
if _G.UseSkill then
_G.UseSkill = false
end
if not _G.FastAttackNice then
_G.FastAttackNice = true
end
end
end
end)

spawn(function()
while task.wait(1) do
if _G.UseSkill then
pcall(function()
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
if v.Name == "NotificationTemplate" then
if string.find(v.Text,"Skill locked!") then
v:Destroy()
end
end
end
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == MonFarm and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
repeat game:GetService("RunService").Heartbeat:wait()
PositionSkillMasteryDevilFruit = v.HumanoidRootPart.Position
if Char:FindFirstChild(MyFruit) then
Char:FindFirstChild(MyFruit).MousePos.Value = PositionSkillMasteryDevilFruit
local DevilFruitMastery = Char:FindFirstChild(MyFruit).Level.Value
if SkillZ and DevilFruitMastery >= 1 then
KeyPress("Z")
end
if SkillX and DevilFruitMastery >= 2 then
KeyPress("X")
end
if SkillC and DevilFruitMastery >= 3 then
KeyPress("C")
end
if SkillV and DevilFruitMastery >= 4 then
KeyPress("V")
end
if SkillF and DevilFruitMastery >= 5 then
KeyPress("F")
end
end
until not _G.AutoFruitMastery or not _G.UseSkill or v.Humanoid.Health <= 0
end
end
end)
end
end
end)

M:AddToggle({
	Name = "Auto Gun Mastery",
	Default = false,
	Flag = "AutoFarmGunMastery",
    Save = true,
	Callback = function(Value)
	_G.AutoGunMastery = Value
	end    
})

spawn(function()
while task.wait() do
if _G.AutoGunMastery and _G.SelectMethodFarmMastery == "Level" then
pcall(function()
CheckLevel()
if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
Tween(CFrameQ)
if (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,QuestLv)
end
elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
if v.Name == Ms then
repeat game:GetService("RunService").Heartbeat:wait()
if v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
_G.UseSkillGun = true
EquipTool(CurrentEquipGun)
game:GetService("Players").LocalPlayer.Character[CurrentEquipGun].Cooldown.Value = 0
else
_G.UseSkillGun = false
_G.FastAttackNice = false
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
end
until not _G.AutoGunMastery or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name) or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not _G.SelectMethodFarmMastery == "Level"
_G.UseSkillGun = false
_G.FastAttackNice = true
end   
end
end
else
if game:GetService("ReplicatedStorage"):FindFirstChild(Ms) then
Tween(CFrameMon)
else
for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
if string.find(v.Name,NameMon) then
Tween(v.CFrame * MethodFarm)
end
end
end
end
end
end)
elseif _G.AutoGunMastery and _G.SelectMethodFarmMastery == "Near" then
pcall(function()
for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000 then
repeat task.wait()
if v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
_G.UseSkillGun = true
EquipTool(CurrentEquipGun)
game:GetService("Players").LocalPlayer.Character[CurrentEquipGun].Cooldown.Value = 0
else
_G.UseSkillGun = false
_G.FastAttackNice = false
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
end
until not _G.AutoGunMastery or not v.Parent or v.Humanoid.Health <= 0 or not game.Workspace.Enemies:FindFirstChild(v.Name) or not _G.SelectMethodFarmMastery == "Near"
_G.UseSkillGun = false
_G.FastAttackNice = true
end
end
end
end)
else
if _G.UseSkillGun then
_G.UseSkillGun = false
end
if not _G.FastAttackNice then
_G.FastAttackNice = true
end
end
end
end)

spawn(function()
while task.wait(1) do
if _G.UseSkillGun then
pcall(function()
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
if v.Name == "NotificationTemplate" then
if string.find(v.Text,"Skill locked!") then
v:Destroy()
end
end
end
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == MonFarm and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
repeat game:GetService("RunService").Heartbeat:wait()
PositionSkillMasteryGun = v.HumanoidRootPart
if Char:FindFirstChild(CurrentEquipGun) then
Char:FindFirstChild(CurrentEquipGun).MousePos.Value = PositionSkillMasteryGun.Position
game:GetService("Players").LocalPlayer.Character[CurrentEquipGun].RemoteEvent:FireServer(PositionSkillMasteryGun.Position)
game:GetService("Players").LocalPlayer.Character[CurrentEquipGun].RemoteFunctionShoot:InvokeServer(PositionSkillMasteryGun.Position,PositionSkillMasteryGun)
ClickCamera()
if SkillZ then
KeyPress("Z")
end
if SkillX then
KeyPress("X")
end
end
until not _G.AutoGunMastery or not _G.UseSkillGun or v.Humanoid.Health <= 0 or not v.Parent
end
end
end)
end
end
end)

local Section = STE:AddSection({
	Name = "Misc Farm Skill"
})

STE:AddLabel("Setting Mastery Farm Skill")

STE:AddSlider({
	Name = "Kill At",
	Min = 0,
	Max = 100,
	Default = 25,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "%",
	Flag = "KillPercent",
    Save = true,
	Callback = function(Value)
	KillPercent = Value
	end    
})

STE:AddToggle({
	Name = "Skill Z",
	Default = true,
	Flag = "SkillZMastery",
    Save = true,
	Callback = function(Value)
	SkillZ = Value
	end    
})

STE:AddToggle({
	Name = "Skill X",
	Default = true,
	Flag = "SkillXMastery",
    Save = true,
	Callback = function(Value)
	SkillX = Value
	end    
})

STE:AddToggle({
	Name = "Skill C",
	Default = true,
	Flag = "SkillCMastery",
    Save = true,
	Callback = function(Value)
	SkillC = Value
	end    
})

STE:AddToggle({
	Name = "Skill V",
	Default = true,
	Flag = "SkillVMastery",
    Save = true,
	Callback = function(Value)
	SkillV = Value
	end    
})

STE:AddToggle({
	Name = "Skill F",
	Default = false,
	Flag = "SkillFMastery",
    Save = true,
	Callback = function(Value)
	SkillF = Value
	end    
})

STE:AddLabel("Setting Race V4 Skill")

STE:AddToggle({
	Name = "Spam Skill Kill Players Trial",
	Default = false,
	Flag = "AutoSkillInKillTrial",
    Save = true,
	Callback = function(Value)
	AutoSkillInKillTrial = Value
	end    
})
































----------------------------------------------------------------------------
-- esp + fruit tab
EF:AddSlider({
	Name = "Notify Fruit Time",
	Min = 5,
	Max = 120,
	Default = 10,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Second",
	Flag = "NotifyFruitTimer",
    Save = true,
	Callback = function(Value)
	_G.TimerNotifyFruit = Value
	end    
})

EF:AddToggle({
	Name = "Notify Fruit Spawn",
	Default = false,
	Flag = "NotifyFruitSpawn",
    Save = true,
	Callback = function(Value)
     _G.NotifyFruitSpawn = Value
	end    
})

WS.ChildAdded:Connect(function(part)
if _G.NotifyFruitSpawn then
if part:IsA("Model") and string.find(part.Name, "Fruit") then
OrionLib:MakeNotification({
	Name = "Notifying",
	Content = "A devil fruit has appeared on the map: "..tostring(part.Name),
	Image = "rbxassetid://4483345998",
	Time = _G.TimerNotifyFruit
})
end
end
end)




local EFSec = EF:AddSection({
	Name = "Misc Esp"
})

EF:AddToggle({
	Name = "Esp Players",
	Default = false,
	Flag = "EspPlayer",
    Save = true,
	Callback = function(Value)
_G.EspPlayer = Value
UpdatePlayerChams()
	end    
})

EF:AddToggle({
	Name = "Esp Real Fruit",
	Default = false,
	Flag = "EspFruit",
    Save = true,
	Callback = function(Value)
_G.EspFruit = Value
while _G.EspFruit do wait()
UpdateDevilChams() 
end
	end    
})

EF:AddToggle({
	Name = "Esp Fruit",
	Default = false,
	Flag = "EspRealFruit",
    Save = true,
	Callback = function(Value)
_G.EspRealFruit = Value
while _G.EspRealFruit do wait()
UpdateRealFruitChams()
end
	end    
})

EF:AddToggle({
	Name = "Esp Island",
	Default = false,
	Flag = "EspIsland",
    Save = true,
	Callback = function(Value)
_G.EspIsland = Value
while _G.EspIsland do wait()
UpdateIslandESP()
end
	end    
})

EF:AddToggle({
	Name = "Esp Chest",
	Default = false,
	Flag = "EspChest",
    Save = true,
	Callback = function(Value)
_G.EspChest = Value
while _G.EspChest do wait()
UpdateChestChams() 
end
	end    
})
if Second_Sea then
EF:AddToggle({
	Name = "Esp Flower",
	Default = false,
	Flag = "EspFlower",
    Save = true,
	Callback = function(Value)
_G.EspFlower = Value
UpdateFlowerChams()
	end    
})
end

spawn(function()
while wait(2) do
if _G.EspFlower then
UpdateFlowerChams() 
end
if _G.EspFruit then
UpdateDevilChams() 
end
if _G.EspChest then
UpdateChestChams() 
end
if _G.EspPlayer then
UpdatePlayerChams()
end
if _G.EspRealFruit then
UpdateRealFruitChams()
end
end
end)

if Second_Sea then
EF:AddToggle({
	Name = "Esp Legendary Sword Dealer",
	Default = false,
	Flag = "EspLSD",
    Save = true,
	Callback = function(Value)
_G.EspLegendDealer = Value
while _G.EspLegendDealer do wait()
UpdateLSDESP()
end
	end    
})
end

if Second_Sea or Third_Sea then
EF:AddToggle({
	Name = "Esp Master Aura",
	Default = false,
	Flag = "EspMasterAura",
    Save = true,
	Callback = function(Value)
_G.EspMasterAura = Value
while _G.EspMasterAura do wait()
UpdateAuraESP()
end
	end    
})
end

local EFSec = EF:AddSection({
	Name = "Misc Hunt Fruit"
})

local Remote_GetFruits = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits");
Table_DevilFruitSniper = {}
ShopDevilSell = {}
for i,v in next,Remote_GetFruits do
table.insert(Table_DevilFruitSniper,v.Name)
if v.OnSale then 
table.insert(ShopDevilSell,v.Name)
end
end
_G.SelectFruit = ""

EF:AddDropdown({
	Name = "Select Fruit Sniper",
	Default = "",
	Options = Table_DevilFruitSniper,
	Flag = "SelectFruitSniper",
    Save = true,
	Callback = function(Value)
	_G.SelectFruit = Value
	end    
})

EF:AddToggle({
	Name = "Auto Buy Fruit Sniper",
	Default = false,
	Flag = "BuyFruitSniper",
    Save = true,
	Callback = function(Value)
	_G.AutoBuyFruitSniper = Value
	end    
})

spawn(function()
pcall(function()
while wait(.1) do
if _G.AutoBuyFruitSniper then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit","_G.SelectFruit",false)
end 
end
end)
end)

EF:AddToggle({
	Name = "Auto Drop Fruit",
	Default = false,
	Flag = "DropFruit",
    Save = true,
	Callback = function(Value)
	_G.AutoDropFruit = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoDropFruit then
pcall(function()
if game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible == true then
game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible = false
end
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
if table.find(NameFruitList,v.Name) then
EquipTool(v.Name)
wait(.1)
game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)).EatRemote:InvokeServer("Drop")
end
end
for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
if table.find(NameFruitList,v.Name) then
EquipTool(v.Name)
wait(.1)
game:GetService("Players").LocalPlayer.Character:FindFirstChild(tostring(v.Name)).EatRemote:InvokeServer("Drop")
end
end
end)
end
end
end)

EF:AddToggle({
	Name = "Auto Store Fruit",
	Default = false,
	Flag = "StoreFruit",
    Save = true,
	Callback = function(Value)
	_G.AutoStoreFruit = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoStoreFruit then
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
end
end)

EF:AddToggle({
	Name = "Auto Collect Fruit",
	Default = false,
	Flag = "CollectFruit",
    Save = true,
	Callback = function(Value)
    _G.AutoCollectFruit = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoCollectFruit then
pcall(function()
for i,v in pairs(WS:GetChildren()) do
if string.find(v.Name, "Fruit") then
Tween(v.Handle.CFrame)
end
end
end)
end
end
end)

EF:AddToggle({
	Name = "Auto Random Fruit",
	Default = false,
	Flag = "RandomFruit",
    Save = true,
	Callback = function(Value)
	_G.AutoRDFruit = Value
	end    
})

spawn(function()
pcall(function()
while wait(.1) do
if _G.AutoRDFruit then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
end 
end
end)
end)

EF:AddToggle({
	Name = "Bring All Fruit",
	Default = false,
	Callback = function(Value)
	_G.BringAllFruit = Value
	end    
})

spawn(function()
while wait() do
if _G.BringAllFruit then
pcall(function()
for i,v in pairs(WS:GetChildren()) do
if string.find(v.Name, "Fruit") then
v.Handle.CFrame = HMRP.CFrame
wait(.2)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,0)
end
end	
end)
end
end
end)



















----------------------------------------------------------------------------
-- race v4 and mirage tab
local NpcLeaveTemple = CFrame.new(28609.650390625, 14896.5458984375, 105.68901062011719)
local LeverS = CFrame.new(28576.78125, 14937.8720703125, 76.74828338623047)
local TempleOfHeloVectop = Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586)

function EquipToolCheck(Tooltip)
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v:IsA("Tool") and v.ToolTip == Tooltip then
if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
EquipTool(v.Name)
end
end
end
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Tool") and v.ToolTip == Tooltip then
if game.Players.LocalPlayer.Character:FindFirstChild(tostring(v.Name)) then
EquipTool(v.Name)
end
end
end
end

function TeleportTemple()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",TempleOfHeloVectop)
end

function CheckNearTempleOrTeleport()
if (TempleOfHelo.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
TeleportTemple()
end
end

local namanhemtrenmotchiecxetang = R:AddSection({
	Name = "Misc Mirage Island"
})

R:AddToggle({
	Name = "Esp Mirage Island",
	Default = false,
	Flag = "EspMirage",
    Save = true,
	Callback = function(Value)
_G.EspMirageIsland = Value
while _G.EspMirageIsland do wait()
UpdateIslandMirageESP()
end
	end    
})

R:AddToggle({
	Name = "Esp Advanced Fruit Dealer",
	Default = false,
	Flag = "EspAfd",
    Save = true,
	Callback = function(Value)
_G.EspAdvanceDealer = Value
while _G.EspAdvanceDealer do wait()
UpdateAfdESP()
end
	end    
})

R:AddToggle({
	Name = "Esp Gear",
	Default = false,
	Flag = "EspGear",
    Save = true,
	Callback = function(Value)
_G.EspGear = Value
while _G.EspGear do wait()
UpdateGearESP()
end
	end    
})

local ToggleAutoPullLever = R:AddToggle({
	Name = "Auto Pull Lever",
	Default = false,
	Flag = "AutoPullLever",
    Save = true,
	Callback = function(Value)
	_G.AutoPullLever = Value
	end    
})

local CheckDaCapToc = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress","Check")
local CheckMirror = CheckMaterial("Mirror Fractal")
local CheckValk = CheckItem("Valkyrie Helm")

function GetHighestPointMirageIsland()
if not game.workspace.Map:FindFirstChild("MysticIsland") then
return nil
end
for r, v in pairs(game:GetService("Workspace").Map.MysticIsland:GetDescendants()) do
if v:IsA("MeshPart") then
if v.MeshId == "rbxassetid://6745037796" then
return v
end
end
end
end

function GetGearMirageIsland()
if game.workspace.Map:FindFirstChild("MysticIsland") then
for r, v in pairs(game.workspace.Map.MysticIsland:GetChildren()) do
if v:IsA("MeshPart") and v.MeshId == "rbxassetid://10153114969" then
return v
end
end
end
end

spawn(function()
while wait() do
if _G.AutoPullLever and DaGatCan == false and IsMirageIsland2() then
pcall(function()
if not CheckMirror then
CheckMirror = CheckMaterial("Mirror Fractal")
end
if not CheckValk then
CheckValk = CheckItem("Valkyrie Helm")
end
if CheckValk and CheckMirror then
if CheckDaCapToc == 1 then
game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Begin")
elseif CheckDaCapToc == 2 then
CheckNearTempleOrTeleport()
wait(0.1)
Tween(NpcLeaveTemple)
wait(0.35)
if (NpcLeaveTemple.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "TeleportBack")
end
elseif CheckDaCapToc == 3 then
game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Continue")
elseif DaGatCan == false and not game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") and IsMirageIsland2() then
if GetGearMirageIsland() then
HighestPointRealCFrame = GetHighestPointMirageIsland().CFrame * CFrame.new(0, 211.88, 0)
BlueGear = GetGearMirageIsland()
if BlueGear and BlueGear.CanCollide == false and BlueGear.Transparency ~= 1 then
repeat wait()
Tween(BlueGear.CFrame)
until not BlueGear or BlueGear.Transparency == 1
if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") then
DaGatCan = true
end
elseif BlueGear and BlueGear.Transparency == 1 then
if HighestPointRealCFrame and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - HighestPointRealCFrame.Position).Magnitude > 10 then
Tween(HighestPointRealCFrame)
end
end
end
end
elseif DaGatCan == true then
CheckNearTempleOrTeleport()
wait(0.1)
Tween(LeverS)
for r, v in pairs(game:GetService("Workspace").Map["Temple of Time"].Lever:GetDescendants()) do
if v.Name == "ProximityPrompt" then
fireproximityprompt(v)
end
end
end
end)
else
wait()
end
end
end)


R:AddToggle({
	Name = "Tween To Mirage Island",
	Default = false,
	Flag = "TweenMirage",
    Save = true,
	Callback = function(Value)
	_G.TweenToMirage = Value
	end    
})

spawn(function()
while wait() do
if _G.TweenToMirage then
pcall(function()
HighestPoint = GetHighestPointMirageIsland()
if HighestPoint then
Tween(HighestPoint.CFrame * CFrame.new(0, 211.88, 0))
end
end)
end
end
end)


R:AddToggle({
	Name = "Tween To Advanced Fruit Dealer",
	Default = false,
	Flag = "TweenAFD",
    Save = true,
	Callback = function(Value)
	_G.TweenToNpcFruitMirage = Value
	end    
})

spawn(function()
while wait() do
if _G.TweenToNpcFruitMirage then
pcall(function()
if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
if v.Name == "Advanced Fruit Dealer" then
Tween(v.CFrame)
end
end
end
end)
end
end
end)

R:AddToggle({
	Name = "Tween To Gear",
	Default = false,
	Flag = "TweenGear",
    Save = true,
	Callback = function(Value)
	_G.TweenToGear = Value
	end    
})

spawn(function()
while wait() do
if _G.TweenToGear then
pcall(function()
if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do 
if v:IsA("MeshPart") then 
if v.Material ==  Enum.Material.Neon then  
Tween(v.CFrame)
end
end
end
end
end)
end
end
end)

local LookMoonAndActiveRace = R:AddToggle({
    Name = "Auto Look Moon",
    Default = false,
    Flag = "AutoLookMoon",
    Save = true,
    Callback = function(Value)
    _G.AutoLookMoon = Value
    end    
})

spawn(function()
while wait() do
if _G.AutoLookMoon then
pcall(function()
repeat wait()
local moonDir = game.Lighting:GetMoonDirection()
local lookAtPos = game.Workspace.CurrentCamera.CFrame.p + moonDir * 100
game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, lookAtPos)
until not _G.AutoLookMoon
end)
end
end
end)

spawn(function()
while wait() do
pcall(function()
if _G.AutoLookMoon then
repeat wait()
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommE"):FireServer("ActivateAbility")
until not _G.AutoLookMoon
end
end)
end
end)

local namanhemtrenmotchiecxetang = R:AddSection({
	Name = "Misc Area V4"
})


R:AddButton({
	Name = "Top of Great Tree",
	Callback = function()
CheckNearTempleOrTeleport()
wait(0.1)
TweenButton(NpcLeaveTemple)
wait(0.35)
if (NpcLeaveTemple.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "TeleportBack")
end
  	end    
})

R:AddButton({
	Name = "Lever Pull",
	Callback = function()
CheckNearTempleOrTeleport()
wait(0.1)
TweenButton(LeverS)
for r, v in pairs(game:GetService("Workspace").Map["Temple of Time"].Lever:GetDescendants()) do
if v.Name == "ProximityPrompt" then
fireproximityprompt(v)
end
end
  	end    
})

R:AddButton({
	Name = "Unlock Lever",
	Callback = function()
if game:GetService("Workspace").Map["Temple of Time"].Lever.Prompt:FindFirstChild("ProximityPrompt") then
game:GetService("Workspace").Map["Temple of Time"].Lever.Prompt:FindFirstChild("ProximityPrompt"):Remove()
end
wait(0.1)
local ProximityPrompt = Instance.new("ProximityPrompt")
ProximityPrompt.Parent = game:GetService("Workspace").Map["Temple of Time"].Lever.Prompt
ProximityPrompt.MaxActivationDistance = 10
ProximityPrompt.ActionText = "Secrets Beholds Inside"
ProximityPrompt.ObjectText = "An unknown lever of time"

function onProximity()
local part = game:GetService("Workspace").Map["Temple of Time"].MainDoor1
local TweenService = game:GetService("TweenService")

local startPosition = part.Position
local endPosition = startPosition + Vector3.new(0, -50, 0)

local tweenInfo = TweenInfo.new(10, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local tween = TweenService:Create(part, tweenInfo, {Position = endPosition})

tween:Play()

local partnew = game:GetService("Workspace").Map["Temple of Time"].MainDoor2
local TweenService = game:GetService("TweenService")

local startPosition = partnew.Position
local endPosition = startPosition + Vector3.new(0, -50, 0)

local tweenInfo = TweenInfo.new(10, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local tween = TweenService:Create(partnew, tweenInfo, {Position = endPosition})

tween:Play()

local SoundSFX = Instance.new("Sound")
SoundSFX.Parent = workspace
SoundSFX.SoundId = "rbxassetid://1904813041"
SoundSFX:Play()
SoundSFX.Name = "POwfpxzxzfFfFF"
game:GetService("Workspace").Map["Temple of Time"].Lever.Prompt:FindFirstChild("ProximityPrompt"):Remove()
wait(5)
workspace:FindFirstChild("POwfpxzxzfFfFF"):Remove()
game:GetService("Workspace").Map["Temple of Time"].NoGlitching:Remove()
game:GetService("Workspace").Map["Temple of Time"].NoGlitching:Remove()
game:GetService("Workspace").Map["Temple of Time"].NoGlitching:Remove()
end

ProximityPrompt.Triggered:Connect(onProximity)
  	end    
})

R:AddButton({
	Name = "Temple Of Time",
	Callback = function()
    CheckNearTempleOrTeleport()
  	end    
})

R:AddToggle({
	Name = "Disabled Infinite Stairs",
	Default = false,
	Flag = "DisabledInfStairs",
    Save = true,
	Callback = function(Value)
	game.Players.LocalPlayer.Character.InfiniteStairs.Disabled = Value
	end    
})

R:AddButton({
	Name = "Ancient One",
	Callback = function()
CheckNearTempleOrTeleport()
wait(0.1)
TweenButton(CFrame.new(28973.0879, 14889.9756, -120.298691, -0.85230273, -9.83552173e-09, -0.523048818, -7.0291172e-08, 1, 9.5734535e-08, 0.523048818, 1.18360518e-07, -0.85230273))
  	end    
})

R:AddButton({
	Name = "Ancient Clock",
	Callback = function()
CheckNearTempleOrTeleport()
wait(0.1)
TweenButton(CFrame.new(29551.9941, 15069.002, -85.5179291, 0.603725016, 4.74354529e-08, -0.797192633, -3.64676893e-08, 1, 3.18856408e-08, 0.797192633, 9.82161463e-09, 0.603725016))
  	end    
})

R:AddButton({
	Name = "Clock Access",
	Callback = function()
game:GetService("Workspace").Map["Temple of Time"].DoNotEnter:Remove()
game:GetService("Workspace").Map["Temple of Time"].ClockRoomExit:Remove()
  	end    
})

R:AddButton({
	Name = "Race Door",
	Callback = function()
CheckNearTempleOrTeleport()
wait(0.1)
if game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
TweenButton(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
TweenButton(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
TweenButton(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))
elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
TweenButton(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
TweenButton(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))
elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
TweenButton(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))
end
  	end    
})

local namanhemtrenmotchiecxetang = R:AddSection({
	Name = "Misc Awaken V4"
})

R:AddToggle({
	Name = "Auto Trial",
	Default = false,
	Callback = function(Value)
    _G.AutoCompleteTrialV4 = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoCompleteTrialV4 then
pcall(function()
if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" or game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
for i,v in pairs(WS.Enemies:GetDescendants()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 750 then
repeat wait(.1)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
v.Humanoid.Health = 0
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
until not _G.AutoCompleteTrialV4 or not v.Parent or v.Humanoid.Health <= 0
end
end
end
elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
for i,v in pairs(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants()) do
if v.Name ==  "snowisland_Cylinder.081" then
Tween(v.CFrame)
end
if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
_G.AutoCompleteTrialV4 = false
CancelTween(_G.AutoCompleteTrialV4)
end
end
elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
for i,v in pairs(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants()) do
if v.Name ==  "HumanoidRootPart" then
Tween(v.CFrame)
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.CFrame.Position).Magnitude <= 10 then
EquipToolCheck("Melee")
KeyPress("Z")
wait(.1)
KeyPress("X")
wait(.2)
KeyPress("C")
wait(0.25)
EquipToolCheck("Blox Fruit")
KeyPress("Z")
wait(.1)
KeyPress("X")
wait(.2)
KeyPress("C")
wait(.3)
KeyPress("V")
wait(.4)
KeyPress("F")
wait(0.25)
EquipToolCheck("Sword")
KeyPress("Z")
wait(.1)
KeyPress("X")
wait(0.25)
EquipTool(CurrentEquipGun)
KeyPress("Z")
wait(.1)
KeyPress("X")
end
end
end
elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
Tween(CFrame.new(28654, 14898.7832, -30, 1, 0, 0, 0, 1, 0, 0, 0, 1))
elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
if v.Name == "StartPoint" then
Tween(v.CFrame * CFrame.new(0,3,0))
if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
_G.AutoCompleteTrialV4 = false
CancelTween(_G.AutoCompleteTrialV4)
end
end
end
end
end
end)
end
end
end)

R:AddToggle({
    Name = "Auto Kill Players After Trial",
    Default = false,
    Callback = function(Value)
    _G.AutoKillPlayerAfterTrial = Value
    end
})

spawn(function()
while wait() do
if _G.AutoKillPlayerAfterTrial then
pcall(function()
if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
if v.Name ~= game.Players.LocalPlayer.Name then
if v:WaitForChild("Humanoid").Health > 0 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 500 then
repeat task.wait()
AutoHaki()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,5,7))
v.HumanoidRootPart.CanCollide = false
v.HumanoidRootPart.Size = Vector3.new(100, 100, 100)
Click()
Click()
if AutoSkillInKillTrial then
EquipToolCheck("Melee")
wait(0.25)
EquipToolCheck("Blox Fruit")
wait(0.25)
EquipToolCheck("Sword")
wait(0.25)
EquipTool(CurrentEquipGun)
end
if AutoSkillInKillTrial then
KeyPress("Z")
wait(.1)
KeyPress("X")
wait(.2)
KeyPress("C")
wait(.3)
KeyPress("V")
wait(.4)
KeyPress("F")
end
until not _G.AutoKillPlayerAfterTrial or v:WaitForChild("Humanoid").Health <= 0 or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid") or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false
end
end
end
end
end)
end
end
end)

function ChooseGearFireRemote(bH)
v = bH
if v == "Gear1" then
print("Gear3")
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("TempleClock","SpendPoint")
elseif v == "Gear2" then
print("Gear2")
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("TempleClock","SpendPoint","Gear2","Omega")
elseif v == "Gear4" then
print("Gear4")
if condimemeaymeci.B == 2 then
print("Gear 4 Omega")
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("TempleClock","SpendPoint","Gear4","Omega")
elseif condimemeaymeci.A == 2 then
print("Gear 4 Alpha")
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("TempleClock","SpendPoint","Gear4","Alpha")
elseif condimemeaymeci.A < 2 then
v14 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TempleClock", "Check")
condimemeaymeci = v14.RaceDetails
print("Gear 4 Alpha")
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("TempleClock","SpendPoint","Gear4","Alpha")
end
elseif v == "Gear3" then
print("Gear3")
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("TempleClock","SpendPoint","Gear3","Alpha")
elseif v == "Gear5" then
print("Gear5")
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("TempleClock","SpendPoint","Gear5","Default")
end
OrionLib:MakeNotification({
	Name = "Notifying",
	Content = "Choose your gear!",
	Image = "rbxassetid://4483345998",
	Time = 6
})
end

function InstantChooseGear()
v14 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TempleClock", "Check")
if v14 and v14.HadPoint then
condimemeaymeci = v14.RaceDetails
CheckNearTempleOrTeleport()
wait(0.1)
Tween(game:GetService("Workspace").Map["Temple of Time"].Prompt.CFrame)
if (game:GetService("Workspace").Map["Temple of Time"].Prompt.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 3 then
wait(1)
fireproximityprompt(game:GetService("Workspace").Map["Temple of Time"].Prompt.ProximityPrompt)
wait(5)
for r, v in pairs(game:GetService("Workspace").Map["Temple of Time"].InnerClock:GetChildren()) do
if v:FindFirstChild("Highlight") and v.Highlight.Enabled then
print(v.Name)
ChooseGearFireRemote(v.Name)
end
end
end
task.wait(300)
else
OrionLib:MakeNotification({
	Name = "Notifying",
	Content = "You haven't upgraded your gear yet!",
	Image = "rbxassetid://4483345998",
	Time = 6
})
task.wait(30)
end
end

R:AddToggle({
	Name = "Auto Choose Gear",
	Default = false,
	Flag = "AutoPlaceGearV4",
    Save = true,
	Callback = function(Value)
	_G.AutoPlaceGear = Value
	end    
})

spawn(function()
while wait(0.1) do
if _G.AutoPlaceGear then
pcall(function()
InstantChooseGear()
end)
end
end
end)

R:AddToggle({
    Name = "Auto Buy Ancient One",
    Default = false,
    Flag = "AutoBuyAncOneQuest",
    Save = true,
    Callback = function(Value)
    _G.AutoBuyAncOneQuest = Value
    end    
})

spawn(function()
while wait() do
if _G.AutoBuyAncOneQuest then
pcall(function()
local b_ = CheckAcientOneStatus()
if string.find(b_, "I have no need for it, I'll sell it to you for f") or string.find(b_, "As promised, I'll upgrade your transformation limit for f") or string.find(b_, "You're ready for the next upgrade. This will cost you f") then
v229, v228, v227 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("UpgradeRace", "Check")
if v227 and game.Players.LocalPlayer.Data.Fragments.Value >= v227 then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("UpgradeRace","Buy")
end
end
end)
end
end
end)

R:AddDropdown({
	Name = "Choose trains",
	Default = "",
	Options = {"Level", "Bone", "Cake"},
	Flag = "ChosenTrainsFarm",
    Save = true,
	Callback = function(Value)
	_G.ChosenTrainsFarm = Value
	end    
})

R:AddToggle({
    Name = "Auto Trains",
    Default = false,
    Flag = "AutoTrainsV4",
    Save = true,
    Callback = function(Value)
    _G.AutoTrains = Value
    end    
})

spawn(function()
while task.wait() do
if _G.AutoTrains then
if _G.ChosenTrainsFarm == "Level" then
pcall(function()
CheckLevel()
if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
Tween(CFrameQ)
if (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,QuestLv)
end
elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
if v.Name == Ms then
repeat game:GetService("RunService").Heartbeat:wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoLevel or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name) or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
end   
end
end
else
if game:GetService("ReplicatedStorage"):FindFirstChild(Ms) then
Tween(CFrameMon)
else
for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
if string.find(v.Name,NameMon) then
Tween(v.CFrame * MethodFarm)
end
end
end
end
end
end)
elseif _G.ChosenTrainsFarm == "Bone" then
pcall(function()
local BoneCFrame = CFrame.new(-9515.75, 174.8521728515625, 6079.40625)
if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
repeat task.wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoBone or v.Humanoid.Health <= 0 or not v.Parent
end
end
end
else
Tween(BoneCFrame)
end
end)
elseif _G.ChosenTrainsFarm == "Cake" then
pcall(function()
local PosCake = CFrame.new(-2077, 252, -12373)
if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
repeat game:GetService("RunService").Heartbeat:wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not _G.AutoCakePrince
end
end
end
else
Tween(PosCake)
end
end)
end
end
end
end)

spawn(function()
while wait() do
pcall(function()
if _G.AutoTrains then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("UpgradeRace","Buy",true)
if WS.Characters:FindFirstChild(plr.Name).RaceEnergy.Value == 1 and WS.Characters:FindFirstChild(plr.Name).RaceTransformed.Value == false then
repeat wait()
game:GetService("Players").LocalPlayer.Character.Awakening.RemoteFunction:InvokeServer(true)
until WS.Characters:FindFirstChild(plr.Name).RaceTransformed.Value == true or WS.Characters:FindFirstChild(plr.Name).RaceEnergy.Value ~= 1 or not _G.AutoTrains
end
end
end)
end
end)














----------------------------------------------------------------------------
-- item quest tab
if First_Sea then
local SkibidiToilet = IQ:AddSection({
	Name = "Misc Boss Quest"
})

IQ:AddToggle({
	Name = "Auto Saber",
	Default = false,
	Flag = "AutoSaber",
    Save = true,
	Callback = function(Value)
	_G.AutoSaber = Value
	end    
})

function DoorTouch()
    for r, v in next, game:GetService("Workspace").Map.Jungle.QuestPlates:GetChildren() do
        if v:IsA("Model") then
            if v.Button:FindFirstChild("TouchInterest") then
                return v
            end
        end
    end
end

function doorcup()
    return workspace.Map.Desert.Burn.Part.CanCollide == false
end

function doorsaber()
    for r, v in next, game:GetService("Workspace").Map.Jungle.Final:GetChildren() do
        if v:IsA("Part") and not v.CanCollide then
            return true
        end
    end
end


spawn(function()
    while task.wait() do
        if _G.AutoSaber and game.Players.LocalPlayer.Data.Level.Value >= 200 then
            if not GetWeaponInventory("Saber") then
                pcall(function()
                    if not doorsaber() then
                        if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.CanCollide then
                            if DoorTouch() then
                                Tween(DoorTouch().Button.CFrame)
                            end
                        else
                            if doorcup() then
                                if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") ~= 0 and 
                                   game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") ~= 1 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup")
                                    
                                    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Cup") and 
                                       not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Cup") then
                                        if (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - 
                                            CFrame.new(1112.46521, 4.92147732, 4364.55469, -0.743286014, -4.82822775e-11, 
                                            -0.668973804, 4.62103383e-10, 1, -5.85609283e-10, 0.668973804, 
                                            -7.444102e-10, -0.743286014).Position).Magnitude < 5 then
                                            Tween(CFrame.new(1113.66992, 7.5484705, 4365.27832, -0.78613919, 
                                                -2.19578524e-08, -0.618049502, 1.02977182e-09, 1, 
                                                -3.68374984e-08, 0.618049502, -2.95958493e-08, 
                                                -0.78613919))
                                            firetouchinterest(game:GetService("Workspace").Map.Desert.Cup, 
                                                game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                                            firetouchinterest(game:GetService("Workspace").Map.Desert.Cup, 
                                                game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
                                            return
                                        end
                                        Tween(CFrame.new(1112.46521, 4.92147732, 4364.55469, 
                                            -0.743286014, -4.82822775e-11, -0.668973804, 4.62103383e-10, 
                                            1, -5.85609283e-10, 0.668973804, -7.444102e-10, 
                                            -0.743286014))
                                    else
                                        EquipTool("Cup")
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", 
                                            "FillCup", game:GetService("Players").LocalPlayer.Character.Cup)

                                        if (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Cup") and 
                                            game:GetService("Players").LocalPlayer.Backpack.Cup.Handle:FindFirstChild("TouchInterest")) or 
                                           (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Cup") and 
                                            game:GetService("Players").LocalPlayer.Character.Cup.Handle:FindFirstChild("TouchInterest")) then
                                            Tween(CFrame.new(1395.77307, 37.4733238, -1324.34631, 
                                                -0.999978602, -6.53588605e-09, 0.00654155109, 
                                                -6.57083277e-09, 1, -5.32077493e-09, 
                                                -0.00654155109, -5.3636442e-09, -0.999978602))
                                        elseif (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Cup") and 
                                                  not game:GetService("Players").LocalPlayer.Backpack.Cup.Handle:FindFirstChild("TouchInterest")) or 
                                               (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Cup") and 
                                                  not game:GetService("Players").LocalPlayer.Character.Cup.Handle:FindFirstChild("TouchInterest")) then
                                            if (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - 
                                                Vector3.new(1457.8768310547, 88.377502441406, -1390.6892089844)).Magnitude > 8 then
                                                Tween(CFrame.new(1457.8768310547, 88.377502441406, -1390.6892089844))
                                            else
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan")
                                            end
                                        end
                                    end
                                elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == nil then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                                elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 0 then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") or 
                                       game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
                                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if v.Name == "Mob Leader" then
                                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                    repeat task.wait()
                                                        EquipTool(SelectWeapon)
                                                        Tween(v.HumanoidRootPart.CFrame * MethodFarm)
                                                        FarmPos = v.HumanoidRootPart.CFrame
                                                        MonFarm = v.Name
                                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                                    until v.Humanoid.Health <= 0 or not _G.AutoSaber or not v.Parent
                                                end
                                            end
                                        end
                                    end
                                elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 1 then
                                    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Relic") and 
                                       not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Relic") then
                                        if (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - 
                                            CFrame.new(-1404.07996, 29.8520069, 5.26677656, 0.888123989, 
                                            -4.0340602e-09, 0.459603906, 7.5884703e-09, 1, 
                                            -5.8864642e-09, -0.459603906, 8.71560069e-09, 0.888123989)).Magnitude > 8 then
                                            Tween(CFrame.new(-1404.07996, 29.8520069, 5.26677656, 
                                                0.888123989, -4.0340602e-09, 0.459603906, 
                                                7.5884703e-09, 1, -5.8864642e-09, 
                                                -0.459603906, 8.71560069e-09, 0.888123989))
                                        else
                                            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                                        end
                                    else
                                        EquipTool("Relic")
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic")
                                        Tween(CFrame.new(-1405.3677978516, 29.977333068848, 4.5685839653015))
                                    end
                                else
                                    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torch") and 
                                       not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") then
                                        Tween(game:GetService("Workspace").Map.Jungle.Torch.CFrame)
                                    else
                                        EquipTool("Torch")
                                        if (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - 
                                            CFrame.new(1115.23499, 4.92147732, 4349.36963, -0.670654476, 
                                            -2.18307523e-08, 0.74176991, -9.06980624e-09, 1, 
                                            2.1230365e-08, -0.74176991, 7.51052998e-09, 
                                            -0.670654476).Position).Magnitude < 5 then
                                            Tween(CFrame.new(1114.59863, 4.92147732, 4350.64258, 
                                                -0.508235395, 1.00975717e-09, 0.861218214,-0.508235395))
                                            firetouchinterest(game.Players.LocalPlayer.Character.Torch.Handle, 
                                                game:GetService("Workspace").Map.Desert.Burn.Fire, 0)
                                            firetouchinterest(game.Players.LocalPlayer.Character.Torch.Handle, 
                                                game:GetService("Workspace").Map.Desert.Burn.Fire, 1)
                                            return
                                        end
                                        Tween(CFrame.new(1115.23499, 4.92147732, 4349.36963, 
                                            -0.670654476, -2.18307523e-08, 0.74176991, 
                                            -9.06980624e-09, 1, 2.1230365e-08, 
                                            -0.74176991, 7.51052998e-09, -0.670654476))
                                    end
                                end
                            end
                        end
                    else
                        if game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert") or 
                           game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert") then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    if v.Name == "Saber Expert" then
                                        repeat task.wait()
                                            EquipTool(SelectWeapon)
                                            Tween(v.HumanoidRootPart.CFrame * MethodFarm)
                                            FarmPos = v.HumanoidRootPart.CFrame
                                        until v.Humanoid.Health <= 0 or not _G.AutoSaber or not v.Parent
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic")
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end
end)

IQ:AddToggle({
	Name = "Auto Pole",
	Default = false,
	Flag = "AutoPoleV1",
    Save = true,
	Callback = function(Value)
	_G.AutoPole = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoPole then
pcall(function()
if game:GetService("Workspace").Enemies:FindFirstChild("Thunder God") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Thunder God" then
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
repeat task.wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
until not _G.AutoPole or not v.Parent or v.Humanoid.Health <= 0
end
end
end
else
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
wait(0.25)
if game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God") then
Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God").HumanoidRootPart.CFrame * MethodFarm)
end
end
end)
end
end
end)

IQ:AddToggle({
	Name = "Auto Second Sea",
	Default = false,
	Flag = "AutoSecondSea",
    Save = true,
	Callback = function(Value)
	_G.AutoSecondSea = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoSecondSea then
pcall(function()
if game.Players.LocalPlayer.Data.Level.Value >= 700 and First_Sea then
if game.Workspace.Map.Ice.Door.CanCollide == true and game.Workspace.Map.Ice.Door.Transparency == 0 then
repeat wait()
Tween(CFrame.new(4851.8720703125, 5.6514348983765, 718.47094726563))
until (CFrame.new(4851.8720703125, 5.6514348983765, 718.47094726563).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.AutoSecondSea
wait(1)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
EquipTool("Key")
local pos2 = CFrame.new(1347.7124, 37.3751602, -1325.6488)
repeat wait()
Tween(pos2)
until (pos2.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.AutoSecondSea
wait(3)
elseif game.Workspace.Map.Ice.Door.CanCollide == false and game.Workspace.Map.Ice.Door.Transparency == 1 then
if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Ice Admiral" and v.Humanoid.Health > 0 then
repeat wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until v.Humanoid.Health <= 0 or not v.Parent or not _G.AutoSecondSea
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
end
end
else
Tween(CFrame.new(1347.7124, 37.3751602, -1325.6488))
end
else
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
end
end
end)
end
end
end)
end

if Second_Sea then
local SkibidiToilet = IQ:AddSection({
	Name = "Misc Boss Items"
})

IQ:AddToggle({
	Name = "Auto Buy Legendary Sword",
	Default = false,
	Flag = "AutoBuyLegendSword",
    Save = true,
	Callback = function(Value)
	_G.AutoBuyLegendarySword = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoBuyLegendarySword then
pcall(function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","1")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","2")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","3")
end)
end 
end
end)

IQ:AddToggle({
	Name = "Auto Buy TTK",
	Default = false,
	Flag = "AutoBuyTTK",
    Save = true,
	Callback = function(Value)
	_G.AutoBuyTrueTripleKatana = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoBuyTrueTripleKatana then
pcall(function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("MysteriousMan","1")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("MysteriousMan","2")
end)
end 
end
end)

IQ:AddToggle({
	Name = "Auto Factory",
	Default = false,
	Flag = "AutoFactory",
    Save = true,
	Callback = function(Value)
	_G.AutoFactory = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoFactory then
pcall(function()
if game.Workspace.Enemies:FindFirstChild("Core") then
for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
if v.Name == "Core" then
repeat wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name     
until not v.Parent or v.Humanoid.Health <= 0 or not _G.AutoFactory
end
end
end
elseif game.ReplicatedStorage:FindFirstChild("Core") then
Tween(CFrame.new(448.46756, 199.356781, -441.389252))
end
end)
end
end
end)

IQ:AddToggle({
	Name = "Auto Swan Glasses",
	Default = false,
	Flag = "AutoTakeSwanGlasses",
    Save = true,
	Callback = function(Value)
	_G.AutoSwanGlasses = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoSwanGlasses then
pcall(function()
if game:GetService("Workspace").Enemies:FindFirstChild("Don Swan") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Don Swan" then
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
repeat task.wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
until not _G.AutoSwanGlasses or not v.Parent or v.Humanoid.Health <= 0
end
end
end
else
if game:GetService("ReplicatedStorage"):FindFirstChild("Don Swan") then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(2284.912109375, 15.537666320801, 905.48291015625))
end
end
end)
end
end
end)

IQ:AddToggle({
	Name = "Auto Rengoku Sword",
	Default = false,
	Flag = "AutoRengoku",
    Save = true,
	Callback = function(Value)
	_G.AutoRengoku = Value
	end    
})

spawn(function()
while task.wait() do
pcall(function()
if _G.AutoRengoku then
local RengoKuBoss = CFrame.new(5525.7045898438, 262.90060424805, -6755.1186523438)
if game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game.Players.LocalPlayer.Character:FindFirstChild("Hidden Key") then
EquipTool("Hidden Key")
wait(0.1)
Tween(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
elseif game.Workspace.Enemies:FindFirstChild("Snow Lurker") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior") then
for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
if (v.Name == "Snow Lurker" or v.Name == "Arctic Warrior") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
repeat wait()
EquipTool(SelectWeapon)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
until game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or not _G.AutoRengoku or not v.Parent or v.Humanoid.Health <= 0
end
end
elseif game.Workspace.Enemies:FindFirstChild("Awakened Ice Admiral") or game:GetService("ReplicatedStorage"):FindFirstChild("Awakened Ice Admiral") then
for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
repeat wait()
EquipTool(SelectWeapon)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
until game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game.Players.LocalPlayer.Character:FindFirstChild("Hidden Key") or not _G.AutoRengoku or not v.Parent or v.Humanoid.Health <= 0
end
end
else
Tween(RengoKuBoss)
end
end
end)
end
end)

IQ:AddToggle({
	Name = "Auto Dark Beard",
	Default = false,
	Flag = "AutoDarkBeard",
    Save = true,
	Callback = function(Value)
	_G.AutoDarkBeard = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoDarkBeard then
pcall(function()
if game:GetService("Workspace").Enemies:FindFirstChild("Darkbeard") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Darkbeard" then
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
repeat task.wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
until not _G.AutoDarkBeard or not v.Parent or v.Humanoid.Health <= 0
end
end
end
else
if game:GetService("ReplicatedStorage"):FindFirstChild("Darkbeard") then
Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Darkbeard").HumanoidRootPart.CFrame * CFrame.new(2,posY,2))
end
end
end)
end
end
end)

local SkibidiToilet = IQ:AddSection({
	Name = "Misc Boss Quest"
})

IQ:AddToggle({
	Name = "Auto Bartilo Quest",
	Default = false,
	Flag = "AutoBartilo",
    Save = true,
	Callback = function(Value)
	_G.AutoBartilo = Value
	end    
})

spawn(function()
pcall(function()
while wait(.1) do
if _G.AutoBartilo then
if game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then 
if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Swan Pirate" then
repeat task.wait()
sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not v.Parent or v.Humanoid.Health <= 0 or not _G.AutoBartilo or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
end
end
else
repeat Tween(CFrame.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.55137119e-08, -0.230443969, 2.67024713e-08, 1, 8.47491108e-08, 0.230443969, 7.63147128e-08, -0.973085582)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.55137119e-08, -0.230443969, 2.67024713e-08, 1, 8.47491108e-08, 0.230443969, 7.63147128e-08, -0.973085582)).Magnitude <= 10
end
else
repeat Tween(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
wait(1.1)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","BartiloQuest",1)
end 
elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
if game:GetService("Workspace").Enemies:FindFirstChild("Jeremy") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Jeremy" then
repeat task.wait()
sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
until not v.Parent or v.Humanoid.Health <= 0 or not _G.AutoBartilo
end
end
elseif game:GetService("ReplicatedStorage"):FindFirstChild("Jeremy") then
repeat Tween(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
wait(1.1)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo")
wait(1)
repeat Tween(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
wait(2)
else
repeat Tween(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
end
elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
repeat Tween(CFrame.new(-1850.49329, 13.1789551, 1750.89685)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1850.49329, 13.1789551, 1750.89685)).Magnitude <= 10
wait(1)
repeat Tween(CFrame.new(-1858.87305, 19.3777466, 1712.01807)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1858.87305, 19.3777466, 1712.01807)).Magnitude <= 10
wait(1)
repeat Tween(CFrame.new(-1803.94324, 16.5789185, 1750.89685)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1803.94324, 16.5789185, 1750.89685)).Magnitude <= 10
wait(1)
repeat Tween(CFrame.new(-1858.55835, 16.8604317, 1724.79541)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1858.55835, 16.8604317, 1724.79541)).Magnitude <= 10
wait(1)
repeat Tween(CFrame.new(-1869.54224, 15.987854, 1681.00659)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1869.54224, 15.987854, 1681.00659)).Magnitude <= 10
wait(1)
repeat Tween(CFrame.new(-1800.0979, 16.4978027, 1684.52368)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1800.0979, 16.4978027, 1684.52368)).Magnitude <= 10
wait(1)
repeat Tween(CFrame.new(-1819.26343, 14.795166, 1717.90625)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1819.26343, 14.795166, 1717.90625)).Magnitude <= 10
wait(1)
repeat Tween(CFrame.new(-1813.51843, 14.8604736, 1724.79541)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1813.51843, 14.8604736, 1724.79541)).Magnitude <= 10
end
end 
end
end)
end)

IQ:AddToggle({
	Name = "Auto Don Swan Access",
	Default = false,
	Flag = "AutoDonSwanAccess",
    Save = true,
	Callback = function(Value)
	_G.AutoDonSwanAccess = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoDonSwanAccess then
pcall(function()
if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
TabelDevilFruitStore = {}
TabelDevilFruitOpen = {}
for i, v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
for i1, v1 in pairs(v) do
if i1 == "Name" then
table.insert(TabelDevilFruitStore, v1)
end
end
end
for i, v in next, game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits") do
if v.Price >= 1000000 then
table.insert(TabelDevilFruitOpen, v.Name)
end
end
for i, DevilFruitOpenDoor in pairs(TabelDevilFruitOpen) do
for x, DevilFruitStore in pairs(TabelDevilFruitStore) do
if DevilFruitOpenDoor == DevilFruitStore and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
if not game.Players.LocalPlayer.Backpack:FindFirstChild(DevilFruitStore) then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit", DevilFruitStore)
else
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor", "1")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor", "2")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor", "3")
end
end
end
end
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor", "1")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor", "2")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor", "3")
end
end)
end
end
end)

IQ:AddToggle({
	Name = "Auto Third Sea",
	Default = false,
	Flag = "AutoThirdSea",
    Save = true,
	Callback = function(Value)
	_G.AutoThirdSea = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoThirdSea then
pcall(function()
if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 3 then
if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess ~= nil then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1500 and Second_Sea then
if game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("ZQuestProgress", "Check") == 0 then
if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
if v.Name == "rip_indra" then
repeat task.wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, posY, 0))
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
until not _G.AutoThirdSea or v.Humanoid.Health <= 0 or not v.Parent
wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
end
end
end
else
Tween(CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016))
if (CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
wait(1.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "Check")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "Begin")
end
wait(1.8)
end
elseif game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("ZQuestProgress", "Check") == 1 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
end
end
end
end
end)
end
end
end)

local SkibidiToilet = IQ:AddSection({
	Name = "Misc Boss Race"
})

IQ:AddToggle({
	Name = "Auto Evo Race (Not Evo V3)",
	Default = false,
	Flag = "AutoEvoRace",
    Save = true,
	Callback = function(Value)
	_G.AutoEvoRace = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoEvoRace then
pcall(function()
Race = CheckRace()
if string.find(Race, "V1") then
_G.AutoBartilo = true
elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 3 then
_G.AutoBartilo = false
if not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
if game:GetService("Players").LocalPlayer.Data.Beli.Value >= 500000 and game:GetService("Players").LocalPlayer.Data.Level.Value >= 900 then
if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
Tween(CFrame.new(-2779.83521, 72.9661407, -3574.02002, -0.730484903, 6.39014104e-08, -0.68292886, 3.59963224e-08, 1, 5.50667032e-08, 0.68292886, 1.56424669e-08, -0.730484903))
if (CFrame.new(-2779.83521, 72.9661407, -3574.02002) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
wait(1.3)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","2")
end
elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") or not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
Tween(game:GetService("Workspace").Flower1.CFrame)
elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") or not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
Tween(game:GetService("Workspace").Flower2.CFrame)
elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Swan Pirate" then
repeat task.wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or not _G.AutoEvoRace or game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved")
end
end
else
Tween(CFrame.new(-5685.9233398438, 48.480125427246, -853.23724365234))
end
end
elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3")
end
end
end
elseif string.find(Race, "V2") then
if game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("ZQuestProgress", "Check") == 1 then
if game:GetService("Players").LocalPlayer.Data.Beli.Value >= 2000000 and game:GetService("Players").LocalPlayer.Data.Level.Value >= 1000 then
if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Last Resort") or not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Last Resort") then
if game:GetService("Workspace").Enemies:FindFirstChild("Diamond") or game:GetService("Workspace").Enemies:FindFirstChild("Jeremy") or game:GetService("Workspace").Enemies:FindFirstChild("Fajita") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
if v.Name == "Diamond" or v.Name == "Jeremy" or v.Name == "Fajita" then
repeat game:GetService("RunService").Heartbeat:wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("Wenlocktoad","1")
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("Wenlocktoad","2")
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("Wenlocktoad","3")
until not _G.AutoEvoRace or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Last Resort") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Last Resort")
end
end
end
if game:GetService("ReplicatedStorage"):FindFirstChild("Diamond") then
Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Diamond").HumanoidRootPart.CFrame * MethodFarm)
elseif game:GetService("ReplicatedStorage"):FindFirstChild("Jeremy") then
Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Jeremy").HumanoidRootPart.CFrame * MethodFarm)
elseif game:GetService("ReplicatedStorage"):FindFirstChild("Fajita") then
Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Fajita").HumanoidRootPart.CFrame * MethodFarm)
end
end
end
elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Energy Core") or not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Energy Core") then
TabelDevilFruitStore = {}
TabelDevilFruitOpen = {}
for i, v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
for i1, v1 in pairs(v) do
if i1 == "Name" then
table.insert(TabelDevilFruitStore, v1)
end
end
end
for i, v in next, game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits") do
if v.Price >= 1000000 then
table.insert(TabelDevilFruitOpen, v.Name)
end
end
for i, DevilFruitOpenDoor in pairs(TabelDevilFruitOpen) do
for x, DevilFruitStore in pairs(TabelDevilFruitStore) do
if DevilFruitOpenDoor == DevilFruitStore and (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess ~= nil or game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("ZQuestProgress", "Check") == 1) then
if not game.Players.LocalPlayer.Backpack:FindFirstChild(DevilFruitStore) then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit", DevilFruitStore)
else
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("Wenlocktoad","1")
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("Wenlocktoad","2")
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("Wenlocktoad","3")
end
end
end
end
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("Wenlocktoad","1")
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("Wenlocktoad","2")
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("Wenlocktoad","3")
end
end
end
end
elseif string.find(Race, "V3") or string.find(Race, "V4") then
_G.AutoEvoRace = false
end
end)
end
end
end)

IQ:AddToggle({
	Name = "Auto Ghoul",
	Default = false,
	Flag = "AutoGhoul",
    Save = true,
	Callback = function(Value)
	_G.AutoGhoul = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoGhoul then
pcall(function()
if game:GetService("Players").LocalPlayer.Data.Race.Value ~= "Ghoul" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm","BuyCheck",4)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm","Change",4)
wait(0.1)
if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Captain") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Cursed Captain" then
if v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
repeat task.wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
until not _G.AutoGhoul or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul"
end
end
end
elseif game:GetService("ReplicatedStorage"):FindFirstChild("Cursed Captain") then
if (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
wait(0.1)
Tween(CFrame.new(916.928589, 181.092773, 33422))
end
elseif CheckMaterial("Ectoplasm") ~= 100 then
if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Ship Steward" or v.Name == "Ship Engineer" or v.Name == "Ship Deckhand" or v.Name == "Ship Officer" then
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
repeat game:GetService("RunService").Heartbeat:wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoGhoul or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
end
end
end
elseif game:GetService("ReplicatedStorage"):FindFirstChild("Ship Steward") or game:GetService("ReplicatedStorage"):FindFirstChild("Ship Engineer") or game:GetService("ReplicatedStorage"):FindFirstChild("Ship Deckhand") or game:GetService("ReplicatedStorage"):FindFirstChild("Ship Officer") then
if (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
wait(0.1)
Tween(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875))
end
elseif CheckMaterial("Ectoplasm") >= 100 then
if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hellfire Torch") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hellfire Torch") then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm","BuyCheck",4)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm","Change",4)
end
end
end
end
end)
end
end
end)

IQ:AddToggle({
	Name = "Auto Cyborg Race [No Auto Chest]",
	Default = false,
	Flag = "AutoCyborg",
    Save = true,
	Callback = function(Value)
	_G.AutoCyborg = Value
	end    
})

spawn(function()
    while wait() do
        if _G.AutoCyborg then
            pcall(function()
                local CyborgCheck = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CyborgTrainer", "Check")
                
                -- Kiểm tra nếu đã là Cyborg
                if game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
                    OrionLib:MakeNotification({
                        Name = "Notifying",
                        Content = "Please turn it off because you are a cyborg",
                        Image = "rbxassetid://4483345998",
                        Time = 5
                    })
                elseif not CyborgCheck then
                    if not game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector.CanCollide then
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CyborgTrainer", "Buy")
                    else
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Core Brain") or 
                           game.Players.LocalPlayer.Character:FindFirstChild("Core Brain") then
                            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                        elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or 
                               game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") then
                            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                        else
                            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckBlockPart") then
                                if game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                            if v.Name == "Order" then
                                                repeat wait()
                                                    EquipTool(SelectWeapon)
                                                    Tween(v.HumanoidRootPart.CFrame * MethodFarm)
                                                    FarmPos = v.HumanoidRootPart.CFrame
                                                    MonFarm = v.Name
                                                until not v.Parent or v.Humanoid.Health <= 0 or 
                                                       not _G.AutoCyborg or 
                                                       game.Players.LocalPlayer.Backpack:FindFirstChild("Core Brain") or 
                                                       game.Players.LocalPlayer.Character:FindFirstChild("Core Brain")
                                            end
                                        end
                                    end
                                else
                                    if (not game.Players.LocalPlayer.Character:FindFirstChild("Microchip") or 
                                        not game.Players.LocalPlayer.Backpack:FindFirstChild("Microchip")) and 
                                        game.Players.LocalPlayer.Data.Fragments.Value >= 1000 then
                                        
                                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "1")
                                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
                                    elseif game.Players.LocalPlayer.Character:FindFirstChild("Microchip") or 
                                           game.Players.LocalPlayer.Backpack:FindFirstChild("Microchip") then
                                        fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                                    end
                                end
                            else
                                fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                            end
                        end
                    end
                end
            end)
        end
    end
end)
end

local SkibidiToilet = IQ:AddSection({
	Name = "Misc Something"
})

if First_Sea then
TableAutoItems = {"Saw Sword","Cool Shades","Trident","Marine Coat","Pink Coat","Warden Sword"}
elseif Second_Sea then
TableAutoItems = {"Black Spikey Coat","Blue/Red Spikey Coat","Dark Coat","Gravity Cane","Dragon Trident","Jitte","Longsword"}
elseif Third_Sea then
TableAutoItems = {"Pilot Helmet","Lei","Canvander","Twin Hooks","Serpent Bow","Dark Dagger","Buddy Sword"}
end

IQ:AddDropdown({
	Name = "Select Auto Items",
	Default = "",
	Options = TableAutoItems,
	Callback = function(Value)
	_G.SelectAutoItems = Value
	end    
})

IQ:AddToggle({
	Name = "Auto Items",
	Default = false,
	Flag = "AutoItems",
    Save = true,
	Callback = function(Value)
	_G.AutoItems = Value
	end    
})

IQ:AddToggle({
	Name = "Auto Items Hop",
	Default = false,
	Flag = "AutoItemsHop",
    Save = true,
	Callback = function(Value)
	_G.AutoItemsHop = Value
	end    
})

function GetFastTpAutoItemz()
if _G.SelectAutoItems == "Saw Sword" then
AutoItemsPos = CFrame.new(-710.454345703125, 9.582493782043457, 1590.454833984375)
AutoItemsBossName = "The Saw"
AutoItemsPos2 = CFrame.new(-830.2066650390625, 53.97815704345703, 1574.9228515625)
elseif _G.SelectAutoItems == "Cool Shades" then
AutoItemsPos = CFrame.new(6183.31494140625, 57.33689880371094, 3857.846923828125)
AutoItemsBossName = "Cyborg"
AutoItemsPos2 = CFrame.new(6294.30224609375, 42.3297233581543, 3999.1416015625)
elseif _G.SelectAutoItems == "Trident" then
AutoItemsPos = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
AutoItemsBossName = "Fishman Lord"
AutoItemsPos2 = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
elseif _G.SelectAutoItems == "Marine Coat" then
AutoItemsPos = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
AutoItemsBossName = "Vice Admiral"
AutoItemsPos2 = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
elseif _G.SelectAutoItems == "Pink Coat" then
AutoItemsPos = CFrame.new(5184.01416015625, 52.346580505371094, 820.8744506835938)
AutoItemsBossName = "Swan"
AutoItemsPos2 = CFrame.new(6294.30224609375, 42.3297233581543, 3999.1416015625)
elseif _G.SelectAutoItems == "Warden Sword" then
AutoItemsPos = CFrame.new(5184.01416015625, 52.346580505371094, 820.8744506835938)
AutoItemsBossName = "Chief Warden"
AutoItemsPos2 = CFrame.new(6294.30224609375, 42.3297233581543, 3999.1416015625)
elseif _G.SelectAutoItems == "Black Spikey Coat" then
AutoItemsPos = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
AutoItemsBossName = "Jeremy"
AutoItemsPos2 = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
elseif _G.SelectAutoItems == "Blue/Red Spikey Coat" then
AutoItemsPos = CFrame.new(916.928589, 181.092773, 33422)
AutoItemsBossName = "Cursed Captain"
AutoItemsPos2 = CFrame.new(916.928589, 181.092773, 33422)
elseif _G.SelectAutoItems == "Dark Coat" then
AutoItemsPos = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
AutoItemsBossName = "Darkbeard"
AutoItemsPos2 = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
elseif _G.SelectAutoItems == "Gravity Cane" then
AutoItemsPos = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
AutoItemsBossName = "Fajita"
AutoItemsPos2 = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
elseif _G.SelectAutoItems == "Dragon Trident" then
AutoItemsPos = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)
AutoItemsBossName = "Tide Keeper"
AutoItemsPos2 = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)
elseif _G.SelectAutoItems == "Jitte" then
AutoItemsPos = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
AutoItemsBossName = "Smoke Admiral"
AutoItemsPos2 = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
elseif _G.SelectAutoItems == "Longsword" then
AutoItemsPos = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
AutoItemsBossName = "Diamond"
AutoItemsPos2 = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
elseif _G.SelectAutoItems == "Pilot Helmet" then
AutoItemsPos = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
AutoItemsBossName = "Stone"
AutoItemsPos2 = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
elseif _G.SelectAutoItems == "Lei" then
AutoItemsPos = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
AutoItemsBossName = "Kilo Admiral"
AutoItemsPos2 = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
elseif _G.SelectAutoItems == "Canvander" then
AutoItemsPos = CFrame.new(5314.58203, 22.8796749, -125.942276, 1, 1.69639192e-10, 1.5617945e-15, -1.69639192e-10, 1, 5.38001999e-08, -1.55266783e-15, -5.38001999e-08, 1)
AutoItemsBossName = "Beautiful Pirate"
AutoItemsPos2 = CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875)
elseif _G.SelectAutoItems == "Twin Hooks" then
AutoItemsPos = CFrame.new(-13348.0654296875, 405.8904113769531, -8570.62890625)
AutoItemsBossName = "Captain Elephant"
AutoItemsPos2 = CFrame.new(-13348.0654296875, 405.8904113769531, -8570.62890625)
elseif _G.SelectAutoItems == "Serpent Bow" then
AutoItemsPos = CFrame.new(5543.86328125, 668.97399902344, 199.0341796875)
AutoItemsBossName = "Island Empress"
AutoItemsPos2 = CFrame.new(5543.86328125, 668.97399902344, 199.0341796875)
elseif _G.SelectAutoItems == "Dark Dagger" then
AutoItemsPos = CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781)
AutoItemsBossName = "rip_indra True Form" or "rip_indra"
AutoItemsPos2 = CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781)
elseif _G.SelectAutoItems == "Buddy Sword" then
AutoItemsPos = CFrame.new(-731.2034301757812, 381.5658874511719, -11198.4951171875)
AutoItemsBossName = "Cake Queen"
AutoItemsPos2 = CFrame.new(-731.2034301757812, 381.5658874511719, -11198.4951171875)
end
end

spawn(function()
while wait() do
if _G.AutoItems then
pcall(function()
GetFastTpAutoItemz()
if game:GetService("Workspace").Enemies:FindFirstChild(AutoItemsBossName) then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == AutoItemsBossName then
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
repeat task.wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
until not _G.AutoItems or not v.Parent or v.Humanoid.Health <= 0
end
end
end
elseif game:GetService("ReplicatedStorage"):FindFirstChild(AutoItemsBossName) then
Tween(game:GetService("ReplicatedStorage"):FindFirstChild(AutoItemsBossName).HumanoidRootPart.CFrame * MethodFarm)
else
if _G.AutoItemsHop then
Hop()
end
end
end)
end
end
end)

local CheckObservationPoint = IQ:AddLabel("Obversation Point")

spawn(function()
while wait() do
pcall(function()
CheckObservationPoint:Set("Obversation Point : "..math.floor(game:GetService("Players").LocalPlayer.VisionRadius.Value))
end)
end
end)

IQ:AddToggle({
	Name = "Auto Observation V1",
	Default = false,
	Flag = "AutoObservation",
    Save = true,
	Callback = function(Value)
	_G.AutoObservationV1 = Value
	end    
})

IQ:AddToggle({
	Name = "Auto Observation V1 Hop",
	Default = false,
	Flag = "AutoObservationHop",
    Save = true,
	Callback = function(Value)
	_G.AutoObservationV1Hop = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoObservationV1 then
pcall(function()
if game:GetService("Players").LocalPlayer.VisionRadius.Value >= 3000 then
OrionLib:MakeNotification({
	Name = "Notifying",
	Content = "You have maxed out observation haki points",
	Image = "rbxassetid://4483345998",
	Time = 6
})
wait(2)
else
if Second_Sea then
if game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate") then
repeat task.wait()
if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
Tween(game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(3, 0, 0))
elseif not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and not _G.AutoObservationV1Hop then
Tween(game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
elseif not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and _G.AutoObservationV1Hop then
game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
end
until not _G.AutoObservationV1
else
Tween(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
end
elseif First_Sea then
if game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain") then
repeat task.wait()
if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
Tween(game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(3, 0, 0))
elseif not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and not _G.AutoObservationV1Hop then
Tween(game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
elseif not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and _G.AutoObservationV1Hop then
game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
end
until not _G.AutoObservationV1
else
Tween(CFrame.new(5533.29785, 88.1079102, 4852.3916))
end
elseif Third_Sea then
if game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander") then
repeat task.wait()
if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
Tween(game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander").HumanoidRootPart.CFrame * CFrame.new(3, 0, 0))
elseif not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and not _G.AutoObservationV1Hop then
Tween(game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
elseif not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and _G.AutoObservationV1Hop then
game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
end
until not _G.AutoObservationV1
else
Tween(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789))
end
end
end
end)
end
end
end)

spawn(function()
while wait() do
pcall(function()
if _G.AutoObservationV1 then
repeat task.wait()
if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
wait(5)
game:GetService("VirtualUser"):CaptureController()
game:GetService("VirtualUser"):SetKeyDown("0x65")
wait(2)
game:GetService("VirtualUser"):SetKeyUp("0x65")
end
until game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") or not _G.AutoObservationV1
end
end)
end
end)

if Second_Sea or Third_Sea then
IQ:AddToggle({
	Name = "Auto Buy Haki Colors",
	Default = false,
	Flag = "BuyColorHaki",
    Save = true,
	Callback = function(Value)
	_G.AutoBuyColorHaki = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoBuyColorHaki then
pcall(function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer","1")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer","2")
end)
end 
end
end)
end

if Third_Sea then
local SkibidiToilet = IQ:AddSection({
	Name = "Misc Boss Quest"
})

function CheckColorRipIndra()
    conchodonand = {}
    for r, v in next, game:GetService("Workspace").Map["Boat Castle"].Summoner.Circle:GetChildren() do
        if v:IsA("Part") and v:FindFirstChild("Part") and v.Part.BrickColor.Name == "Dark stone grey" then
            conchodonand[v.BrickColor.Name] = v
        end
    end
    return conchodonand
end
function ActivateColor(cw)
    concho = {["Hot pink"] = "Winter Sky", ["Really red"] = "Pure Red", ["Oyster"] = "Snow White"}
    conchogg = concho[cw]
    if conchogg then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", conchogg)
    end
end
function AutoActiveColorRip_Indra()
    for r, v in pairs(CheckColorRipIndra()) do
        ActivateColor(r)
        Tween(v.CFrame)
        firetouchinterest(v.TouchInterest)
    end
end

local EliteProgress = IQ:AddLabel("Elite Progress")

local EliteStatus = IQ:AddLabel("Elite Status")

spawn(function()
while wait() do
if Third_Sea then
pcall(function()
EliteProgress:Set("Elite Progress : "..game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress"))
if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
EliteStatus:Set("Elite Status : ✅")
else
EliteStatus:Set("Elite Status : ❌")
end
end)
end
end
end)

IQ:AddToggle({
	Name = "Auto Elite",
	Default = false,
	Flag = "AutoElite",
    Save = true,
	Callback = function(Value)
	_G.AutoEliteHunter = Value
	end    
})

IQ:AddToggle({
	Name = "Auto Elite Hop",
	Default = false,
	Flag = "AutoEliteHop",
    Save = true,
	Callback = function(Value)
	_G.AutoEliteHop = Value
	end    
})

spawn(function()
while task.wait() do
if _G.AutoEliteHunter then
pcall(function()
if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Diablo") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Deandre") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Urban") then
if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
if v.Name == "Diablo" or v.Name == "Deandre" or v.Name == "Urban" then
repeat task.wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoEliteHunter or v.Humanoid.Health <= 0 or not v.Parent
end
end
end
else
if game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame * MethodFarm)
elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame * MethodFarm)
elseif game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame * MethodFarm)
else
if _G.AutoEliteHop then
Hop()
end
end
end
else
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
end
else
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
end
end)
end
end
end)

IQ:AddToggle({
	Name = "Auto Collect Yama [Only Elite Progress 30]",
	Default = false,
	Flag = "CollectYama",
    Save = true,
	Callback = function(Value)
	_G.AutoCollectYama = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoCollectYama then
pcall(function()
if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress") >= 30 then
repeat wait(.1)
fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Yama") or not _G.AutoCollectYama
else
warn("You don't have enough elite missions yet")
end
end)
end
end
end)

IQ:AddToggle({
	Name = "Auto Open Haki Pad",
	Default = false,
	Flag = "AutoOpenHakiPad",
    Save = true,
	Callback = function(Value)
	_G.AutoOpenHakiPad = Value
	end    
})

spawn(function()
while task.wait(.1) do
if _G.AutoOpenHakiPad then
pcall(function()
for i, v in pairs(CheckColorRipIndra()) do
ActivateColor(r)
Tween(v.CFrame)
firetouchinterest(v.TouchInterest)
end
end)
end
end
end)

IQ:AddToggle({
	Name = "Auto Tushita",
	Default = false,
	Flag = "AutoTushita",
    Save = true,
	Callback = function(Value)
	_G.AutoTushita = Value
	end    
})

spawn(function()
while task.wait(.1) do
if _G.AutoTushita then
pcall(function()
autoTushita()
end)
end
end
end)
function enemyrip()
Tween(CFrame.new(-5332.30371, 423.985413, -2673.48218))
wait()
if game.Workspace.Enemies:FindFirstChild("rip_indra True Form") then
local mobs = game.Workspace.Enemies:GetChildren()
for i,v in pairs(mobs) do
if v.Name == "rip_indra True Form" and v:IsA("Model") and v:FindFirstChild("Humanoid") and
v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
return v
end
end
end
return game.ReplicatedStorage:FindFirstChild("rip_indra True Form")
end
function enemyEliteBoss()
if game.Workspace.Enemies:FindFirstChild("Deandre") or game.Workspace.Enemies:FindFirstChild("Urban") or game.Workspace.Enemies:FindFirstChild("Diablo") then
local mobs = game.Workspace.Enemies:GetChildren()
for i,v in pairs(mobs) do
if v.Name == "Deandre" or v.Name == "Diablo" or v.Name == "Urban"  and v:IsA("Model") and v:FindFirstChild("Humanoid") and
v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
return v
end
end
end
return game.ReplicatedStorage:FindFirstChild("Deandre") or game.ReplicatedStorage:FindFirstChild("Urban") or game.ReplicatedStorage:FindFirstChild("Diablo")
end
function enemylongma()
Tween(CFrame.new(-10171.7051, 406.981995, -9552.31738))
if game.Workspace.Enemies:FindFirstChild("Longma") then
local mobs = game.Workspace.Enemies:GetChildren()
for i,v in pairs(mobs) do
if v.Name == "Longma" and v:IsA("Model") and v:FindFirstChild("Humanoid") and
v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
return v
end
end
end
return game.ReplicatedStorage:FindFirstChild("Longma")
end
function autoTushita()
local CFrameTushita = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
if not game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") and not game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
if game.Workspace.Enemies:FindFirstChild("Deandre") or game.Workspace.Enemies:FindFirstChild("Urban") or game.Workspace.Enemies:FindFirstChild("Diablo") or game.ReplicatedStorage:FindFirstChild("Deandre") or game.ReplicatedStorage:FindFirstChild("Urban") or game.ReplicatedStorage:FindFirstChild("Diablo") then
if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
EquipTool(SelectWeapon)
local v = enemyEliteBoss()
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
end
else
Tween(CFrame.new(-12554.9443, 337.194092, -7501.44727))
end
elseif game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
AutoActiveColorRip_Indra()
wait(0.5)
EquipTool("God's Chalice")
wait(0.5)
repeat Tween(CFrame.new(-5560.27295, 313.915466, -2663.89795)) wait() until not _G.AutoTushita or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5560.27295, 313.915466, -2663.89795)).Magnitude <= 10
wait(0.5)
repeat Tween(CFrame.new(-5561.37451, 313.342529, -2663.4948)) wait() until not _G.AutoTushita or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
wait(1)
repeat Tween(CFrame.new(5154.17676, 141.786423, 911.046326)) wait() until not _G.AutoTushita or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
wait(0.2)
repeat Tween(CFrame.new(5148.03613, 162.352493, 910.548218)) wait() until not _G.AutoTushita or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
wait(1)
EquipTool("Holy Torch")
wait(1)
wait(0.4)
repeat Tween(CFrame.new(-10752.7695, 412.229523, -9366.36328)) wait() until not _G.AutoTushita or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
wait(0.4)
repeat Tween(CFrame.new(-11673.4111, 331.749023, -9474.34668)) wait() until not _G.AutoTushita or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
wait(0.4)
repeat Tween(CFrame.new(-12133.3389, 519.47522, -10653.1904)) wait() until not _G.AutoTushita or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
wait(0.4)
repeat Tween(CFrame.new(-13336.5, 485.280396, -6983.35254)) wait() until not _G.AutoTushita or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
wait(0.4)
repeat Tween(CFrame.new(-13487.4131, 334.84845, -7926.34863)) wait() until not _G.AutoTushita or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
wait(1)
elseif game.Workspace.Enemies:FindFirstChild("Longma") or game.ReplicatedStorage:FindFirstChild("Longma") then
EquipTool(SelectWeapon)
local v = enemylongma()
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
elseif game.Workspace.Enemies:FindFirstChild("rip_indra True Form")  or game.ReplicatedStorage:FindFirstChild("rip_indra True Form") then
EquipTool(SelectWeapon)
local v = enemyrip()
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
else
Tween(CFrame.new(-12554.9443, 337.194092, -7501.44727))
end
end

IQ:AddToggle({
	Name = "Auto Cursed Dual Katana",
	Default = false,
	Flag = "AutoCursedDualKatana",
    Save = true,
	Callback = function(Value)
	_G.AutoCDK = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoCDK then
pcall(function()
if GetWeaponInventory("Cursed Dual Katana") == true then
if game.Players.LocalPlayer.Character:FindFirstChild("Cursed Dual Katana") or game.Players.LocalPlayer.Backpack:FindFirstChild("Cursed Dual Katana") then
OrionLib:MakeNotification({
Name = "Notifying",
Content = "You have the cursed dual katanas!",
Image = "rbxassetid://4483345998",
Time = 4
})
else
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Cursed Dual Katana")
end
else
if game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") or game.Players.LocalPlayer.Character:FindFirstChild("Yama") or game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") then
if game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") then
--- Tushita Check Mastery
if game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") then
EquipTool("Tushita")
else
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v.Name == "Tushita" and v:IsA("Tool") then
if v.Level.Value >= 350 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Yama")
_G.AutoBone = false
TushitaMasCDKDone = true
else
SelectWeapon = "Tushita"
_G.AutoBone = true
TushitaMasCDKDone = false
end
end
end
end
elseif game.Players.LocalPlayer.Character:FindFirstChild("Yama") or game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") then
----- Yama Check Mastery
if game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") then
EquipTool("Yama")
else
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v.Name == "Yama" and v:IsA("Tool") then
if v.Level.Value >= 350 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Tushita")
_G.AutoBone = false
YamaMasCDKDone = true
else
SelectWeapon = "Yama"
_G.AutoBone = true
YamaMasCDKDone = false
end
end
end
end
end
elseif YamaMasCDKDone == true and TushitaMasCDKDone == true then
_G.AutoCDKQuest = true
elseif YamaMasCDKDone == false or TushitaMasCDKDone == false then
_G.AutoCDKQuest = false
Auto_Quest_Yama_1 = false
Auto_Quest_Yama_2 = false
Auto_Quest_Yama_3 = false
Auto_Quest_Tushita_1 = false
Auto_Quest_Tushita_2 = false
Auto_Quest_Tushita_3 = false
else
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Tushita")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Yama")
end
end
end)
else
if _G.AutoCDKQuest then
_G.AutoCDKQuest = false
Auto_Quest_Yama_1 = false
Auto_Quest_Yama_2 = false
Auto_Quest_Yama_3 = false
Auto_Quest_Tushita_1 = false
Auto_Quest_Tushita_2 = false
Auto_Quest_Tushita_3 = false
end
end
end
end)

spawn(function()
while wait() do
if _G.AutoCDKQuest then
pcall(function()
if CheckMaterial("Alucard Fragment") == 0 then
Auto_Quest_Yama_1 = true
Auto_Quest_Yama_2 = false
Auto_Quest_Yama_3 = false
Auto_Quest_Tushita_1 = false
Auto_Quest_Tushita_2 = false
Auto_Quest_Tushita_3 = false
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
elseif CheckMaterial("Alucard Fragment") == 1 then
Auto_Quest_Yama_1 = false
Auto_Quest_Yama_2 = true
Auto_Quest_Yama_3 = false
Auto_Quest_Tushita_1 = false
Auto_Quest_Tushita_2 = false
Auto_Quest_Tushita_3 = false
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
elseif CheckMaterial("Alucard Fragment") == 2 then
Auto_Quest_Yama_1 = false
Auto_Quest_Yama_2 = false
Auto_Quest_Yama_3 = true
Auto_Quest_Tushita_1 = false
Auto_Quest_Tushita_2 = false
Auto_Quest_Tushita_3 = false
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
elseif CheckMaterial("Alucard Fragment") == 3 then
Auto_Quest_Yama_1 = false
Auto_Quest_Yama_2 = false
Auto_Quest_Yama_3 = false
Auto_Quest_Tushita_1 = true
Auto_Quest_Tushita_2 = false
Auto_Quest_Tushita_3 = false
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
elseif CheckMaterial("Alucard Fragment") == 4 then
Auto_Quest_Yama_1 = false
Auto_Quest_Yama_2 = false
Auto_Quest_Yama_3 = false
Auto_Quest_Tushita_1 = false
Auto_Quest_Tushita_2 = true
Auto_Quest_Tushita_3 = false
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
elseif CheckMaterial("Alucard Fragment") == 5 then
Auto_Quest_Yama_1 = false
Auto_Quest_Yama_2 = false
Auto_Quest_Yama_3 = false
Auto_Quest_Tushita_1 = false
Auto_Quest_Tushita_2 = false
Auto_Quest_Tushita_3 = true
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
elseif CheckMaterial("Alucard Fragment") == 6 then
if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss") or game:GetService("Workspace").ReplicatedStorage:FindFirstChild("Cursed Skeleton Boss") then
Auto_Quest_Yama_1 = false
Auto_Quest_Yama_2 = false
Auto_Quest_Yama_3 = false
Auto_Quest_Tushita_1 = false
Auto_Quest_Tushita_2 = false
Auto_Quest_Tushita_3 = false
if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Cursed Skeleton Boss" or v.Name == "Cursed Skeleton" then
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
repeat wait()
sethiddenproperty(game:GetService('Players').LocalPlayer,"SimulationRadius",math.huge)
v.Humanoid.Health = 0
v.HumanoidRootPart.CanCollide = false
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
until v.Humanoid.Health <= 0 or not _G.AutoCDKQuest or not _G.AutoCDK or not v.Parent
end
end
end
end
else
if (CFrame.new(-12361.7060546875, 603.3547973632812, -6550.5341796875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
wait(1)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
wait(1)
Tween(CFrame.new(-12361.7060546875, 603.3547973632812, -6550.5341796875))
wait(1.5)
KeyPress("E")
wait(1.5)
Tween(CFrame.new(-12253.5419921875, 598.8999633789062, -6546.8388671875))
else
Tween(CFrame.new(-12361.7060546875, 603.3547973632812, -6550.5341796875))
end   
end
end
end)
end
end
end)

spawn(function()
while wait() do
if Auto_Quest_Yama_1 then
pcall(function()
if game:GetService("Workspace").Enemies:FindFirstChild("Mythological Pirate") or game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Mythological Pirate" or v.Name == "Forest Pirate" then
repeat wait()
Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,0,-2))
until not _G.AutoCDKQuest or not _G.AutoCDK or not Auto_Quest_Yama_1
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
end
end
else
Tween(CFrame.new(-13451.46484375, 543.712890625, -6961.0029296875))
end
end)
end
end
end)

spawn(function()
while wait() do
if Auto_Quest_Tushita_1 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",WS.NPCs:FindFirstChild("Luxury Boat Dealer"))
pcall(function()
Tween(CFrame.new(-9546.990234375, 21.139892578125, 4686.1142578125))
wait(5)
Tween(CFrame.new(-6120.0576171875, 16.455780029296875, -2250.697265625))
wait(5)
Tween(CFrame.new(-9533.2392578125, 7.254445552825928, -8372.69921875))
end)
end
end
end)

spawn(function()
while wait() do
if Auto_Quest_Tushita_2 then
pcall(function()
if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if Auto_Quest_Tushita_2 then
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
repeat wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until v.Humanoid.Health <= 0 or not v.Parent or not Auto_Quest_Tushita_2 or not _G.AutoCDKQuest or not _G.AutoCDK
end
end
end
else
Tween(CFrame.new(-5545.1240234375, 313.800537109375, -2976.616455078125))
end
end)
end
end
end)

spawn(function()
while wait() do
if Auto_Quest_Yama_2 then 
pcall(function() 
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("HazeESP") then
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
repeat wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
v.HazeESP.Size = UDim2.new(50,50,50,50)
v.HazeESP.MaxDistance = "inf"
until not _G.AutoCDK or not _G.AutoCDKQuest or not Auto_Quest_Yama_2 or not v.Parent or v.Humanoid.Health <= 0 or not v:FindFirstChild("HazeESP")
end
else
for x,y in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
if y:FindFirstChild("HazeESP") then
Tween(y.HumanoidRootPart.CFrame * MethodFarm)
end
end
end
end
end)
end
end
end)

spawn(function()
while wait() do
if Auto_Quest_Yama_3 then
pcall(function()
if game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game.Players.LocalPlayer.Character:FindFirstChild("Hallow Essence") then         
_G.AutoBone = false
Tween(game:GetService("Workspace").Map["Haunted Castle"].Summoner.Detection.CFrame)
elseif game:GetService("Workspace").Map:FindFirstChild("HellDimension") then
repeat wait()
if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Hell's Messenger") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Cursed Skeleton" or v.Name == "Cursed Skeleton" or v.Name == "Hell's Messenger" then
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
repeat wait()
sethiddenproperty(game:GetService('Players').LocalPlayer,"SimulationRadius",math.huge)
v.Humanoid.Health = 0
v.HumanoidRootPart.CanCollide = false
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
until v.Humanoid.Health <= 0 or not v.Parent or not Auto_Quest_Yama_3 or not _G.AutoCDKQuest or not _G.AutoCDK
end
end
end
else
wait(5)
Tween(game:GetService("Workspace").Map.HellDimension.Torch1.CFrame)
wait(1.5)
KeyPress("E")
wait(1.5)        
Tween(game:GetService("Workspace").Map.HellDimension.Torch2.CFrame)
wait(1.5)
KeyPress("E")
wait(1.5)     
Tween(game:GetService("Workspace").Map.HellDimension.Torch3.CFrame)
wait(1.5)
KeyPress("E")
wait(1.5)     
Tween(game:GetService("Workspace").Map.HellDimension.Exit.CFrame)
end
until not _G.AutoCDKQuest or not _G.AutoCDK or not Auto_Quest_Yama_3 or CheckMaterial("Alucard Fragment") == 3
else
if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") or game.ReplicatedStorage:FindFirstChild("Soul Reaper") then
if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Soul Reaper" then
if v.Humanoid.Health > 0 then
repeat wait()
Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,0,-2))
until not _G.AutoCDKQuest or not _G.AutoCDK or not Auto_Quest_Yama_3 or game:GetService("Workspace").Map:FindFirstChild("HellDimension")
end
end
end
else
Tween(CFrame.new(-9570.033203125, 315.9346923828125, 6726.89306640625))
end
else
_G.AutoBone = true
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
end
end
end)
end
end
end)

spawn(function()
while wait() do
if Auto_Quest_Tushita_3 then
pcall(function()
if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") or game.ReplicatedStorage:FindFirstChild("Cake Queen") then
if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Cake Queen" then
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
repeat wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoCDKQuest or not _G.AutoCDK or not Auto_Quest_Tushita_3 or game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension")
end
end
end
else
Tween(CFrame.new(-709.3132934570312, 381.6005859375, -11011.396484375))
end
elseif game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension") then
repeat wait()
if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Heaven's Guardian") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Cursed Skeleton" or v.Name == "Cursed Skeleton" or v.Name == "Heaven's Guardian" then
if v.Humanoid.Health > 0 then
repeat wait()
sethiddenproperty(game:GetService('Players').LocalPlayer,"SimulationRadius",math.huge)
v.Humanoid.Health = 0
v.HumanoidRootPart.CanCollide = false
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
until v.Humanoid.Health <= 0 or not v.Parent or not Auto_Quest_Tushita_3 or not _G.AutoCDKQuest or not _G.AutoCDK
end
end
end
else
wait(5)
Tween(game:GetService("Workspace").Map.HeavenlyDimension.Torch1.CFrame)
wait(1.5)
KeyPress("E")
wait(1.5)        
Tween(game:GetService("Workspace").Map.HeavenlyDimension.Torch2.CFrame)
wait(1.5)
KeyPress("E")
wait(1.5)     
Tween(game:GetService("Workspace").Map.HeavenlyDimension.Torch3.CFrame)
wait(1.5)
KeyPress("E")
wait(1.5)     
Tween(game:GetService("Workspace").Map.HeavenlyDimension.Exit.CFrame)
end
until not _G.AutoCDKQuest or not _G.AutoCDK or not Auto_Quest_Tushita_3 or CheckMaterial("Alucard Fragment") == 6
else
Hop()
end
end)
end
end
end)

IQ:AddToggle({
	Name = "Auto Rainbow Haki",
	Default = false,
	Flag = "AutoRainbowHaki",
    Save = true,
	Callback = function(Value)
	_G.AutoRainbowHaki = Value
	end    
})

task.spawn(function()
while task.wait() do
pcall(function()
if _G.AutoRainbowHaki then
if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
Tween(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
wait(1.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan","Bet")
end
elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Stone") then
if game:GetService("Workspace").Enemies:FindFirstChild("Stone") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Stone" then
repeat task.wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoRainbowHaki or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
end
end
else
Tween(CFrame.new(-1086.11621,38.8425903,6768.71436,0.0231462717,-0.592676699,0.805107772,2.03251839e-05,0.805323839,0.592835128,-0.999732077,-0.0137055516,0.0186523199))
end
elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Island Empress") then
if game:GetService("Workspace").Enemies:FindFirstChild("Island Empress") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Island Empress" then
repeat task.wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoRainbowHaki or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
end
end
else
Tween(CFrame.new(5713.98877,601.922974,202.751251,-0.101080291,-0,-0.994878292,-0,1,-0,0.994878292,0,-0.101080291))
end
elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Kilo Admiral") then
if game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Kilo Admiral" then
repeat task.wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoRainbowHaki or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
end
end
else
Tween(CFrame.new(2877.61743,423.558685,-7207.31006,-0.989591599,-0,-0.143904909,-0,1.00000012,-0,0.143904924,0,-0.989591479))
end
elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Captain Elephant") then
if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Captain Elephant" then
repeat task.wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoRainbowHaki or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
end
end
else
Tween(CFrame.new(-13485.0283,331.709259,-8012.4873,0.714521289,7.98849911e-08,0.69961375,-1.02065748e-07,1,-9.94383065e-09,-0.69961375,-6.43015241e-08,0.714521289))
end
elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Beautiful Pirate") then
if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Beautiful Pirate" then
repeat task.wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoRainbowHaki or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
end
end
else
Tween(CFrame.new(5312.3598632813, 20.141201019287, -10.158538818359))
end
else
Tween(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
wait(1.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan","Bet")
end
end
end
end)
end
end)

local SkibidiToilet = IQ:AddSection({
	Name = "Misc Boss Items"
})

IQ:AddToggle({
	Name = "Auto Raid Castle",
	Default = false,
	Flag = "AutoRaidCastle",
    Save = true,
	Callback = function(Value)
	_G.AutoRaidCastle = Value
	end    
})

spawn(function()
while wait(.1) do
if _G.AutoRaidCastle then
pcall(function()
local PosCastle = CFrame.new(-5496.17432, 313.768921, -2841.53027, 0.924894512, 7.37058015e-09, 0.380223751, 3.5881019e-08, 1, -1.06665446e-07, -0.380223751, 1.12297109e-07, 0.924894512)
if (PosCastle.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:FindFirstChild("HumanoidRootPart").Position).Magnitude < 2000 then
repeat task.wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoRaidCastle or not v.Parent or v.Humanoid.Health <= 0 or not game.Workspace.Enemies:FindFirstChild(v.Name)
end
end
end
else
Tween(PosCastle)
end
end)
end
end
end)

IQ:AddToggle({
	Name = "Auto Obversation V2",
	Default = false,
	Flag = "AutoObversationV2",
    Save = true,
	Callback = function(Value)
	_G.AutoObversationV2 = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoObversationV2 then
pcall(function()
local KenV2Pos = CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)
if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
Tween(KenV2Pos)
wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
wait(1)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","CitizenQuest",1)
elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Defeat 50 Forest Pirates") then
if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Forest Pirate" then
repeat task.wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoObversationV2 or v.Humanoid.Health <= 0 or not v.Parent
end
end
else
Tween(CFrame.new(-13277.568359375, 370.34185791016, -7821.1572265625)) 
end
elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Defeat Captain Elephant (0/1)") then 
if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Captain Elephant" then
repeat wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoObversationV2 or v.Humanoid.Health <= 0 or not v.Parent
end
end
else
Tween(CFrame.new(-13493.12890625, 318.89553833008, -8373.7919921875)) 
end
end
end
if game.Players.LocalPlayer.Backpack:FindFirstChild("Banana") and game.Players.LocalPlayer.Backpack:FindFirstChild("Apple") and game.Players.LocalPlayer.Backpack:FindFirstChild("Pineapple") then
repeat wait()
Tween(CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)) 
until not _G.AutoObversationV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)).Magnitude <= 10
wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") or game.Players.LocalPlayer.Character:FindFirstChild("Fruit Bowl") then
repeat wait()
Tween(CFrame.new(-10920.125, 624.20275878906, -10266.995117188)) 
until not _G.AutoObversationV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-10920.125, 624.20275878906, -10266.995117188)).Magnitude <= 10
wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2","Start")
wait(1)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2","Buy")
else
for i,v in pairs(game.Workspace:GetDescendants()) do
if v.Name == "Apple" or v.Name == "Banana" or v.Name == "Pineapple" then
Tween(v.Handle.CFrame)
end
end
end
end)
end
end
end)

IQ:AddToggle({
	Name = "Auto Musketeer Hat",
	Default = false,
	Flag = "AutoMusketeerHat",
    Save = true,
	Callback = function(Value)
	_G.AutoMusketeerHat = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoMusketeerHat then
pcall(function()
local MusketeerPos = CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)
if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
Tween(MusketeerPos)
wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
wait(1)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","CitizenQuest",1)
elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Defeat 50 Forest Pirates") then
if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Forest Pirate" then
repeat wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoMusketeerHat or v.Humanoid.Health <= 0 or not v.Parent
end
end
else
Tween(CFrame.new(-13277.568359375, 370.34185791016, -7821.1572265625)) 
end
elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Defeat Captain Elephant (0/1)") then 
if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Captain Elephant" then
repeat wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoMusketeerHat or v.Humanoid.Health <= 0 or not v.Parent
end
end
else
Tween(CFrame.new(-13493.12890625, 318.89553833008, -8373.7919921875)) 
end
end
end
if game:GetService("Workspace").Map.Turtle.IslandModel:FindFirstChild("PluginGrass") then
Tween(game:GetService("Workspace").Map.Turtle.IslandModel.PluginGrass)
end
end)
end
end
end)

IQ:AddToggle({
	Name = "Auto Dummy",
	Default = false,
	Flag = "AutoDummy",
    Save = true,
	Callback = function(Value)
	_G.AutoDummy = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoDummy then
pcall(function()
if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Training Dummy") then
if game:GetService("Workspace").Enemies:FindFirstChild("Training Dummy") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Training Dummy" then
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
repeat wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoDummy or v.Humanoid.Health <= 0 or not v.Parent
end
end
end
else
if game:GetService("ReplicatedStorage"):FindFirstChild("Training Dummy") then
Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Training Dummy").HumanoidRootPart.CFrame * MethodFarm)
end
end
end
else
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ArenaTrainer")
end
end)
end
end
end)

IQ:AddToggle({
	Name = "Auto Rip Indra",
	Default = false,
	Flag = "AutoRipIndra",
    Save = true,
	Callback = function(Value)
	_G.AutoRipIndra = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoRipIndra then
pcall(function()
local AdminPos = CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781)
if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form") or game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == ("rip_indra True Form" or v.Name == "rip_indra") and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
repeat task.wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not _G.AutoRipIndra or not v.Parent or v.Humanoid.Health <= 0
end
end
else
Tween(AdminPos)
end
end)
end
end
end)

IQ:AddToggle({
	Name = "Auto Soul Guitar",
	Default = false,
	Flag = "AutoSoulGuitar",
    Save = true,
	Callback = function(Value)
	_G.AutoSoulGuitarVipPro = Value
	end    
})

IQ:AddToggle({
	Name = "Auto Soul Guitar [Hop]",
	Default = false,
	Flag = "AutoSoulGuitarHop",
    Save = true,
	Callback = function(Value)
	_G.AutoSoulGuitarHop = Value
	end    
})

spawn(function()
while task.wait() do
pcall(function()
if _G.AutoSoulGuitarVipPro then
if GetWeaponInventory("Soul Guitar") == false then
if (CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
if game:GetService("Workspace").NPCs:FindFirstChild("Skeleton Machine") then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy",true)
OrionLib:MakeNotification({
	Name = "Notifying",
	Content = "You have obtained the soul guitar!",
	Image = "rbxassetid://4483345998",
	Time = 5
})
elseif (game:GetService("Workspace").Map["Haunted Castle"].Candle1.Transparency == 0) then
if (game:GetService("Workspace").Map["Haunted Castle"].Placard1.Left.Part.Transparency == 0) then
Quest2 = true
repeat task.wait()
Tween(CFrame.new(-8762.69140625, 176.84783935546875, 6171.3076171875))
until ((CFrame.new(-8762.69140625, 176.84783935546875, 6171.3076171875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) or not _G.AutoSoulGuitarVipPro
wait(1)
fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard7.Left.ClickDetector)
wait(1)
fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard6.Left.ClickDetector)
wait(1)
fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard5.Left.ClickDetector)
wait(1)
fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard4.Right.ClickDetector)
wait(1)
fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard3.Left.ClickDetector)
wait(1)
fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard2.Right.ClickDetector)
wait(1)
fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard1.Right.ClickDetector)
wait(1)
elseif game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment1:FindFirstChild("ClickDetector") then
if game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part1:FindFirstChild("ClickDetector") then
Quest4 = true
repeat task.wait()
Tween(CFrame.new(-9553.5986328125,65.62338256835938,6041.58837890625))
until ((CFrame.new(-9553.5986328125,65.62338256835938,6041.58837890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) or not _G.AutoSoulGuitarVipPro
wait(1)
Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame)
wait(1)
fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector)
wait(1)
Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame)
wait(1)
fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
wait(1)
fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
wait(1)
fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
wait(1)
Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame)
wait(1)
fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
wait(1)
fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
wait(1)
Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame)
wait(1)
fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector)
wait(1)
Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame)
wait(1)
fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
wait(1)
fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
wait(1)
fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
else
Quest3 = true
--Not Work Yet
end
else
if game:GetService("Workspace").NPCs:FindFirstChild("Ghost") then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Ghost")
end
if game.Workspace.Enemies:FindFirstChild("Living Zombie") then
for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
if v.Name == "Living Zombie" then
EquipWeapon(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
end
end
end
else
Tween(CFrame.new(-10160.787109375,138.6616973876953,5955.03076171875))
end
end
elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2),"Error") then
require(game.ReplicatedStorage.Notification).new("<Color=Yellow>Go to Grave<Color=/>"):Display()
Tween(CFrame.new(-8653.2060546875, 140.98487854003906, 6160.033203125))
elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2),"Nothing") then
require(game.ReplicatedStorage.Notification).new("<Color=Yellow>Wait Next Night<Color=/>"):Display()
if _G.AutoSoulGuitarHop and game:GetService("Lighting").Sky.MoonTextureId ~= moon5 then
Hop()
OrionLib:MakeNotification({
	Name = "Notifying",
	Content = "Hop Server...",
	Image = "rbxassetid://4483345998",
	Time = 5
})
require(game.ReplicatedStorage.Notification).new("<Color=White>Hop Server...<Color=/>"):Display()
end
else
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2,true)
end
else
Tween(CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125))
end
end
end
end)
end
end)
end





















----------------------------------------------------------------------------
-- sea event tab
local MyShip = nil
spawn(function()
while wait() do
pcall(function()
for i,v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
if v:FindFirstChild("Owner") and v.Owner.Value == plr.Name then
MyShip = game:GetService("Workspace").Boats:FindFirstChild(v.Name)
elseif v:FindFirstChild("VehicleSeat") and v:FindFirstChild("Owner") and v.Owner.Value ~= plr.Name then
if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.VehicleSeat.Position).Magnitude <= 2.5 then
MyShip = game:GetService("Workspace").Boats:FindFirstChild(v.Name)
end
end
end
end)
end
end)

spawn(function()
while task.wait() do
pcall(function()
if _G.AutoSeaEvent or _G.AutoFindLeviathan or _G.AutoBackTiki then
if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
if not MyShip:FindFirstChild("AnchoredTweenShip") then
local Noclip = Instance.new("BodyVelocity")
Noclip.Name = "AnchoredTweenShip"
Noclip.Parent = MyShip
Noclip.MaxForce = Vector3.new(100000,100000,100000)
Noclip.Velocity = Vector3.new(0,0,0)
end
else
MyShip:FindFirstChild("AnchoredTweenShip"):Destroy()
end
else
MyShip:FindFirstChild("AnchoredTweenShip"):Destroy()
end
end)
end
end)

spawn(function()
pcall(function()
game:GetService("RunService").Stepped:Connect(function()
if MyShip then
for i,v in pairs(MyShip:GetDescendants()) do
if _G.AutoSeaEvent or _G.AutoFindLeviathan or _G.AutoBackTiki then
if v:IsA("BasePart") and v.CanCollide == true then
v.CanCollide = false
end
else
if v:IsA("BasePart") and v.CanCollide == false then
v.CanCollide = true
end
end
end
end
end)
end)
end)

local SESec = SE:AddSection({
	Name = "Misc Select"
})

local ChoMuaThuyen = CFrame.new(-16921.853515625, 9.0863618850708, 433.9601135253906)
local KitsuneFinderPoint = CFrame.new(-38106.8984375, 600.8792114257812, 12708.7470703125)
local EndPointHeartLeviathanBoatDrive = CFrame.new(-16163.18359375, 18.75250816345215, 437.4910888671875)

NameShipEnemyCheck = {"PirateBrigade", "PirateGrandBrigade", "FishBoat"}
NameFishCheck = {"Shark", "Piranha", "Fish Crew Member", "Haunted Crew Member"}
NameAllFishCheck = {"Terrorshark", "Shark", "Piranha", "Fish Crew Member", "Haunted Crew Member"}
RockPart = {"SmallGroup", "SmallCluster", "MediumGroup", "MediumFlat", "Large", "Largest"}

function NoclipRock()
for _, v in pairs(WS:GetChildren()) do
if table.find(RockPart, v.Name) and v:IsA("Model") then
for _, part in pairs(v:GetDescendants()) do
if part:IsA("BasePart") then
part.CanCollide = false
end
end
end
end
end

local TargetCFrameFix = nil
local BoatList = {
"PirateSloop",
"PirateBasic",
"PirateBrigade",
"PirateGrandBrigade",
"MarineSloop",
"MarineBasic",
"MarineBrigade",
"MarineGrandBrigade",
"Miracle",
"The Sentinel",
"Guardian",
"Lantern",
"Sleigh",
"Beast Hunter"
}

SE:AddDropdown({
	Name = "Select Zone",
	Default = "Zone 6",
	Options = {"Zone 2", "Zone 3", "Zone 4", "Zone 5", "Zone 6","Inf"},
	Flag = "SelectZone",
    Save = true,
	Callback = function(Value)
_G.ZoneSelect = Value

if _G.ZoneSelect == "Zone 2" then
ZoneMagamingSayBuDa = CFrame.new(-26168.79296875, 31, 5621.3037109375)
elseif _G.ZoneSelect == "Zone 3" then
ZoneMagamingSayBuDa = CFrame.new(-29108.18359375, 31, 7068.3818359375)
elseif _G.ZoneSelect == "Zone 4" then
ZoneMagamingSayBuDa = CFrame.new(-33175.96875, 31, 8923.8369140625)
elseif _G.ZoneSelect == "Zone 5" then
ZoneMagamingSayBuDa = CFrame.new(-36859.6875, 31, 10932.3056640625)
elseif _G.ZoneSelect == "Zone 6" then
ZoneMagamingSayBuDa = CFrame.new(-40915.5546875, 31, 13193.6455078125)
elseif _G.ZoneSelect == "Inf" then
ZoneMagamingSayBuDa = CFrame.new(-99999, 31, 99999)
end
	end    
})

SE:AddDropdown({
	Name = "Select Boat To Buy",
	Default = "PirateBrigade",
	Options = BoatList,
	Flag = "ChosenBoatBuyToSail",
    Save = true,
	Callback = function(Value)
	_G.SelectBoatSeaEvent = Value
	end    
})

SE:AddToggle({
	Name = "Auto Farm Sea Event [Bug]",
	Default = false,
	Flag = "AutoFarmSeaEvent",
    Save = true,
	Callback = function(Value)
	_G.AutoSeaEvent = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoSeaEvent then
pcall(function()
local CheckRoughSea = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Rough Sea")

--- Check Entity ----
function CheckEntityFishSpawn()
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if table.find(NameAllFishCheck, v.Name) or table.find(NameShipEnemyCheck, v.Name) then
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.CFrame.Position).Magnitude <= 500 then
return true
else
return false
end
else
return false
end
end
return false
end

function CheckEntitySBSpawn()
for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
if v.Name == "SeaBeast1" then
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Health") and v.Health.Value > 0 then
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.CFrame.Position).Magnitude <= 500 then
return true
else
return false
end
end
else
return false
end
end
return false
end

function SafeBoat()
if _G.SafeBoatModeSeaEvent then
if CheckEntityFishSpawn() or CheckEntitySBSpawn() then
TweenBoat(TargetCFrameFix * CFrame.new(0,75,100))
else
if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
TweenBoat(ZoneMagamingSayBuDa)
end
end
else
if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
TweenBoat(ZoneMagamingSayBuDa)
end
end
end

function DodgeRoughSea()
if _G.AutoDodgeRoughSea then
if CheckRoughSea then
if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
TweenBoat(ChoMuaThuyen)
end
else
if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
TweenBoat(ZoneMagamingSayBuDa)
end
end
else
if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
TweenBoat(ZoneMagamingSayBuDa)
end
end
end

---- Check Boat ----
if not MyShip then
Tween(ChoMuaThuyen)
--- Buy Boat ----
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - ChoMuaThuyen.Position).Magnitude <= 10 then
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("BuyBoat",_G.SelectBoatSeaEvent)
wait(0.15)
HMRP.CFrame = MyShip.VehicleSeat.CFrame * CFrame.new(0,1,0)
end
elseif MyShip then
--- Noclip Rock (Useless) ----
NoclipRock()

---- RoiNaoQuaA -----
if CheckEntityFishSpawn() or CheckEntitySBSpawn() then
SafeBoat()
if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
game.Players.LocalPlayer.Character.Humanoid.Sit = false
game.Players.LocalPlayer.Character.Humanoid.Sit = false
game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
end
elseif CheckRoughSea then
DodgeRoughSea()
else
if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
Tween(MyShip.VehicleSeat.CFrame * CFrame.new(0,1,0))
end
end

---- End If Check Boat -----
end
end)
end
end
end)

SE:AddButton({
	Name = "Buy New Boat",
	Callback = function()
TweenButton(ChoMuaThuyen)
wait(0.25)
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("BuyBoat",_G.SelectBoatSeaEvent)
  	end    
})

local SESec = SE:AddSection({
	Name = "Misc Main Features"
})

SE:AddLabel("Setting Kill Mob")

SE:AddToggle({
	Name = "Auto Kill Fish",
	Default = false,
	Flag = "AutoKillSmallFish",
    Save = true,
	Callback = function(Value)
	_G.AutoKillFish = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoKillFish then
pcall(function()
for r, v in next, game:GetService("Workspace").Enemies:GetChildren() do
if table.find(NameFishCheck, v.Name) then
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
repeat task.wait()
EquipTool(SelectWeapon)
if _G.SafeModeHealthSeaEvent then
if HM.Health >= 1000 then
Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,150,0))
else
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
end
else
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
end
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
TargetCFrameFix = v.HumanoidRootPart.CFrame
until not _G.AutoKillFish or not v.Parent or v.Humanoid.Health <= 0
end
end
end
end)
end
end
end)

SE:AddToggle({
	Name = "Auto Kill Terrorshark",
	Default = false,
	Flag = "AutoKillTerrorshark",
    Save = true,
	Callback = function(Value)
	_G.AutoKillTerrorshark = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoKillTerrorshark then
pcall(function()
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Terrorshark" then
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
repeat task.wait()
EquipTool(SelectWeapon)
if _G.SafeModeHealthSeaEvent then
if HM.Health > 2000 then
Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,235,0))
else
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
end
else
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
end
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
TargetCFrameFix = v.HumanoidRootPart.CFrame
until not _G.AutoKillTerrorshark or not v.Parent or v.Humanoid.Health <= 0
end
end
end
end)
end
end
end)

SE:AddToggle({
	Name = "Auto Kill Boat",
	Default = false,
	Flag = "AutoKillShip",
    Save = true,
	Callback = function(Value)
	_G.AutoKillShip = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoKillShip then
pcall(function()
for r, v in next, game:GetService("Workspace").Enemies:GetChildren() do
if table.find(NameShipEnemyCheck, v.Name) then
if v:FindFirstChild("Engine") and v.Health.Value > 0 then
repeat task.wait()
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Engine.CFrame.Position).Magnitude <= 300 then
EquipToolCheck("Melee")
wait(1)
EquipToolCheck("Blox Fruit")
wait(1)
EquipToolCheck("Sword")
end
TargetCFrameFix = v.Engine.CFrame
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Engine.CFrame.Position).Magnitude <= 30 then
KeyPress("Z")
task.wait(0.05)
KeyPress("X")
task.wait(0.05)
KeyPress("C")
task.wait(0.05)
KeyPress("V")
task.wait(0.05)
KeyPress("F")
end
if _G.SafeModeHealthSeaEvent then
if HM.Health > 1500 then
Tween(v.Engine.CFrame * CFrame.new(0,170,0))
else
Tween(v.Engine.CFrame * CFrame.new(0,30,0))
end
else
Tween(v.Engine.CFrame * CFrame.new(0,30,0))
end
until not _G.AutoKillShip or not v.Parent or v.Health.Value <= 0
end
end
end
end)
end
end
end)

SE:AddToggle({
	Name = "Auto Kill Sea Beast",
	Default = false,
	Flag = "AutoKillSeaBeast",
    Save = true,
	Callback = function(Value)
	_G.AutoKillSB = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoKillSB then
pcall(function()
for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
if v.Name == "SeaBeast1" then
if v:FindFirstChild("HumanoidRootPart") and v.Health.Value > 0 then
repeat task.wait()
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.CFrame.Position).Magnitude <= 300 then
EquipToolCheck("Melee")
wait(1)
EquipToolCheck("Blox Fruit")
wait(1)
EquipToolCheck("Sword")
wait(1)
EquipTool(CurrentEquipGun)
end
TargetCFrameFix = v.HumanoidRootPart.CFrame
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.CFrame.Position).Magnitude <= 60 then
KeyPress("Z")
task.wait(0.05)
KeyPress("X")
task.wait(0.05)
KeyPress("C")
task.wait(0.05)
KeyPress("V")
task.wait(0.05)
KeyPress("F")
end
if _G.SafeModeHealthSeaEvent then
if HM.Health >= 2500 then
Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,300,0))
else
Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,60,0))
end
else
Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,60,0))
end
until not _G.AutoKillSB or not v.Parent or v.Health.Value <= 0
end
end
end
end)
end
end
end)

SE:AddLabel("Setting Sail Boat")

SE:AddToggle({
	Name = "Auto Dodge Rough Sea",
	Default = false,
	Flag = "DodgeRoughSea",
    Save = true,
	Callback = function(Value)
	_G.AutoDodgeRoughSea = Value
	end    
})

SE:AddToggle({
	Name = "Safe Boat",
	Default = false,
	Flag = "SafeBoatMode",
    Save = true,
	Callback = function(Value)
	_G.SafeBoatModeSeaEvent = Value
	end    
})

SE:AddToggle({
	Name = "Safe Mode",
	Default = false,
	Flag = "SafeModeWhenLowHealth",
    Save = true,
	Callback = function(Value)
	_G.SafeModeHealthSeaEvent = Value
	end    
})

local SESec = SE:AddSection({
	Name = "Misc Extra Features"
})

SE:AddSlider({
	Name = "Tween Boat Speed",
	Min = 150,
	Max = 300,
	Default = 250,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "M",
	Flag = "TweenSpeedBoatSlider",
    Save = true,
	Callback = function(Value)
	_G.TweenSpeedBoat = Value
	end    
})

SE:AddSlider({
	Name = "Boat Speed",
	Min = 150,
	Max = 500,
	Default = 200,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "M",
	Flag = "SpeedBoatNumber",
    Save = true,
	Callback = function(Value)
	_G.SpeedBoatNumber = Value
	end    
})

SE:AddToggle({
	Name = "Change Boat Speed",
	Default = false,
	Flag = "ChangeSpeedBoat",
    Save = true,
	Callback = function(Value)
	_G.ChangeSpeedBoat = Value
	end    
})

spawn(function()
while wait() do
if _G.ChangeSpeedBoat then
pcall(function()
MyShip:FindFirstChild("VehicleSeat").MaxSpeed = _G.SpeedBoatNumber
end)
end
end
end)

SE:AddButton({
	Name = "Teleport Boat To MySelf",
	Callback = function()
MyShip.VehicleSeat.CFrame = HMRP.CFrame
  	end    
})

local SESec = SE:AddSection({
	Name = "Misc Leviathan"
})

SE:AddButton({
	Name = "Teleport Boat To Frozen Dimension (If Spawn)",
	Callback = function()
TweenBoat(game.Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension"))
  	end    
})

SE:AddToggle({
	Name = "Auto Find Leviathan (Beta)",
	Default = false,
	Flag = "AutoFindLeviathan",
    Save = true,
	Callback = function(Value)
	_G.AutoFindLeviathan = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoFindLeviathan then
pcall(function()
if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
repeat wait()
TweenBoat(CFrame.new(-99999, 100, 99999))
until not _G.AutoFindLeviathan or game.Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension") or game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false
TweenBoat(MyShip.VehicleSeat.CFrame)
end
end)
end
end
end)

SE:AddToggle({
	Name = "Auto Back Tiki",
	Default = false,
	Flag = "AutoBackTiki",
    Save = true,
	Callback = function(Value)
	_G.AutoBackTiki = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoBackTiki then
pcall(function()
if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
repeat wait()
NoclipRock()
TweenBoat(EndPointHeartLeviathanBoatDrive)
until not _G.AutoBackTiki or game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false
TweenBoat(MyShip.VehicleSeat.CFrame)
end
end)
end
end
end)

SE:AddToggle({
	Name = "Auto Leviathan (Beta)",
	Default = false,
	Flag = "AutoLeviathan",
    Save = true,
	Callback = function(Value)
	_G.AutoLeviathan = Value
	end    
})

SE:AddToggle({
	Name = "Multi Segment Attack",
	Default = false,
	Flag = "AutoLeviathanSegment",
    Save = true,
	Callback = function(Value)
	_G.MultiSegmentAttack = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoLeviathan then
pcall(function()
for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
if _G.MultiSegmentAttack then
if game:GetService("Workspace").SeaBeasts:FindFirstChild("Leviathan Segment") then
if v.Name == "Leviathan Segment" then
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
repeat task.wait()
Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,60,0))
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 60 then
EquipToolCheck("Melee")
wait(1)
EquipToolCheck("Blox Fruit")
wait(1)
EquipToolCheck("Sword")
wait(1)
EquipTool(CurrentEquipGun)
end
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 60 then
KeyPress("Z")
task.wait(0.05)
KeyPress("X")
task.wait(0.05)
KeyPress("C")
task.wait(0.05)
KeyPress("V")
task.wait(0.05)
KeyPress("F")
end
until not _G.MultiSegmentAttack or not v.Parent or v.Humanoid.Health <= 0
end
end
elseif game:GetService("Workspace").SeaBeasts:FindFirstChild("Leviathan") or game:GetService("Workspace").SeaBeasts:FindFirstChild("Leviathan Tail") then
if not game:GetService("Workspace").SeaBeasts:FindFirstChild("Leviathan Segment") then
if v.Name == "Leviathan" or v.Name == "Leviathan Tail" then
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
repeat task.wait()
Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,60,0))
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 60 then
EquipToolCheck("Melee")
wait(1)
EquipToolCheck("Blox Fruit")
wait(1)
EquipToolCheck("Sword")
wait(1)
EquipTool(CurrentEquipGun)
end
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 60 then
KeyPress("Z")
task.wait(0.05)
KeyPress("X")
task.wait(0.05)
KeyPress("C")
task.wait(0.05)
KeyPress("V")
task.wait(0.05)
KeyPress("F")
end
until not _G.MultiSegmentAttack or not v.Parent or v.Humanoid.Health <= 0
end
end
end
end
else
if v.Name == "Leviathan" or v.Name == "Leviathan Tail" then
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
repeat task.wait()
Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,60,0))
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 60 then
EquipToolCheck("Melee")
wait(1)
EquipToolCheck("Blox Fruit")
wait(1)
EquipToolCheck("Sword")
wait(1)
EquipTool(CurrentEquipGun)
end
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 60 then
KeyPress("Z")
task.wait(0.05)
KeyPress("X")
task.wait(0.05)
KeyPress("C")
task.wait(0.05)
KeyPress("V")
task.wait(0.05)
KeyPress("F")
end
until not _G.AutoLeviathan or not v.Parent or v.Humanoid.Health <= 0
end
end
end
end
end)
end
end
end)

local SESec = SE:AddSection({
	Name = "Misc Kitsune Island"
})

SE:AddToggle({
	Name = "Esp Kitsune Island",
	Default = false,
	Flag = "EspKitsune",
    Save = true,
	Callback = function(Value)
_G.EspKitsuneIsland = Value
while _G.EspKitsuneIsland do wait()
UpdateIslandKitsuneESP()
end
	end    
})

SE:AddToggle({
	Name = "Tween To Kitsune Island",
	Default = false,
	Flag = "TweenKitsuneIsland",
    Save = true,
	Callback = function(Value)
	_G.TweenToKitsuneIsland = Value
	end    
})

spawn(function()
while wait() do
if _G.TweenToKitsuneIsland then
pcall(function()
if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland"):FindFirstChild("ShrineActive") or game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland"):FindFirstChild("ShrineInActive") then
for _, v in pairs(game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland"):FindFirstChild("ShrineActive"):GetDescendants()) do
if v:IsA("BasePart") and v.Name:find("NeonShrinePart") then
Tween(v.CFrame)
end
end
end
end)
end
end
end)

SE:AddToggle({
	Name = "Auto Collect Azure Wisp",
	Default = false,
	Flag = "AutoCollectAzure",
    Save = true,
	Callback = function(Value)
    _G.AutoCollectAzure = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoCollectAzure then
pcall(function()
for _, v in pairs(WS.EmberTemplate:GetDescendants()) do
if v.Name == "Part" then
repeat wait()
Tween(v.CFrame)
until not _G.AutoCollectAzure or not v.Parent
end
end
end)
end
end
end)

SE:AddSlider({
	Name = "Min Azure Wisp Trade",
	Min = 5,
	Max = 25,
	Default = 15,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Azure",
	Flag = "MinAzureWispTrade",
    Save = true,
	Callback = function(Value)
	_G.MinAzureWispTrade = Value
	end    
})

SE:AddToggle({
	Name = "Auto Trade Azure Wisp",
	Default = false,
	Callback = function(Value)
    _G.AutoTradeAzure = Value
	end    
})

spawn(function()
while wait(0.0000000000000000000000000000000000000000000000000001) do
if _G.AutoTradeAzure then
pcall(function()
if CheckMaterial("Azure Ember") == _G.MinAzureWispTrade then
game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/KitsuneStatuePray"):InvokeServer()
end
end)
end
end
end)






























----------------------------------------------------------------------------
-- stat tab
S:AddToggle({
    Name = "Auto Stats Melee",
    Default = false,
    Flag = "AutoStatsMelee",
    Save = true,
    Callback = function(Value)
    melee = Value
    end    
})

S:AddToggle({
    Name = "Auto Stats Defense",
    Default = false,
    Flag = "AutoStatsDefense",
    Save = true,
    Callback = function(Value)
    defense = Value
    end    
})

S:AddToggle({
    Name = "Auto Stats Sword",
    Default = false,
    Flag = "AutoStatsSword",
    Save = true,
    Callback = function(Value)
    sword = Value
    end    
})

S:AddToggle({
    Name = "Auto Stats Gun",
    Default = false,
    Flag = "AutoStatsGun",
    Save = true,
    Callback = function(Value)
    gun = Value
    end    
})

S:AddToggle({
    Name = "Auto Stats Fruit",
    Default = false,
    Flag = "AutoStatsFruit",
    Save = true,
    Callback = function(Value)
    demonfruit = Value
    end    
})

PointStats = 1
S:AddSlider({
    Name = "Add Point",
    Min = 1,
    Max = 2550,
    Default = 1,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "Point",
    Flag = "AutoAddPoint",
    Save = true,
    Callback = function(Value)
    PointStats = Value
    end    
})

spawn(function()
while wait() do
if game.Players.localPlayer.Data.Points.Value >= PointStats then
if melee then
local args = {
    [1] = "AddPoint",
    [2] = "Melee",
    [3] = PointStats
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end 
if defense then
local args = {
    [1] = "AddPoint",
    [2] = "Defense",
    [3] = PointStats
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end 
if sword then
local args = {
    [1] = "AddPoint",
    [2] = "Sword",
    [3] = PointStats
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end 
if gun then
local args = {
    [1] = "AddPoint",
    [2] = "Gun",
    [3] = PointStats
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end 
if demonfruit then
local args = {
    [1] = "AddPoint",
    [2] = "Demon Fruit",
    [3] = PointStats
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
end
end
end)














----------------------------------------------------------------------------
-- status tab
local nammoadidaphat = STA:AddSection({
	Name = "Misc Check Server"
})

local Chest = STA:AddLabel("Chest")

local Fruit = STA:AddLabel("Fruit")

spawn(function()
while wait() do
local count10 = 0
local count = 0
for i,v in pairs(game.workspace:GetChildren()) do
if string.find(v.Name,"Chest") and v:IsA("Part") then
count10 = count10 + 1
end
end
for i,v in pairs(game.Workspace:GetChildren()) do
if v.Name == "Blox Fruit Dealer" then
else
if string.find(v.Name, "Fruit") and v:IsA("Tool") then
count = count + 1
end
if string.find(v.Name, "Fruit") and v:IsA("Model") then
count = count + 1
end
end
end
Fruit:Set("Fruit : "..count)
Chest:Set("Chest : "..count10)
wait(5)
end
end)


local DimensionKill = STA:AddLabel("Defeat")

spawn(function()
while wait() do
pcall(function()
if Third_Sea then
if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
DimensionKill:Set("Defeat : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41).."/500")
elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
DimensionKill:Set("Defeat : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,40).."/500")
elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
DimensionKill:Set("Defeat : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,39).."/500")
else
if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
DimensionKill:Set("Defeat : Cake Prince Has Spawn")
elseif game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
DimensionKill:Set("Defeat : Dough King Has Spawn")
end
end
end
end)
end
end)

local CheckRaceV4 = STA:AddLabel("Ancient One Status")
local CheckBribeStatus = STA:AddLabel("Bribe Status")
local CheckMirageIsland = STA:AddLabel("Mirage Island")
local CheckKitsuneIsland = STA:AddLabel("Kitsune Island")
local CheckFullMoon = STA:AddLabel("Moon:")

spawn(function()
pcall(function()
while wait() do
CheckFullMoon:Set("Moon: "..CheckMonStatus())
if Third_Sea then
CheckRaceV4:Set("Ancient One Status: "..CheckAcientOneStatus())
if game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("InfoLeviathan","1") == -1 then
CheckBribeStatus:Set("Bribe Status: I Don't Know")
else
CheckBribeStatus:Set("Bribe Status: "..game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("InfoLeviathan","1"))
end
if game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") or game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
CheckMirageIsland:Set("Mirage Island : ✅")
else
CheckMirageIsland:Set("Mirage Island : ❌")
end
if game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") or game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
CheckKitsuneIsland:Set("Kitsune Island : ✅")
else
CheckKitsuneIsland:Set("Kitsune Island : ❌")
end
end
end
end)
end)

local nammoadidaphat = STA:AddSection({
	Name = "Misc Server"
})

STA:AddTextbox({
	Name = "Enter Job Id",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
	_G.JobId = Value
	end	  
})

STA:AddButton({
	Name = "Join Job Id",
	Callback = function()
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,_G.JobId, game.Players.LocalPlayer)
  	end    
})

STA:AddToggle({
	Name = "Auto Join Job Id",
	Default = false,
	Flag = "AutoJoinJobId",
    Save = true,
	Callback = function(Value)
	_G.AutoJoinJobId = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoJoinJobId then
pcall(function()
if _G.JobId ~= nil then
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,_G.JobId, game.Players.LocalPlayer)
end
end)
end
end
end)

STA:AddButton({
	Name = "Copy Job Id",
	Callback = function()
    setclipboard(tostring(game.JobId))
  	end    
})

STA:AddToggle({
	Name = "Auto Rejoin",
	Default = false,
	Flag = "AutoRejoin",
    Save = true,
	Callback = function(Value)
	_G.AutoRejoin = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoRejoin then
game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end
end)
end
end
end)

STA:AddButton({
	Name = "Hop Server",
	Callback = function()
	_G.AutoRejoin = false
    Hop()
  	end    
})

STA:AddButton({
    Name = "Rejoin Server",
    Callback = function()
_G.AutoRejoin = false
game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
      end    
})

STA:AddButton({
    Name = "Hop Server Low Players",
    Callback = function()
getgenv().AutoTeleport = true
_G.AutoRejoin = false
getgenv().DontTeleportTheSameNumber = true 
getgenv().CopytoClipboard = false
if not game:IsLoaded() then
print("Game is loading waiting...")
end
local maxplayers = math.huge
local serversmaxplayer;
local goodserver;
local gamelink = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100" 
function serversearch()
for _, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink)).data) do
if type(v) == "table" and v.playing ~= nil and maxplayers > v.playing then
serversmaxplayer = v.maxPlayers
maxplayers = v.playing
goodserver = v.id
end
end       
end
function getservers()
serversearch()
for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink))) do
if i == "nextPageCursor" then
if gamelink:find("&cursor=") then
local a = gamelink:find("&cursor=")
local b = gamelink:sub(a)
gamelink = gamelink:gsub(b, "")
end
gamelink = gamelink .. "&cursor=" ..v
getservers()
end
end
end 
getservers()
if AutoTeleport then
if DontTeleportTheSameNumber then 
if #game:GetService("Players"):GetPlayers() - 4  == maxplayers then
return warn("It has same number of players (except you)")
elseif goodserver == game.JobId then
return warn("Your current server is the most empty server atm") 
end
end
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, goodserver)
end
      end    
})

























----------------------------------------------------------------------------
-- shop tab
local Skibidi = SH:AddSection({
	Name = "Misc Reset"
})

SH:AddButton({
	Name = "Refund Stats [3,500 F]",
	Callback = function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
  	end    
})

SH:AddButton({
	Name = "Reroll Race [3,000 F]",
	Callback = function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","1")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
  	end    
})

local Skibidi = SH:AddSection({
	Name = "Misc Race Shop"
})

SH:AddButton({
	Name = "Change to Ghoul Race",
	Callback = function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm","BuyCheck",4)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm","Change",4)
  	end    
})

SH:AddButton({
	Name = "Change to Cyborg Race [2,500 F]",
	Callback = function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CyborgTrainer","Buy")
  	end    
})

local Skibidi = SH:AddSection({
	Name = "Misc Shop"
})

SH:AddDropdown({
	Name = "Select Haki To Buy",
	Default = "",
	Options = {"Buso", "Geppo", "Soru", "Obversation"},
	Callback = function(Value)
_G.SelectBuyHaki = Value

if _G.SelectBuyHaki == "Buso" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
elseif _G.SelectBuyHaki == "Geppo" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
elseif _G.SelectBuyHaki == "Soru" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
elseif _G.SelectBuyHaki == "Obversation" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
end
	end    
})

SH:AddDropdown({
	Name = "Select Melee To Buy",
	Default = "",
	Options = {"Black Leg", "Electro", "Fishman Karate", "Dragon Claw", "Superhuman", "Sharkman Karate", "Death Step", "Electric Claw", "Dragon Talon", "Godhuman", "Sanguine Art"},
	Callback = function(Value)
_G.SelectBuyMelee = Value

if _G.SelectBuyMelee == "Black Leg" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
elseif _G.SelectBuyMelee == "Electro" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
elseif _G.SelectBuyMelee == "Fishman Karate" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
elseif _G.SelectBuyMelee == "Dragon Claw" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
elseif _G.SelectBuyMelee == "Superhuman" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
elseif _G.SelectBuyMelee == "Sharkman Karate" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
elseif _G.SelectBuyMelee == "Death Step" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
elseif _G.SelectBuyMelee == "Electric Claw" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
elseif _G.SelectBuyMelee == "Dragon Talon" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
elseif _G.SelectBuyMelee == "Godhuman" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
elseif _G.SelectBuyMelee == "Sanguine Art" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")
end
	end    
})

SH:AddDropdown({
	Name = "Select Sword To Buy",
	Default = "",
	Options = {"Cutlass", "Katana", "Iron Mace", "Dual Katana", "Triple Katana", "Pipe", "Dual-Headed Blade", "Bisento", "Soul Cane", "Pole (2nd Form)"},
	Callback = function(Value)
_G.SelectBuySword = Value

if _G.SelectBuySword == "Cutlass" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cutlass")
elseif _G.SelectBuySword == "Katana" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Katana")
elseif _G.SelectBuySword == "Iron Mace" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Iron Mace")
elseif _G.SelectBuySword == "Dual Katana" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Duel Katana")
elseif _G.SelectBuySword == "Triple Katana" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Triple Katana")
elseif _G.SelectBuySword == "Pipe" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Pipe")
elseif _G.SelectBuySword == "Dual-Headed Blade" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Dual-Headed Blade")
elseif _G.SelectBuySword == "Bisento" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Bisento")
elseif _G.SelectBuySword == "Soul Cane" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Soul Cane")
elseif _G.SelectBuySword == "Pole (2nd Form)" then
game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ThunderGodTalk")
end
	end    
})

SH:AddDropdown({
	Name = "Select Gun To Buy",
	Default = "",
	Options = {"Slingshot", "Musket", "Flintlock", "Refined Slingshot", "Refined Flintlock", "Cannon", "Kabucha", "Bizarre Rifle"},
	Callback = function(Value)
_G.SelectBuyGun = Value

if _G.SelectBuyGun == "Slingshot" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Slingshot")
elseif _G.SelectBuyGun == "Musket" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Musket")
elseif _G.SelectBuyGun == "Flintlock" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Flintlock")
elseif _G.SelectBuyGun == "Refined Slingshot" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Refined Slingshot")
elseif _G.SelectBuyGun == "Refined Flintlock" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Refined Flintlock")
elseif _G.SelectBuyGun == "Cannon" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cannon")
elseif _G.SelectBuyGun == "Kabucha" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","1")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","2")
elseif _G.SelectBuyGun == "Bizarre Rifle" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 1)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 1)
end
	end    
})
























----------------------------------------------------------------------------
-- raid tab
local Chips = {"Flame","Ice","Quake","Light","Dark","Spider","Rumble","Magma","Buddha","Sand","Phoenix","Dough"}

local Section = RA:AddSection({
	Name = "Normal Raid"
})

RA:AddDropdown({
	Name = "Select Chip",
	Default = "",
	Options = Chips,
	Callback = function(Value)
	SelectChip = Value
	end    
})

RA:AddToggle({
	Name = "Auto Buy Chip",
	Default = false,
	Callback = function(Value)
	_G.AutoBuyChip = Value
	end    
})

spawn(function()
while wait() do
if _G.AutoBuyChip then
pcall(function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc","Select",SelectChip)
end)
end
end
end)

RA:AddToggle({
	Name = "One Click Raid",
	Default = false,
	Callback = function(Value)
	_G.OneClickRaid = Value
	end    
})

Type = 1
spawn(function()
while wait(.1) do
if Type == 1 then
RaidPos = CFrame.new(0,70,100)
elseif Type == 2 then
RaidPos = CFrame.new(0,50,50)
elseif Type == 3 then
RaidPos = CFrame.new(50,65,0)
elseif Type == 4 then
RaidPos = CFrame.new(0,45,-65)	
elseif Type == 5 then
RaidPos = CFrame.new(-70,75,0)
elseif Type == 6 then
RaidPos = CFrame.new(0,55,-100)
end
end
end)

spawn(function()
while wait(.1) do
Type = 1
wait(0.9)
Type = 2
wait(0.9)
Type = 3
wait(0.9)
Type = 4
wait(0.9)
Type = 5
wait(0.9)
end
end)

spawn(function()
while wait() do
if _G.OneClickRaid then
pcall(function()
if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc","Select",SelectChip)
elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
if Second_Sea then
fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
elseif Third_Sea then
fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
end
end
end
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
elseif game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true then
if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
Tween(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame * RaidPos)
elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
Tween(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame * RaidPos)
elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
Tween(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame * RaidPos)
elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
Tween(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame * RaidPos)
elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
Tween(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame * RaidPos)
end
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
repeat task.wait()
sethiddenproperty(game:GetService('Players').LocalPlayer,"SimulationRadius",math.huge)
v.Humanoid.Health = 0
v.HumanoidRootPart.CanCollide = false
until not _G.OneClickRaid or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false
end
end
end
end)
end
end
end)


RA:AddToggle({
	Name = "Auto Start Raid",
	Default = false,
	Callback = function(Value)
	_G.AutoStartRaid = Value
	end    
})

spawn(function()
while wait(.1) do
pcall(function()
if _G.AutoStartRaid then
if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
if Second_Sea then
fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
elseif Third_Sea then
fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
end
end
end
end
end)
end
end)

RA:AddToggle({
	Name = "Auto Next Island",
	Default = false,
	Callback = function(Value)
	_G.AutoNextIsland = Value
	end    
})

spawn(function()
while task.wait() do
if _G.AutoNextIsland then
pcall(function()
if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true then
if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
Tween(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame * RaidPos)
elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
Tween(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame * RaidPos)
elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
Tween(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame * RaidPos)
elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
Tween(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame * RaidPos)
elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
Tween(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame * RaidPos)
end
end
end)
end
end
end)

RA:AddToggle({
	Name = "Kill Aura",
	Default = false,
	Callback = function(Value)
	_G.KillAura = Value
	end    
})

spawn(function()
while wait() do
if _G.KillAura then
pcall(function()
for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
repeat task.wait()
sethiddenproperty(game:GetService('Players').LocalPlayer,"SimulationRadius",math.huge)
v.Humanoid.Health = 0
v.HumanoidRootPart.CanCollide = false
until not _G.KillAura or not v.Parent or v.Humanoid.Health <= 0
end
end
end)
end
end
end)

RA:AddToggle({
	Name = "Auto Awaken",
	Default = false,
	Callback = function(Value)
	_G.AutoAwakenSkill = Value
	end    
})

spawn(function()
while task.wait() do
if _G.AutoAwakenSkill then
pcall(function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
end)
end
end
end)

RA:AddToggle({
	Name = "Auto Get Below 1M$ Fruit",
	Default = false,
	Callback = function(Value)
	_G.AutoGetFruitBelow1M = Value
	end    
})

spawn(function()
while task.wait() do
if _G.AutoGetFruitBelow1M then
pcall(function()
TabelDevilFruitStore = {}
TabelDevilFruitOpen = {}
for i, v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
for i1, v1 in pairs(v) do
if i1 == "Name" then
table.insert(TabelDevilFruitStore, v1)
end
end
end
for i, v in next, game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits") do
if v.Price > 1000000 then
table.insert(TabelDevilFruitOpen, v.Name)
end
end
for i, DevilFruitOpenDoor in pairs(TabelDevilFruitOpen) do
for x, DevilFruitStore in pairs(TabelDevilFruitStore) do
if DevilFruitOpenDoor == DevilFruitStore then
if not game.Players.LocalPlayer.Backpack:FindFirstChild(DevilFruitStore) then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit", DevilFruitStore)
end
end
end
end
end)
end
wait(0.2)
end
end)

if Second_Sea then
RA:AddButton({
	Name = "Tween To Raid Room",
	Callback = function()
TweenButton(CFrame.new(-6438.73535, 250.645355, -4501.50684))
  	end    
})
elseif Third_Sea then
RA:AddButton({
	Name = "Tween To Raid Room",
	Callback = function()
TweenButton(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499e-08, -0.378151238, 4.55503146e-09, 1, 1.07377559e-07, 0.378151238, 9.7681621e-08, -0.925743818))
  	end    
})
end

if Second_Sea then
local Section = RA:AddSection({
	Name = "Law Raid"
})

RA:AddToggle({
	Name = "Auto Law",
	Default = false,
	Callback = function(Value)
	_G.AutoLaw = Value
	end    
})

RA:AddToggle({
	Name = "Auto Buy Chip Law",
	Default = false,
	Callback = function(Value)
	_G.AutoBuyChipLaw = Value
	end    
})

RA:AddToggle({
	Name = "Auto Start Law",
	Default = false,
	Callback = function(Value)
	_G.AutoStartLaw = Value
	end    
})

spawn(function()
pcall(function()
while wait() do
if _G.AutoStartLaw then
if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") then
wait(0.15)
fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
end
end
end
end)
end)

spawn(function()
pcall(function()
while wait() do
if _G.AutoBuyChipLaw then
if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") and not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") and not game:GetService("Workspace").Enemies:FindFirstChild("Order") and not game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
wait(0.2)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Microchip","1")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Microchip","2")
end
end
end
end)
end)

spawn(function()
pcall(function()
while wait() do
if _G.AutoLaw then
if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") and not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") and not game:GetService("Workspace").Enemies:FindFirstChild("Order") and not game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
wait(0.3)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Microchip","1")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Microchip","2")
end
end
end
end)
end)

spawn(function()
pcall(function()
while wait(0.4) do
if _G.AutoLaw then
if not game:GetService("Workspace").Enemies:FindFirstChild("Order") and not game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") then
fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
end
end
if game:GetService("ReplicatedStorage"):FindFirstChild("Order") or game:GetService("Workspace").Enemies:FindFirstChild("Order") then
if game:GetService("Workspace").Enemies:FindFirstChild("Order") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v.Name == "Order" then
repeat game:GetService("RunService").Heartbeat:wait()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
FarmPos = v.HumanoidRootPart.CFrame
MonFarm = v.Name
until not v.Parent or v.Humanoid.Health <= 0 or not _G.AutoLaw
end
end
elseif game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
Tween(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
end
end
end
end
end)
end)
end



























----------------------------------------------------------------------------
-- player tab
local Section = P:AddSection({
    Name = "Misc Players"
})

local PlayerCounts = P:AddLabel("Player")

spawn(function()
while wait() do
pcall(function()
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
if i == 12 then
PlayerCounts:Set("Players :".." "..i.." ".."/".." ".."12".." ".."(Max)")
elseif i == 1 then
PlayerCounts:Set("Player :".." "..i.." ".."/".." ".."12")
else
PlayerCounts:Set("Players :".." "..i.." ".."/".." ".."12")
end
end
end)
end
end)

function GetPlayersTable()
    local playerNames = {}
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(playerNames, player.Name)
        end
    end
    return playerNames
end

local SelectedPlayers = P:AddDropdown({
    Name = "Select Players",
    Default = "",
    Options = GetPlayersTable(),
    Callback = function(Value)
    _G.SelectPlayers = Value
    end    
})

P:AddButton({
    Name = "Refresh Dropdown",
    Callback = function()
SelectedPlayers:Refresh(GetPlayersTable(), true)
      end     
})

P:AddToggle({
    Name = "Tween to Players",
    Default = false,
    Callback = function(Value)
_G.TeleportPlayers = Value
pcall(function()
if _G.TeleportPlayers then
repeat wait()
Tween(game:GetService("Players"):FindFirstChild(_G.SelectPlayers).Character.HumanoidRootPart.CFrame)
until not _G.TeleportPlayers or not game:GetService("Players"):FindFirstChild(_G.SelectPlayers)
CancelTween(_G.TeleportPlayers)
else
CancelTween(_G.TeleportPlayers)
end
end)
    end    
})

P:AddToggle({
    Name = "Spectator Players",
    Default = false,
    Callback = function(Value)
_G.SpectatorsPlayers = Value
pcall(function()
if _G.SpectatorsPlayers then
game:GetService("Workspace").CurrentCamera.CameraSubject = game:GetService("Players"):FindFirstChild(_G.SelectPlayers).Character
else
game:GetService("Workspace").CurrentCamera.CameraSubject = game:GetService("Players").LocalPlayer.Character
end
end)
    end    
})

P:AddToggle({
    Name = "Auto Kill Players",
    Default = false,
    Flag = "AutoKillPlayersVipPro",
    Save = true,
    Callback = function(Value)
    _G.AutoKillPlayers = Value
    end    
})

spawn(function()
while wait() do
if _G.AutoKillPlayers then
pcall(function()
if _G.SelectPlayers ~= nil then 
if game.Players:FindFirstChild(_G.SelectPlayers) then
if game.Players:FindFirstChild(_G.SelectPlayers).Character.Humanoid.Health > 0 then
repeat task.wait()
EquipTool(SelectWeapon)
AutoHaki()
Click()
game.Players:FindFirstChild(_G.SelectPlayers).Character.HumanoidRootPart.CanCollide = false
if game.Players.LocalPlayer.Character.Humanoid.Health <= 3000 then
Tween(game.Players:FindFirstChild(_G.SelectPlayers).Character.HumanoidRootPart.CFrame * CFrame.new(0,70,0))
else
Tween(game.Players:FindFirstChild(_G.SelectPlayers).Character.HumanoidRootPart.CFrame * CFrame.new(0,5,7))
end
until game.Players:FindFirstChild(_G.SelectPlayers).Character.Humanoid.Health <= 0 or not game.Players:FindFirstChild(_G.SelectPlayers) or not _G.AutoKillPlayers
end
end
end
end)
end
end
end)

local Section = P:AddSection({
    Name = "Aimbot"
})

spawn(function()
while wait() do
pcall(function()
local MaxDistance = math.huge
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
if v.Name ~= game:GetService("Players").LocalPlayer.Name then
local Distance = v:DistanceFromCharacter(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position)
if Distance < MaxDistance then
MaxDistance = Distance
AimbotPlayerSkill = v.Name
end
end
end
end)
end
end)

P:AddToggle({
    Name = "Aimbot Gun + Skill",
    Default = false,
    Flag = "AimbotGunAndSkill",
    Save = true,
    Callback = function(Value)
_G.AimbotGun = Value
_G.AimbotSkill = Value
    end    
})

spawn(function()
while task.wait() do
if _G.AimbotGun and _G.SelectPlayers ~= nil and game:GetService("Players").LocalPlayer.Character:FindFirstChild(CurrentEquipGun) then
pcall(function()
game:GetService("Players").LocalPlayer.Character[CurrentEquipGun].Cooldown.Value = 0
local args = {
    [1] = game:GetService("Players"):FindFirstChild(_G.SelectPlayers).Character.HumanoidRootPart.Position,
    [2] = game:GetService("Players"):FindFirstChild(_G.SelectPlayers).Character.HumanoidRootPart
}
game:GetService("Players").LocalPlayer.Character[CurrentEquipGun].RemoteFunctionShoot:InvokeServer(unpack(args))
end)
end
end
end)

spawn(function()
pcall(function()
while task.wait() do
if _G.AimbotSkill and _G.SelectPlayers ~= nil and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name]:FindFirstChild("MousePos") then
local args = {
    [1] = game:GetService("Players"):FindFirstChild(_G.SelectPlayers).Character.HumanoidRootPart.Position
}
game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name).RemoteEvent:FireServer(unpack(args))
end
end
end)
end)



P:AddToggle({
    Name = "Aimbot Skill Nearest",
    Default = false,
    Flag = "AimbotSkillNearest",
    Save = true,
    Callback = function(Value)
    _G.AimbotSkillNear = Value
    end    
})

spawn(function()
pcall(function()
game:GetService("RunService").RenderStepped:connect(function()
if _G.AimbotSkillNear and AimbotPlayerSkill ~= nil and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name]:FindFirstChild("MousePos") then
local args = {
	[1] = game:GetService("Players"):FindFirstChild(AimbotPlayerSkill).Character.HumanoidRootPart.Position
}
game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
end
end)
end)
end)



































----------------------------------------------------------------------------
-- teleport tab
local TPSec = TP:AddSection({
	Name = "Misc Sea"
})

TP:AddButton({
	Name = "Join Sea1",
	Callback = function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
  	end    
})

TP:AddButton({
	Name = "Join Sea2",
	Callback = function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
  	end    
})

TP:AddButton({
	Name = "Join Sea3",
	Callback = function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
  	end    
})

local TPSec = TP:AddSection({
	Name = "Misc Island"
})

TP:AddButton({
	Name = "Stop Tween",
	Callback = function()
    CancelTween(All)
  	end    
})

if First_Sea then
IslandList = {"WindMill","Marine","Middle Town","Jungle","Pirate Village","Desert","Snow Island","MarineFord","Colosseum","Sky Island 1","Sky Island 2","Sky Island 3","Prison","Magma Village","Under Water Island","Fountain City","Shank Room","Mob Island",}
elseif Second_Sea then
IslandList = {"The Cafe","Frist Spot","Dark Area","Flamingo Mansion","Flamingo Room","Green Zone","Factory","Colossuim","Zombie Island","Two Snow Mountain","Punk Hazard","Cursed Ship","Ice Castle","Forgotten Island","Ussop Island","Mini Sky Island",}
elseif Third_Sea then
IslandList = {"Mansion","Port Town","Great Tree","Castle On The Sea","MiniSky", "Hydra Island","Floating Turtle","Haunted Castle","Ice Cream Island","Peanut Island","Cake Island","Cocoa Island","Candy Island","Isle Outpost","Tiki Outpost"}
end

if First_Sea then
InstaIslandList = {"Sky Island 2","Sky Island 3","Under Water Island"}
elseif Second_Sea then
InstaIslandList = {"Mansion","Swan Room","Cursed Ship Domain","Cursed Ship Gate"}
elseif Third_Sea then
InstaIslandList = {"Mansion","Hydra Island","Castle On The Sea","Beautiful Room Domain","Beautiful Room Gate"}
end

TP:AddDropdown({
	Name = "Insta Tp Island",
	Default = "...",
	Options = InstaIslandList,
	Callback = function(Value)
_G.SelectInstaTpIsland = Value

if Third_Sea then
if _G.SelectInstaTpIsland == "Mansion" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(-12464.8994140625, 374.9494934082031, -7546.80908203125))
elseif _G.SelectInstaTpIsland == "Castle On The Sea" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(-5071.19091796875, 314.550537109375, -3152.2353515625))
elseif _G.SelectInstaTpIsland == "Hydra Island" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(5743.95703125, 610.4590454101562, -268.8750915527344))
elseif _G.SelectInstaTpIsland == "Beautiful Room Domain" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656))
elseif _G.SelectInstaTpIsland == "Beautiful Room Gate" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875))
end
elseif Second_Sea then
if _G.SelectInstaTpIsland == "Cursed Ship Domain" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
elseif _G.SelectInstaTpIsland == "Cursed Ship Gate" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(-6508.55810546875, 89.03499603271484, -132.83953857421875))
elseif _G.SelectInstaTpIsland == "Mansion" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(-286.98907470703125, 306.1379089355469, 597.8827514648438))
elseif _G.SelectInstaTpIsland == "Swan Room" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(2284.912109375, 15.537666320800781, 905.48291015625))
end
elseif First_Sea then
if _G.SelectInstaTpIsland == "Sky Island 2" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
elseif _G.SelectInstaTpIsland == "Sky Island 3" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
elseif _G.SelectInstaTpIsland == "Under Water Island" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
end
end
	end    
})

TP:AddDropdown({
	Name = "Select Island",
	Default = "...",
	Options = IslandList,
	Callback = function(Value)
	_G.SelectIsland = Value
	end    
})

TP:AddToggle({
	Name = "Tween To Island",
	Default = false,
	Callback = function(Value)
_G.TeleportIsland = Value

if _G.TeleportIsland then
repeat wait()
if _G.SelectIsland == "WindMill" then
Tween(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
elseif _G.SelectIsland == "Marine" then
Tween(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
elseif _G.SelectIsland == "Middle Town" then
Tween(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
elseif _G.SelectIsland == "Jungle" then
Tween(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
elseif _G.SelectIsland == "Pirate Village" then
Tween(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
elseif _G.SelectIsland == "Desert" then
Tween(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
elseif _G.SelectIsland == "Snow Island" then
Tween(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
elseif _G.SelectIsland == "MarineFord" then
Tween(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
elseif _G.SelectIsland == "Colosseum" then
Tween( CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
elseif _G.SelectIsland == "Sky Island 1" then
Tween(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
elseif _G.SelectIsland == "Sky Island 2" then  
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
elseif _G.SelectIsland == "Sky Island 3" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
elseif _G.SelectIsland == "Prison" then
Tween( CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
elseif _G.SelectIsland == "Magma Village" then
Tween(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
elseif _G.SelectIsland == "Under Water Island" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
elseif _G.SelectIsland == "Fountain City" then
Tween(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
elseif _G.SelectIsland == "Shank Room" then
Tween(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
elseif _G.SelectIsland == "Mob Island" then
Tween(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
elseif _G.SelectIsland == "The Cafe" then
Tween(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
elseif _G.SelectIsland == "Frist Spot" then
Tween(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
elseif _G.SelectIsland == "Dark Area" then
Tween(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
elseif _G.SelectIsland == "Flamingo Mansion" then
Tween(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234))
elseif _G.SelectIsland == "Flamingo Room" then
Tween(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
elseif _G.SelectIsland == "Green Zone" then
Tween( CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
elseif _G.SelectIsland == "Factory" then
Tween(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
elseif _G.SelectIsland == "Colossuim" then
Tween( CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
elseif _G.SelectIsland == "Zombie Island" then
Tween(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
elseif _G.SelectIsland == "Two Snow Mountain" then
Tween(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
elseif _G.SelectIsland == "Punk Hazard" then
Tween(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
elseif _G.SelectIsland == "Cursed Ship" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
elseif _G.SelectIsland == "Ice Castle" then
Tween(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
elseif _G.SelectIsland == "Forgotten Island" then
Tween(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
elseif _G.SelectIsland == "Ussop Island" then
Tween(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
elseif _G.SelectIsland == "Mini Sky Island" then
Tween(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
elseif _G.SelectIsland == "Great Tree" then
Tween(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
elseif _G.SelectIsland == "Castle On The Sea" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(-5071.19091796875, 314.550537109375, -3152.2353515625))
elseif _G.SelectIsland == "MiniSky" then
Tween(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
elseif _G.SelectIsland == "Port Town" then
Tween(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
elseif _G.SelectIsland == "Hydra Island" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(5743.95703125, 610.4590454101562, -268.8750915527344))
elseif _G.SelectIsland == "Floating Turtle" then
Tween(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
elseif _G.SelectIsland == "Mansion" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(-12464.8994140625, 374.9494934082031, -7546.80908203125))
elseif _G.SelectIsland == "Haunted Castle" then
Tween(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
elseif _G.SelectIsland == "Ice Cream Island" then
Tween(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
elseif _G.SelectIsland == "Peanut Island" then
Tween(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
elseif _G.SelectIsland == "Cake Island" then
Tween(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
elseif _G.SelectIsland == "Cocoa Island" then
Tween(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375))
elseif _G.SelectIsland == "Candy Island" then
Tween(CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625))
elseif _G.SelectIsland == "Isle Outpost" then
Tween(CFrame.new(-16223.8984375, 9.095597267150879, 431.6678161621094))
elseif _G.SelectIsland == "Tiki Outpost" then
Tween(CFrame.new(-16227.775390625, 9.086363792419434, 441.05169677734375))
end
until not _G.TeleportIsland
CancelTween(_G.TeleportIsland)
end
	end    
})























































----------------------------------------------------------------------------
-- tab setting
local STSec = ST:AddSection({
	Name = "Misc Setting Farm"
})

ST:AddSlider({
	Name = "Tween Speed",
	Min = 150,
	Max = 350,
	Default = 250,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "M",
	Flag = "TweenSpeed",
    Save = true,
	Callback = function(Value)
	ChangeSpeed = Value
	end    
})

ST:AddSlider({
	Name = "Distance Farm",
	Min = 0,
	Max = 60,
	Default = 30,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "M",
	Flag = "DistanceFarm",
    Save = true,
	Callback = function(Value)
	posY = Value
	end    
})

local listfastattack = {"0.3","0.2","0.15","0.1","0"}
ST:AddDropdown({
	Name = "Select Fast Attack Delay",
	Default = "0.2",
	Options = listfastattack,
	Flag = "DelayFastAttackSelect",
    Save = true,
	Callback = function(Value)
    _G.FastAttackDelay = Value
	end    
})

ST:AddToggle({
	Name = "Fast Attack",
	Default = true,
	Flag = "FastAttackToggle",
    Save = true,
	Callback = function(Value)
	_G.FastAttackNice = Value
	end    
})

ST:AddToggle({
	Name = "Bring Mob",
	Default = true,
	Flag = "BringMobToggle",
    Save = true,
	Callback = function(Value)
	_G.BringMob = Value
	end    
})

ST:AddToggle({
	Name = "Auto Turn On Observation",
	Default = false,
	Flag = "AutoTurnOnObservationToggle",
    Save = true,
	Callback = function(Value)
	_G.AutoTurnOnObservation = Value
	end    
})

spawn(function()
while wait() do
pcall(function()
if _G.AutoTurnOnObservation then
repeat task.wait()
if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
game:GetService('VirtualUser'):CaptureController()
game:GetService('VirtualUser'):SetKeyDown('0x65')
wait(2)
game:GetService('VirtualUser'):SetKeyUp('0x65')
end
until game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") or not _G.AutoTurnOnObservation
end
end)
end
end)

ST:AddToggle({
	Name = "Reset Teleport",
	Default = false,
	Flag = "BypassTpToggle",
    Save = true,
	Callback = function(Value)
	BypassTP = Value
	end    
})

ST:AddToggle({
	Name = "No Fog",
	Default = false,
	Flag = "NoFogToggle",
    Save = true,
	Callback = function(Value)
	_G.NoFog = Value
	end    
})

spawn(function()
while wait() do
pcall(function()
if _G.NoFog then
game.Lighting.FogEnd = 9e9
game:GetService("Lighting").LightingLayers:Destroy()
else
game.Lighting.FogEnd = 2500
end
end)
end
end)

ST:AddButton({
	Name = "Redeem All Code",
	Callback = function()
UseCode("TheGreatAce")
UseCode("Sub2OfficialNoobie")
UseCode("StrawHatMaine")
UseCode("TantaiGaming")
UseCode("Axiore")
UseCode("Sub2Daigrock")
UseCode("Sub2NoobMaster123")
UseCode("SUB2GAMERROBOT_EXP1")
UseCode("Bluxxy")
UseCode("Starcodeheo")
UseCode("JCWK")
UseCode("Magicbus")
UseCode("Enyu_is_Pro")
UseCode("Sub2Fer999")
UseCode("Sub2CaptainMaui")
UseCode("TRIPLEABUSE")
UseCode("kittgaming")
UseCode("FIGHT4FRUIT")
UseCode("Sub2UncleKizaru")
UseCode("fudd10_v2")
UseCode("Fudd10")
UseCode("CHANDLER")
UseCode("Bignews")
UseCode("KITT_RESET")
UseCode("SUB2GAMERROBOT_RESET1")
UseCode("EARN_FRUITS")
  	end    
})

ST:AddButton({
	Name = "Fps Booster",
	Callback = function()
    FPSBooster()
  	end    
})

--- cai dat phu chung
local STESec = STE:AddSection({
	Name = "Misc Change Team"
})

STE:AddButton({
	Name = "Join Pirates Team",
	Callback = function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Pirates")
  	end    
})

STE:AddButton({
	Name = "Join Marines Team",
	Callback = function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Marines")
  	end    
})

local STESec = STE:AddSection({
	Name = "Misc disabled of game"
})

STE:AddToggle({
	Name = "Disabled Chat Message",
	Default = false,
	Flag = "DisabledMessage",
    Save = true,
	Callback = function(Value)
	_G.DisabledShowMessage = Value
	end    
})

STE:AddToggle({
	Name = "Disabled Leaderboard",
	Default = false,
	Flag = "DisabledLeaderboard",
    Save = true,
	Callback = function(Value)
	_G.DisabledShowLeaderboard = Value
	end    
})

spawn(function()
while wait() do
pcall(function()
if _G.DisabledShowMessage then
game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
else
game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
end
if _G.DisabledShowLeaderboard then
game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
else
game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
end
end)
end
end)

local STESec = STE:AddSection({
	Name = "Misc Rainbow Change"
})

STE:AddToggle({
	Name = "Rainbow Haki",
	Default = false,
	Flag = "RainbowHaki",
    Save = true,
	Callback = function(Value)
	_G.RainbowHaki = Value
	end    
})

spawn(function()
while wait() do
if _G.RainbowHaki then
pcall(function()
if game.Players.LocalPlayer.Character.HasBuso then
for i,v in pairs(game.Players.LocalPlayer.Character.Humanoid:GetChildren()) do
if v.Name == "RightLowerArm_BusoLayer1" or v.Name == "RightLowerArm_BusoLayer2" or v.Name == "RightHand_BusoLayer1" or v.Name == "RightHand_BusoLayer2" or v.Name == "LeftLowerArm_BusoLayer1" or v.Name == "LeftLowerArm_BusoLayer2" or v.Name == "LeftHand_BusoLayer1" or v.Name == "LeftHand_BusoLayer2" or v.Name == "LeftHand_BusoLayer1" or v.Name == "RightUpperArm_BusoLayer1" or v.Name == "RightUpperArm_BusoLayer2" or v.Name == "LeftUpperArm_BusoLayer1" or v.Name == "LeftUpperArm_BusoLayer2" or v.Name == "UpperTorso_BusoLayer1" or v.Name == "UpperTorso_BusoLayer2" or v.Name == "LowerTorso_BusoLayer1" or v.Name == "LowerTorso_BusoLayer2" or v.Name == "Head_BusoLayer1" or v.Name == "Head_BusoLayer2" or v.Name == "RightUpperLeg_BusoLayer1" or v.Name == "RightUpperLeg_BusoLayer2" or v.Name == "LeftUpperLeg_BusoLayer1" or v.Name == "LeftUpperLeg_BusoLayer2" or v.Name == "RightLowerLeg_BusoLayer1" or v.Name == "RightLowerLeg_BusoLayer2" or v.Name == "LeftLowerLeg_BusoLayer1" or v.Name == "LeftLowerLeg_BusoLayer2" or v.Name == "LeftFoot_BusoLayer1" or v.Name == "LeftFoot_BusoLayer2" or v.Name == "RightFoot_BusoLayer1" or v.Name == "RightFoot_BusoLayer2" then
v.Color = Color3.fromHSV(tick() * 24 % 255/255, 1, 1)
end
end
end
end)
end
end
end)

STE:AddToggle({
	Name = "Rainbow Yoru",
	Default = false,
	Flag = "RainbowYoru",
    Save = true,
	Callback = function(Value)
	_G.RainbowYoru = Value
	end    
})

spawn(function()
while wait() do
if _G.RainbowYoru then
pcall(function()
for i,v in pairs(game.Players.LocalPlayer.Character.DarkBlade.Right:GetChildren()) do
if v.Name == "Runes" or v.Name == "Hold" or v.Name == "Bottom" or v.Name == "Gems" or v.Name == "Wings" or v.Name == "Blade" or v.Name == "Tape" then
v.Color = Color3.fromHSV(tick() * 24 % 255/255, 1, 1)
v.Material = "Neon"
end
end
for i,v in pairs(game.Players.LocalPlayer.Character.DarkBlade.Right.Handle:GetChildren()) do
if v.Name == "Trail" then
v.LightEmission = 1
end
end
for i,v in pairs(game.Players.LocalPlayer.Character.DarkBlade.Right.Handle.Attachment0:GetChildren()) do
if v.Name == "Beam" then
v.LightEmission = 1
v.Texture = 0
v.Width0 = 0
v.Width1 = 0
end
end
end)
end
end
end)

local STESec = STE:AddSection({
	Name = "Misc Troll"
})

function rm()
for i,v in pairs(Char:GetDescendants()) do
if v:IsA("BasePart") then
if v.Name == "Handle" or v.Name == "Head" then
if Char.Head:FindFirstChild("OriginalSize") then
Char.Head.OriginalSize:Destroy()
end
else
for i,cav in pairs(v:GetDescendants()) do
if cav:IsA("Attachment") then
if cav:FindFirstChild("OriginalPosition") then
cav.OriginalPosition:Destroy()  
end
end
end
v:FindFirstChild("OriginalSize"):Destroy()
if v:FindFirstChild("AvatarPartScaleType") then
v:FindFirstChild("AvatarPartScaleType"):Destroy()
end
end
end
end
end

STE:AddButton({
	Name = "Buddha Big",
	Callback = function()
rm()
wait(0.5)
HM:FindFirstChild("BodyProportionScale"):Destroy()
wait(1)
  	end    
})

STE:AddDropdown({
	Name = "Select State Haki",
	Default = "",
	Options = {"0", "1", "2", "3", "4", "5"},
	Flag = "ChooseStateHaki",
    Save = true,
	Callback = function(Value)
	_G.SelectStateHaki = Value
	end    
})

STE:AddButton({
	Name = "Change State Haki",
	Callback = function()
if _G.SelectStateHaki == "0" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",0)
elseif _G.SelectStateHaki == "1" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",1)
elseif _G.SelectStateHaki == "2" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",2)
elseif _G.SelectStateHaki == "3" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",3)
elseif _G.SelectStateHaki == "4" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",4)
elseif _G.SelectStateHaki == "5" then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",5)
end
  	end    
})

local STESec = STE:AddSection({
	Name = "Misc Change Graphic Of Game"
})

STE:AddDropdown({
	Name = "Select Graphic",
	Default = "Autumn",
	Options = {"Summer", "Autumn"},
	Flag = "SelectGraphicToChange",
    Save = true,
	Callback = function(Value)
	_G.SelectGraphic = Value
	end    
})

STE:AddToggle({
	Name = "Change Graphic",
	Default = false,
	Flag = "ChangeGraphic",
    Save = true,
	Callback = function(Value)
	_G.ChangeGraphic = Value
	end    
})

spawn(function()
while wait() do
pcall(function()
if _G.ChangeGraphic then
local a = game.Lighting
a.Ambient = Color3.fromRGB(33, 33, 33)
a.Brightness = 0.3
a.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
a.ColorShift_Top = Color3.fromRGB(255, 247, 237)
a.EnvironmentDiffuseScale = 0.105
a.EnvironmentSpecularScale = 0.522
a.GlobalShadows = true
a.OutdoorAmbient = Color3.fromRGB(51, 54, 67)
a.ShadowSoftness = 0.04
a.GeographicLatitude = -15.525
a.ExposureCompensation = 0.75
 local b = Instance.new("BloomEffect", a)
b.Name = "BloomEffect_Graphic"
b.Enabled = true
b.Intensity = 0.04
b.Size = 1900
b.Threshold = 0.915
local c = Instance.new("ColorCorrectionEffect", a)
c.Name = 'ColorCorrectionEffect1_Graphic'
c.Brightness = 0.176
c.Contrast = 0.39
c.Enabled = true
c.Saturation = 0.2
c.TintColor = Color3.fromRGB(217, 145, 57)
if _G.SelectGraphic == "Summer" then
c.TintColor = Color3.fromRGB(255, 220, 148)
elseif _G.SelectGraphic == "Autumn" then
c.TintColor = Color3.fromRGB(242, 193, 79)
end
local d = Instance.new("DepthOfFieldEffect", Graphic)
d.Name =  'DepthOfFieldEffect_Graphic'
d.Enabled = true
d.FarIntensity = 0.077
d.FocusDistance = 21.54
d.InFocusRadius = 20.77
d.NearIntensity = 0.277
local e = Instance.new("ColorCorrectionEffect", a)
e.Name = 'ColorCorrectionEffect2_Graphic'
e.Brightness = 0
e.Contrast = -0.07
e.Saturation = 0
e.Enabled = true
e.TintColor = Color3.fromRGB(255, 247, 239)
local e2 = Instance.new("ColorCorrectionEffect", a)
e2.Name = 'ColorCorrectionEffect3_Graphic'
e2.Brightness = 0.2
e2.Contrast = 0.45
e2.Saturation = -0.1
e2.Enabled = true
e2.TintColor = Color3.fromRGB(255, 255, 255)
local s = Instance.new("SunRaysEffect", a)
s.Name = 'SunRaysEffect_Graphic'
s.Enabled = false
s.Intensity = 0.01
s.Spread = 0.146
else
local a = game.Lighting
a.Ambient = Color3.fromRGB(170, 170, 170)
a.Brightness = 2
a.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
a.ColorShift_Top = Color3.fromRGB(0, 0, 0)
a.EnvironmentDiffuseScale = 0.105
a.EnvironmentSpecularScale = 0.522
a.GlobalShadows = false
a.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
a.ShadowSoftness = 0
a.GeographicLatitude = 66
a.ExposureCompensation = 0.2
game:GetService("Lighting")["BloomEffect_Graphic"]:Destroy()
game:GetService("Lighting")["ColorCorrectionEffect1_Graphic"]:Destroy()
game:GetService("Lighting")["ColorCorrectionEffect2_Graphic"]:Destroy()
game:GetService("Lighting")["ColorCorrectionEffect3_Graphic"]:Destroy()
game:GetService("Lighting")["SunRaysEffect_Graphic"]:Destroy()
end
end)
end
end)

function SuperFpsBooster()
for i,v in pairs(game.Workspace.Map:GetDescendants()) do
if v.Name == "Tavern" or v.Name == "SmileFactory" or v.Name == "Tree" or v.Name == "Rocks" or v.Name == "PartHouse" or v.Name == "Hotel" or v.Name == "WallPiece" or v.Name == "MiddlePillars" or v.Name == "Cloud" or v.Name == "PluginGrass" or v.Name == "BigHouse" or v.Name == "SmallHouse" or v.Name == "Detail" then
v:Destroy()
end
end 
for i,v in pairs(game.ReplicatedStorage.Unloaded:GetDescendants()) do
if v.Name == "Tavern" or v.Name == "SmileFactory" or v.Name == "Tree" or v.Name == "Rocks" or v.Name == "PartHouse" or v.Name == "Hotel" or v.Name == "WallPiece" or v.Name == "MiddlePillars" or v.Name == "Cloud" or v.Name == "PluginGrass" or v.Name == "BigHouse" or v.Name == "SmallHouse" or v.Name == "Detail" then
v:Destroy()
end
end
for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
if v:IsA("Accessory") or v.Name == "Pants" or v.Name == "Shirt" then
v:Destroy()
end
end
local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(g:GetDescendants()) do
if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
v.Material = "Plastic"
v.Reflectance = 0
elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
v.Transparency = 1
elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
v.Lifetime = NumberRange.new(0)
elseif v:IsA("Explosion") then
v.BlastPressure = 1
v.BlastRadius = 1
elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
v.Enabled = false
elseif v:IsA("MeshPart") then
v.Material = "Plastic"
v.Reflectance = 0
v.TextureID = 10385902758728957
end
end
for i, e in pairs(l:GetChildren()) do
if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
e.Enabled = false
end
end
end

STE:AddButton({
	Name = "Super Fps Booster",
	Callback = function()
    SuperFpsBooster()
  	end    
})

local STESec = STE:AddSection({
	Name = "Misc Unlocked Of Game"
})

STE:AddButton({
	Name = "Unlock Fps",
	Callback = function()
    setfpscap(500)
  	end    
})

STE:AddToggle({
	Name = "Unlock Portal",
	Default = false,
	Flag = "UnlockPortal",
    Save = true,
	Callback = function(Value)
	_G.UnlockPortal = Value
	end    
})

spawn(function()
while wait() do
pcall(function()
if _G.UnlockPortal then
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
if v.Name == "NotificationTemplate" then
if string.find(v.Text,"cannot") then
v:Destroy()
end
end
end
end
end)
end
end)

spawn(function()
while wait() do
pcall(function()
if _G.UnlockPortal then
CastlePostoMansion = CFrame.new(-5084.8447265625, 316.48101806641, -3145.3752441406)
MansiontoCastlePos = CFrame.new(-12464.596679688, 376.30590820312, -7567.2626953125)
Castletophydra = CFrame.new(-5095.33984375, 316.48101806641, -3168.3134765625)
HydratoCastle = CFrame.new(5741.869140625, 611.94750976562, -282.61154174805)
if (CastlePostoMansion.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
end
if (MansiontoCastlePos.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5072.08984375, 314.5412902832, -3151.1098632812))
end
if (Castletophydra.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5748.7587890625, 610.44982910156, -267.81704711914))
end
if (HydratoCastle.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5072.08984375, 314.5412902832, -3151.1098632812))
end
end
end)
end
end)

--- phan tiep theo cua cai dat chinh
local STSec = ST:AddSection({
	Name = "Misc Menu"
})

ST:AddButton({
	Name = "Open Fruit Shop",
	Callback = function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
  	end    
})

ST:AddButton({
	Name = "Open Awakening Fruit Menu",
	Callback = function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities")
game.Players.LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = true
  	end    
})

ST:AddButton({
	Name = "Open Titles",
	Callback = function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getTitles")
game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
  	end    
})

ST:AddButton({
	Name = "Open Haki Colors",
	Callback = function()
game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
  	end    
})

local STSec = ST:AddSection({
	Name = "Misc Other"
})

ST:AddToggle({
	Name = "Disabled DMG Counter",
	Default = false,
	Flag = "DestroyDMGCounter",
    Save = true,
	Callback = function(Value)
	_G.RemoveDMGCounter = Value
	end    
})

spawn(function()
while wait() do
if _G.RemoveDMGCounter then
game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false
else
game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = true
end
end
end)

ST:AddToggle({
	Name = "Disabled Notify",
	Default = false,
	Flag = "DisabledNotify",
    Save = true,
	Callback = function(Value)
	_G.RemoveNotify = Value
	end    
})

spawn(function()
while wait() do
pcall(function()
if _G.RemoveNotify then
game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = false
else
game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = true
end
end)
end
end)

ST:AddToggle({
	Name = "Anti Afk",
	Default = false,
	Flag = "AntiAfk",
    Save = true,
	Callback = function(Value)
	_G.AntiAfk = Value
	end    
})

game:GetService("Players").LocalPlayer.Idled:connect(function()
if _G.AntiAfk then
pcall(function()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(1)
game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
end
end)

ST:AddToggle({
	Name = "Walk On Water",
	Default = true,
	Flag = "WalkOnWater",
    Save = true,
	Callback = function(Value)
	_G.WalkWater = Value
	end    
})

spawn(function()
while task.wait() do
pcall(function()
if _G.WalkWater then
game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,112,1000)
else
game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,80,1000)
end
end)
end
end)

ST:AddButton({
	Name = "Remove Lava",
	Callback = function()
for i,v in pairs(game.Workspace:GetDescendants()) do
if v.Name == "Lava" then   
v:Destroy()
end
end
for i,v in pairs(game.ReplicatedStorage:GetDescendants()) do
if v.Name == "Lava" then   
v:Destroy()
end
end
  	end    
})

ST:AddToggle({
	Name = "White Screen",
	Default = false,
	Flag = "WhiteScreen",
    Save = true,
	Callback = function(Value)
	_G.WhiteScreen = Value
	end    
})

ST:AddToggle({
	Name = "Black Screen",
	Default = false,
	Flag = "BlackScreen",
    Save = true,
	Callback = function(Value)
	_G.BlackScreen = Value
	end    
})

spawn(function()
while wait() do
if _G.WhiteScreen then
game:GetService("RunService"):Set3dRenderingEnabled(false)
else
game:GetService("RunService"):Set3dRenderingEnabled(true)
end
end
end)

spawn(function()
while wait() do
if _G.BlackScreen then
game:GetService("Players").LocalPlayer.PlayerGui.Main.Blackscreen.Size = UDim2.new(500, 0, 500, 500)
else
game:GetService("Players").LocalPlayer.PlayerGui.Main.Blackscreen.Size = UDim2.new(1, 0, 500, 500)
end
end
end)

OrionLib:Init()

OrionLib:MakeNotification({
	Name = "Notifying",
	Content = "The script has completed loading all functions, now you can use it!",
	Image = "rbxassetid://4483345998",
	Time = 5
})