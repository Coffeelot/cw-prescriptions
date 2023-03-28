local QBCore = exports['qb-core']:GetCoreObject()

local function addItem(source, item, amount, info)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Config.Inventory == 'ox' then
        exports.ox_inventory:AddItem(src, item, amount, info)
    else
		Player.Functions.AddItem(item, amount, nil, info)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "remove")
    end
end

local function removeItem(source, item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Config.Inventory == 'ox' then
        exports.ox_inventory:RemoveItem(src, item, amount)
    else
		Player.Functions.RemoveItem(item, amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "remove")
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
    Player.Functions.RemoveMoney("debit", data.amount*Config.Cost, "Created Prescription Card")
end

RegisterNetEvent("cw-prescriptions:server:createCard", function(data)
    createPrescriptionCard(source, data)
end)

local function createLabel(source, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local info = {}
    local item = data.item
    info.recieverName = data.recieverName
    info.citizenId = data.citizenId
    info.fromDate = data.fromDate
    info.giverName = data.giverName
    info.notes = data.notes
    if data.drug then
        info.drug = data.drug
    end

    removeItem(src, data.item, 1)
    addItem(src, data.item, 1, info)
    Player.Functions.RemoveMoney("debit", Config.Cost, "Created Label")
end

RegisterNetEvent("cw-prescriptions:server:addLabel", function(data)
    createLabel(source, data)
end)

for i, type in pairs(Config.Items) do
    QBCore.Functions.CreateUseableItem(type.value, function(source, Item)
        TriggerClientEvent("cw-prescriptions:client:openPrescriptionCard", source, Item)
    end)
end

QBCore.Commands.Add('makepres', 'make a prescription card (admin only)',{ { name = 'recieverName', help = 'For who' }}, true, function(source, args)
    local data = { args[1], args[2], args[3], args[4] }
    createPrescriptionCard(source, data)
end, "admin")
