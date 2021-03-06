local mod	= DBM:NewMod("Arenas", "DBM-PvP", 1)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20190812173754")
mod:SetZone(DBM_DISABLE_ZONE_DETECTION)

mod:RegisterEvents("CHAT_MSG_BG_SYSTEM_NEUTRAL")

local timerShadow		= mod:NewTimer(90, "TimerShadow", 34709)
local timerDamp			= mod:NewCastTimer(300, 110310)
local timerCombatStart	= mod:NewCombatTimer(30)

function mod:CHAT_MSG_BG_SYSTEM_NEUTRAL(msg)
	if IsActiveBattlefieldArena() and msg == L.Start15 then
		timerShadow:Schedule(16)
		timerDamp:Schedule(16)
		timerCombatStart:Start()
	elseif msg == L.highmaulArena then
		timerCombatStart:Start()
	end
end