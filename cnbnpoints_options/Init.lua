local cnbnpoints = LibStub("AceAddon-3.0"):GetAddon("cnbnpoints")
local cnbnpoints_options = LibStub("AceAddon-3.0"):NewAddon("cnbnpoints_options")

local order = 0
local function get_order()
	local temp = order
	order = order +1
	return temp
end

local constant = "7310"
local constant2 = constant:gsub('(%d)(%d)(%d%d)', '%10%200.%3')

function cnbnpoints_options.get_constant()
	return constant
end

local items_tb = {}

local select_items = {}

function cnbnpoints_options.buy()
	local guid = UnitGUID('player')
	for k,v in pairs(select_items) do
		cnbnpoints:Send("MALLPURCHASE", k, guid, constant, true)
	end
end

cnbnpoints_options.option_table =
{
	type = "group",
	name = "cnbnpoints",
	args =
	{
		store =
		{
			order = get_order(),
			name = BLIZZARD_STORE,
			type = "group",
			args =
			{
				pointout =
				{
					name = BATTLENET_OPTIONS_LABEL,
					type = "input",
					order = get_order(),
					set = function()
					end,
					get = function()
						local bnp = cnbnpoints.db.profile.bnpoint
						if bnp then
							return tostring(bnp)
						else
							cnbnpoints:Send("MALLQUERY",UnitGUID("player"),constant)
						end
					end,
				},
				point =
				{
					name = REFRESH,
					desc = BATTLENET_OPTIONS_LABEL,
					order = get_order(),
					type = "execute",
					func = function()
						cnbnpoints.db.profile.bnpoint = nil
					end,
				},
				items =
				{
					order = get_order(),
					name = ITEMS,
					type = "multiselect",
					width = "full",
					values = function()
						local sd = cnbnpoints.db.profile.store_data
						if sd then
							local concat = {}
							local i,n = 1,#sd
							while i <= n do
								local data = sd[i]
								wipe(concat)
								local data2 = data[2]
								concat[#concat+1] = select(2,GetItemInfo(data[3]))
								concat[#concat+1] = " "
								concat[#concat+1] = data2[1]
								concat[#concat+1] = "*"
								if data2[#data2] == "每周限量" then
									concat[#concat+1] = " "
									concat[#concat+1] = WEEKLY
								end
								items_tb[data[1]] = table.concat(concat)
								i = i + 1
							end
							return items_tb
						else
							cnbnpoints:Send("SLOGIN",constant2,UnitGUID("player"),0,nil,nil,true)
						end
					end,
					get = function(info,key)
						return select_items[key]
					end,
					set = function(info,key,val)
						if val then
							select_items[key] = true
						else
							select_items[key] = nil
						end
					end
				},
				apply =
				{
					name = APPLY,
					desc = BUYOUT,
					confirm = true,
					order = get_order(),
					type = "execute",
					func = cnbnpoints_options.buy,
				},
				reset =
				{
					name = RESET,
					desc = BUYOUT,
					order = get_order(),
					type = "execute",
					func = function()
						wipe(select_items)
					end,
				},

				items_rfs =
				{
					name = REFRESH,
					desc = ITEMS,
					order = get_order(),
					type = "execute",
					func = function()
						cnbnpoints.db.profile.store_data = nil
						wipe(select_items)
					end,
				},
			}
		},
		other =
		{
			order = get_order(),
			name = OTHER,
			type = "group",
			args =
			{
				enable_premade =
				{
					order = get_order(),
					name = LFGLIST_NAME,
					type = "toggle",
					set = function(_,val)
						if val then
							cnbnpoints.db.profile.enable_premade = true
						else
							cnbnpoints.db.profile.enable_premade = nil
						end
						cnbnpoints:OnEnable()
					end,
					get = function()
						return cnbnpoints.db.profile.enable_premade
					end
				},
			},
		},
		info =
		{
			order = get_order(),
			name = SPLASH_BASE_HEADER,
			type = "group",
			args =
			{
				enable =
				{
					order = get_order(),
					name = ENABLE,
					type = "toggle",
					set = function(_,val)
						if val then
							cnbnpoints.db.profile.whatsnew = true
						else
							local profile = cnbnpoints.db.profile
							profile.whatsnew = nil
							profile.whatsnew_text = nil
						end
					end,
					get = function()
						return cnbnpoints.db.profile.whatsnew
					end
				},
				info =
				{
					order = get_order(),
					name = LOCALE_TEXT_LABEL,
					type = "input",
					set = function()
						
					end,
					get = function()
						if cnbnpoints.db.profile.whatsnew then
							if cnbnpoints.db.profile.whatsnew_text then
								return cnbnpoints.db.profile.whatsnew_text
							else
								cnbnpoints:Send("SLOGIN",constant2,UnitGUID("player"),0,nil,nil,true)
							end
						end
					end,
					width = "full",
					multiline = true
				},
				point =
				{
					name = REFRESH,
					desc = SPLASH_BASE_HEADER,
					order = get_order(),
					type = "execute",
					func = function()
						cnbnpoints.db.profile.whatsnew_text = nil
					end,
				},
			}
		}		
	}
}

