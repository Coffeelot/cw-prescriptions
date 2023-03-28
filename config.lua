Config = {}
Config.Inventory = 'qb'

Config.JobIsRequired = false
Config.AllowedJobs = {
    ['police'] = { print = 4},
    ['ambulance'] = { print = 1},
}

Config.Cost = 200 

Config.UseInteractionPoint = true -- set this to false if you don't want to use the stock locations
Config.InteractionPoints = {
    vector3(308.12, -562.91, 43.39),
}

-- Setup for spawning printers
Config.UsePrinterSpawns = true -- set this to true if you want to spawn specific printers that are interactable
Config.PrinterSpawns = {
    { prop = "prop_printer_01", coords = vector4(1157.08, -3190.4, -38.16, 85.72)},
    { prop = "prop_printer_02", coords = vector4(1157.08, -3191.4, -38.16, 81.72)},
    { prop = "v_res_printer", coords = vector4(1157.08, -3192.1, -38.16, 82.72)},
}

-- General Setup
Config.Texts = {
    cardMakerHeader = "Presciption Card Maker ELITE edition (©2001)",
    cardMakerSubmit = "Create",
    labelMakerHeaer = "Label Printer DELUXE (©1992)",
    labelMakerSubmit = "Print"
}

Config.Items = {
    ['prescription_card'] = { value = "prescription_card", text = "Prescription Card" },
}

Config.Inputs = {
    {
        text = "Name on card", -- text you want to be displayed as a place holder
        name = "recieverName", -- name of the input should be unique otherwise it might override
        type = "text", -- type of the input
        isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
    },
    {
        text = "Citizen Id", -- text you want to be displayed as a place holder
        name = "citizenId", -- name of the input should be unique otherwise it might override
        type = "text", -- type of the input
        isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
    },
    {
        text = "Expiration Date (mm/dd/yyyy)", -- text you want to be displayed as a place holder
        name = "toDate", -- name of the input should be unique otherwise it might override
        type = "text", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
        isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
    },
    {
        text = "Drug", -- text you want to be displayed as a place holder
        name = "drug", -- name of the input should be unique otherwise it might override
        type = "text", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
        isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
    },
    -- {
    --     text = "Amount", -- text you want to be displayed as a place holder
    --     name = "amount", -- name of the input should be unique otherwise it might override
    --     type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
    --     isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
    -- },
    {
        text = "Signed by", -- text you want to be displayed as a place holder
        name = "giverName", -- name of the input should be unique otherwise it might override
        type = "text", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
        isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
    },
    {
        text = "Notes", -- text you want to be displayed as a place holder
        name = "notes", -- name of the input should be unique otherwise it might override
        type = "text", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
        isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
    }
}

local bottles = {
    {   value = 'painkillers', name = 'painkillers', text = 'Painkillers' },
    {   value = 'oxy', name = 'oxy', text = 'Oxycotin' },
    {   value = 'adderall', name = 'adderall', text = 'Adderall' },
    {   value = 'pill_bottle', name = 'pill_bottle', text = 'Pill Bottle' },
}

Config.LabelInputs = {
    {
        text = "Name on card", -- text you want to be displayed as a place holder
        name = "recieverName", -- name of the input should be unique otherwise it might override
        type = "text", -- type of the input
        isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
    },
    {
        text = "Citizen Id", -- text you want to be displayed as a place holder
        name = "citizenId", -- name of the input should be unique otherwise it might override
        type = "text", -- type of the input
        isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
    },
    {
        text = "Bottle",
        name = "item",
        type = "select",
        options = bottles
    },
    {
        text = "Drug (if applicable)",
        name = "drug",
        type = "text"
    },
    {
        text = "Signed by", -- text you want to be displayed as a place holder
        name = "giverName", -- name of the input should be unique otherwise it might override
        type = "text", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
        isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
    },
    {
        text = "Notes", -- text you want to be displayed as a place holder
        name = "notes", -- name of the input should be unique otherwise it might override
        type = "text", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
        isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
    }

}