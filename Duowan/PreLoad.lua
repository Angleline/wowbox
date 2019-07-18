--============================================
-- 名称: PreLoad
-- 日期: 2014-09-06
-- 描述: 提前全局兼容老版本信息
-- 作者: 盒子哥
-- 版权所有 (C) duowan
--============================================


function dwGetMapContinents()
	local mapInfo = {GetMapContinents()};
	local maps = {};
	for i=2, #mapInfo, 2 do
		table.insert(maps, mapInfo[i]);		
	end
	
	return unpack(maps);
end

--Provide copies of GetPlayerLink and GetBNPlayerLink for patch 7.1.5 backwards compatibility
local function FormatLink(linkType, linkDisplayText, ...)
	local linkFormatTable = { ("|H%s"):format(linkType), ... };
	return table.concat(linkFormatTable, ":") .. ("|h%s|h"):format(linkDisplayText);
end

function GetPlayerLink(characterName, linkDisplayText, lineID, chatType, chatTarget)
	-- Use simplified link if possible
	if lineID or chatType or chatTarget then
		return FormatLink("player", linkDisplayText, characterName, lineID or 0, chatType or 0, chatTarget or "");
	else
		return FormatLink("player", linkDisplayText, characterName);
	end
end

function GetBNPlayerLink(name, linkDisplayText, bnetIDAccount, lineID, chatType, chatTarget)
	return FormatLink("BNplayer", linkDisplayText, name, bnetIDAccount, lineID or 0, chatType, chatTarget);
end

if not GuildControlUIRankSettingsFrameRosterLabel then --fix 8.0点击公会面板报错
	GuildControlUIRankSettingsFrameRosterLabel = CreateFrame("frame")
	GuildControlUIRankSettingsFrameRosterLabel:Hide()
end