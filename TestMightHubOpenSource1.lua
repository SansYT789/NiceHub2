local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
    Title = "Might Hub",
    SubTitle = "made by SansYT789",
    TabWidth = 160,
    Size = UDim2.fromOffset(520, 400),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
})
--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    MainFarm = Window:AddTab({ Title = "Main Farm", Icon = "" }),
    SubFarm = Window:AddTab({ Title = "Quest/Items", Icon = "" }),
    Status = Window:AddTab({ Title = "Status", Icon = "" }),
    Players = Window:AddTab({ Title = "Players", Icon = "" }),
    Pvp = Window:AddTab({ Title = "Pvp", Icon = "" }),
    RaidEsp = Window:AddTab({ Title = "Raids/Esp", Icon = "" }),
    Islands = Window:AddTab({ Title = "Islands", Icon = "" }),
    Leviathan = Window:AddTab({ Title = "Sea/Leviathan", Icon = "" }),
    ClockTrial = Window:AddTab({ Title = "Clock Trial", Icon = "" }),
    Shop = Window:AddTab({ Title = "Shop", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "" })
}

local PosY = 25
local FruitList = {"Rocket-Rocket","Spike-Spike","Chop-Chop","Spring-Spring","Kilo-Kilo","Spin-Spin","Falcon-Falcon","Smoke-Smoke","Flame-Flame","Ice-Ice","Sand-Sand","Dark-Dark","Revive-Revive","Ghost-Ghost","Diamond-Diamond","Light-Light","Rubber-Rubber","Barrier-Barrier","Magma-Magma","Quake-Quake","Buddha-Buddha","Love-Love","String-String","Spider-Spider","Sound-Sound","Phoenix-Phoenix","Soul-Soul","Portal-Portal","Rumble-Rumble","Paw-Paw","Pain-Pain","Blizzard-Blizzard","Gravity-Gravity","Mammoth-Mammoth","T-Rex-T-Rex","Dough-Dough","Venom-Venom","Shadow-Shadow","Control-Control","Spirit-Spirit","Dragon-Dragon","Leopard-Leopard","Kitsune-Kitsune"}
local NameFruitList = {"Rocket Fruit","Spike Fruit","Chop Fruit","Spring Fruit","Kilo Fruit","Spin Fruit","Falcon Fruit","Smoke Fruit","Flame Fruit","Ice Fruit","Sand Fruit","Dark Fruit","Revive Fruit","Ghost Fruit","Diamond Fruit","Light Fruit","Rubber Fruit","Barrier Fruit","Magma Fruit","Quake Fruit","Buddha Fruit","Love Fruit","String Fruit","Spider Fruit","Sound Fruit","Phoenix Fruit","Soul Fruit","Portal Fruit","Rumble Fruit","Paw Fruit","Pain Fruit","Blizzard Fruit","Gravity Fruit","Mammoth Fruit","T-Rex Fruit","Dough Fruit","Venom Fruit","Shadow Fruit","Control Fruit","Spirit Fruit","Dragon Fruit","Leopard Fruit","Kitsune Fruit"}
local BlacklistItemTp = {"Microchip", "Red Key", "Water Key", "Hidden Key", "Library Key", "Torch", "Cup", "Relic", "Hellfire Torch", "Core Brain", "Holy Torch", "Apple", "Banana", "Pineapple", "Flower 1", "Flower 2", "Flower 3", "Sweet Chalice", "God's Chalice", "Fist of Darkness", "Hallow Essence", "Fire Essence"}

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
pcall(function() 
destroyScripts({"General", "Shiftlock", "FallDamage", "4444", "CamBob", "JumpCD", "Looking", "Run"}, game:GetService("Players").LocalPlayer.Character) 
destroyScripts({"RobloxMotor6DBugFix", "Clans", "Codes", "CustomForceField", "MenuBloodSp", "PlayerList"}, game:GetService("Players").LocalPlayer.PlayerScripts) 
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

local First_Sea, Second_Sea, Third_Sea = false, false, false
local placeId = game.PlaceId
if placeId == 2753915549 then
First_Sea = true
elseif placeId == 4442272183 then
Second_Sea = true
elseif placeId == 7449423635 then
Third_Sea = true
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

function AutoHaki()
if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
end
end

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
elseif Lv == 400 or Lv <= 449 or SelectMonster == "Fishman Commando" or SelectArea == 'Fishman' then -- Fishman Commando
Ms = "Fishman Commando"
NameQuest = "FishmanQuest"
QuestLv = 2
NameMon = "Fishman Commando"
CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
elseif Lv == 450 or Lv <= 474 or SelectMonster == "God's Guard" or SelectArea == 'Sky Island' then -- God's Guard
Ms = "God's Guard"
NameQuest = "SkyExp1Quest"
QuestLv = 1
NameMon = "God's Guard"
CFrameQ = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
CFrameMon = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
elseif Lv == 475 or Lv <= 524 or SelectMonster == "Shanda" or SelectArea == 'Sky Island' then -- Shanda
Ms = "Shanda"
NameQuest = "SkyExp1Quest"
QuestLv = 2
NameMon = "Shanda"
CFrameQ = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
CFrameMon = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
elseif Lv == 525 or Lv <= 549 or SelectMonster == "Royal Squad" or SelectArea == 'Sky Island' then -- Royal Squad
Ms = "Royal Squad"
NameQuest = "SkyExp2Quest"
QuestLv = 1
NameMon = "Royal Squad"
CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
CFrameMon = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
elseif Lv == 550 or Lv <= 624 or SelectMonster == "Royal Soldier" or SelectArea == 'Sky Island' then -- Royal Soldier
Ms = "Royal Soldier"
NameQuest = "SkyExp2Quest"
QuestLv = 2
NameMon = "Royal Soldier"
CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
CFrameMon = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
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
elseif Lv == 1275 or Lv <= 1299 or SelectMonster == "Ship Engineer" or SelectArea == 'Ship' then -- Ship Engineer
Ms = "Ship Engineer"
NameQuest = "ShipQuest1"
QuestLv = 2
NameMon = "Ship Engineer"
CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
elseif Lv == 1300 or Lv <= 1324 or SelectMonster == "Ship Steward" or SelectArea == 'Ship' then -- Ship Steward
Ms = "Ship Steward"
NameQuest = "ShipQuest2"
QuestLv = 1
NameMon = "Ship Steward"
CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
elseif Lv == 1325 or Lv <= 1349 or SelectMonster == "Ship Officer" or SelectArea == 'Ship' then -- Ship Officer
Ms = "Ship Officer"
NameQuest = "ShipQuest2"
QuestLv = 2
NameMon = "Ship Officer"
CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
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
CFrameMon = CFrame.new(-16240.298828125, 94.04179382324219, 1042.3505859375)
elseif Lv >= 2525 or SelectMonster == "Isle Champion" or SelectArea == 'Tiki Outpost' then
Ms = "Isle Champion"
NameQuest = "TikiQuest2"
QuestLv = 2
NameMon = "Isle Champion"
CFrameQ = CFrame.new(-16542.447265625, 55.68632888793945, 1044.41650390625)
CFrameMon = CFrame.new(-16811.625, 94.04179382324219, 1112.4207763671875)
end
end
end

function CheckSea(e)
    if game.PlaceId == 2753915549 then
        if e == 1 then
            return true
        end
    elseif game.PlaceId == 4442272183 then
        if e == 2 then
            return true
        end
    elseif game.PlaceId == 7449423635 then
        if e == 3 then
            return true
        end
    end
    return false
end

function IsIslandRaid(cu)
    local islands = game:GetService("Workspace")["_WorldOrigin"].Locations
    if islands:FindFirstChild("Island " .. cu) then
        local closest, minDist = nil, 4500
        for _, v in ipairs(islands:GetChildren()) do
            if v.Name == "Island " .. cu then
                local dist = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if dist < minDist then
                    minDist, closest = dist, v
                end
            end
        end
        return closest
    end
end

function getNextIsland()
    for _, v in ipairs({5, 4, 3, 2, 1}) do
        local island = IsIslandRaid(v)
        if island and (island.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4500 then
            return island
        end
    end
end

function CheckIsRaiding()
    if game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == true then
        return game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible
    end
    return getNextIsland()
end

function getPortal(check)
if not check then return end
local minDistance, closestPortal = math.huge, nil
local TableLocations = {}
if First_Sea then
TableLocations = {
["Castle On The Sea"] = Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
["Hydra Island"] = Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
["Mansion"] = Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
["Great Tree"] = Vector3.new(2955.05126953125, 2282.111083984375, -7217.95947265625),
["Temple Of Time"] = Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586),
["Beautiful Gate"] = Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875),
["Beautiful Domain"] = Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656)}
elseif Second_Sea then
TableLocations = {
["Mansion"] = Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
["Flamingo"] = Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
["Ship Domain"] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
["Ship Gate"] = Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)}
elseif Third_Sea then
TableLocations = {
["Sky 3"] = Vector3.new(-7894.6201171875, 5545.49169921875, -380.2467346191406),
["Sky 2"] = Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
["Under Water"] = Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
["In Water"] = Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875)}
end

