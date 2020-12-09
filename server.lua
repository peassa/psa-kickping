RegisterServerEvent("psakick")
AddEventHandler("psakick", function()
	DropPlayer(source, "Çok uzun süredir AFK oldun.")
end)

Citizen.CreateThread(function()
	while true do
		Wait(checkRate)

		TriggerServerEvent("psaping")
	end
end)