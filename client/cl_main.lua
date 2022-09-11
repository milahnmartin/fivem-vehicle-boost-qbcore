heistInteractNpc = nil
QBCore = exports['qb-core']:GetCoreObject()
-- AddEventHandler('onResourceStart', function(resourceName)
--   if (GetCurrentResourceName() ~= resourceName) then
--     return
--   end
--   Citizen.CreateThread(function()
--     RequestModel( -1613485779)
--     while not HasModelLoaded( -1613485779) do
--         Wait(0)
--     end
--     local heistInteractNpc = CreatePed(3,-1613485779, 589.19, -3282.03, 5.07, false, true)
--     PlaceObjectOnGroundProperly(heistInteractNpc)
--     FreezeEntityPosition(heistInteractNpc, true)
--     local player = GetPlayerPed(-1)
--     local pos = GetEntityCoords(heistInteractNpc, 0)
--     while true do
--     Wait(0)
--     local playerloc = GetEntityCoords(player, 0)
--     local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
--     if distance <= 2 then
--       checkKeyCard(player,heistInteractNpc)
--       Wait(10000)
--     end
--     end
--   end)
-- end)

Citizen.CreateThread(function()
  Wait(5000)
  while true do
    Wait(1000)
    local playerloc = GetEntityCoords(GetPlayerPed(-1), 0)
    local distance = GetDistanceBetweenCoords(589.19, -3282.03, 5.07, playerloc['x'], playerloc['y'], playerloc['z'], true)
    if distance <= 40 then
      RequestModel(732742363)
    while not HasModelLoaded(732742363) do
        Wait(0)
    end
    heistInteractNpc = CreatePed(3,732742363, 589.19, -3282.03, 5.07, false, true)
    PlaceObjectOnGroundProperly(heistInteractNpc)
    FreezeEntityPosition(heistInteractNpc, true)
    SetEntityInvincible(heistInteractNpc, true)
    SetPedCanRagdoll(heistInteractNpc, false)
    SetPedCanRagdollFromPlayerImpact(heistInteractNpc, false)
    SetPedFleeAttributes(heistInteractNpc, 0, 0)
    SetEveryoneIgnorePlayer(heistInteractNpc, true)
    break
    end
  end
end)

Citizen.CreateThread(function()
  Wait(5000)
  while true do
  local pos = GetEntityCoords(heistInteractNpc, 0)
  local playerloc = GetEntityCoords(GetPlayerPed(-1), 0)
  local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
  Wait(0)
  if distance <= 2 then
    checkKeyCard(GetPlayerPed(-1),heistInteractNpc)
    Wait(10000)
  end
end
end)


function checkKeyCard(source,ped)
  local keycard_present = QBCore.Functions.HasItem("ultrafy-heist-key")
  if keycard_present then
    QBCore.Functions.Notify("I see you have what I'm looking for!", "success")
    QBCore.Functions.Notify("Press E to Start", "primary")
    Citizen.CreateThread(function()
      local pos = GetEntityCoords(ped, 0)
      local playerloc = GetEntityCoords(source, 0)
      local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
        while distance <= 2 do
          Wait(0)
          if(IsControlJustPressed(1, 46)) then
            print("PRESSED")
            configureHeistResources(GetPlayerPed(-1))
          end
        end
    end)
    return
  end
  QBCore.Functions.Notify("Man tells you to get out of here", "error")
end

function configureHeistResources(source)
  local PlayerTable = nil
  QBCore.Functions.GetPlayerData(function(PlayerData)
    PlayerTable = PlayerData
  end)
  TriggerServerEvent("qb-heist:addPlayer",PlayerTable.citizenid)
  -- RequestModel(0xEF813606)
  -- while not HasModelLoaded(0xEF813606) do
  --   Wait(0)
  -- end
  -- local heistBoat1 = CreateVehicle(0xEF813606,580.00, -3231.67, -0.32,0,true,false)
  -- local heistBoat2 = CreateVehicle(0xEF813606,579.32, -3248.12, -0.66,0,true,false)
  -- SetVehicleOnGroundProperly(heistBoat1)
  -- SetVehicleOnGroundProperly(heistBoat2)
  -- SetPedIntoVehicle(source, heistBoat1, -1)
  -- TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(heistBoat1))
  -- TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(heistBoat2))
  -- SetVehicleEngineOn(heistBoat1, true, true)
  -- SetVehicleEngineOn(heistBoat2, true, true)
  -- TriggerEvent("qb-admin:client:maxmodVehicle")
  -- TriggerServerEvent("qb-ultrafy-heist:heistCounter",{heistBoat1,heistBoat2})
end



