local QBCore = exports['qb-core']:GetCoreObject()


local ItemList = {
    ["cokebaggy"] = "cokebaggy"
}

local DrugList = {
    ["crack_baggy"] = "crack_baggy"
}


RegisterServerEvent('qb-crack:server:processcrack')
AddEventHandler('qb-crack:server:processcrack', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cokebaggy = Player.Functions.GetItemByName('cokebaggy')

    if Player.PlayerData.items ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if cokebaggy ~= nil then
                if ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    if Player.PlayerData.items[k].name == "cokebaggy" and Player.PlayerData.items[k].amount >= 2 then 
                        Player.Functions.RemoveItem("cokebaggy", 2)
                        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cokebaggy'], "remove")

                        TriggerClientEvent("qb-crack:client:grindleavesMinigame", src)
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You dont have enough Coke", 'error')
                        break
                    end
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You do not have any Coke", 'error')
                break
            end
        end
    end
end)

RegisterServerEvent('qb-crack:server:getcrack')
AddEventHandler('qb-crack:server:getcrack', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem("crack_baggy", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['crack_baggy'], "add")
end)

