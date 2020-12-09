-- Kick
secondsUntilKick = 180 --AFK Kick Time Limit (saniye olarak)
kickWarning = true --Zaman Limitinin 3 / 4'ü dolduğunda oyuncuları uyar
-- Ping
pingLimit = 400

-- AFK
Citizen.CreateThread(function()
	while true do
		Wait(1000)
		playerPed = GetPlayerPed(-1)
		if playerPed then
			currentPos = GetEntityCoords(playerPed, true)
			if currentPos == prevPos then
				if time > 0 then
					if kickWarning and time == math.ceil(secondsUntilKick / 4) then
						TriggerEvent("chatMessage", "WARNING", {255, 0, 0}, "^1Atılacaksın " .. time .. " AFK olmak için saniye!")
					end
					time = time - 1
				else
					TriggerServerEvent("psakick")
				end
			else
				time = secondsUntilKick
			end
			prevPos = currentPos
		end
	end
end)

-- PING
RegisterServerEvent("psaping")
AddEventHandler("psaping", function()
	ping = GetPlayerPing(source)
	if ping >= pingLimit then
		DropPlayer(source, "Ping çok yüksek (Sınır: " .. pingLimit .. " Ping'iniz: " .. ping .. ")")
	end
end)