local helicopters = {}

RegisterServerEvent("heli:spotlight_on")
RegisterServerEvent("heli:spotlight_off")
RegisterServerEvent("heli:spotlight_update")

AddEventHandler("heli:spotlight_on", function(playerId)
    TriggerClientEvent("heli:spotlight_on", -1, playerId, 0)
end)

AddEventHandler("heli:spotlight_off", function(playerId)
    TriggerClientEvent("heli:spotlight_off", -1, playerId, 0)
end)

AddEventHandler("heli:spotlight_update", function(playerId, data)
    TriggerClientEvent("heli:spotlight_update", -1, playerId, data)
end)

RegisterNetEvent("policejob:syncSpotlight", function (coord, forward_vector)
    TriggerClientEvent("policejob:syncSpotlight" ,-1, coord, forward_vector)
end)

RegisterNetEvent("policejob:addHelicopter", function(heli, cam)
    local should_add = true
    local table = {
        helicop = heli,
        came = cam
    }
    for k, v in pairs(helicopters) do
        if v.helicop == heli then
            should_add = false
            break
        end
    end
    if should_add then
        table.insert(helicopters, table)
        TriggerClientEvent("policejob:syncHelicopters", helicopters)
    end
end)

RegisterNetEvent("policejob:removeHelicopter", function (heli)
    local should_remove = false
    local key
    for k, v in pairs(helicopters) do
        if heli == v.helicop then
            should_remove = true
            key = k
        end
    end
    if should_remove then
        table.remove(helicopter, key)
        TriggerClientEvent("policejob:syncHelicopters", helicopters)
    end
end)