local sx,sy = guiGetScreenSize()
local width,height = 270,250

local year = getRealTime().year + 1900
local month = getRealTime().month + 1

local buttons = {}

local months = {
	"January",
	"February",
	"March",
	"April",
	"May",
	"June",
	"July",
	"August",
	"September",
	"October",
	"November",
	"December",
}

local monthdays = {
	31,28,31,30,31,30,31,31,30,31,30,31
}

addEvent("calendar:onClientSelectDate",true)
addEvent("calendar:toggleCalender",true)

local window = guiCreateWindow(sx/2-width/2,sy/2-height/2,width,height,"Calendar",false)
local monthLabel = guiCreateLabel(width/2 - 73/2,25+15/4,100,100,"August 2020",false,window)
local leftButton = guiCreateButton(0,25,25,25,"<",false,window)
local rightButton = guiCreateButton(width-60,25,25,25,">",false,window)
local moLabel = guiCreateLabel(15,55,25,25,"Mo",false,window)
local tuLabel = guiCreateLabel(45,55,25,25,"Tu",false,window)
local weLabel = guiCreateLabel(80,55,25,25,"We",false,window)
local thLabel = guiCreateLabel(115,55,25,25,"Th",false,window)
local frLabel = guiCreateLabel(150,55,25,25,"Fr",false,window)
local saLabel = guiCreateLabel(180,55,25,25,"Sa",false,window)
local suLabel = guiCreateLabel(213,55,25,25,"Su",false,window)
local closeButton = guiCreateButton(240,25,25,245,"X",false,window)

local day = 0
for i = 0,5 do
	for v = 0,6 do
		day = day + 1
		local btn = guiCreateButton(10 + (v * 33),75 + (28 * i),25,25,day,false,window)
		if day > 31 then
			btn.enabled = false
			btn.text = day-31
		end
		table.insert(buttons,btn)
	end
end

local function calcTimestamp(years,months,days)
	return os.time({year = years or 1,month = months or 1,day = days or 1, hour = 1})
end

local function isDayButton(button)
	if button and getElementType(button) == "gui-button" then
		for i,v in pairs(buttons) do
			if v == button then
				return true
			end
		end
	end
	return false
end

local function getMonthsDays(year,month)
	local isLeap = year%4 == 0
	if month == 2 and isLeap then return 29 end
	return monthdays[month]
end

local function getPrevMonth(month)
	local year
	local month = month - 1
	if month <= 0 then
		month = 12
		year = 1
	end
	return month,year or 0
end

local function superMagicalFunctionThatReturnsMeDaysWhenGivenYearAndAMonth(year,month)
	local daysInMonth = getMonthsDays(year,month)
	local currentDay = getRealTime(calcTimestamp(year,month),false).weekday
	if currentDay == 0 then currentDay = 7 end
	return daysInMonth,currentDay
end

addCommandHandler("calendar",function(_,year,month)
	year = tonumber(year) or 2020
	month = tonumber(month) or 10
	superMagicalFunctionThatReturnsMeDaysWhenGivenYearAndAMonth(year,month)
end)

local function updateDayButtons(year,month)
	local txt = months[month].." "..year
	monthLabel:setText(txt)
	local daysInMonth,startDay = superMagicalFunctionThatReturnsMeDaysWhenGivenYearAndAMonth(year,month)
	
	--[[
	for i,v in pairs(buttons) do
		v.visible = false
		v.enabled = false
	end
	
	local day = 1
	for i = startDay,daysInMonth+startDay-1 do
		local button 
		if buttons[i] then
			buttons[i].text = day
			buttons[i].visible = true
			buttons[i].enabled = true
		end
		day = day + 1
	end
	]]
	local day = 1
	for i,v in pairs(buttons) do
		v.enabled,v.visible = false,false
		if i >= startDay and i < daysInMonth+startDay then
			v.enabled,v.visible = true,true
			v.text = day
			day = day + 1
		end
	end

end




updateDayButtons(year,month)

addEventHandler("onClientGUIClick",rightButton,function()
	month = month + 1
	if month > 12 then
		month = 1
		year = year + 1
	end
	updateDayButtons(year,month)
end,false)

addEventHandler("onClientGUIClick",leftButton,function()
	month = month - 1
	if month <= 0 then
		month = 12
		year = year - 1
	end
	updateDayButtons(year,month)
end,false)

addEventHandler("onClientGUIClick",closeButton,function()
	window.visible = false
end,false)

addEventHandler("onClientGUIClick",root,function()
	if window.visible and isDayButton(source) then
		local day = tonumber(source.text)
		triggerEvent("calendar:onClientSelectDate",localPlayer,getRealTime(calcTimestamp(year,month,day)))
		triggerServerEvent("calendar:onClientPlayerSelectDate",localPlayer,getRealTime(calcTimestamp(year,month,day)))
	end
end)