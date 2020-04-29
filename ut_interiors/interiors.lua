--[[ JAVASCRIPT TO SCRAPE WIKI

var tables = document.getElementsByClassName("wikitable")
var total = ""
// loop through all tables

for (var h = 1; h < tables.length; h++){
	var table = tables[h]
	var interiorID = parseInt(table.rows[0].cells[0].innerHTML.substring(2))
	total += "\n\n"+"--INTERIOR "+interiorID+"\n"
	
	for (var i = 2; i < table.rows.length; i++){

		var row = "{";

		for (var j = 0; j < table.rows[i].cells.length; j++) {
			var data = table.rows[i].cells[j].innerHTML
			if (j == 0){ 
				row += 'name = "' + data.substring(0,data.length-4).substring(3)+'"';
			}
			if (j == 1){
				row += "x = " + data;
			}
			if (j == 2){
				row += "y = " + data;
			}
			if (j == 3){
				row += "z = " + data;
			}
			row += ", "
		}
		
		row += "interior = "+interiorID+"},\n"
		total += row
	}
	
	
}

console.log(total)

https://wiki.multitheftauto.com/wiki/Interior_IDs
]]


local interiorsJS = {
--INTERIOR 1
	{name = "Ammu-nation 1", x = 289.7870, y = -35.7190, z = 1003.5160, interior = 1},
	{name = "Burglary House 1", x = 224.6351, y = 1289.012, z = 1082.141, interior = 1},
	{name = "The Wellcome Pump (Catalina?)", x = 681.65, y = -452.86, z = -25.62, interior = 1},
	{name = "Restaurant 1", x = 446.6941, y = -9.7977, z = 1000.7340, interior = 1},
	{name = "Caligulas Casino", x = 2235.2524, y = 1708.5146, z = 1010.6129, interior = 1},
	{name = "Denise's Place", x = 244.0892, y = 304.8456, z = 999.1484, interior = 1},
	{name = "Shamal cabin", x = 1.6127, y = 34.7411, z = 1199.0, interior = 1},
	{name = "Liberty City", x = -750.80, y = 491.00, z = 1371.70, interior = 1},
	{name = "Sweet's House", x = 2525.0420, y = -1679.1150, z = 1015.4990, interior = 1},
	{name = "Transfender", x = 621.7850, y = -12.5417, z = 1000.9220, interior = 1},
	{name = "Safe House 4", x = 2216.5400, y = -1076.2900, z = 1050.4840, interior = 1},
	{name = "Trials(Hyman Memorial?) Stadium", x = -1401.13, y = 106.110, z = 1032.273, interior = 1},
	{name = "Warehouse 1", x = 1405.3120, y = -8.2928, z = 1000.9130, interior = 1},
	{name = "Doherty Garage", x = -2042.42, y = 178.59, z = 28.84, interior = 1},
	{name = "Sindacco Abatoir", x = 963.6078, y = 2108.3970, z = 1011.0300, interior = 1},
	{name = "Sub Urban", x = 203.8173, y = -46.5385, z = 1001.8050, interior = 1},
	{name = "Wu Zi Mu's Betting place", x = -2159.9260, y = 641.4587, z = 1052.3820, interior = 1},


	--INTERIOR 2
	{name = "Ryder's House", x = 2464.2110, y = -1697.9520, z = 1013.5080, interior = 2},
	{name = "Angel Pine Trailer", x = 0.3440, y = -0.5140, z = 1000.5490, interior = 2},
	{name = "The Pig Pen", x = 1213.4330, y = -6.6830, z = 1000.9220, interior = 2},
	{name = "BDups Crack Palace", x = 1523.7510, y = -46.0458, z = 1002.1310, interior = 2},
	{name = "Big Smoke's Crack Palace", x = 2543.6610, y = -1303.9320, z = 1025.0700, interior = 2},
	{name = "Burglary House 2", x = 225.756, y = 1240.000, z = 1082.149, interior = 2},
	{name = "Burglary House 3", x = 447.470, y = 1398.348, z = 1084.305, interior = 2},
	{name = "Burglary House 4", x = 491.740, y = 1400.541, z = 1080.265, interior = 2},
	{name = "Katie's Place", x = 267.2290, y = 304.7100, z = 999.1480, interior = 2},
	{name = "Loco Low Co.", x = 612.5910, y = -75.6370, z = 997.9920, interior = 2},
	{name = "Reece's Barbershop", x = 612.5910, y = -75.6370, z = 997.9920, interior = 2},


	--INTERIOR 3
	{name = "Jizzy's Pleasure Domes", x = -2636.7190, y = 1402.9170, z = 906.4609, interior = 3},
	{name = "Brothel", x = 940.6520, y = -18.4860, z = 1000.9300, interior = 3},
	{name = "Brothel 2", x = 967.5334, y = -53.0245, z = 1001.1250, interior = 3},
	{name = "BDups Apartment", x = 1527.38, y = -11.02, z = 1002.10, interior = 3},
	{name = "Bike School", x = 1494.3350, y = 1305.6510, z = 1093.2890, interior = 3},
	{name = "Big Spread Ranch", x = 1210.2570, y = -29.2986, z = 1000.8790, interior = 3},
	{name = "LV Tattoo Parlour", x = -204.4390, y = -43.6520, z = 1002.2990, interior = 3},
	{name = "LVPD HQ", x = 289.7703, y = 171.7460, z = 1007.1790, interior = 3},
	{name = "OG Loc's House", x = 516.8890, y = -18.4120, z = 1001.5650, interior = 3},
	{name = "Pro-Laps", x = 207.3560, y = -138.0029, z = 1003.3130, interior = 3},
	{name = "Las Venturas Planning Dep.", x = 374.6708, y = 173.8050, z = 1008.3893, interior = 3},
	{name = "Record Label Hallway", x = 1038.2190, y = 6.9905, z = 1001.2840, interior = 3},
	{name = "Driving School", x = -2027.9200, y = -105.1830, z = 1035.1720, interior = 3},
	{name = "Johnson House", x = 2496.0500, y = -1693.9260, z = 1014.7420, interior = 3},
	--{name = "Budget Inn Motel Room<", interior = 3},
	{name = "Burglary House 5", x = 234.733, y = 1190.391, z = 1080.258, interior = 3},
	{name = "Gay Gordo's Barbershop", x = 418.6530, y = -82.6390, z = 1001.8050, interior = 3},
	{name = "Helena's Place", x = 292.4459, y = 308.7790, z = 999.1484, interior = 3},
	{name = "Inside Track Betting", x = 826.8863, y = 5.5091, z = 1004.4830, interior = 3},
	{name = "Sex Shop", x = -106.7268, y = -19.6444, z = 1000.7190, interior = 3},
	{name = "Wheel Arch Angels", x = 614.3889, y = -124.0991, z = 997.9950, interior = 3},


	--INTERIOR 4
	{name = "24/7 shop 1", x = -27.3769, y = -27.6416, z = 1003.5570, interior = 4},
	{name = "Ammu-Nation 2", x = 285.8000, y = -84.5470, z = 1001.5390, interior = 4},
	{name = "Burglary House 6", x = -262.91, y = 1454.966, z = 1084.367, interior = 4},
	{name = "Burglary House 7", x = 221.4296, y = 1142.423, z = 1082.609, interior = 4},
	{name = "Burglary House 8", x = 261.1168, y = 1286.519, z = 1080.258, interior = 4},
	{name = "Diner 2", x = 460.0, y = -88.43, z = 999.62, interior = 4},
	{name = "Dirtbike Stadium", x = -1435.8690, y = -662.2505, z = 1052.4650, interior = 4},
	{name = "Michelle's Place", x = 302.6404, y = 304.8048, z = 999.1484, interior = 4},


	--INTERIOR 5
	{name = "Madd Dogg's Mansion", x = 1272.9116, y = -768.9028, z = 1090.5097, interior = 5},
	{name = "Well Stacked Pizza Co.", x = 377.7758, y = -126.2766, z = 1001.4920, interior = 5},
	{name = "Victim", x = 221.3310, y = -6.6169, z = 1005.1977, interior = 5},
	{name = "Burning Desire House", x = 2351.1540, y = -1180.5770, z = 1027.9770, interior = 5},
	--{name = "Barbara's Place<", interior = 5},
	{name = "Burglary House 9", x = 22.79996, y = 1404.642, z = 1084.43, interior = 5},
	{name = "Burglary House 10", x = 228.9003, y = 1114.477, z = 1080.992, interior = 5},
	{name = "Burglary House 11", x = 140.5631, y = 1369.051, z = 1083.864, interior = 5},
	{name = "The Crack Den", x = 322.1117, y = 1119.3270, z = 1083.8830, interior = 5},
	{name = "Police Station (Barbara's)", x = 322.72, y = 306.43, z = 999.15, interior = 5},
	{name = "Diner 1", x = 448.7435, y = -110.0457, z = 1000.0772, interior = 5},
	{name = "Ganton Gym", x = 768.0793, y = 5.8606, z = 1000.7160, interior = 5},
	{name = "Vank Hoff Hotel ", x = 2232.8210, y = -1110.0180, z = 1050.8830, interior = 5},


	--INTERIOR 6
	{name = "Ammu-Nation 3", x = 297.4460, y = -109.9680, z = 1001.5160, interior = 6},
	{name = "Ammu-Nation 4", x = 317.2380, y = -168.0520, z = 999.5930, interior = 6},
	{name = "LSPD HQ ", x = 246.4510, y = 65.5860, z = 1003.6410, interior = 6},
	{name = "Safe House 3", x = 2333.0330, y = -1073.9600, z = 1049.0230, interior = 6},
	{name = "Safe House 5", x = 2194.2910, y = -1204.0150, z = 1049.0230, interior = 6},
	{name = "Safe House 6", x = 2308.8710, y = -1210.7170, z = 1049.0230, interior = 6},
	{name = "Cobra Marital Arts Gym", x = 774.0870, y = -47.9830, z = 1000.5860, interior = 6},
	{name = "24/7 shop 2", x = -26.7180, y = -55.9860, z = 1003.5470, interior = 6},
	{name = "Millie's Bedroom", x = 344.5200, y = 304.8210, z = 999.1480, interior = 6},
	{name = "Fanny Batter's Brothel", x = 744.2710, y = 1437.2530, z = 1102.7030, interior = 6},
	{name = "Restaurant 2", x = 443.9810, y = -65.2190, z = 1050.0000, interior = 6},
	{name = "Burglary House 15", x = 234.319, y = 1066.455, z = 1084.208, interior = 6},
	{name = "Burglary House 16", x = -69.049, y = 1354.056, z = 1080.211, interior = 6},


	--INTERIOR 7
	{name = "Ammu-Nation 5 (2 Floors)", x = 315.3850, y = -142.2420, z = 999.6010, interior = 7},
	{name = "8-Track Stadium", x = -1417.8720, y = -276.4260, z = 1051.1910, interior = 7},
	{name = "Below the Belt Gym", x = 774.2430, y = -76.0090, z = 1000.6540, interior = 7},


	--INTERIOR 8
	--{name = "Safe house 2<", interior = 8},
	{name = "Colonel Fuhrberger's House", x = 2807.8990, y = -1172.9210, z = 1025.5700, interior = 8},
	{name = "Burglary House 22", x = -42.490, y = 1407.644, z = 1084.43, interior = 8},


	--INTERIOR 9
	{name = "Unknown safe house", x = 2253.1740, y = -1139.0100, z = 1050.6330, interior = 9},
	{name = "Andromada Cargo hold", x = 315.48, y = 984.13, z = 1959.11, interior = 9},
	{name = "Burglary House 12", x = 85.32596, y = 1323.585, z = 1083.859, interior = 9},
	{name = "Burglary House 13", x = 260.3189, y = 1239.663, z = 1084.258, interior = 9},
	{name = "Cluckin' Bell", x = 365.67, y = -11.61, z = 1000.87, interior = 9},


	--INTERIOR 10
	{name = "Four Dragons Casino", x = 2009.4140, y = 1017.8990, z = 994.4680, interior = 10},
	{name = "RC Zero's Battlefield", x = -975.5766, y = 1061.1312, z = 1345.6719, interior = 10},
	{name = "Burger Shot", x = 366.4220, y = -73.4700, z = 1001.5080, interior = 10},
	{name = "Burglary House 14", x = 21.241, y = 1342.153, z = 1084.375, interior = 10},
	{name = "Janitor room(Four Dragons Maintenance)", x = 1891.3960, y = 1018.1260, z = 31.8820, interior = 10},
	--{name = "Safe House 1<", interior = 10},
	{name = "Hashbury safe house", x = 2264.5231, y = -1210.5229, z = 1049.0234, interior = 10},
	{name = "24/7 shop 3", x = 6.0780, y = -28.6330, z = 1003.5490, interior = 10},
	{name = "Abandoned AC Tower", x = 419.6140, y = 2536.6030, z = 10.0000, interior = 10},
	{name = "SFPD HQ", x = 246.4410, y = 112.1640, z = 1003.2190, interior = 10},


	--INTERIOR 11
	{name = "The Four Dragons Office", x = 2011.6030, y = 1017.0230, z = 39.0910, interior = 11},
	--{name = "Los Santos safe house<", interior = 11},
	{name = "Ten Green Bottles Bar", x = 502.3310, y = -70.6820, z = 998.7570, interior = 11},


	--INTERIOR 12
	--{name = "Budget Inn Motel Room<", interior = 12},
	{name = "The Casino", x = 1132.9450, y = -8.6750, z = 1000.6800, interior = 12},
	{name = "Macisla's Barbershop", x = 411.6410, y = -51.8460, z = 1001.8980, interior = 12},
	{name = "Safe house 7", x = 2237.2970, y = -1077.9250, z = 1049.0230, interior = 12},
	{name = "Modern safe house", x = 2324.4990, y = -1147.0710, z = 1050.7100, interior = 12},


	--INTERIOR 13
	{name = "LS Atrium", x = 1724.33, y = -1625.784, z = 20.211, interior = 13},
	{name = "CJ's Garage", x = -2043.966, y = 172.932, z = 28.835, interior = 13},


	--INTERIOR 14
	{name = "Kickstart Stadium", x = -1464.5360, y = 1557.6900, z = 1052.5310, interior = 14},
	{name = "Didier Sachs", x = 204.1789, y = -165.8740, z = 1000.5230, interior = 14},
	{name = "Francis Int. Airport (Front ext.)", x = -1827.1473, y = 7.2074, z = 1061.1435, interior = 14},
	{name = "Francis Int. Airport (Baggage Claim/Ticket Sales)", x = -1855.5687, y = 41.2631, z = 1061.1435, interior = 14},
	{name = "Wardrobe", x = 255.7190, y = -41.1370, z = 1002.0230, interior = 14},


	--INTERIOR 15
	{name = "Binco", x = 207.5430, y = -109.0040, z = 1005.1330, interior = 15},
	{name = "Blood Bowl Stadium", x = -1394.20, y = 987.62, z = 1023.96, interior = 15},
	{name = "Jefferson Motel", x = 2217.6250, y = -1150.6580, z = 1025.7970, interior = 15},
	{name = "Burglary House 17", x = -285.711, y = 1470.697, z = 1084.375, interior = 15},
	{name = "Burglary House 18", x = 327.808, y = 1479.74, z = 1084.438, interior = 15},
	{name = "Burglary House 19", x = 375.572, y = 1417.439, z = 1081.328, interior = 15},
	{name = "Burglary House 20", x = 384.644, y = 1471.479, z = 1080.195, interior = 15},
	{name = "Burglary House 21", x = 295.467, y = 1474.697, z = 1080.258, interior = 15},


	--INTERIOR 16
	{name = "24/7 shop 4", x = -25.3730, y = -139.6540, z = 1003.5470, interior = 16},
	{name = "LS Tattoo Parlour", x = -204.5580, y = -25.6970, z = 1002.2730, interior = 16},
	{name = "Sumoring? stadium", x = -1400, y = 1250, z = 1040, interior = 16},


	--INTERIOR 17
	{name = "24/7 shop 5", x = -25.3930, y = -185.9110, z = 1003.5470, interior = 17},
	{name = "Club", x = 493.4687, y = -23.0080, z = 1000.6796, interior = 17},
	{name = "Rusty Brown's - Ring Donuts", x = 377.0030, y = -192.5070, z = 1000.6330, interior = 17},
	{name = "The Sherman's Dam Generator Hall", x = -942.1320, y = 1849.1420, z = 5.0050, interior = 17},
	{name = "Hemlock Tattoo", x = 377.0030, y = -192.5070, z = 1000.6330, interior = 17},


	--INTERIOR 18
	{name = "Lil Probe Inn", x = -227.0280, y = 1401.2290, z = 27.7690, interior = 18},
	{name = "24/7 shop 6", x = -30.9460, y = -89.6090, z = 1003.5490, interior = 18},
	{name = "Atrium", x = 1726.1370, y = -1645.2300, z = 20.2260, interior = 18},
	{name = "Warehouse 2", x = 1296.6310, y = 0.5920, z = 1001.0230, interior = 18},
	{name = "Zip", x = 161.4620, y = -91.3940, z = 1001.8050, interior = 18},
}


local function getInteiorByName(namepart)
	local found = 0
	local index = false
	for i,v in pairs(interiorsJS) do
		if string.find(v.name,namepart) then
			found = found + 1
			index = i
		end
	end
	
	return index,found
end

local function getInteiorsByID(id)
	if id > 18 or id < 1 then
		return false
	end
	
	local temp = {}
	
	for i,v in pairs(interiorsJS) do
		if v.interior == id then
			table.insert({
				name = v.name,
				x = v.x,
				y = v.y,
				z = v.z,
				interior = v.interior
			},temp)
		end
	end
	
	return temp
end


addCommandHandler("usetint",function(player,command,number)
	number = tonumber(number)
	if getDevelopmentMode() and number and interiorsJS[number] then
		local interior = interiorsJS[number]
		
		setElementInterior(player,interior.interior)
		setElementPosition(player,interior.x,interior.y,interior.z)
		outputChatBox(interior.name,player)
	end
end)