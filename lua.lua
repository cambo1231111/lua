-- Orion GUI AutoFarm UI

-- Load Orion Library
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Create window
local Window = OrionLib:MakeWindow({
    Name = "AutoFarm UI",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "AutoFarmConfig"
})

-- Create tab
local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Create section
local Section = Tab:AddSection({
    Name = "AutoFarm Controls"
})

-- Auto Click toggle
local autoClick = false
Tab:AddToggle({
    Name = "Auto Click",
    Default = false,
    Callback = function(Value)
        autoClick = Value
    end
})

-- Auto Rebirth toggle
local autoRebirth = false
Tab:AddToggle({
    Name = "Auto Rebirth",
    Default = false,
    Callback = function(Value)
        autoRebirth = Value
    end
})

-- Click loop
task.spawn(function()
    while true do
        task.wait(0.1)
        if autoClick then
            pcall(function()
                game:GetService("ReplicatedStorage").Events.Click4:FireServer()
            end)
        end
    end
end)

-- Rebirth loop
task.spawn(function()
    while true do
        task.wait(0.1)
        if autoRebirth then
            pcall(function()
                game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(3)
            end)
        end
    end
end)

-- Finish UI
OrionLib:Init()
