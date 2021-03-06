local mod	= DBM:NewMod("z1105", "DBM-PvP", 2)

mod:SetRevision("20190812173754")
mod:SetZone(DBM_DISABLE_ZONE_DETECTION)

mod:RegisterEvents(
	"ZONE_CHANGED_NEW_AREA"
)

do
	local bgzone = false

	function mod:OnInitialize()
		if 1105 == DBM:GetCurrentArea() then
			bgzone = true
			DBM:GetModByName("Battlegrounds"):SubscribeAssault(
				0,
				-- TODO: Get default ID's
				{},
				{0.01, 8 / 5, 16 / 5, 32 / 5}
			)
			bgzone = true
			-- Assault ID: 519
		elseif bgzone then
			bgzone = false
			self:UnregisterShortTermEvents()
		end
	end

	function mod:ZONE_CHANGED_NEW_AREA()
		self:ScheduleMethod(1, "OnInitialize")
	end
end