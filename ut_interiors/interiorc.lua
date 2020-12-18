local sx,sy = guiGetScreenSize()
local width,height = 580,380
local interiorWindow = guiCreateWindow(sx/2 - width/2,sy/2 - height/2,width,height,"Interiors",false)
local searchEmptyText = "Search [ID/Interior/Name/Namepart]"
local searchEdit = guiCreateEdit(10,25,350,25,searchEmptyText,false,interiorWindow)
local interiorGridlist = guiCreateGridList(10,65,350,320,false,interiorWindow)
local interiorIDColumn = interiorGridlist:addColumn("ID",0.1)
local interiorIntColumn = interiorGridlist:addColumn("Int",0.1)
local interiorNameColumn = interiorGridlist:addColumn("Name",0.7)
local boxLabel = guiCreateLabel(370,25,1000,1000,"|=====================|\n\n\n\n\n\n|=====================|",false,interiorWindow)
local idLabel = guiCreateLabel(375,40,1000,1000,"ID - #N/A",false,interiorWindow)
local nameLabel = guiCreateLabel(375,55,1000,1000,"Name - N/A",false,interiorWindow)
local interiorLabel = guiCreateLabel(375,70,1000,1000,"Interior - N/A",false,interiorWindow)
local positionLabel = guiCreateLabel(375,85,200,400,"Position - N/A",false,interiorWindow)
local bookmarkButton = guiCreateButton(370,150,200,40,"Bookmarks",false,interiorWindow)
local teleportButton = guiCreateButton(370,195,200,40,"Go to interior",false,interiorWindow)
local copyButton = guiCreateButton(370,240,200,40,"Copy Interior",false,interiorWindow)
local resetButton = guiCreateButton(370,285,200,40,"Reset Position",false,interiorWindow)
local closeButton = guiCreateButton(370,330,200,40,"Close",false,interiorWindow)


interiorWindow.visible = false
interiorWindow.sizable = false
interiorGridlist.sortingEnabled = false

if not fileExists("bookmarks.json") then
	local file = fileCreate("bookmarks.json")
	fileWrite(file,toJSON({},false,"tabs"))
	fileClose(file)
end

local file = fileOpen("bookmarks.json")
local bookmarks = fromJSON(fileRead(file,fileGetSize(file)))
fileClose(file)

function GuiGridList:setItemColour(rowid,r,g,b)
	if rowid then
		r,g,b = r or 255,g or 255, b or 255
		self:setItemColor(rowid,1,r,g,b)
		self:setItemColor(rowid,2,r,g,b)
		return self:setItemColor(rowid,3,r,g,b)
	end
	return false
end

local function isInteriorBookmarked(interior)
	for i,v in pairs(bookmarks) do
		if v.id == interior.id then
			return true,i
		end
	end
	return false
end

local function saveBookmarks()
	local file = fileOpen("bookmarks.json")
	fileWrite(file,toJSON(bookmarks,false,"tabs"))
	fileClose(file)
end

local function fillGridlist(list)
	interiorGridlist:clear()
	for i,v in pairs(list or interiorsJS) do
		local rowid = interiorGridlist:addRow(v.id,v.interior,v.name)
		if isInteriorBookmarked(v) then
			interiorGridlist:setItemColour(rowid,255,215,0)
		end
	end
end

fillGridlist()

local function updateInteriorLabels(interior)
	interior = interior or {}
	idLabel.text = ("ID - #%s"):format(interior.id or "N/A")
	nameLabel.text = ("Name - %s"):format(interior.name or "N/A")
	interiorLabel.text = ("Interior - %s"):format(interior.interior or "N/A")
	positionLabel.text = ("Position - \n%s"):format(inspect({interior.x,interior.y,interior.z}) or "N/A")
end

local function getSelectedInterior(rowid)
	local rowid = rowid or interiorGridlist:getSelectedItem()
	if rowid then
		local interiorID = tonumber(interiorGridlist:getItemText(rowid,interiorIDColumn))
		return interiorsJS[interiorID] or false,rowid
	end
	return false
end

local function getInteriorsBySearch()
	local search = searchEdit.text
	local tempInteriors = {}
	local searchTable = bookmarkButton.text == "Bookmarks" and interiorsJS or bookmarks
	search = tonumber(search) or search
	if type(search) == "number" then
		for i,v in pairs(searchTable) do
			if v.id == search or v.interior == search then
				table.insert(tempInteriors,v)
			end
		end
	elseif type(search) == "string" then
		for i,v in pairs(searchTable) do
			if string.find(v.name:lower(),search:lower()) then
				table.insert(tempInteriors,v)
			end
		end
	end
	fillGridlist(tempInteriors)
end

