QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('qb-heist:addPlayer')
AddEventHandler("qb-heist:addPlayer",function(source)
  local result = MySQL.query.await('SELECT COUNT(*) FROM ultrafy_heist_data WHERE userStarted = ?', { source })
  if result[1] ~= nil then
    print(result[1]['COUNT(*)'])
    QBCore.Functions.Notify(QBCore.Functions.GetPlayerByCitizenId(source), "You have already started this heist.","error",20)
    return
  end
  print("PENIS")
  MySQL.insert('INSERT INTO ultrafy_heist_data(userStarted,TimeStarted,CurrentlyActive)VALUES(?,TIME(NOW()),?)', {source,true})
end)