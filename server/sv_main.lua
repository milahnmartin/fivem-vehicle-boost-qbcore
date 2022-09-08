QBCore = exports['qb-core']:GetCoreObject()
BoostingConfig = BoostingConfig

RegisterNetEvent('qb-vehicleboost:NotifyUser',function(message, type)
    QBCore.Functions.Notify(message, type)
end)



QBCore.Functions.CreateUseableItem("boosting_laptop", function(source, item)
  local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-vehicleboosting:trigger-laptop", source, item.name)
end)


RegisterNetEvent('qb-boosting:test', function(data)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
  print(BoostingConfig)
--   MySQL.insert('INSERT INTO boosting_players (citizenid, license, name) VALUES (?, ?, ?)', {
--     Player.PlayerData.citizenid,
--     Player.PlayerData.license,
--     Player.PlayerData.name,
 
-- })
end)