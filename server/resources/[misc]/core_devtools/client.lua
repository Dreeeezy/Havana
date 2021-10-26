local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local Tools = module("vrp", "lib/Tools")

func = Tunnel.getInterface("core_devtools")



RegisterNUICallback('dev_tools',function()
   func.Punicao()
end)