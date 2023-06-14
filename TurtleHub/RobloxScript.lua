-- special thx to riri#5671 and my brother too

--[[
    release: 14/06/2023
    last update: 14/06/2023 (12:32 PM)
]]

local client = game.Players.LocalPlayer
local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})

function showinfo(av,hv)
OrionLib:MakeNotification({
        Name = av,
        Content = hv,
        Image = "rbxassetid://0",
        Time = 5
    })
end

local T1 = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Egg",
Icon = "rbxassetid://0",
PremiumOnly = false
})

function Blacklist(name)
  return name
end

function GetName(name)
    return name
end

local workspace = game:GetService("Workspace")

local CreateZoneTable = {}
local ReturnWalls = {}
local TableZones = {}
local Egg = {}
--[[
for _,v in pairs(table:GetChildren()) do
    table.insert(TableZones, v.Name)
  end
--]]
function CreateTable(tablefunc, localTable)
for _,v in pairs(tablefunc:GetChildren()) do
    table.insert(localTable, v.Name)
  end
end

CreateTable(workspace.Eggs, Egg)

function pet(name,bl_1,bl_2,bl_3,bl_4)
local args = {
    [1] = GetName(name),
    [3] = {
        [GetName(name)] = {
            [1] = Blacklist(bl_1),
            [2] = Blacklist(bl_2),
            [3] = Blacklist(bl_3),
            [4] = Blacklist(bl_4)
        }
    }
}

game:GetService("ReplicatedStorage").PetSystem.Remotes.HatchPet:FireServer(unpack(args))
game:GetService("ReplicatedStorage").PetSystem.Remotes.EquipBest:FireServer()
end

local TargetLvl = "Lvl2Target"
local TargetType = "Target2"

function Trainner(zoneselected, partchanged)
    if zoneselected == "Zone1" then
        showinfo("Oops:)","try another zone! :)")
    end
    if zoneselected == "Zone2" then
        TargetLvl = "Lvl2Target"
        TargetType = "Target2"
    end
    if zoneselected == "Zone3" then
        TargetLvl = "Lvl3Target"
        TargetType = "Target3"
    end
    if zoneselected == "Zone4" then
        TargetLvl = "Lvl4Target"
        TargetType = "Target4"
    end
    if zoneselected == "Zone5" then
        TargetLvl = "Lvl5Target"
        TargetType = "Target5"
    end
    if zoneselected == "Zone6" then
        TargetLvl = "Lvl6Target"
        TargetType = "Target6"
    end
    if zoneselected == "Zone7" then
        TargetLvl = "Lvl7Target"
        TargetType = "Target7"
    end
    if zoneselected == "Zone8" then
        TargetLvl = "Lvl8Target"
        TargetType = "Target8"
    end
    if zoneselected == "Zone9" then
        TargetLvl = "Lvl9Target"
        TargetType = "Target9"
    end
    if zoneselected == "Zone10" then
        TargetLvl = "Lvl10Target"
        TargetType = "Target10"
    end
    if zoneselected == "Zone11" then
        TargetLvl = "Lvl11Target"
        TargetType = "Target11"
    end
    if zoneselected == "Zone12" then
        TargetLvl = "Lvl12Target"
        TargetType = "Target12"
    end
    if zoneselected == "Zone13" then
        TargetLvl = "Lvl13Target"
        TargetType = "Target13"
    end
    if zoneselected == "Zone14" then
        TargetLvl = "Lvl14Target"
        TargetType = "Target14"
    end
    if zoneselected == "Zone15" then
        TargetLvl = "Lvl15Target"
        TargetType = "Target15"
    end
    if zoneselected == "Zone16" then
        TargetLvl = "Lvl16Target"
        TargetType = "Target16"
    end
    if zoneselected == "Zone17" then
        TargetLvl = "Lvl17Target"
        TargetType = "Target17"
    end
    if zoneselected == "Zone18" then
        TargetLvl = "Lvl18Target"
        TargetType = "Target18"
    end
    if zoneselected == "Zone19" then
        TargetLvl = "Lvl19Target"
        TargetType = "Target17"
    end
    
local args = {
    [1] = client.Character:FindFirstChild(getEquippedWeapon(client)),
    [2] = {
        ["p"] = Vector3.new(0,0,0),
        ["pid"] = 1,
        ["part"] = workspace.Targets["Targets" .. tostring(zoneselected)][TargetLvl][TargetType]:FindFirstChild("Meshes/Target_Cylinder (1)"),
        ["t"] = 0.8021890526669664,
        ["maxDist"] = 30.89893341064453,
        ["m"] = Enum.Material.Plastic,
        ["sid"] = 15,
        ["d"] = 30.975276947021484,
        ["n"] = Vector3.new(0,0,0)
    }
}

game:GetService("ReplicatedStorage").WeaponSystem.Remotes.WeaponHit:FireServer(unpack(args))
end

-- local client = game.Players.LocalPlayer

function getEquippedWeapon(player)
        local char = player.Character
        local weapon = char and char:FindFirstChildWhichIsA("Tool")
    
        if weapon ~= nil then
            return weapon.Name
        else
            return "Nothing"
        end
    end

