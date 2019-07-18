if GetCurrentRegion()~=5 then
	return
end

local cnbnpoints = LibStub("AceAddon-3.0"):NewAddon("cnbnpoints","AceConsole-3.0","AceEvent-3.0","AceComm-3.0","AceSerializer-3.0")
--------------------------------------------------------------------------------------

local key = tostring(random(0x100000,0xFFFFFF))

function cnbnpoints:OnInitialize()
	self:RegisterChatCommand("cnbnpoints", "ChatCommand")
	self:RegisterChatCommand("cbp", "ChatCommand")
	self:RegisterComm("NERB")
	self.db = LibStub("AceDB-3.0"):New("cnbnpoints_db",{profile={}},true)
	self:SendCommMessage('NERB',self:Serialize("NETEASE_CONNECT",key), "WHISPER","S1"..UnitFactionGroup("player"))
end

function cnbnpoints:OnEnable()
	if self.db.profile.enable_premade then
		self:RegisterEvent("LFG_LIST_ACTIVE_ENTRY_UPDATE")
	else
		self:UnregisterEvent("LFG_LIST_ACTIVE_ENTRY_UPDATE")
	end
end

function cnbnpoints:ChatCommand(input)
	if IsAddOnLoaded("cnbnpoints_options") == false then
		local loaded , reason = LoadAddOn("cnbnpoints_options")
		if not loaded then
			cnbnpoints:Print(reason)
		end
	end
	if not input or input:trim() == "" then
		LibStub("AceConfigDialog-3.0"):Open("cnbnpoints")
	else
		LibStub("AceConfigCmd-3.0"):HandleCommand("cnbnpoints", "cnbnpoints",input)
	end
end

local events = {}

function cnbnpoints:RegisterCBPEvent(key,func)
	events[key] = func
end

local cbp_unit

local function transfer(unit,ok,event,...)
	if ok and event then
		local func = events[event]
		if event == "NETEASE_CONNECT_SUCCESS" then
			local k = ...
			if key == k then
				cbp_unit = unit
			end
		elseif unit == cbp_unit and func then
			func(...)
		end
	end
end

function cnbnpoints:OnCommReceived(prefix, text, distribution, unit)
	if distribution == "WHISPER" then
		transfer(unit,self:Deserialize(text))
	end
end

function cnbnpoints:Send(...)
	if cbp_unit then
		local r = self:Serialize(...)
		cnbnpoints:SendCommMessage('NERB',r, "WHISPER",cbp_unit)
	end
end

function cnbnpoints:LFG_LIST_ACTIVE_ENTRY_UPDATE(event,status)
	if status then
		local active, activityID, ilvl, honorLevel, name, comment, voiceChat, duration, autoAccept, privateGroup, questID = C_LFGList.GetActiveEntryInfo()
		if active then
			local summary,data = comment:match('^(.*)%((^1^.+^^)%)$')
			if summary then
				local ok, customId, version, mode, loot,
				class, itemLevel, progression, leaderPvPRating, minLevel, maxLevel, pvpRating, source, creator, savedInstance, _, honorLevel = cnbnpoints:Deserialize(data)
				if ok then
					self:Send('SEI',
					UnitGUID('player'),
					"",
					version,
					activityID,
					customId,
					mode,
					loot,
					summary,
					ilvl,
					leaderPvPRating,
					class)
				end
			end
		end
	end
end
