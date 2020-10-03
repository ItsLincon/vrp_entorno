RegisterCommand('entorno', function(source, args)
    local ped = GetPlayerPed(PlayerId())
    local plyPos = GetEntityCoords(GetPlayerPed(-1))
    local msg = table.concat(args, ' ')
    if args[1] == nil then
        TriggerEvent('chatMessage', '^5Entorno', {255,255,255}, ' ^7Escribe tu reporte.')
    else
        TriggerServerEvent('entorno:sendentorno', plyPos.x, plyPos.y, plyPos.z, msg)
		drawNotification2(msg)
		ExecuteCommand ('ooc Has enviado una llamada de rol de entorno a la policía')
    end
end)


RegisterCommand("forzar", function(source, args, rawCommand)

	local colorNames = {
		['0'] = "Metallic Black",
		['1'] = "Metallic Graphite Black",
		['2'] = "Metallic Black Steal",
		['3'] = "Metallic Dark Silver",
		['4'] = "Metallic Silver",
		['5'] = "Metallic Blue Silver",
		['6'] = "Metallic Steel Gray",
		['7'] = "Metallic Shadow Silver",
		['8'] = "Metallic Stone Silver",
		['9'] = "Metallic Midnight Silver",
		['10'] = "Metallic Gun Metal",
		['11'] = "Metallic Anthracite Grey",
		['12'] = "Matte Black",
		['13'] = "Matte Gray",
		['14'] = "Matte Light Grey",

		['15'] = "Util Black",

		['16'] = "Util Black Poly",

		['17'] = "Util Dark silver",

		['18'] = "Util Silver",

		['19'] = "Util Gun Metal",

		['20'] = "Util Shadow Silver",

		['21'] = "Worn Black",

		['22'] = "Worn Graphite",

		['23'] = "Worn Silver Grey",

		['24'] = "Worn Silver",

		['25'] = "Worn Blue Silver",

		['26'] = "Worn Shadow Silver",

		['27'] = "Metallic Red",

		['28'] = "Metallic Torino Red",

		['29'] = "Metallic Formula Red",

		['30'] = "Metallic Blaze Red",

		['31'] = "Metallic Graceful Red",

		['32'] = "Metallic Garnet Red",

		['33'] = "Metallic Desert Red",

		['34'] = "Metallic Cabernet Red",

		['35'] = "Metallic Candy Red",

		['36'] = "Metallic Sunrise Orange",

		['37'] = "Metallic Classic Gold",

		['38'] = "Metallic Orange",

		['39'] = "Matte Red",

		['40'] = "Matte Dark Red",

		['41'] = "Matte Orange",

		['42'] = "Matte Yellow",

		['43'] = "Util Red",

		['44'] = "Util Bright Red",

		['45'] = "Util Garnet Red",

		['46'] = "Worn Red",

		['47'] = "Worn Golden Red",

		['48'] = "Worn Dark Red",

		['49'] = "Metallic Dark Green",

		['50'] = "Metallic Racing Green",

		['51'] = "Metallic Sea Green",

		['52'] = "Metallic Olive Green",

		['53'] = "Metallic Green",

		['54'] = "Metallic Gasoline Blue Green",

		['55'] = "Matte Lime Green",

		['56'] = "Util Dark Green",

		['57'] = "Util Green",

		['58'] = "Worn Dark Green",

		['59'] = "Worn Green",

		['60'] = "Worn Sea Wash",

		['61'] = "Metallic Midnight Blue",

		['62'] = "Metallic Dark Blue",

		['63'] = "Metallic Saxony Blue",

		['64'] = "Metallic Blue",

		['65'] = "Metallic Mariner Blue",

		['66'] = "Metallic Harbor Blue",

		['67'] = "Metallic Diamond Blue",

		['68'] = "Metallic Surf Blue",

		['69'] = "Metallic Nautical Blue",

		['70'] = "Metallic Bright Blue",

		['71'] = "Metallic Purple Blue",

		['72'] = "Metallic Spinnaker Blue",

		['73'] = "Metallic Ultra Blue",

		['74'] = "Metallic Bright Blue",

		['75'] = "Util Dark Blue",

		['76'] = "Util Midnight Blue",

		['77'] = "Util Blue",

		['78'] = "Util Sea Foam Blue",

		['79'] = "Uil Lightning blue",

		['80'] = "Util Maui Blue Poly",

		['81'] = "Util Bright Blue",

		['82'] = "Matte Dark Blue",

		['83'] = "Matte Blue",

		['84'] = "Matte Midnight Blue",

		['85'] = "Worn Dark blue",

		['86'] = "Worn Blue",

		['87'] = "Worn Light blue",

		['88'] = "Metallic Taxi Yellow",

		['89'] = "Metallic Race Yellow",

		['90'] = "Metallic Bronze",

		['91'] = "Metallic Yellow Bird",

		['92'] = "Metallic Lime",

		['93'] = "Metallic Champagne",

		['94'] = "Metallic Pueblo Beige",

		['95'] = "Metallic Dark Ivory",

		['96'] = "Metallic Choco Brown",

		['97'] = "Metallic Golden Brown",

		['98'] = "Metallic Light Brown",

		['99'] = "Metallic Straw Beige",

		['100'] = "Metallic Moss Brown",

		['101'] = "Metallic Biston Brown",

		['102'] = "Metallic Beechwood",

		['103'] = "Metallic Dark Beechwood",

		['104'] = "Metallic Choco Orange",

		['105'] = "Metallic Beach Sand",

		['106'] = "Metallic Sun Bleeched Sand",

		['107'] = "Metallic Cream",

		['108'] = "Util Brown",

		['109'] = "Util Medium Brown",

		['110'] = "Util Light Brown",

		['111'] = "Metallic White",

		['112'] = "Metallic Frost White",

		['113'] = "Worn Honey Beige",

		['114'] = "Worn Brown",

		['115'] = "Worn Dark Brown",

		['116'] = "Worn straw beige",

		['117'] = "Brushed Steel",

		['118'] = "Brushed Black steel",

		['119'] = "Brushed Aluminium",

		['120'] = "Chrome",

		['121'] = "Worn Off White",

		['122'] = "Util Off White",

		['123'] = "Worn Orange",

		['124'] = "Worn Light Orange",

		['125'] = "Metallic Securicor Green",

		['126'] = "Worn Taxi Yellow",

		['127'] = "police car blue",

		['128'] = "Matte Green",

		['129'] = "Matte Brown",

		['130'] = "Worn Orange",

		['131'] = "Matte White",

		['132'] = "Worn White",

		['133'] = "Worn Olive Army Green",

		['134'] = "Pure White",

		['135'] = "Hot Pink",

		['136'] = "Salmon pink",

		['137'] = "Metallic Vermillion Pink",

		['138'] = "Orange",

		['139'] = "Green",

		['140'] = "Blue",

		['141'] = "Mettalic Black Blue",

		['142'] = "Metallic Black Purple",

		['143'] = "Metallic Black Red",

		['144'] = "hunter green",

		['145'] = "Metallic Purple",

		['146'] = "Metaillic V Dark Blue",

		['147'] = "MODSHOP BLACK1",

		['148'] = "Matte Purple",

		['149'] = "Matte Dark Purple",

		['150'] = "Metallic Lava Red",

		['151'] = "Matte Forest Green",

		['152'] = "Matte Olive Drab",

		['153'] = "Matte Desert Brown",

		['154'] = "Matte Desert Tan",

		['155'] = "Matte Foilage Green",

		['156'] = "DEFAULT ALLOY COLOR",

		['157'] = "Epsilon Blue",

	}

	local playerPed = GetPlayerPed(-1)

    if IsPedInAnyVehicle(playerPed, false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if (vehicle ~= nil and vehicle ~= 0) then
			local modelo = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
            modelo = GetLabelText(modelo)
			local puertas1 = GetNumberOfVehicleDoors(vehicle)
			local puertas = puertas1-2
            local matricula = GetVehicleNumberPlateText(vehicle)
			local color = GetVehicleColours(vehicle)
          	color = colorNames[tostring(color)]
			
			local ped = GetPlayerPed(PlayerId())
			local x, y, z = table.unpack(GetEntityCoords(ped, true))
			local street = GetStreetNameAtCoord(x, y, z)  
			local plyPos = GetEntityCoords(GetPlayerPed(-1))
			local location = GetStreetNameFromHashKey(street)

			local msg = 'Vehiculo robado en ' .. location..' Matricula '.. matricula..' con modelo '.. modelo.. ' de color '.. color  ..''
			local notificationText = '~r~Matricula~s~ ' .. matricula.. '\n~r~Modelo~s~ ' .. modelo.. '\n~r~Localizacion~s~ '.. location.. ''
			
			drawNotification(notificationText)
			TriggerServerEvent('entorno:sendentorno', plyPos.x, plyPos.y, plyPos.z, msg)
			ExecuteCommand ('ooc Has enviado una llamada de rol de entorno a la policía')
        end
    end
end, false)

function drawNotification(text)
	SetNotificationTextEntry("STRING");
	AddTextComponentString(text);
	SetNotificationMessage("CHAR_CALL911", "CHAR_CALL911", true, 1, "~r~Codigo 37~s~", "");
	DrawNotification(false, true);
end

function drawNotification2(text)
	SetNotificationTextEntry("STRING");
	AddTextComponentString(text);
	SetNotificationMessage("CHAR_CALL911", "CHAR_CALL911", true, 1, "~r~911~s~", "");
	DrawNotification(false, true);
end
