new(CJob, 4, "Bus", "1743.0999|-1863|13.1999")

function createDummyBus(...)
	local v = createVehicle(431, ...)
	setVehicleDamageProof(v, true)
	setElementFrozen(v, true)

	addEventHandler("onVehicleStartEnter", v, function()
		cancelEvent()
	end
	)
end

createDummyBus(1780, -1931.8, 13.6, 0, 0, 270)
createDummyBus(1780, -1913.7, 13.6, 0, 0, 270)
createDummyBus(1780, -1925.6, 13.6, 0, 0, 270)
createDummyBus(1780, -1919.5, 13.6, 0, 0, 270)
createDummyBus(1780, -1907.8, 13.6, 0, 0, 270)
createDummyBus(1780, -1901.8, 13.6, 0, 0, 270)

local busjobActive = true
local busSpawnX, busSpawnY, busSpawnZ, busSpawnRotX, busSpawnRotY, busSpawnRotZ = 1783.20, -1888.90, 13.6, 0, 0, 270
local busjobPickup = createPickup(1743.0999, -1863, 13.1999, 3, 1274, 0)

addEventHandler("onPickupHit", busjobPickup, function(e)
	if (busjobActive) then
		if (getElementType(e) == "player") and not (isPedInVehicle(e)) then
			if (getPlayerWantedLevel(e) == 0) then
				triggerClientEvent(e, "onBJStartMarkerHit", e)
			else
				e:showInfoBox("info", "Du wirst derzeit von der Polizei gesucht, solche Leute wollen wir bei uns nicht.")
			end
		end
	end
end
)