for name, position in pairs(TableLocations) do
if (position - check.Position).Magnitude < minDistance then
minDistance, closestPortal = (position - check.Position).Magnitude, position
end
end

if closestPortal and minDistance <= (check.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
return closestPortal
else
return
end
end

function requestEntrance(check1)
pcall(function()
if not check1 then return end
if check1 ~= Vector3.new(2955.05126953125, 2282.111083984375, -7217.95947265625) then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance", check1)
else
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress","TeleportBack")
end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y + 50, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
task.wait(0.5)
end)
end

function hasBlacklistItem()
    -- Duyệt qua danh sách vật phẩm bị cấm
    for _, v in pairs(BlacklistItemTp) do
        if game.Players.LocalPlayer.Backpack:FindFirstChild(v) or 
           game.Players.LocalPlayer.Character:FindFirstChild(v) then
            return true
        end
    end

    -- Duyệt qua danh sách trái cây
    for _, y in pairs(NameFruitList) do
        if game.Players.LocalPlayer.Backpack:FindFirstChild(y) or 
           game.Players.LocalPlayer.Character:FindFirstChild(y) then
            return true
        end
    end

    -- Nếu không tìm thấy bất kỳ vật phẩm nào
    return false
end

function BypassTp(P1)
pcall(function()
if not P1 or not game.Players.LocalPlayer.Character then return end
if not game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") or not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
if CheckIsRaiding() or hasBlacklistItem() then return end

local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - P1.Position).Magnitude
if distance > 2500 then
repeat task.wait(0.5)
game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P1
task.wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.Health = 0
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P1
task.wait(0.5)
distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - P1.Position).Magnitude
until distance < 2500 and game.Players.LocalPlayer.Character.Humanoid.Health > 0
end
end)
end

function Tween(P1)
if not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") or not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then return end
if not P1 then return end
local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude

if Distance <= 300 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P1
elseif Distance < 500 then
TweenSpeed = 750
elseif Distance < 750 then
TweenSpeed = 450
else
TweenSpeed = ChangeSpeed or 300
end

if getPortal(P1) then requestEntrance(getPortal(P1)) end
if BYPASSTELEPORT then BypassTp(P1) end

if game.Players.LocalPlayer.Character.Humanoid.Health <= game.Players.LocalPlayer.Character.Humanoid.MaxHealth * 0.3 then
OldY = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y
repeat task.wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, math.random(100, 750), game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
wait()
until not game.Players.LocalPlayer.Character.Humanoid or game.Players.LocalPlayer.Character.Humanoid.Health > game.Players.LocalPlayer.Character.Humanoid.MaxHealth * 0.7
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, OldY, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
wait()
end

pcall(function()
local tween = game:GetService("TweenService"):Create(
game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Distance / TweenSpeed, Enum.EasingStyle.Linear), 
{CFrame = P1})

tween:Play()
if _G.StopTween then tween:Cancel() HackerNoclipFly = false end
end)

if SameY and (CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, P1.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z).Position - P1.Position).Magnitude > 5 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, P1.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
end
end

function CancelTween(target)
    if not target then
        if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("MightHubTween") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.MightHubTween:Destroy()
        end

        -- Reset trạng thái Tween
        _G.StopTween = true
        task.wait(0.1)
        _G.StopTween = false
    end
end

function EquipTool(ToolSe)
if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) or game.Players.LocalPlayer.Character:FindFirstChild(ToolSe) then
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) or game.Players.LocalPlayer.Character:FindFirstChild(ToolSe)
wait(0.4)
game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
end
end

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

local MethodFarm = CFrame.new(0, PosY, 0)

