local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_tires")


    vRP.defInventoryItem({"Wheel","Wheel","",
        function(args)
            local choices = {}
            choices[">⚙️ Change Tire"] = {function(player,choice)
                local user_id = vRP.getUserId({player})
                if user_id ~= nil then
                          TriggerClientEvent('mario3:help', player)
                vRP.closeMenu({player})
            end
        end,""}

        return choices
    end, 5.50
})

RegisterNetEvent('mario3:taketire')
AddEventHandler('mario3:takeTheTire', function()
	local user_id = vRP.getUserId({player})

	vRP.tryGetInventoryItem({user_id, "Wheel", 1, true})
end)
