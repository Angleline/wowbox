local mod	= DBM:NewMod(430, "DBM-Party-Classic", 6, 232)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("2019041710024")
mod:SetCreatureID(13596)
mod:SetEncounterID(428)

mod:RegisterCombat("combat")

--[[
mod:RegisterEventsInCombat(
	"SPELL_CAST_START"
)

--local warningSoul	= mod:NewTargetAnnounce(32346, 2)

local specWarnMaddeningCall			= mod:NewSpecialWarningInterrupt(86620, "HasInterrupt", nil, nil, 1, 2)

local timerMaddeningCallCD			= mod:NewAITimer(180, 86620, nil, nil, nil, 4, nil, DBM_CORE_INTERRUPT_ICON)

function mod:OnCombatStart(delay)
	timerMaddeningCallCD:Start(1-delay)
end

function mod:SPELL_CAST_START(args)
	timerMaddeningCallCD:Start()
	if args.spellId == 86620 and self:CheckInterruptFilter(args.sourceGUID, false, true) then
		specWarnMaddeningCall:Show(args.sourceName)
		specWarnMaddeningCall:Play("kickcast")
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 32346 then
		warningSoul:Show(args.destName)
	end
end--]]
