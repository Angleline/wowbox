local AceAddon = LibStub("AceAddon-3.0")
local AceLocale = LibStub("AceLocale-3.0")
local AceDBOptions = LibStub("AceDBOptions-3.0")
local AceConfig = LibStub("AceConfig-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local cnbnpoints = AceAddon:GetAddon("cnbnpoints")
local cnbnpoints_options = AceAddon:GetAddon("cnbnpoints_options")

function cnbnpoints_options:OnInitialize()
	local options = self.option_table
	options.args.profile = AceDBOptions:GetOptionsTable(cnbnpoints.db)
	options.args.profile.order = -1
	AceConfig:RegisterOptionsTable("cnbnpoints", options)
	cnbnpoints.db.RegisterCallback(cnbnpoints, "OnProfileChanged", "OnEnable")
	cnbnpoints.db.RegisterCallback(cnbnpoints, "OnProfileCopied", "OnEnable")
	cnbnpoints.db.RegisterCallback(cnbnpoints, "OnProfileReset", "OnEnable")
end

function cnbnpoints_options:OnEnable()
	cnbnpoints:RegisterCBPEvent("MALLQUERY_RESULT",function(bnpoint)
		cnbnpoints.db.profile.bnpoint = bnpoint
		AceConfigRegistry:NotifyChange("cnbnpoints")
	end)
	cnbnpoints:RegisterCBPEvent("APP_QUERY_RESULT",function(...)
		cnbnpoints:Print("App query result received",...)	
	end)
	cnbnpoints:RegisterCBPEvent("SDV",function(dataname,...)
		if dataname == "ActivitiesData" then
			cnbnpoints.db.profile.whatsnew_text = ...
			AceConfigRegistry:NotifyChange("cnbnpoints")
		elseif dataname == "MallData" then
			local ok,malldata,tb = cnbnpoints:Deserialize(...)
			if type(tb) == "table" then
				local gmatch = string.gmatch
				local t = {}
				for k,v in pairs(tb) do
					for k1,_ in gmatch(v, "([^#]+)") do
						local tb = {}
						for k2,_ in gmatch(k1, "([^;]+)") do
							table.insert(tb,k2)
						end
						if 2 < #tb and type(tb[2]) == "string" then
							local tb2 = {}
							for k3,_ in gmatch(tb[2], "([^,]+)") do
								table.insert(tb2,k3)
							end
							tb[2] = tb2
							table.insert(t,tb)
						end
					end
				end
				cnbnpoints.db.profile.store_data = t
				AceConfigRegistry:NotifyChange("cnbnpoints")
			end
		end
	end)
	cnbnpoints:RegisterCBPEvent("MALLPURCHASE_RESULT",function(result,ok)
		cnbnpoints:Send("MALLQUERY",UnitGUID("player"),cnbnpoints_options.get_constant())
	end)
end