T1:AddDropdown({
  Name = "Select Zone",
  Default = "",
  Options = {"Zone1","Zone2","Zone3","Zone4","Zone5","Zone6","Zone7","Zone8","Zone9","Zone10","Zone11","Zone12","Zone13","Zone14","Zone15","Zone16","Zone17","Zone18","Zone19"},
  Callback = function(Value)
     _G.ReturnZones = Value
      CreateTable(workspace.Walls[_G.ReturnZones], ReturnWalls)
  end    
})

T1:AddToggle({
Name = "Auto Shoot wall",
Default = false,
Callback = function(Value)
      _G.Shoot = Value
      while wait() do
        if _G.Shoot == false then break end
        local args = {
             [1] = client.Character:FindFirstChild(getEquippedWeapon(client)),
             [2] = {
                 ["p"] = Vector3.new(0,0,0),
                 ["pid"] = 1,
                 ["part"] = workspace.Walls[_G.ReturnZones][ReturnWalls[math.random(1, #ReturnWalls)]],
                 ["t"] = 0.6423321066551326,
                 ["maxDist"] = 48.076534271240234,
                 ["m"] = Enum.Material.Plastic,
                 ["sid"] = 15,
                 ["d"] = 48.21862030029297,
                 ["n"] = Vector3.new(0, 0, 0)
           }
       }

      game:GetService("ReplicatedStorage").WeaponSystem.Remotes.WeaponHit:FireServer(unpack(args))
    end
end
})

T1:AddToggle({
Name = "Auto Train",
Default = false,
Callback = function(Value)
      _G.Train = Value
      while wait() do
        if _G.Train == false then break end
        Trainner(_G.ReturnZones)
    end
end
})

T1:AddToggle({
Name = "Auto Rebirth",
Default = false,
Callback = function(Value)
      _G.Reb = Value
      while wait() do
        if _G.Reb == false then break end
        game:GetService("ReplicatedStorage").RebirthSystem.Remotes.Rebirth:FireServer()
    end
end
})

T1:AddToggle({
Name = "Auto Claim Free Gift",
Default = false,
Callback = function(Value)
      _G.Gift = Value
      while wait() do
        if _G.Gift == false then break end
        game:GetService("ReplicatedStorage").GiftSystem.Remotes.Claim:FireServer(1)
        game:GetService("ReplicatedStorage").GiftSystem.Remotes.Claim:FireServer(2)
        game:GetService("ReplicatedStorage").GiftSystem.Remotes.Claim:FireServer(3)
        game:GetService("ReplicatedStorage").GiftSystem.Remotes.Claim:FireServer(4)
        game:GetService("ReplicatedStorage").GiftSystem.Remotes.Claim:FireServer(5)
        game:GetService("ReplicatedStorage").GiftSystem.Remotes.Claim:FireServer(6)
        game:GetService("ReplicatedStorage").GiftSystem.Remotes.Claim:FireServer(7)
        game:GetService("ReplicatedStorage").GiftSystem.Remotes.Claim:FireServer(8)
        game:GetService("ReplicatedStorage").GiftSystem.Remotes.Claim:FireServer(9)
        game:GetService("ReplicatedStorage").GiftSystem.Remotes.Claim:FireServer(10)
        game:GetService("ReplicatedStorage").GiftSystem.Remotes.Claim:FireServer(11)
        game:GetService("ReplicatedStorage").GiftSystem.Remotes.Claim:FireServer(12)
    end
end
})

T1:AddToggle({
Name = "Auto Claim Daily Chest",
Default = false,
Callback = function(Value)
      _G.Daily = Value
      while wait() do
        if _G.Daily == false then break end
        game:GetService("ReplicatedStorage").DailyChest.Remotes.Claim:FireServer()
    end
end
})

T1:AddToggle({
Name = "Auto Spin",
Default = false,
Callback = function(Value)
      _G.Spin = Value
      while wait() do
        if _G.Spin == false then break end
        game:GetService("ReplicatedStorage").SpinSystem.Remotes.Spin:FireServer()
    end
end
})

T2:AddDropdown({
  Name = "Select Egg",
  Default = "?",
  Options = Egg,
  Callback = function(Value)
    _G.EggName = Value
   end    
})

T2:AddTextbox({
   Name = "Blacklist pet",
   Default = "Pet 1",
   TextDisappear = true,
   Callback = function(Value)
     _G.blacklist_1 = Value or "Cat"
   end  
})

T2:AddTextbox({
   Name = "Blacklist pet",
   Default = "Pet 2",
   TextDisappear = true,
   Callback = function(Value)
     _G.blacklist_2 = Value or "Dog"
   end  
})

T2:AddTextbox({
   Name = "Blacklist pet",
   Default = "Pet 3",
   TextDisappear = true,
   Callback = function(Value)
     _G.blacklist_3 = Value or "Bunny"
   end  
})

T2:AddTextbox({
   Name = "Blacklist pet",
   Default = "Pet 4",
   TextDisappear = true,
   Callback = function(Value)
     _G.blacklist_4 = Value or "Fox"
   end  
})

T2:AddToggle({
Name = "Auto Hatch",
Default = false,
Callback = function(Value)
      _G.Egg = Value
      while wait() do
        if _G.Egg == false then break end
        pet(_G.EggName,_G.blacklist_1,_G.blacklist_2,_G.blacklist_3,_G.blacklist_4)
    end
end
})
