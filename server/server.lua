local QBCore = exports['qb-core']:GetCoreObject()

local function addItem(source, item, amount, info)
    local src = source
    if Config.Inventory == 'ox' then
        exports.ox_inventory:AddItem(src, item, amount, info)
    else
		Player.Functions.AddItem(item, amount, nil, info)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")
    end

end

local function createPrescriptionCard(source, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local info = {}
    info.recieverName = data.recieverName
    info.citizenId = data.citizenId
    info.fromDate = data.fromDate
    info.expirationDate = data.toDate
    info.drug = data.drug
    -- info.amount = data.amount
    info.giverName = data.giverName
    info.notes = data.notes
    
    addItem(src, Config.Items['prescription_card'].value, 1, info)
    Player.Functions.RemoveMoney("debit", data.amount*Config.Cost)
end

for i, type in pairs(Config.Items) do
    QBCore.Functions.CreateUseableItem(type.value, function(source, Item)
        TriggerClientEvent("cw-prescriptions:client:openPrescriptionCard", source, Item)
    end)
end

RegisterNetEvent("cw-prescriptions:server:createCard", function(data)
    createPrescriptionCard(source, data)
end)

QBCore.Commands.Add('makepres', 'make a prescription card (admin only)',{ { name = 'recieverName', help = 'For who' }}, true, function(source, args)
    local data = { args[1], args[2], args[3], args[4] }
    createPrescriptionCard(source, data)
end, "admin")