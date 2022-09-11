local contractsConfig = json.decode(LoadResourceFile(GetCurrentResourceName(), "./contracts.json"))
QBCore = exports['qb-core']:GetCoreObject()
Citizen.CreateThread(function()
  MySQL.query('TRUNCATE TABLE `availible_boosting_contracts`', {})
  Citizen.Wait(2000)
  generateSPlusContracts()
  generateSContracts()
  generateAPlusContracts()
  generateAContracts()
  generateBContracts()
  generateCContracts()
  Citizen.Wait(1000)
  print("[QB-VEHICLEBOOST - ".."^2"..calcRemainingContracts().." ^1contracts ^4left]")
end)
-- GET ALL CITIZEN ID's THATS ONLINE' for i = 1, #Players do
  --   print(Players[i].PlayerData.citizenid)
  -- end
function generateSPlusContracts()
  local amountOfContracts = #(contractsConfig["S+"].contracts)
  randomContract = contractsConfig["S+"].contracts[math.random(1,amountOfContracts)]
    MySQL.insert('INSERT INTO availible_boosting_contracts (model,xpGain,xpLost,spawnLocation,deliveryLocation,requireSecurityDevice,notifyPolice,contractType) VALUES (?, ?, ?, ?, ?, ?, ?,?)', {
      randomContract.model,
      contractsConfig["S+"].successfull_xp,
      contractsConfig["S+"].unsuccessfull_xp,
      json.encode(randomContract.spawnLocation),
      json.encode(randomContract.deliveryLocation),
      randomContract.requiresSecurityDevice,
      randomContract.policeNotify,
      "S+"
    })
  print("^4 Generated S+ Contracts QB-VEHICLEBOOSTING")
end
function generateSContracts()
  local SContracts = {}
  local amountOfContracts = #(contractsConfig["S"].contracts)
  for i = 1 , 2 do
    local randomContract = contractsConfig["S"].contracts[math.random(1,amountOfContracts)]
    if not SContracts[randomContract.model] then
      MySQL.insert('INSERT INTO availible_boosting_contracts (model,xpGain,xpLost,spawnLocation,deliveryLocation,requireSecurityDevice,notifyPolice,contractType) VALUES (?, ?, ?, ?, ?, ?, ?,?)', {
        randomContract.model,
        contractsConfig["S"].successfull_xp,
        contractsConfig["S"].unsuccessfull_xp,
        json.encode(randomContract.spawnLocation),
        json.encode(randomContract.deliveryLocation),
        randomContract.requiresSecurityDevice,
        randomContract.policeNotify,
        "S"
      })
      SContracts[randomContract.model] = true
  else
    randomContract = contractsConfig["S"].contracts[math.random(1,amountOfContracts)]
    MySQL.insert('INSERT INTO availible_boosting_contracts (model,xpGain,xpLost,spawnLocation,deliveryLocation,requireSecurityDevice,notifyPolice,contractType) VALUES (?, ?, ?, ?, ?, ?, ?,?)', {
      randomContract.model,
      contractsConfig["S"].successfull_xp,
      contractsConfig["S"].unsuccessfull_xp,
      json.encode(randomContract.spawnLocation),
      json.encode(randomContract.deliveryLocation),
      randomContract.requiresSecurityDevice,
      randomContract.policeNotify,
      "S"
    })
   end
  end
  print("^4 Generated S Contracts QB-VEHICLEBOOSTING")
end
function generateAPlusContracts()
  local APlusContracts = {}
  local amountOfContracts = #(contractsConfig["A+"].contracts)
  for i = 1 , 5 do
    local randomContract = contractsConfig["A+"].contracts[math.random(1,amountOfContracts)]
    if not APlusContracts[randomContract.model] then
      MySQL.insert('INSERT INTO availible_boosting_contracts (model,xpGain,xpLost,spawnLocation,deliveryLocation,requireSecurityDevice,notifyPolice,contractType) VALUES (?, ?, ?, ?, ?, ?, ?,?)', {
        randomContract.model,
        contractsConfig["A+"].successfull_xp,
        contractsConfig["A+"].unsuccessfull_xp,
        json.encode(randomContract.spawnLocation),
        json.encode(randomContract.deliveryLocation),
        randomContract.requiresSecurityDevice,
        randomContract.policeNotify,
        "A+"
      })
      APlusContracts[randomContract.model] = true
  else
    randomContract = contractsConfig["A+"].contracts[math.random(1,amountOfContracts)]
    MySQL.insert('INSERT INTO availible_boosting_contracts (model,xpGain,xpLost,spawnLocation,deliveryLocation,requireSecurityDevice,notifyPolice,contractType) VALUES (?, ?, ?, ?, ?, ?, ?,?)', {
      randomContract.model,
      contractsConfig["A+"].successfull_xp,
      contractsConfig["A+"].unsuccessfull_xp,
      json.encode(randomContract.spawnLocation),
      json.encode(randomContract.deliveryLocation),
      randomContract.requiresSecurityDevice,
      randomContract.policeNotify,
      "A+"
    })
   end
  end
  print("^4 Generated A+ Contracts QB-VEHICLEBOOSTING")
