local QBCore = exports['qb-core']:GetCoreObject()
local openid = false

if Config.Inventory == 'ox' then
    AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
        exports.ox_inventory:displayMetadata('holderName', 'Holder')
        exports.ox_inventory:displayMetadata('citizenId', 'Citizen ID')
        exports.ox_inventory:displayMetadata('fromDate', 'Active from')
        exports.ox_inventory:displayMetadata('expirationDate', 'Expiration Date')
        exports.ox_inventory:displayMetadata('drug', 'Drug')
        exports.ox_inventory:displayMetadata('amount', 'Amount')
        exports.ox_inventory:displayMetadata('giverName', 'Signed by')
        exports.ox_inventory:displayMetadata('notes', 'Notes')
    end)
end

RegisterNetEvent("cw-prescriptions:client:openPrescriptionCard", function(data, nui)
    if not openid then
        QBCore.Functions.Notify("Press backspace to close")
        local info
        if Config.Inventory == 'ox' then
            info = data.metadata
        else
            info = data.info
        end
        if useDebug then
            print(QBCore.Debug(data))
        end
        SetNuiFocusKeepInput(true)
        SetNuiFocus(true,false)
        SendNUIMessage({nui = 'cwpres', information = info})
        openid = true
    end
end)

local function hasValue(tbl, value)
    for k, v in ipairs(tbl) do -- iterate table (for sequential tables only)
        if v == value or (type(v) == "table" and hasValue(v, value)) then -- Compare value from the table directly with the value we are looking for, otherwise if the value is table, check its content for this value.
            return true -- Found in this or nested table
        end
    end
    return false -- Not found
end

local function isAllowed(type)
    if Config.JobIsRequired then
        local Player = QBCore.Functions.GetPlayerData()

        local playerHasJob = Config.AllowedJobs[Player.job.name]

        local jobGradeReq = nil
        if Config.AllowedJobs[Player.job.name] ~= nil then
            jobGradeReq = Config.AllowedJobs[Player.job.name][type]
        end

        if playerHasJob then
            if jobGradeReq ~= nil then
                if Player.job.grade.level >= jobGradeReq then
                    return true
                else
                    return false
                end
            else
                return false
            end
        else
            return false
        end
    else
        return true
    end
end

CreateThread(function()
    if Config.UseInteractionPoint then
        for i,v in pairs(Config.InteractionPoints) do
            local coords = v
            local boxData = {}

            if boxData and boxData.created then
                return
            end
            exports['qb-target']:AddBoxZone('prescription-interaction-'..i, coords, 1.5, 1.5, {
                name = 'prescription-interaction',
                heading = 0,
                debugPoly = false,
                minZ = coords.z - 1.0,
                maxZ = coords.z + 1.0,
            }, {
                options = {
                    {
                        type = "client",
                        icon = "fas fa-prescription-bottle-alt",
                        event = "cw-prescriptions:client:openInteraction",
                        label = "Write Prescription",
                        canInteract = function() return isAllowed('print') end
                    },
                    {
                        type = "client",
                        icon = "fas fa-tag",
                        event = "cw-prescriptions:client:openLabelInteraction",
                        label = "Add Label To Drugs",
                        canInteract = function() return isAllowed('print') end
                    },
                },
                distance = 2.0
            })
        end
    end
end)

local printers = {}

CreateThread(function()
    if Config.UsePrinterSpawns then
        for i,printer in pairs(Config.PrinterSpawns) do

            local printerLocation = printer.coords
            local printer = CreateObject(printer.prop, printerLocation.x, printerLocation.y, printerLocation.z, true,  true, true)
            SetEntityHeading(printer, printerLocation.w)
            FreezeEntityPosition(printer, true)
            SetEntityAsMissionEntity(printer)

            exports['qb-target']:AddTargetModel(printer, {
                options = {
                    {
                        type = "client",
                        icon = "fas fa-prescription-bottle-alt",
                        event = "cw-prescriptions:client:openInteraction",
                        label = "Write prescription",
                        canInteract = function() return isAllowed('print') end
                    },
                    {
                        type = "client",
                        icon = "fas fa-prescription-bottle-alt",
                        event = "cw-prescriptions:client:openLabelInteraction",
                        label = "Add Label To Drugs",
                        canInteract = function() return isAllowed('print') end
                    },
                },
                distance = 2.0
            })
        end
    end
end)

RegisterNetEvent("cw-prescriptions:client:openLabelInteraction", function()
    local dialog = exports['qb-input']:ShowInput({
        header = Config.Texts.labelMakerHeaer,
        submitText = Config.Texts.labelMakerSubmit,
        inputs = Config.LabelInputs,
    })
    if dialog ~= nil then
        local year, month, day = GetUtcTime()

        local data = {
            recieverName = dialog.recieverName,
            citizenId = dialog.citizenId,
            fromDate = tostring(month)..'/'..tostring(day)..'/'..tostring(year),
            giverName = dialog.giverName,
            notes = dialog.notes,
            drug = dialog.drug,
            item = dialog.item,
        }
        if QBCore.Functions.HasItem(data.item) then
            TriggerServerEvent("cw-prescriptions:server:addLabel", data)
        else
            QBCore.Functions.Notify("You don't the bottle on you", "error")
        end
    else
        QBCore.Functions.Notify("Bad input", "error")
    end
end)

RegisterNetEvent("cw-prescriptions:client:openInteraction", function()
    local dialog = exports['qb-input']:ShowInput({
        header = Config.Texts.cardMakerHeader,
        submitText = Config.Texts.cardMakerSubmit,
        inputs = Config.Inputs,
    })
    if dialog ~= nil then
        local year, month, day = GetUtcTime()

        local data = {
            recieverName = dialog.recieverName,
            citizenId = dialog.citizenId,
            toDate = dialog.toDate,
            fromDate = tostring(month)..'/'..tostring(day)..'/'..tostring(year),
            drug = dialog.drug,
            --amount = dialog.amount,
            giverName = dialog.giverName,
            notes = dialog.notes,
        }
        TriggerServerEvent("cw-prescriptions:server:createCard", data)
    else
        QBCore.Functions.Notify("Bad input", "error")
    end
end)

RegisterNUICallback("escape", function()
    SetNuiFocus(false)
    openid = false
end)