addEventHandler("onClientGUIClick",resourceRoot,function()
	if source == searchEdit and source.text == searchEmptyText then
		source.text = ""
	elseif not (source == searchEdit) then
		if searchEdit.text == "" then
			searchEdit.text = searchEmptyText
		elseif interiorGridlist.rowCount == 0 then
			searchEdit.text = searchEmptyText
			fillGridlist()
		end
	end
end)

addEventHandler("onClientGUIChanged",searchEdit,function()
	if source.text == searchEmptyText then return end
	getInteriorsBySearch()
end)

addEventHandler("onClientGUIClick",closeButton,function()
	interiorWindow.visible = false
	showCursor(false)
end,false)

addEventHandler("onClientGUIClick",interiorGridlist,function()
	local interior = getSelectedInterior()
	if interior then
		updateInteriorLabels(interior)
	end
end,false)

addEventHandler("onClientGUIClick",teleportButton,function()
	local interior = getSelectedInterior()
	if interior then
		triggerServerEvent("utils:onClientPlayerTeleportInterior",localPlayer,interior)
	end
end,false)

addEventHandler("onClientGUIDoubleClick",interiorGridlist,function()
	local interior,rowid = getSelectedInterior()
	if interior then
		local bookmark,index = isInteriorBookmarked(interior)
		if bookmark then
			interiorGridlist:setItemColour(rowid)
			for i,v in pairs(bookmarks) do
				if v.id == interior.id then
					table.remove(bookmarks,i)
					updateInteriorLabels()
					break
				end
			end
		else
			interiorGridlist:setItemColour(rowid,255,215,0)
			table.insert(bookmarks,interior)
		end
		if bookmarkButton.text == "Interior List" then
			fillGridlist(bookmarks)
		end
		saveBookmarks()
	end
end,false)

addEventHandler("onClientGUIClick",bookmarkButton,function()
	if source.text == "Bookmarks" then
		source.text = "Interior List"
		fillGridlist(bookmarks)
	else
		source.text = "Bookmarks"
		fillGridlist()
		searchEdit.text = searchEmptyText
	end
end,false)

addEventHandler("onClientGUIClick",copyButton,function()
	local interior = getSelectedInterior()
	if interior then
		local text = ("{interior = %s, x = %s, y = %s, z = %s, name = '%s'}"):format(interior.interior,interior.x,interior.y,interior.z,interior.name)
		outputChatBox(("Copied %s to clipboard."):format(text))
		outputConsole(inspect({interior.interior,interior.x,interior.y,interior.z}))
		outputConsole(inspect({interior.interior,interior.x,interior.y,interior.z,interior.name}))
		setClipboard(text)
	end
end,false)

addEventHandler("onClientGUIClick",resetButton,function()
	triggerServerEvent("utils:onClientPlayerTeleportInterior",localPlayer,{})
end,false)

addEventHandler("onClientKey",root,function(key,state)
	if not interiorWindow.visible then return end
	if state and (key == "arrow_u" or key == "arrow_d")then
		local interior,rowid = getSelectedInterior()
		if key == "arrow_u" then rowid = rowid - 1 end
		if key == "arrow_d" then rowid = rowid + 1 end
		interior,rowid = getSelectedInterior(rowid)
		if interior then
			interiorGridlist:setSelectedItem(rowid,1)
			updateInteriorLabels(interior)
			interiorGridlist:setVerticalScrollPosition(100 * (rowid+1)/interiorGridlist.rowCount)
		end
	end
end)

addCommandHandler("interiorlist",function()
	if getDevelopmentMode() then
		showCursor(true)
		interiorWindow:setPosition(sx/2-width/2,sy/2-height/2,false)
		interiorWindow.visible = true
	end
end)

--- USED TO FIND WORLD MODEL IN WORLD. ---
-- addEventHandler("onClientClick",root,function(button,state,_,_,x,y,z,element)
	-- if button == "left" and state == "down" then
		-- px,py,pz = getPedBonePosition(localPlayer,7)
		-- hit,hx,hy,hz,element,nx,ny,nz,mat,light,piece,worldid,wmx,wmy,wmz,wmrx,wmry,wmrx,worldlodid = processLineOfSight(px,py,pz,x,y,z,true,false,false,true,true,false,false,false,nil,true,true)
		
		-- if hit then
			-- dxDrawLine3D(px,py,pz,hx,hy,hz)
			-- if worldid then
				-- outputChatBox(inspect({worldid,hx,hy,hz}))
			-- end
		-- end
	-- end
-- end)

-- addEventHandler("onClientRender",root,function()
	-- if hx and hy and hz and px and py and pz then
		-- dxDrawLine3D(hx,hy,hz,px,py,pz)
	-- end
-- end)