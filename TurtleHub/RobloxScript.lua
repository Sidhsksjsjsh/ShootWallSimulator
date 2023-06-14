-- special thx to riri#5671 and my brother too

--[[
    release: 14/06/2023
    last update: 14/06/2023 (12:32 PM)
]]

local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})

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
function CreateTable(table, localTable)
for _,v in pairs(table:GetChildren()) do
    table.insert(localTable, v.Name)
  end
end

-- CreateTable(workspace.Eggs, Egg)

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

local client = game.Players.LocalPlayer

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
                 ["part"] = workspace.Walls[_G.ReturnZones][ReturnWalls],
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
        local args = {
             [1] = client.Character:FindFirstChild(getEquippedWeapon(client)),
             [2] = {
                 ["p"] = Vector3.new(0,0,0),
                 ["pid"] = 1,
                 ["part"] = workspace.Targets.TargetsZone1.NoobTarget2.Target1:FindFirstChild("Meshes/Target_Cylinder.001 (1)"),
                 ["d"] = 35.75101089477539,
                 ["maxDist"] = 35.737483978271484,
                 ["m"] = Enum.Material.Plastic,
                 ["sid"] = 12,
                 ["t"] = 0.6319174430296733,
                 ["n"] = Vector3.new(0,0,0)
           }
       }

      game:GetService("ReplicatedStorage").WeaponSystem.Remotes.WeaponHit:FireServer(unpack(args))
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