spawn(function()
while task.wait() do
pcall(function()
if HackerNoclipFly then
if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("MightHubTween") then
local Noclip = Instance.new("BodyVelocity")
Noclip.Name = "MightHubTween"
Noclip.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
Noclip.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
Noclip.Velocity = Vector3.new(0,0,0)
Noclip.P = 9000
for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
if v:IsA("BasePart") and v.CanCollide == true then
v.CanCollide = false
end
end
end
else
if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("MightHubTween") then
game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("MightHubTween"):Destroy()
end
end
end)
end
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

function KeyPress(c9, ca)
    if c9 then
        if not ca then
            game:service("VirtualInputManager"):SendKeyEvent(true, c9, false, game)
            task.wait()
            game:service("VirtualInputManager"):SendKeyEvent(false, c9, false, game)
        elseif ca then
            game:service("VirtualInputManager"):SendKeyEvent(true, c9, false, game)
            task.wait(ca)
            game:service("VirtualInputManager"):SendKeyEvent(false, c9, false, game)
        end
    end
end

function KeyPressUi(Piggy)
game:GetService("VirtualInputManager"):SendKeyEvent(true,Piggy,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
game:GetService("VirtualInputManager"):SendKeyEvent(false,Piggy,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
end

function Click()
require(game.ReplicatedStorage.Util.CameraShaker):Stop()
game:GetService("VirtualUser"):CaptureController()
game:GetService("VirtualUser"):ClickButton1(Vector2.new(851,158),game:GetService("Workspace").Camera.CFrame)
end

local NoAttackAnimation = true
local DmgAttack = game:GetService("ReplicatedStorage").Assets.GUI:WaitForChild("DamageCounter")
local PC = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.Particle)
local RL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
local oldRL = RL.wrapAttackAnimationAsync

RL.wrapAttackAnimationAsync = function(a, b, c, d, func)
    if not NoAttackAnimation then
        return oldRL(a, b, c, 60, func)
    end

    local Hits = {}
    local Client = game.Players.LocalPlayer
    local Characters = game:GetService("Workspace").Characters:GetChildren()
    for _, v in pairs(Characters) do
        local Human = v:FindFirstChildOfClass("Humanoid")
        if v.Name ~= Client.Name and Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < 65 then
            table.insert(Hits, Human.RootPart)
        end
    end
    local Enemies = game:GetService("Workspace").Enemies:GetChildren()
    for _, v in pairs(Enemies) do
        local Human = v:FindFirstChildOfClass("Humanoid")
        if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < 65 then
            table.insert(Hits, Human.RootPart)
        end
    end
    a:Play(0.01, 0.01, 0.01)
    pcall(func, Hits)
end

function getAllBladeHits(size)
    local Hits = {}
    local Client = game.Players.LocalPlayer
    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        local Human = v:FindFirstChildOfClass("Humanoid")
        if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < size + 5 then
            table.insert(Hits, Human.RootPart)
        end
    end
    return Hits
end

function getAllBladeHitsPlayers(size)
    local Hits = {}
    local Client = game.Players.LocalPlayer
    for _, v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
        local Human = v:FindFirstChildOfClass("Humanoid")
        if v.Name ~= Client.Name and Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < size + 5 then
            table.insert(Hits, Human.RootPart)
        end
    end
    return Hits
end

local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]
local RigEven = game:GetService("ReplicatedStorage").RigControllerEvent
local AttackAnim = Instance.new("Animation")
local AttackCoolDown = 0
local cooldowntickFire = 0
local MaxFire = 1000
local FireCooldown = 0.01
local FireL = 0

function CancelCoolDown()
    local ac = CombatFrameworkR.activeController
    if ac and ac.equipped then
        AttackCoolDown = tick() + FireCooldown + ((FireL / MaxFire) * 0.3)
        RigEven:FireServer("weaponChange", ac.currentWeaponModel.Name)
        FireL = FireL + 1
        task.delay(FireCooldown + ((FireL + 0.3) / MaxFire * 0.3), function()
            FireL = FireL - 1
        end)
    end
end

function AttackFunction(typef)
    local ac = CombatFrameworkR.activeController
    require(game.ReplicatedStorage.Util.CameraShaker):Stop()
    if ac and ac.equipped then
        local bladehit = {}
        -- Lựa chọn đối tượng trúng đòn dựa trên loại tấn công
        if typef == 1 then
            bladehit = getAllBladeHits(60)
        elseif typef == 2 then
            bladehit = getAllBladeHitsPlayers(65)
        elseif typef == 4 then
            for _, v in pairs(getAllBladeHits(60)) do
                table.insert(bladehit, v)
            end
            for _, v in pairs(getAllBladeHitsPlayers(65)) do
                table.insert(bladehit, v)
            end
        else
            for _, v in pairs(getAllBladeHits(55)) do
                table.insert(bladehit, v)
            end
            for _, v in pairs(getAllBladeHitsPlayers(55)) do
                table.insert(bladehit, v)
            end
        end

        -- Thực hiện tấn công nếu có đối tượng trúng đòn
        if #bladehit > 0 then
            pcall(function() ac.attack() end)
            if tick() > AttackCoolDown then
                CancelCoolDown()
            end
            if tick() - cooldowntickFire > 0.1 then
                ac.timeToNextAttack = 0
                ac.hitboxMagnitude = 60
                pcall(function() ac.attack() end)
                cooldowntickFire = tick()
            end

            -- Thiết lập animation và gửi sự kiện tấn công
            local animId = ac.anims.basic[3] or ac.anims.basic[2]
            AttackAnim.AnimationId = animId
            local StartP = ac.humanoid:LoadAnimation(AttackAnim)
            StartP:Play(0.01, 0.01, 0.01)
            RigEven:FireServer("hit", bladehit, animId and 3 or 2, "")
            task.delay(0.01, function() StartP:Stop() end)
        end
    end
end

spawn(function()
while task.wait() do
pcall(function()
if Fast_Attack then
if game.Players.LocalPlayer.Character:FindFirstChild("Stun").Value ~= 0 then
game.Players.LocalPlayer.Character.Stun.Value = 0
end
if game.Players.LocalPlayer.Character:FindFirstChild("Busy").Value == true then
game.Players.LocalPlayer.Character.Busy.Value = false
end
end
end)
end
end)

function CheckStun()
    local stun = game.Players.LocalPlayer.Character:FindFirstChild("Stun")
    return stun and stun.Value ~= 0 or false
end

spawn(function()
while game:GetService("RunService").Stepped:Wait() do
local ac = CombatFrameworkR.activeController
if ac and ac.equipped and not CheckStun() then
if NeedAttacking and Fast_Attack then
pcall(function() AttackFunction(1) end)
elseif NeedAttacking and not Fast_Attack then
ac.hitboxMagnitude = 55
pcall(function() ac.attack() end)
elseif DamageAura then
pcall(function() AttackFunction(3) end)
elseif FatBellAttackPlayer and not FatBellAttackMob and Fast_Attack then
pcall(function() AttackFunction(2) end)
elseif FatBellAttackMob and not FatBellAttackPlayer and Fast_Attack then
pcall(function() AttackFunction(1) end)
elseif FatBellAttackMob and FatBellAttackPlayer and Fast_Attack then
pcall(function() AttackFunction(4) end)
elseif not (FatBellAttackMob and FatBellAttackPlayer) and Fast_Attack then
pcall(function() AttackFunction(3) end)
elseif not (FatBellAttackMob or FatBellAttackPlayer and Fast_Attack) then
ac.hitboxMagnitude = 65
pcall(function() ac.attack() end)
end
end
end
end)

game.Players.LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

function inmyselfss(name)
    local backpackItem = game.Players.LocalPlayer.Backpack:FindFirstChild(name)
    if backpackItem then return backpackItem end

    for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") and v.Name == name then
            return v
        end
    end
    return game.Players.LocalPlayer.Character:FindFirstChild(name)
end

task.delay(15, function()
    if hookfunction and not islclosure(hookfunction) then
        workspace._WorldOrigin.ChildAdded:Connect(function(v)
            if v.Name == 'DamageCounter' then v.Enabled = false end
        end)

        hookfunction(require(game.ReplicatedStorage.GuideModule).ChangeDisplayedNPC, function() end)

        repeat
            local success = pcall(function()
                for _, v in pairs(getupvalues(CombatFrameworkR)[2].activeController.data) do
                    if typeof(v) == 'function' then hookfunction(v, function() end) end
                end
            end)
            task.wait(1.5)
        until success
    end
end)

local Options = Fluent.Options

do

local CloseUiVipPro = false
local ToggleUI = Instance.new("ScreenGui")
local ToggleButton = Instance.new("TextButton")
local ToggleButtonHUI = Instance.new("UICorner")
ToggleUI.Name = "ToggleUI"
ToggleUI.Parent = game.CoreGui
ToggleUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ToggleUI
ToggleButton.BackgroundColor3 = Color3.fromRGB(30,20,20)
ToggleButton.BackgroundTransparency = 0.1
ToggleButton.BorderSizePixel = 0
ToggleButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.Text = "Close Ui"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 14.000
ToggleButton.Draggable = true
ToggleButton.MouseButton1Click:Connect(function()
    if not CloseUiVipPro then
        -- Thao tác khi đóng UI
        KeyPressUi(305)
        ToggleButton.Text = "Open Ui"
        CloseUiVipPro = true
    else
        -- Thao tác khi mở UI
        KeyPressUi(305)
        ToggleButton.Text = "Close Ui"
        CloseUiVipPro = false
    end
end)

---- [ Main Farm Tabs ] ----
function UseCode(Text)
game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
end
Tabs.MainFarm:AddButton({
Title = "Redeem All Codes",
Description = "",
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
UseCode("GetPranked")
end})
local WeaponChose = {"Melee", "Sword", "Blox Fruit", "Gun"}
local MainFarmSelectWeaponDropdown = Tabs.MainFarm:AddDropdown("MainFarmSelectWeaponDropdown", {
Title = "Select Weapon",
Values = WeaponChose,
Multi = false,
Default = 1,
})
MainFarmSelectWeaponDropdown:OnChanged(function(Value)
if Value == "Melee" then
for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v.ToolTip == "Melee" then
if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
SelectWeapon = v.Name
end
end
end
elseif Value == "Sword" then
for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v.ToolTip == "Sword" then
if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
SelectWeapon = v.Name
end
end
end
elseif Value == "Blox Fruit" then
for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v.ToolTip == "Blox Fruit" then
if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
SelectWeapon = v.Name
end
end
end
elseif Value == "Gun" then
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

local FarmMode = {"Level","Bone"}
local SelectFarmModeDropdown = Tabs.MainFarm:AddDropdown("MainFarmSelectFarmModeDropdown", {
Title = "Select Farm Mode",
Values = FarmMode,
Multi = false,
Default = 1,
})
SelectFarmModeDropdown:OnChanged(function(Value)
SelectFarmMode = Value
end)
Tabs.MainFarm:AddParagraph({
Title = "Farm section",
Content = ""
})
local Toggle = Tabs.MainFarm:AddToggle("MainFarmStartFarmToggle", {Title = "Start Farm", Description = "Start Farming between Level, Bone and Cake options", Default = false })
local Toggle = Tabs.MainFarm:AddToggle("MainFarmAcceptQuestToggle", {Title = "Accept Quest", Description = "For Farm Bone and Cake, May cause Reseted", Default = true })
spawn(function()
while task.wait() do
if Options.MainFarmStartFarmToggle.Value and SelectFarmMode == "Level" and Options.MainFarmAcceptQuestToggle.Value then
pcall(function()
CheckLevel()
local questTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
local questVisible = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible

if not string.find(questTitle, NameMon) or not questVisible then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
Tween(CFrameQ)
if (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
end
elseif string.find(questTitle, NameMon) and questVisible then
for _, enemy in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") and enemy.Humanoid.Health > 0 then
if enemy.Name == Ms then
repeat task.wait()
AutoHaki()
Click()
EquipTool(SelectWeapon)
Tween(enemy.HumanoidRootPart.CFrame * MethodFarm)
MonPos, MonName = enemy.HumanoidRootPart.CFrame, enemy.Name
HackerNoclipFly = true
sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
until SelectFarmMode ~= "Level" or not Options.MainFarmStartFarmToggle.Value or not enemy.Parent or enemy.Humanoid.Health <= 0 or not questVisible
HackerNoclipFly = false
end
end
end
for _, spawns in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
if string.find(spawns.Name,NameMon) then
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - spawns.Position).Magnitude >= 10 then
Tween(spawns.CFrame * MethodFarm)
end
else
Tween(CFrameMon)
end
end
end
end)
else
CancelTween(Options.MainFarmStartFarmToggle.Value)
end
end
end)

spawn(function()
while task.wait() do
if Options.MainFarmStartFarmToggle.Value and SelectFarmMode == "Bone" and Options.MainFarmAcceptQuestToggle.Value then
pcall(function()
local questTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
local questVisible = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible

if not string.find(questTitle, "Posessed Mummy") or not questVisible then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
Tween(CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313))
if (CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","HauntedQuest2",2)
end
elseif string.find(questTitle, "Posessed Mummy") and questVisible then
if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
for _, enemy in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") and enemy.Humanoid.Health > 0 then
if enemy.Name == "Reborn Skeleton" or enemy.Name == "Living Zombie" or enemy.Name == "Demonic Soul" or enemy.Name == "Posessed Mummy" then
repeat task.wait()
AutoHaki()
Click()
EquipTool(SelectWeapon)
Tween(enemy.HumanoidRootPart.CFrame * MethodFarm)
MonPos, MonName = enemy.HumanoidRootPart.CFrame, enemy.Name
HackerNoclipFly = true
sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
until SelectFarmMode ~= "Bone" or not Options.MainFarmAcceptQuestToggle.Value or not Options.MainFarmStartFarmToggle.Value or not enemy.Parent or enemy.Humanoid.Health <= 0 or not questVisible
HackerNoclipFly = false
end
end
end
else
Tween(CFrame.new(-9515.75, 174.8521728515625, 6079.40625))
end
end
end)
else
CancelTween(Options.MainFarmStartFarmToggle.Value)
end
end
end)
spawn(function()
while task.wait() do
if Options.MainFarmStartFarmToggle.Value and SelectFarmMode == "Bone" and not Options.MainFarmAcceptQuestToggle.Value then
pcall(function()
if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
for _, enemy in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") and enemy.Humanoid.Health > 0 then
if enemy.Name == "Reborn Skeleton" or enemy.Name == "Living Zombie" or enemy.Name == "Demonic Soul" or enemy.Name == "Posessed Mummy" then
repeat task.wait()
AutoHaki()
Click()
EquipTool(SelectWeapon)
Tween(enemy.HumanoidRootPart.CFrame * MethodFarm)
MonPos, MonName = enemy.HumanoidRootPart.CFrame, enemy.Name
HackerNoclipFly = true
sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
until SelectFarmMode ~= "Bone" or Options.MainFarmAcceptQuestToggle.Value or not Options.MainFarmStartFarmToggle.Value or not enemy.Parent or enemy.Humanoid.Health <= 0
HackerNoclipFly = false
end
end
end
else
Tween(CFrame.new(-9515.75, 174.8521728515625, 6079.40625))
end
end)
else
CancelTween(Options.MainFarmStartFarmToggle.Value)
end
end
end)






---- [ Sub Farm Tabs ] ----
local Toggle = Tabs.SubFarm:AddToggle("SubFarmEliteToggle", {Title = "Auto Elite", Default = false })
spawn(function()
while task.wait() do
if Options.SubFarmEliteToggle.Value then
pcall(function()
if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
for _, elite in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if elite:FindFirstChild("Humanoid") and elite:FindFirstChild("HumanoidRootPart") and elite.Humanoid.Health > 0 then
if elite.Name == "Diablo" or elite.Name == "Deandre" or elite.Name == "Urban" then
repeat task.wait()
AutoHaki()
Click()
EquipTool(SelectWeapon)
Tween(elite.HumanoidRootPart.CFrame * MethodFarm)
MonPos, MonName = elite.HumanoidRootPart.CFrame, elite.Name
HackerNoclipFly = true
sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
until elite.Humanoid.Health <= 0 or not elite.Parent or not Options.SubFarmEliteToggle.Value
HackerNoclipFly = false
end
end
end
elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Diablo") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Deandre") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Urban") then
if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame * MethodFarm)
elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame * MethodFarm)
elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame * MethodFarm)
end
else
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
end
else
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
end
end
end)
else
CancelTween(Options.SubFarmEliteToggle.Value)
end
end
end)

