local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local server_url = "http://127.0.0.1:5000/update"
local teamcheck = true
local showteamcolor = false -- be careful, some games that have lobbys, spectating options and more might put the player down the map so you could see some circles that aren't visible to the game
local updatespeed = 0.02 -- lower means faster, higher means slower

local function PlayersData()
    local data = {}
    local localRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    
    if not localRoot then
        return data
    end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local sameTeam = false
            if LocalPlayer.Team and player.Team then
                sameTeam = LocalPlayer.Team == player.Team
            end
            
            local shouldShow = true
            if teamcheck and sameTeam then
                shouldShow = false
            end
            
            if shouldShow then
                local character = player.Character
                if character then
                    local root = character:FindFirstChild("HumanoidRootPart")
                    if root then
                        local localRelative = Camera.CFrame:PointToObjectSpace(root.Position)
                        local color = {255, 59, 59}
                        if showteamcolor and player.Team then
                            local tc = player.Team.TeamColor.Color
                            color = {math.floor(tc.R * 255), math.floor(tc.G * 255), math.floor(tc.B * 255)}
                        end
                        table.insert(data, {
                            name = player.Name,
                            x = localRelative.X,
                            y = localRelative.Y,
                            z = localRelative.Z,
                            r = color[1],
                            g = color[2],
                            b = color[3]
                        })
                    end
                end
            end
        end
    end
    
    return data
end

local function SendData()
    local data = PlayersData()
    local jsonData = HttpService:JSONEncode(data)
    
    if request then
        pcall(function()
            request({
                Url = server_url,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = jsonData
            })
        end)
    elseif http_request then
        pcall(function()
            http_request({
                Url = server_url,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = jsonData
            })
        end)
    end
end

while task.wait(updatespeed) do
    pcall(SendData)
end