end
function generateAContracts()
  local AContracts = {}
  local amountOfContracts = #(contractsConfig["A"].contracts)
  for i = 1 , 10 do
    local randomContract = contractsConfig["A"].contracts[math.random(1,amountOfContracts)]
    if not AContracts[randomContract.model] then
      MySQL.insert('INSERT INTO availible_boosting_contracts (model,xpGain,xpLost,spawnLocation,deliveryLocation,requireSecurityDevice,notifyPolice,contractType) VALUES (?, ?, ?, ?, ?, ?, ?,?)', {
        randomContract.model,
        contractsConfig["A"].successfull_xp,
        contractsConfig["A"].unsuccessfull_xp,
        json.encode(randomContract.spawnLocation),
        json.encode(randomContract.deliveryLocation),
        randomContract.requiresSecurityDevice,
        randomContract.policeNotify,
        "A"
      })
      AContracts[randomContract.model] = true
  else
    randomContract = contractsConfig["A"].contracts[math.random(1,amountOfContracts)]
    MySQL.insert('INSERT INTO availible_boosting_contracts (model,xpGain,xpLost,spawnLocation,deliveryLocation,requireSecurityDevice,notifyPolice,contractType) VALUES (?, ?, ?, ?, ?, ?, ?,?)', {
      randomContract.model,
      contractsConfig["A"].successfull_xp,
      contractsConfig["A"].unsuccessfull_xp,
      json.encode(randomContract.spawnLocation),
      json.encode(randomContract.deliveryLocation),
      randomContract.requiresSecurityDevice,
      randomContract.policeNotify,
      "A"
    })
   end
  end
  print("^4 Generated A Contracts QB-VEHICLEBOOSTING")
end
function generateBContracts()
  local amountOfContracts = #(contractsConfig["B"].contracts)
  for i = 1 , 15 do
    local randomContract = contractsConfig["B"].contracts[math.random(1,amountOfContracts)]
      MySQL.insert('INSERT INTO availible_boosting_contracts (model,xpGain,xpLost,spawnLocation,deliveryLocation,requireSecurityDevice,notifyPolice,contractType) VALUES (?, ?, ?, ?, ?, ?, ?,?)', {
        randomContract.model,
        contractsConfig["B"].successfull_xp,
        contractsConfig["B"].unsuccessfull_xp,
        json.encode(randomContract.spawnLocation),
        json.encode(randomContract.deliveryLocation),
        randomContract.requiresSecurityDevice,
        randomContract.policeNotify,
        "B"
      })
    end
  print("^4 Generated B Contracts QB-VEHICLEBOOSTING")
end

function generateCContracts()
  local amountOfContracts = #(contractsConfig["C"].contracts)
  for i = 1 , 20 do
    local randomContract = contractsConfig["C"].contracts[math.random(1,amountOfContracts)]
      MySQL.insert('INSERT INTO availible_boosting_contracts (model,xpGain,xpLost,spawnLocation,deliveryLocation,requireSecurityDevice,notifyPolice,contractType) VALUES (?, ?, ?, ?, ?, ?, ?,?)', {
        randomContract.model,
        contractsConfig["C"].successfull_xp,
        contractsConfig["C"].unsuccessfull_xp,
        json.encode(randomContract.spawnLocation),
        json.encode(randomContract.deliveryLocation),
        randomContract.requiresSecurityDevice,
        randomContract.policeNotify,
        "C"
      })
    end
  print("^4 Generated C Contracts QB-VEHICLEBOOSTING")
end


function getCurrentQueuedPlayers()
  local BoosterQueue = {}
  local Players = QBCore.Functions.GetQBPlayers()
  for i = 1, #Players do
    local playerInf = MySQL.prepare.await("SELECT citizenid,boosting_score,currently_in_queue FROM boosting_players WHERE citizenid = ? AND currently_in_queue = 1",{Players[i].PlayerData.citizenid})
    if playerInf then
      table.insert(BoosterQueue,playerInf) 
    end
  end
  return BoosterQueue
end

function calcRemainingContracts()
  return MySQL.Sync.fetchScalar('SELECT COUNT(*) FROM `availible_boosting_contracts`')
end