local Toggle = Tabs.SubFarm:AddToggle("SubFarmOpenHakiPadToggle", {Title = "Auto Open Haki Pad", Default = false })
function CheckColorRipIndra()
    local partsToActivate = {}
    for _, v in pairs(game:GetService("Workspace").Map["Boat Castle"].Summoner.Circle:GetChildren()) do
        if v:IsA("Part") and v:FindFirstChild("Part") and v.Part.BrickColor.Name == "Dark stone grey" then
            partsToActivate[v.BrickColor.Name] = v
        end
    end
    return partsToActivate
end

function ActivateColor(colorName)
    local colorMap = {
        ["Hot pink"] = "Winter Sky",
        ["Really red"] = "Pure Red",
        ["Oyster"] = "Snow White"
    }
    local mappedColor = colorMap[colorName]
    if mappedColor then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", mappedColor)
    end
end

spawn(function()
while task.wait() do
if Options.SubFarmOpenHakiPadToggle.Value then
pcall(function()
for colorName, part in pairs(CheckColorRipIndra()) do
ActivateColor(colorName)
Tween(part.CFrame) -- Giả định bạn đã định nghĩa hàm Tween
firetouchinterest(part.TouchInterest)
end
end
end)
else
CancelTween(Options.SubFarmOpenHakiPadToggle.Value) -- Hủy tween nếu không còn hoạt động
end
end
end)
local Toggle = Tabs.SubFarm:AddToggle("SubFarmSpawnKillRipIndraToggle", {Title = "Auto Spawn/Kill RipIndra", Default = false })
spawn(function()
while task.wait() do
if Options.SubFarmSpawnKillRipIndraToggle.Value then
pcall(function()
if game:GetService("Players").LocalPlayer.Character:FindFirstChild("God's Chalice") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") then
EquipTool("God's Chalice")
repeat task.wait()
Tween(game.Workspace.Map["Boat Castle"].Summoner.CFrame)
until game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form") or game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra") or game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form") or game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") or not game:GetService("Players").LocalPlayer.Character:FindFirstChild("God's Chalice") or not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") or not Options.SubFarmSpawnKillRipIndraToggle.Value
elseif game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form") or game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
if v.Name == "rip_indra True Form" or v.Name == "rip_indra" then
repeat task.wait()
AutoHaki()
Click()
EquipTool(SelectWeapon)
Tween(v.HumanoidRootPart.CFrame * MethodFarm)
MonPos, MonName = v.HumanoidRootPart.CFrame, v.Name
HackerNoclipFly = true
sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
until not Options.SubFarmSpawnKillRipIndraToggle.Value or not v.Parent or v.Humanoid.Health <= 0
HackerNoclipFly = true
end
end
end
else
Tween(CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781))
end
end)
else
CancelTween(Options.SubFarmSpawnKillRipIndraToggle.Value)
end
end
end)


