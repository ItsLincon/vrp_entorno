local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")

RegisterServerEvent('entorno:sendentorno')
AddEventHandler('entorno:sendentorno', function(x,y,z,msg)
     vRP.sendServiceAlert({source,"police",x,y,z,msg})
end)