local lines = {
	[1] = {
			[1] = {x = 1646.3000488281, y = -2322.1999511719, z = 12.39999961853, "Los Santos Airport"},
			[2] = {x = 1962, y = -1749.3000488281, z = 12.39999961853, "Idlewood [Ost]"},
			[3] = {x = 1818.5999755859, y = -1806.3000488281, z = 12.39999961853, "Idlewood [West]"},
			[4] = {x = 1416.6999511719, y = -1869.3000488281, z = 12.39999961853, "Verdant Bluffs"},
			[5] = {x = 1432.5, y = -1643.4000244141, z = 12.39999961853, "Commerce"},
			[6] = {x = 1457.8000488281, y = -1335, z = 12.39999961853, "Downtown [Süd]"},
			[7] = {x = 1374.5, y = -1138, z = 22.700000762939, "Downtown [Nord][Endstation]"},
			[8] = {x = 1451.6999511719, y = -1350.5, z = 12.39999961853, "Downtown [Süd]"},
			[9] = {x = 1426.3000488281, y = -1670.1999511719, z = 12.39999961853, "Commerce"},
			[10] = {x = 1452.8000488281, y = -1875.3000488281, z = 12.39999961853, "Verdant Bluffs"},
			[11] = {x = 1824.5999755859, y = -1770.6999511719, z = 12.39999961853, "Idlewood [West]"},
			[12] = {x = 1983.0999755859, y = -1755.5, z = 12.39999961853, "Idlewood [Ost]"}
	},
	[2] = {
			[1] = {x = 1669.3000488281, y = -2322.1999511719, z = 12.39999961853, "Los Santos Airport"},
			[2] = {x = 2234.6000976563, y = -2197, z = 12.30, "Ocean Docks"},
			[3] = {x = 2417.1000976563, y = -1951.5, z = 12.39, "Willowfield"},
			[4] = {x = 2461, y = -1735.4, z = 12.5, "Ganton"},
			[5] = {x = 2646, y = -1698.5, z = 9.6999998092651, "East Beach [West]"},
			[6] = {x = 2827.10, y = -1632.599, z = 9.8, "East Beach [Ost]"},
			[7] = {x = 2484.8999, y = 45.2999, z = 25.2999, "Palomino Creek [Ost]"},
			[8] = {x = 2256.60, y = 45, z = 25.2999, "Palomino Creek [West]"},
			[9] = {x = 1318.30, y = 239.6999, z = 18.3999, "Montgomery"},
			[10] = {x = 722.400, y = 323, z = 18.8999, "Hampton Barns"},
			[11] = {x = 229.5, y = -178.300, z = 0.3999, "Blueberry"},
			[12] = {x = 627.70, y = -533.5999, z = 15.200, "Dillimore [Endstation]"},
			[13] = {x = 236.30, y = -151.600, z = 0.3999, "Blueberry"},
			[14] = {x = 761, y = 320.2999, z = 18.8999, "Hampton Barns"},
			[15] = {x = 1353.3, y = 217.1999, z = 18.3999, "Montgomery"},
			[16] = {x = 2256.6999, y = 38.2999, z = 25.2999, "Palomino Creek [West]"},
			[17] = {x = 2489.3, y = 38.5999, z = 25.2999, "Palomino Creek [Ost]"},
			[18] = {x = 2820.6999, y = -1632.1999, z = 9.8, "East Beach [Ost]"},
			[19] = {x = 2639.6999511719, y = -1708.6999511719, z = 9.6999998092651, "East Beach [West]"},
			[20] = {x = 2453, y = -1728.9000, z = 12.5, "Ganton"},
			[21] = {x = 2410.30, y = -1953, z = 12.3999, "Willowfield"},
			[22] = {x = 2225.1999, y = -2196.8999, z = 12.3, "Ocean Docks"}
	},
	[3] = {
			[1] = {x = 1695, y = -2322.1999511719, z = 12.39999961853, "Los Santos Airport"},
			[2] = {x = 1065.199, y = -1886.0000, z = 12.1999, "Verona Beach [Ost]"},
			[3] = {x = 921.0999, y = -1712.0999, z = 12.3999, "Verona Beach [Nord]"},
			[4] = {x = 836.7999, y = -1392.0999, z = 12.3999, "Market Station"},
			[5] = {x = 438.7999, y = -1447.5999, z = 28.3999, "Rodeo [Nord]"},
			[6] = {x = 505.7999, y = -1668.4000, z = 18.1000, "Rodeo [Ost]"},
			[7] = {x = 370.5000, y = -1698.4000, z = 6.0999, "Santa Maria Beach [Nord]"},
			[8] = {x = 126.4000, y = -1585.0999, z = 9.5000, "Rodeo [West][Endstation]"},
			[9] = {x = 415.6000, y = -1775.9000, z = 4.3000, "Santa Maria Beach [Süd]"},
			[10] = {x = 468.5000, y = -1654.3000, z = 23.7000, "Rodeo [Ost]"},
			[11] = {x = 495.7999, y = -1435.4000, z = 15.000, "Rodeo [Nord]"},
			[12] = {x = 834.2999, y = -1409.5000, z = 12.1999, "Market Station"},
			[13] = {x = 914.0000, y = -1728.4000, z = 12.3999, "Verona Beach [Nord]"},
			[14] = {x = 1042.900, y = -1877.5000, z = 12.1999, "Verona Beach [Ost]"}
	},
	[4] = {
			[1] = {x = 1717.9000244141, y = -2322.3000488281, z = 12.39999961853, "Los Santos Airport"},
			[2] = {x = 1401.6999, y = -935.29998, z = 34.0000, "Downtown"},
			[3] = {x = 916.00000, y = -968.09999, z = 37.0999, "Vinewood [Ost]"},
			[4] = {x = 651.79998, y = -1187.5000, z = 16.6000, "Vinewood [West]"},
			[5] = {x = 132.10000, y = -1541.0999, z = 7.69999, "Rodeo [West]"},
			[6] = {x = -122.4000, y = -1197.9000, z = 1.70000, "Flint County"},
			[7] = {x = 236.30000, y = -151.60000, z = 0.39990, "Blueberry"},
			[8] = {x = 761.00000, y = 320.299900, z = 18.8999, "Hampton Barns"},
			[9] = {x = 1353.3000, y = 217.199900, z = 18.3999, "Montgomery"},
			[10] = {x = 788.09997, y = -561.00000, z = 15.2000, "Dillimore [Endstation]"},
			[11] = {x = 1318.3000, y = 239.699900, z = 18.3999, "Montgomery"},
			[12] = {x = 722.40000, y = 323.000000, z = 18.8999, "Hampton Barns"},
			[13] = {x = 229.50000, y = -178.30000, z = 0.39990, "Blueberry"},
			[14] = {x = -117.0999, y = -1162.9000, z = 1.40000, "Flint County"},
			[15] = {x = 171.30000, y = -1546.6999, z = 11.1000, "Rodeo [West]"},
			[16] = {x = 694.00000, y = -1163.0000, z = 14.3000, "Vinewood [West]"},
			[17] = {x = 926.50000, y = -982.40000, z = 37.2000, "Vinewood [Ost]"},
			[18] = {x = 1404.4000, y = -952.79998, z = 34.0999, "Downtown"}
	},
	[5] = {
		{x =   409.600, y =  -1776.0, z =   4.3, "Unknown"},
		{x =   642.900, y =  -1638.0, z =  14.0, "Unknown"},
		{x =   832.500, y =  -1330.0, z =  12.4, "Unknown"},
		{x =  1312.599, y =  -1283.8, z =  12.4, "Unknown"},
		{x =  1451.199, y =  -1266.9, z =  12.4, "Unknown"},
		{x =  1425.599, y =  -1704.4, z =  12.4, "Unknown"},
		{x =  1533.000, y =  -1610.3, z =  12.4, "Unknown"},
		{x =  1458.300, y =  -1272.4, z =  12.4, "Unknown"},
		{x =  1284.699, y =  -1277.4, z =  12.3, "Unknown"},
		{x =   794.000, y =  -1353.0, z =  12.4, "Unknown"},
		{x =   625.700, y =  -1656.4, z =  14.8, "Unknown"},
		{x =   386.500, y =  -1698.5, z =   6.9, "Unknown"},
		{x =   117.000, y =  -1601.5, z =   9.5, "Unknown"},
		{x =   409.600, y =  -1776.0, z =   4.3, "Unknown"},
	},
	[6] = {
		{x =  1425.599, y =  -1704.4, z =  12.4, "Unknown"},
		{x =  1328.500, y =  -1728.7, z =  12.4, "Unknown"},
		{x =  1360.900, y =  -1316.5, z =  12.4, "Unknown"},
		{x =  1324.400, y =  - 921.1, z =  36.1, "Unknown"},
		{x =  1086.600, y =  - 944.2, z =  41.6, "Unknown"},
		{x =   958.900, y =  -1084.2, z =  23.6, "Unknown"},
		{x =   913.900, y =  -1449.7, z =  12.4, "Unknown"},
		{x =   914.100, y =  -1754.5, z =  12.4, "Unknown"},
		{x =   1083.000, y =  -1855.9, z =  12.4, "Unknown"},
		{x =  1573.400, y =  -1762.3, z =  12.4, "Unknown"},
		{x =  1533.200, y =  -1610.5, z =  12.4, "Unknown"},
		{x =  1425.599, y =  -1704.4, z =  12.4, "Unknown"},
	},
	[7] = {
		{x =  1533.000, y =  -1610.3, z =  12.4, "Unknown"},
		{x =  1840.099, y =  -1616.2, z =  12.4, "Unknown"},
		{x =  1938.000, y =  -1736.9, z =  12.4, "Unknown"},
		{x =  1958.099, y =  -1998.4, z =  12.4, "Unknown"},
		{x =  1826.699, y =  -2128.6, z =  12.4, "Unknown"},
		{x =  1965.099, y =  -2003.8, z =  12.4, "Unknown"},
		{x =  2085.199, y =  -1869.6, z =  12.4, "Unknown"},
		{x =  2116.399, y =  -1492.1, z =  22.8, "Unknown"},
		{x =  1873.900, y =  -1457.1, z =  12.4, "Unknown"},
		{x =  1476.199, y =  -1437.0, z =  12.4, "Unknown"},
		{x =  1426.099, y =  -1704.1, z =  12.4, "Unknown"},
		{x =  1533.000, y =  -1610.3, z =  12.4, "Unknown"},
	}
}



