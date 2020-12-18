addEvent("utils:onClientPlayerTeleportInterior",true)

local function teleportPlayer2Interior(player,interior)
	if interior then
		player.interior = interior.interior or 0
		player.dimension = interior.dimension or 0
		player:setPosition(interior.x or 0,interior.y or 0,interior.z or 5)
		return outputChatBox(("Telported to #%s| %s"):format(interior.id or "N/A",interior.name or "Centre of San Andreas"),player)
	end
	return false
end

addEventHandler("utils:onClientPlayerTeleportInterior",root,function(interior)
	teleportPlayer2Interior(client,interior)
end)

addCommandHandler("gotoint",function(player,command,number)
	number = tonumber(number)
	if getDevelopmentMode() and number and interiorsJS[number] then
		local interior = interiorsJS[number]
		teleportPlayer2Interior(player,interior)
	end
end)