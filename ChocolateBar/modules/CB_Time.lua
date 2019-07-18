-- a LDB object that will show/hide the chocolatebar set in the chocolatebar options
local LibStub = LibStub
local ChocolateBar = LibStub("AceAddon-3.0"):GetAddon("ChocolateBar")
local L = LibStub("AceLocale-3.0"):GetLocale("ChocolateBar")
local wipe, pairs = wipe, pairs

local delay = 60
local counter = 0
local localTime, gameTime
local fmtMinute  = "%H:%M"
local whiteFmt = "|cffffffff%s|r"

local Clock = CreateFrame("Frame")
Clock.obj = LibStub("LibDataBroker-1.1"):NewDataObject("TimeChocolate", {
	type = "data source",
	icon = "Interface\\Icons\\INV_Misc_PocketWatch_02",
	label = "Time",
	text  = "00:00",

	OnClick = function(self, btn)
		
		Clock:OnUpdate(100)
	end,

	OnTooltipShow = function(tooltip)
		if not tooltip or not tooltip.AddLine then return end
		tooltip:AddLine( " " )
		tooltip:AddDoubleLine( "本地时间", format(whiteFmt, localTime) )
		tooltip:AddDoubleLine( "游戏时间", format(whiteFmt, gameTime) )
		tooltip:AddLine( date(fullDate) )
	end,
	--OnScroll = OnScroll
})

function Clock:OnUpdate(elapsed)
	counter = counter + elapsed
	if counter >= delay then
		localTime = date(fmtMinute)
		gameTime = date(fmtMinute, GetServerTime())
		Clock.obj.text = localTime
		counter = 0
	end
end

function Clock:ADDON_LOADED(event, addon)
	self:OnUpdate(100)

	self:UnregisterEvent("ADDON_LOADED")
	self:SetScript("OnEvent", nil)
	self.ADDON_LOADED = nil
end

Clock:SetScript("OnUpdate", Clock.OnUpdate)
Clock:SetScript("OnEvent", Clock.ADDON_LOADED)
Clock:RegisterEvent("ADDON_LOADED")
--local module = ChocolateBar:NewModule("MoreChocolate", defaults, options)