---- [ Raid Tabs ] ----
local Chips = {"Flame","Ice","Quake","Light","Dark","Spider","Rumble","Magma","Buddha","Sand","Phoenix","Dough"}
spawn(function()
while wait() do
RaidPos = CFrame.new(0,70,100)
wait(0.9)
RaidPos = CFrame.new(0,50,50)
wait(0.9)
RaidPos = CFrame.new(50,65,0)
wait(0.9)
RaidPos = CFrame.new(0,65,-65)
wait(0.9)
RaidPos = CFrame.new(-70,75,0)
wait(0.9)
RaidPos = CFrame.new(0,55,-100)
wait(0.9)
end
end)
Tabs.RaidEsp:AddParagraph({
Title = "Raids section",
Content = ""
})
SelectChip = "Flame"
local RaidEspSelectChipDropdown = Tabs.RaidEsp:AddDropdown("RaidEspSelectChipDropdown", {
Title = "Select Raid Chip",
Values = Chips,
Multi = false,
Default = 1,
})
RaidEspSelectChipDropdown:SetValue("--")
RaidEspSelectChipDropdown:OnChanged(function(Value)
SelectChip = Value
end)
local Toggle = Tabs.RaidEsp:AddToggle("RaidEspBuyChipToggle", {Title = "Auto Buy Chip", Default = false })
spawn(function()
while wait() do
if Options.RaidEspBuyChipToggle.Value then
pcall(function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc","Select",SelectChip)
end)
end
end
end)
local Toggle = Tabs.RaidEsp:AddToggle("RaidEspStartRaidToggle", {Title = "Auto Start Raid", Default = false })
spawn(function()
while wait() do
if Options.RaidEspStartRaidToggle.Value then
pcall(function()
if not CheckIsRaiding() then
if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
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
end
end)
local Toggle = Tabs.RaidEsp:AddToggle("RaidEspNextRaidIslandToggle", {Title = "Auto Next Raid Islands", Default = false })
spawn(function()
while task.wait() do
if Options.RaidEspNextRaidIslandToggle.Value and CheckIsRaiding() then
pcall(function()
if getNextIsland() then
repeat wait()
Tween(getNextIsland().CFrame * RaidPos)
until not getNextIsland() or not CheckIsRaiding() or not Options.RaidEspNextRaidIslandToggle.Value
end
end)
else
CancelTween(Options.RaidEspNextRaidIslandToggle.Value)
end
end
end)
local Toggle = Tabs.RaidEsp:AddToggle("RaidEspKillAuraToggle", {Title = "Kill Aura", Default = false })
spawn(function()
while wait() do
if Options.RaidEspKillAuraToggle.Value and CheckIsRaiding() then
pcall(function()
for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
repeat task.wait()
sethiddenproperty(game:GetService('Players').LocalPlayer,"SimulationRadius",math.huge)
v.Humanoid.Health = 0
v.HumanoidRootPart.CanCollide = false
until not CheckIsRaiding() or not Options.RaidEspKillAuraToggle.Value or not v.Parent or v.Humanoid.Health <= 0
end
end
end)
end
end
end)
local Toggle = Tabs.RaidEsp:AddToggle("RaidEspAwakenToggle", {Title = "Auto Awaken", Default = false })
spawn(function()
while task.wait() do
if Options.RaidEspAwakenToggle.Value then
pcall(function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
end)
end
end
end)
local Toggle = Tabs.RaidEsp:AddToggle("RaidEspGetBelow1MFruitToggle", {Title = "Auto Get Fruit", Default = false })
spawn(function()
while task.wait() do
if Options.RaidEspGetBelow1MFruitToggle.Value then
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
Tabs.RaidEsp:AddButton({
Title = "Tween To Raid Room",
Description = "Fly to the raid room",
Callback = function()
Tween(CFrame.new(-6438.73535, 250.645355, -4501.50684))
end})
elseif Third_Sea then
Tabs.RaidEsp:AddButton({
Title = "Tween To Raid Room",
Description = "Fly to the raid room",
Callback = function()
Tween(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499e-08, -0.378151238, 4.55503146e-09, 1, 1.07377559e-07, 0.378151238, 9.7681621e-08, -0.925743818))
end})
end

Tabs.RaidEsp:AddParagraph({
Title = "Fruit picking section",
Content = ""
})
local Toggle = Tabs.RaidEsp:AddToggle("RaidEspCollectFruitToggle", {Title = "Auto Collect Fruit", Default = false })
spawn(function()
while task.wait() do
if Options.RaidEspCollectFruitToggle.Value then
pcall(function()
for _, fruit in pairs(game:GetService("Workspace"):GetChildren()) do
if string.find(fruit.Name, "Fruit") then
Tween(fruit.Handle.CFrame)
end
end
end)
else
CancelTween(Options.RaidEspCollectFruitToggle.Value)
end
end
end)
local Toggle = Tabs.RaidEsp:AddToggle("RaidEspStoreFruitToggle", {Title = "Auto Store Fruit", Default = false })
spawn(function()
while wait() do
if Options.RaidEspStoreFruitToggle.Value then
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


---- [ Islands Tabs ] ----
function TeleportSea(e)
    if e == 1 then
        if not CheckSea(e) then
            local args = {[1] = "TravelMain"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            wait()
        end
    elseif e == 2 then
        if not CheckSea(e) then
            local args = {[1] = "TravelDressrosa"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    elseif e == 3 then
        if not CheckSea(e) then
            local args = {[1] = "TravelZou"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end

Tabs.Islands:AddButton({
Title = "Join Sea 1",
Description = "",
Callback = function()
TeleportSea(1)
end})

Tabs.Islands:AddButton({
Title = "Join Sea 2",
Description = "",
Callback = function()
TeleportSea(1)
end})

Tabs.Islands:AddButton({
Title = "Join Sea 3",
Description = "",
Callback = function()
TeleportSea(3)
end})

Tabs.Islands:AddParagraph({
Title = "Teleport Islands section",
Content = ""
})

if First_Sea then
IslandList = {"--","WindMill","Marine","Middle Town","Jungle","Pirate Village","Desert","Snow Island","MarineFord","Colosseum","Sky Island 1","Sky Island 2","Sky Island 3","Prison","Magma Village","Under Water Island","Fountain City","Shank Room","Mob Island",}
elseif Second_Sea then
IslandList = {"--","The Cafe","Frist Spot","Dark Area","Flamingo Mansion","Flamingo Room","Green Zone","Factory","Colossuim","Zombie Island","Two Snow Mountain","Punk Hazard","Cursed Ship","Ice Castle","Forgotten Island","Ussop Island","Mini Sky Island",}
elseif Third_Sea then
IslandList = {"--","Mansion","Port Town","Great Tree","Castle On The Sea","MiniSky", "Hydra Island","Floating Turtle","Haunted Castle","Ice Cream Island","Peanut Island","Cake Island","Cocoa Island","Candy Island","Isle Outpost","Tiki Outpost"}
end
if First_Sea then
InstaIslandList = {"--","Sky Island 2","Sky Island 3","Under Water Island"}
elseif Second_Sea then
InstaIslandList = {"--","Mansion","Swan Room","Cursed Ship Domain","Cursed Ship Gate"}
elseif Third_Sea then
InstaIslandList = {"--","Mansion","Hydra Island","Castle On The Sea","Beautiful Room Domain","Beautiful Room Gate"}
end
local IslandsInstanceTpIslandDropdown = Tabs.Islands:AddDropdown("IslandsInstanceTeleportIslandDropdown", {
Title = "Instance Teleport Island",
Values = InstaIslandList,
Multi = false,
Default = 1
})
IslandsInstanceTpIslandDropdown:SetValue("--")
IslandsInstanceTpIslandDropdown:OnChanged(function(Value)
if CheckSea(3) then
if Value == "Mansion" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(-12464.8994140625, 374.9494934082031, -7546.80908203125))
elseif Value == "Castle On The Sea" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(-5071.19091796875, 314.550537109375, -3152.2353515625))
elseif Value == "Hydra Island" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(5743.95703125, 610.4590454101562, -268.8750915527344))
elseif Value == "Beautiful Room Domain" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656))
elseif Value == "Beautiful Room Gate" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875))
end
elseif CheckSea(2) then
if Value == "Cursed Ship Domain" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
elseif Value == "Cursed Ship Gate" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(-6508.55810546875, 89.03499603271484, -132.83953857421875))
elseif Value == "Mansion" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(-286.98907470703125, 306.1379089355469, 597.8827514648438))
elseif Value == "Swan Room" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(2284.912109375, 15.537666320800781, 905.48291015625))
end
elseif CheckSea(1) then
if Value == "Sky Island 2" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
elseif Value == "Sky Island 3" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
elseif Value == "Under Water Island" then
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
end
end
end)






