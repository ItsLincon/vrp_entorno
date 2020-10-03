description "vrp_entorno made by ItsLincon"

dependency "vrp"

client_scripts{ 
  "client.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua"
}
