local _, Addon = ...

local API = Addon.API
local GarrisonFollowerTooltip_Owner = Addon.GarrisonFollowerTooltip_Owner

local Override = {}

local GARRISON_FOLLOWER_TOOLTIP = {};
function Override.GarrisonFollowerTooltip_Show(garrisonFollowerID, collected, quality, level, xp, levelxp, itemLevel, spec1, ability1, ability2, ability3, ability4, trait1, trait2, trait3, trait4, noAbilityDescriptions, underBiased, tooltipFrame, xpWidth)
	GARRISON_FOLLOWER_TOOLTIP.garrisonFollowerID = garrisonFollowerID;
	GARRISON_FOLLOWER_TOOLTIP.followerTypeID = C_Garrison.GetFollowerTypeByID(garrisonFollowerID);
	GARRISON_FOLLOWER_TOOLTIP.collected = collected;
	GARRISON_FOLLOWER_TOOLTIP.hyperlink = false;
	GARRISON_FOLLOWER_TOOLTIP.name = C_Garrison.GetFollowerNameByID(garrisonFollowerID);
	GARRISON_FOLLOWER_TOOLTIP.spec = C_Garrison.GetFollowerClassSpecByID(garrisonFollowerID);
	GARRISON_FOLLOWER_TOOLTIP.portraitIconID = C_Garrison.GetFollowerPortraitIconIDByID(garrisonFollowerID);
	GARRISON_FOLLOWER_TOOLTIP.quality = quality;
	GARRISON_FOLLOWER_TOOLTIP.level = level;
	GARRISON_FOLLOWER_TOOLTIP.xp = xp;
	GARRISON_FOLLOWER_TOOLTIP.levelxp = levelxp;
	GARRISON_FOLLOWER_TOOLTIP.iLevel = itemLevel;
	GARRISON_FOLLOWER_TOOLTIP.spec1 = spec1;
	GARRISON_FOLLOWER_TOOLTIP.ability1 = ability1;
	GARRISON_FOLLOWER_TOOLTIP.ability2 = ability2;
	GARRISON_FOLLOWER_TOOLTIP.ability3 = ability3;
	GARRISON_FOLLOWER_TOOLTIP.ability4 = ability4;
	GARRISON_FOLLOWER_TOOLTIP.trait1 = trait1;
	GARRISON_FOLLOWER_TOOLTIP.trait2 = trait2;
	GARRISON_FOLLOWER_TOOLTIP.trait3 = trait3;
	GARRISON_FOLLOWER_TOOLTIP.trait4 = trait4;
	GARRISON_FOLLOWER_TOOLTIP.isMaxLevel = (level >= GARRISON_FOLLOWER_MAX_LEVEL)
	GARRISON_FOLLOWER_TOOLTIP.isTroop = C_Garrison.GetFollowerIsTroop(garrisonFollowerID);
	GARRISON_FOLLOWER_TOOLTIP.noAbilityDescriptions = noAbilityDescriptions;
	GARRISON_FOLLOWER_TOOLTIP.underBiased = underBiased;

	if (not tooltipFrame) then
		if (GARRISON_FOLLOWER_TOOLTIP.followerTypeID == LE_FOLLOWER_TYPE_SHIPYARD_6_2) then
			tooltipFrame = GarrisonShipyardFollowerTooltip;
		else
			tooltipFrame = GarrisonFollowerTooltip;
		end
	end

	if (GARRISON_FOLLOWER_TOOLTIP.followerTypeID == LE_FOLLOWER_TYPE_SHIPYARD_6_2) then
		GarrisonFollowerTooltipTemplate_SetShipyardFollower(tooltipFrame, GARRISON_FOLLOWER_TOOLTIP, xpWidth);
	else
		GarrisonFollowerTooltipTemplate_SetGarrisonFollower(tooltipFrame, GARRISON_FOLLOWER_TOOLTIP, xpWidth);
	end
	tooltipFrame:Show();
end

GarrisonFollowerTooltip_Show_Override = Override.GarrisonFollowerTooltip_Show
--GarrisonFollowerTooltip_Show = Override.GarrisonFollowerTooltip_Show

function GarrisonFollowerTooltip_Show(garrisonFollowerID, collected, quality, level, xp, levelxp, itemLevel, spec1, ability1, ability2, ability3, ability4, trait1, trait2, trait3, trait4, noAbilityDescriptions, underBiased, tooltipFrame, xpWidth)
	if spec1 ~= 0 then
		Override.GarrisonFollowerTooltip_Show(garrisonFollowerID, collected, quality, level, xp, levelxp, itemLevel, 0, spec1, ability1, ability2, ability3, ability4, trait1, trait2, trait3, trait4, noAbilityDescriptions, underBiased, tooltipFrame)
	else
		Override.GarrisonFollowerTooltip_Show(garrisonFollowerID, collected, quality, level, xp, levelxp, itemLevel, spec1, ability1, ability2, ability3, ability4, trait1, trait2, trait3, trait4, noAbilityDescriptions, underBiased, tooltipFrame, xpWidth)
	end
end
Addon.Override = Override