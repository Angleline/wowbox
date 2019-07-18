
local Recount_SpeedUpUpdates = CreateFrame ("frame", "RecountSpeedUpUpdates", UIParent)
Recount_SpeedUpUpdates:RegisterEvent ("ADDON_LOADED")
 
--> cancel the current tick
local CancelOldSchedule = function()
	Recount:CancelTimer (Recount.MainWindow.timeid)
end
--> set the new custom tick
local SetCustomTick = function()
	if (Recount.MainWindow.timeid) then
		CancelOldSchedule()
		Recount.MainWindow.timeid = Recount:ScheduleRepeatingTimer ("RefreshMainWindow", Recount_SpeedUpUpdates.db.TickInterval, true)
	end
end

Recount_SpeedUpUpdates:SetScript ("OnEvent", function (self, event, ...)
	if (event == "ADDON_LOADED") then
		local addonName = select (1, ...)
		if (addonName == "Recount" and Recount and dwGetCVar("RecountMod", "Recount_SpeedUp")==1) then
			--> grab our saved table
			Recount_SpeedUpUpdates.db = Recount_SpeedUpUpdatesDB or {TickInterval = 0.5}
			Recount_SpeedUpUpdatesDB = Recount_SpeedUpUpdates.db
			--> install hooks
			hooksecurefunc (Recount.MainWindow, 'ShowFunc', function()
				C_Timer.After (0.1, SetCustomTick)
			end)
			hooksecurefunc (Recount.MainWindow, 'HideFunc', function()
				--do nothing
			end)
			--> set on startup
			if (Recount.MainWindow.timeid) then
				C_Timer.After (0.1, SetCustomTick)
			end
			self:UnregisterEvent("ADDON_LOADED")
		end
	end
end)