---- [ Players Tabs ] ----
Tabs.Players:AddButton({
Title = "Join Pirates Team",
Description = "",
Callback = function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Pirates")
end})
Tabs.Players:AddButton({
Title = "Join Marines Team",
Description = "",
Callback = function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Marines")
end})
local Toggle = Tabs.Players:AddToggle("PlayersDisableChatMsgToggle", {Title = "Disabled Chat Message", Default = false })
local Toggle = Tabs.Players:AddToggle("PlayersDisableLeaderboardToggle", {Title = "Disabled Leaderboard", Default = false })
spawn(function()
while wait() do
pcall(function()
if Options.PlayersDisableChatMsgToggle.Value then
game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
else
game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
end
if Options.PlayersDisableLeaderboardToggle.Value then
game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
else
game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
end
end)
end
end)
local Toggle = Tabs.Players:AddToggle("PlayersTurnObservationToggle", {Title = "Auto Active Observation Haki", Default = false })
spawn(function()
while wait() do
pcall(function()
if Options.PlayersTurnObservationToggle.Value then
repeat task.wait()
if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
game:GetService('VirtualUser'):CaptureController()
game:GetService('VirtualUser'):SetKeyDown('0x65')
wait(2)
game:GetService('VirtualUser'):SetKeyUp('0x65')
end
until game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") or not Options.PlayersTurnObservationToggle.Value
end
end)
end
end)
local Toggle = Tabs.Players:AddToggle("PlayersTurnV3Toggle", {Title = "Auto Active RaceV3", Default = false })
spawn(function()
while wait() do
if Options.PlayersTurnV3Toggle.Value then
pcall(function()
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommE"):FireServer("ActivateAbility")
end)
end
end
end)
local Toggle = Tabs.Players:AddToggle("PlayersTurnV4Toggle", {Title = "Auto Active RaceV4", Default = false })
spawn(function()
while wait() do
if Options.PlayersTurnV4Toggle.Value then
pcall(function()
if game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy") and game.Players.LocalPlayer.Character.RaceEnergy.Value >= 1 and not game.Players.LocalPlayer.Character.RaceTransformed.Value then
game:GetService("Players").LocalPlayer.Character.Awakening.RemoteFunction:InvokeServer()
KeyPress("Y")
end
end)
end
end
end)
local Toggle = Tabs.Players:AddToggle("PlayersUnlockPortalToggle", {Title = "Unlock Portal", Default = false })
spawn(function()
while wait() do
pcall(function()
if Options.PlayersUnlockPortalToggle.Value then
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
if Options.PlayersUnlockPortalToggle.Value then
CastlePostoMansion = CFrame.new(-5084.8447265625, 316.48101806641, -3145.3752441406)
Castletophydra = CFrame.new(-5095.33984375, 316.48101806641, -3168.3134765625)
MansiontoCastlePos = CFrame.new(-12464.596679688, 376.30590820312, -7567.2626953125)
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






---- [ Shop Tabs ] ----
local Toggle = Tabs.Shop:AddToggle("ShopRandomBoneToggle", {Title = "Auto Random Bone", Default = false })
spawn(function()
while task.wait() do
if Options.ShopRandomBoneToggle.Value then
pcall(function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
end)
end
end
end)
local Toggle = Tabs.Shop:AddToggle("ShopRandomFruitToggle", {Title = "Auto Random Fruit", Default = false })
spawn(function()
while wait() do
if Options.ShopRandomFruitToggle.Value then
pcall(function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
end)
end
end
end)


---- [ Settings Tabs ] ----
Tabs.Settings:AddParagraph({
Title = "Tween section",
Content = ""
})
local TpSpeed = {"100","200","250","275","300","325","345","350"}
local SettingsTweenSpeedDropdown = Tabs.Settings:AddDropdown("SettingsTweenSpeedDropdown", {
Title = "Tween Speed",
Values = TpSpeed,
Multi = false,
Default = 5,
})
SettingsTweenSpeedDropdown:OnChanged(function(Value)
ChangeSpeed = Value
end)

local BTPToggle = Tabs.Settings:AddToggle("SettingsBypassTpToggle", {Title = "Bypass Teleport", Default = false })
BTPToggle:OnChanged(function()
BYPASSTELEPORT = Options.SettingsBypassTpToggle.Value
end)
local SameYTweenToggle = Tabs.Settings:AddToggle("SettingsTweenSameYToggle", {Title = "Tween Same Y", Default = false })
SameYTweenToggle:OnChanged(function()
SameY = Options.SettingsTweenSameYToggle.Value
end)

Tabs.Settings:AddParagraph({
Title = "Fast Attack section",
Content = ""
})
local FatBellDelayMode = {"Normal Attack", "Fast Attack", "Super Attack", "FatBell Attack"}
local SettingsFastAttackModeDropdown = Tabs.Settings:AddDropdown("SettingsFastAttackModeDropdown", {
Title = "Fast Attack Mode",
Values = FatBellDelayMode,
Multi = false,
Default = 4,
})
SettingsFastAttackModeDropdown:OnChanged(function(Value)
if Value == "Normal Attack" then
FireCooldown = 0.1
elseif Value == "Fast Attack" then
FireCooldown = 0.07
elseif Value == "Super Attack" then
FireCooldown = 0.04
elseif Value == "FatBell Attack" then
FireCooldown = 0.02
end
end)

local FatBellToggle = Tabs.Settings:AddToggle("SettingsFastAttackToggle", {Title = "Fast Attack", Default = true })
FatBellToggle:OnChanged(function()
Fast_Attack = Options.SettingsFastAttackToggle.Value
end)
local FatBellMobToggle = Tabs.Settings:AddToggle("SettingsFastAttackMobToggle", {Title = "Attack Mob", Default = true })
FatBellMobToggle:OnChanged(function()
FatBellAttackMob = Options.SettingsFastAttackMobToggle.Value
end)
local FatBellPlayerToggle = Tabs.Settings:AddToggle("SettingsFastAttackPlayerToggle", {Title = "Attack Player", Default = true })
FatBellPlayerToggle:OnChanged(function()
FatBellAttackPlayer = Options.SettingsFastAttackPlayerToggle.Value
end)
local Toggle = Tabs.Settings:AddToggle("SettingsStopClickToggle", {Title = "Stop Clicking", Default = false })
spawn(function()
game:GetService("RunService").RenderStepped:Connect(function()
if not Options.SettingsStopClickToggle.Value then
pcall(function()
game:GetService("VirtualUser"):CaptureController()
game:GetService("VirtualUser"):ClickButton1(Vector2.new(851,158),game:GetService("Workspace").Camera.CFrame)
end)
end
end)
end)


Tabs.Settings:AddParagraph({
Title = "Bring mob section",
Content = ""
})
local BringMobMode = {"Low Bring","Normal Bring","Super Bring"}
local SettingsBringMobModeDropdown = Tabs.Settings:AddDropdown("SettingsBringMobModeDropdown", {
Title = "Bring Mob Mode",
Values = BringMobMode,
Multi = false,
Default = 1,
})
SettingsBringMobModeDropdown:OnChanged(function(Value)
if Value == "Low Bring" then
BringModeValue = 300
elseif Value == "Normal Bring" then
BringModeValue = 450
elseif Value == "Super Bring" then
BringModeValue = 750
end
end)
local Toggle = Tabs.Settings:AddToggle("SettingsBringMobToggle", {Title = "Bring Mob", Default = true })
spawn(function()
while task.wait(.1) do
if Options.SettingsBringMobToggle.Value then
pcall(function()
for _, enemy in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if enemy.Name == MonName and (enemy.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= BringModeValue then

-- Cấu hình HumanoidRootPart
enemy.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
enemy.HumanoidRootPart.CanCollide = false
enemy.HumanoidRootPart.Transparency = 1
enemy.HumanoidRootPart.CFrame = MonPos

-- Thay đổi trạng thái Humanoid
enemy.Humanoid:ChangeState(14)
enemy.Humanoid.JumpPower = 0
enemy.Humanoid.WalkSpeed = 0

-- Hủy Animator (nếu tồn tại)
if enemy.Humanoid:FindFirstChild("Animator") then
enemy.Humanoid.Animator:Destroy()
end
end
end
end)
end
end
end)
task.spawn(function()
while task.wait() do
if setscriptable then
setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
end
if sethiddenproperty then
sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
end
end
end)

Tabs.Settings:AddParagraph({
Title = "Other section",
Content = ""
})
local Toggle = Tabs.Settings:AddToggle("SettingsWhiteScreenToggle", {Title = "White Screen", Default = false })
spawn(function()
while wait() do
if Options.SettingsWhiteScreenToggle.Value then
game:GetService("RunService"):Set3dRenderingEnabled(false)
else
game:GetService("RunService"):Set3dRenderingEnabled(true)
end
end
end)
local Toggle = Tabs.Settings:AddToggle("SettingsBlackScreenToggle", {Title = "Black Screen", Default = false })
spawn(function()
while wait() do
if Options.SettingsBlackScreenToggle.Value then
game:GetService("Players").LocalPlayer.PlayerGui.Main.Blackscreen.Size = UDim2.new(500, 0, 500, 500)
else
game:GetService("Players").LocalPlayer.PlayerGui.Main.Blackscreen.Size = UDim2.new(1, 0, 500, 500)
end
end
end)
local Toggle = Tabs.Settings:AddToggle("SettingsNoNotificationToggle", {Title = "Disable Notification", Default = false })
spawn(function()
while wait() do
if Options.SettingsNoNotificationToggle.Value then
game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = false
else
game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = true
end
end
end)
local Toggle = Tabs.Settings:AddToggle("SettingsNoDMGCounterToggle", {Title = "Disable Damage Counter", Default = false })
spawn(function()
while wait() do
if Options.SettingsNoDMGCounterToggle.Value then
game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false
else
game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = true
end
end
end)
local Toggle = Tabs.Settings:AddToggle("SettingsNoFogToggle", {Title = "No Fog", Default = false })
spawn(function()
while wait() do
pcall(function()
if Options.SettingsNoFogToggle.Value then
game.Lighting.FogEnd = 9e9
game:GetService("Lighting").LightingLayers:Destroy()
else
game.Lighting.FogEnd = 2500
end
end)
end
end)

Tabs.Settings:AddParagraph({
Title = "Other 2 section",
Content = ""
})
local Toggle = Tabs.Settings:AddToggle("SettingsWalkOnWaterToggle", {Title = "Walk On Water", Default = true })
spawn(function()
while task.wait() do
pcall(function()
if Options.SettingsWalkOnWaterToggle.Value then
game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,112,1000)
else
game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,80,1000)
end
end)
end
end)
Tabs.Settings:AddButton({
Title = "Delete Lava",
Description = "",
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
end})
local Toggle = Tabs.Settings:AddToggle("SettingsNoEffectToggle", {Title = "Remove Effect", Default = false })
spawn(function()
while wait() do
pcall(function()
if Options.SettingsNoEffectToggle.Value then
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Death") then
game:GetService("ReplicatedStorage").Effect.Container.Death.Transparency = 1
end
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Respawn") then
game:GetService("ReplicatedStorage").Effect.Container.Respawn.Transparency = 1
end
if game:GetService("ReplicatedStorage").Assets:FindFirstChild("SlashHit") then
game:GetService("ReplicatedStorage").Assets.SlashHit.Transparency = 1
end
end
end)
end
end)
spawn(function()
while wait() do
pcall(function()
if Options.SettingsNoEffectToggle.Value then
for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"]:GetChildren()) do
if v.Name == ("CurvedRing") or v.Name == ("SlashHit") or v.Name == ("SwordSlash") or v.Name == ("SlashTail") or v.Name == ("Sounds") then
v.Transparency = 1
end
end
end
end)
end
end)
end

Window:SelectTab(1)