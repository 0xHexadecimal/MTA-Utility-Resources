addEvent("calendar:onClientPlayerSelectDate",true)

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

local days = {
	"Sunday",
	"Monday",
	"Tuesday",
	"Wednesday",
	"Thursday",
	"Friday",
	"Saturday",
}


local function dateToFull(date)
	local p
	if date.monthday == 1 or date.monthday == 21 or date.monthday == 31 then
		p = "st"
	elseif date.monthday == 2 or date.monthday == 22 then
		p = "nd"
	elseif date.monthday == 3 or date.monthday == 23 then
		p = "rd"
	else
		p = "th"
	end
	return ("%s %s%s %s %s"):format(days[date.weekday+1],date.monthday,p,months[date.month+1],date.year+1900)
end

local function datetoStandard(date)
	return ("%s/%s/%s"):format(date.monthday,date.month+1,date.year+1900)
end

addEventHandler("calendar:onClientPlayerSelectDate",root,function(date)
	outputChatBox(("%s has selected the date \"%s [%s]\""):format(client.name,dateToFull(date),datetoStandard(date)))
end)