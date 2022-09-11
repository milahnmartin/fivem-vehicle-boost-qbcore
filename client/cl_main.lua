local laptopVisible = false
-- array = QBCore.PlayerData.metadata["inventory"]
RegisterNetEvent("qb-vehicleboosting:trigger-laptop")
AddEventHandler("qb-vehicleboosting:trigger-laptop", function(itemName)
  QBCore = exports['qb-core']:GetCoreObject()
  local donglePresent = QBCore.Functions.HasItem('boosting_dongle')
  laptopVisible = not laptopVisible
  if laptopVisible then
    local PlayerPed = PlayerPedId()
    local tabletObject = CreateObject(GetHashKey('prop_cs_tablet'), GetEntityCoords(PlayerPed), 1, 1, 1)
    AttachEntityToEntity(tabletObject, PlayerPed, GetPedBoneIndex(PlayerPed, 28422), 0.0, 0.0, 0.03, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
    RequestAnimDict("amb@world_human_seat_wall_tablet@female@base")
    while (not HasAnimDictLoaded("amb@world_human_seat_wall_tablet@female@base")) do Citizen.Wait(0) end
    TaskPlayAnim(PlayerPed, "amb@world_human_seat_wall_tablet@female@base", "base", 8.0, 1.0, -1, 49, 1.0, true,true,true)
    QBCore.Functions.Notify("Boosting Laptop Opened", "primary")
    SetNuiFocus(true, true)
    SendNUIMessage({
      action = 'open',
      donglePresent = donglePresent,
      tabletObj = tabletObject,
      pedId = PlayerPed,
    })
  end
end)

RegisterCommand("boosting:toggle",function(source,args)
  QBCore = exports['qb-core']:GetCoreObject()
  laptopVisible = not laptopVisible
  if laptopVisible then
    QBCore.Functions.Notify("Boosting Laptop Opened", "primary")
    SetNuiFocus(true, true)
    SendNUIMessage({
      action = 'open',
    })
  else
    QBCore.Functions.Notify("Boosting Laptop Closed", "success")
    SetNuiFocus(false, false)
    SendNUIMessage({
      action = 'close'
    })
  end
end)


RegisterNUICallback('qb-vehicleboosting:close',function(data,cb)
  DeleteEntity(data.tabletObject)
  ClearPedTasks(data.pedId)
  laptopVisible = false
  SetNuiFocus(false, false)
  cb({message='closed'})
end)



