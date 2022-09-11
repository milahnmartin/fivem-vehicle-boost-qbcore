QBCore = exports["qb-core"]:GetCoreObject()
local QueuedSPlus = {}
local QueuedS = {}
local QueuedAPlus = {}
local QueuedA = {}
local QueuedB = {}
local QueuedC = {}

function distrubuteC(QuedPlayers)
  local amountQueued = #QuedPlayers
  amountOfContracts = 0
  MySQL.query("SELECT count(*) as amount FROM `availible_boosting_contracts` WHERE `contractType` = 'C'", {}, function(result)
    amountOfContracts = result[1].amount
    for i = 1 , 5 do
      local randomContract = math.random(1,amountQueued)
        MySQL.insert('INSERT INTO boosting_assigned_contracts (citizenId,assignedid) VALUES (?, ?, ?, ?, ?, ?, ?,?)', {
         
        })
      end
    end
  end)
 
end
function distrubuteB(QuedPlayers)end
function distrubuteA(QuedPlayers)end
function distrubuteAPlus(QuedPlayers)end
function distrubuteS(QuedPlayers)end
function distrubuteSPlus(QuedPlayers)end



Citizen.CreateThread(function()
  Citizen.Wait(5000)
  MySQL.query("SELECT `citizenid` FROM `boosting_players` WHERE `currently_in_queue` = 1",{},function(result)
    if result then
      for _,v in pairs(result) do
          if v.boosting_score then
            if v.boosting_score > 100 and v.boosting_score < 200 then
              table.insert(QueuedB,v.citizenid)
            elseif v.boosting_score  > 200 and v.boosting_score < 300 then
              table.insert(QueuedA,v.citizenid)
            elseif v.boosting_score  > 300 and v.boosting_score < 400 then
              table.insert(QueuedAPlus,v.citizenid)
            elseif v.boosting_score  > 400 and v.boosting_score < 500 then
              table.insert(QueuedS,v.citizenid)
            elseif v.boosting_score  > 500 then
              table.insert(QueuedSPlus,v.citizenid)
            end
          else
            table.insert(QueuedC,v.citizenid)
          end
        end
    end
  end)
  distrubuteC(QueuedC)
end)