local data = {}

--Source is the player
addEvent("onClientBJStartPressed", true)
addEventHandler("onClientBJStartPressed", getRootElement(), function()
	if not (clientcheck(source, client)) then
		return false
	end

	local x,y,z = getElementPosition(source)
	local xp,yp, zp = getElementPosition(busjobPickup)
	local line = math.random(1, #lines)

	if not (getDistanceBetweenPoints3D(x, y, z, xp, yp, zp) < 2) and not (isPedInVehicle(source)) then
		source:showInfoBox("error", "Du bist am falschen Ort!")
		return false
	end

	Achievements[5]:playerAchieved(source)
	data[source] = {}
	data[source].line = line
	data[source].point = 1
	data[source].v = createVehicle(431, busSpawnX, busSpawnY, busSpawnZ, busSpawnRotX, busSpawnRotY, busSpawnRotZ)
	data[source].m = createMarker(lines[line][data[source].point].x, lines[line][data[source].point].y, lines[line][data[source].point].z, "cylinder", 2, 0, 0, 255, 255, source)
	data[source].b = createBlipAttachedTo(data[source].m, 41, 2, 0, 0, 255, 255, 0, 1337, source)
	data[source].x = busSpawnX -- used for range calculation
	data[source].y = busSpawnY -- used for range calculation
	data[source].range = 0
	data[source].firstPoint = true
	data[data[source].v] = {}
	data[data[source].v].p = source
	data[data[source].m] = {}
	data[data[source].m].v = data[source].v
	warpPedIntoVehicle(source, data[source].v)
	data[source].v:setEngineState(true)
	local skins = {[265] = true, [266] = true, [267] = true, [312] = true, [280] = true, [281] = true, [282] = true, [283] = true, [284] = true, [285] = true, [286] = true, [287] = true, [288] = true}

	addEventHandler("onVehicleStartEnter", data[source].v, function(p, seat)
		if (seat == 0) then
			if not (skins[getElementModel(p)]) then
				cancelEvent()
			end
		end
	end
	)

	--When the source is deleted, event wont be triggered
	addEventHandler("onVehicleExit", data[source].v, function(p, seat)
		if (seat == 0) then
			--kill Timer if exists
			if (isTimer(data[source].timer)) then killTimer(data[source].timer) end

			--kill radio
			for k, v in ipairs(getVehicleOccupants(source)) do
				triggerClientEvent(v, "onCustomClientPlayerRadioSwitch", getRootElement(), 0)
			end

			--Vehicle delete
			data[source] = nil
			destroyElement(source)

			--Marker + Blip delete
			if(data[data[p].m]) then
				data[data[p].m] = nil
			end
			destroyElement(data[p].m)
			destroyElement(data[p].b)

			--deletes the player data
			data[p] = nil
		end
	end
	)

	--When the source is deleted, event wont be triggered
	addEventHandler("onVehicleExplode", data[source].v, function()
		local p = data[source].p

		--kill Timer if exists
		if (isTimer(data[source].timer)) then killTimer(data[source].timer) end

		--kill radio
		for k, v in ipairs(getVehicleOccupants(source)) do
			triggerClientEvent(v, "onCustomClientPlayerRadioSwitch", getRootElement(), 0)
		end

		--Vehicle delete
		data[source] = nil
		destroyElement(source)

		--Marker + Blip delete
		if(data[data[p].m]) then
			data[data[p].m] = nil
		end
		destroyElement(data[p].m)
		destroyElement(data[p].b)

		--deletes the player data
		data[p] = nil
	end
	)

	source:showInfoBox("info", "Fahre zum Airport und lasse dir eine Linie zuweisen!")

end
)

addEventHandler("onMarkerHit", getRootElement(), function(e)
	if	(type(data[source]) == "table") then --when the table exists, the job is going on
		if (getElementType(e) == "vehicle") and (data[source].v == e) then
			if (getElementRealSpeed(e) <= 40) then
				local x, y, z = getElementPosition(source)
				local l = data[data[e].p].line
				local p = data[data[e].p].point
				data[data[e].p].range = data[data[e].p].range + getDistanceBetweenPoints2D(x, y, data[data[e].p].x, data[data[e].p].y)
				data[data[e].p].x = x
				data[data[e].p].y = y
				setElementFrozen(e, true)
				data[e].timer = setTimer(function(v) setElementFrozen(v, false) end, 5000, 1, e)

				local journal = "Linie: " .. data[data[e].p].line .. "\n"

				local station = ""
				if (#lines[l] == data[data[e].p].point) then
					if (lines[l] and lines[l][ p + 1] and lines[l][p + 1][1]) then
						journal = journal .. "Nächste Station: " .. lines[l][1][1] .. "\n"
						station = lines[l][p + 1][1]
					else
						journal = journal .. "Nächste Station: " .. "Endstelle" .. "\n"
						station = "Endstelle"
					end
				else
					if (lines[l] and lines[l][p + 1] and lines[l][p + 1][1]) then
						journal = journal .. "Nächste Station: " .. lines[l][p + 1][1] .. "\n"
						station = lines[l][p + 1][1]
					else
						journal = journal .. "Nächste Station: " .. "Endstelle" .. "\n"
						station "Endstelle"
					end
				end

				if (station ~= "") then
					for k,v in pairs(getVehicleOccupants(e)) do
						triggerClientEvent(v, "onServerPlaySavedSound", getRootElement(), "http://translate.google.com/translate_tts?tl=de&q=Naechste%20Station:%20"..station, "Busansage", false)
					end
				end

				createMessageSphere(x, y, z, 10, journal)

				if (data[data[e].p].point == 1) then
					if not (data[data[e].p].firstPoint) then
						local money = math.floor((data[data[e].p].range / 6) * 1.35 *getEventMultiplicator())
						data[e].p:addMoney(money)
						data[e].p:incrementStatistics("Job", "Geld_erarbeitet", money)
						data[e].p:checkJobAchievements()
						data[e].p:showInfoBox("info", "Für den Job hast du "..money.." $ erhalten.")
					end
					data[data[e].p].range = 0
					data[data[e].p].point = data[data[e].p].point + 1
					data[data[e].p].firstPoint = false
				elseif (data[data[e].p].point == #lines[data[data[e].p].line]) then
					data[data[e].p].point = 1
				else
					data[data[e].p].point = data[data[e].p].point + 1
				end

				setElementPosition(source, lines[data[data[e].p].line][data[data[e].p].point].x, lines[data[data[e].p].line][data[data[e].p].point].y, lines[data[data[e].p].line][data[data[e].p].point].z)
			end
		end
	end
end
)

addEventHandler("onPlayerWasted", getRootElement(), function()
	if (type(data[source]) == "table") then --when the table exists, the job is going on
		--kill Timer if exists
		if (isTimer(data[data[source].v].timer)) then killTimer(data[data[source].v].timer) end

		--Vehicle delete
		data[data[source].v] = nil
		destroyElement(data[source].v)

		--Marker + Blip delete
		data[data[source].m] = nil
		destroyElement(data[source].m)
		destroyElement(data[source].b)

		--deletes the player data
		data[source] = nil
	end
end
)

addEventHandler("onPlayerQuit", getRootElement(), function()
	if (type(data[source]) == "table") then --when the table exists, the job is going on
		--kill Timer if exists
		if (isTimer(data[data[source].v].timer)) then killTimer(data[data[source].v].timer) end

		--Vehicle delete
		data[data[source].v] = nil
		destroyElement(data[source].v)

		--Marker + Blip delete
		data[data[source].m] = nil
		destroyElement(data[source].m)
		destroyElement(data[source].b)

		--deletes the player data
		data[source] = nil
	end
end
)
