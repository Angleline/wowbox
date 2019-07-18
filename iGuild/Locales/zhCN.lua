local AddonName = ...;
local L = LibStub("AceLocale-3.0"):NewLocale(AddonName, "zhCN")

if not L then return end

L["Addon update available!"] = "\230\156\137\229\143\175\231\148\168\231\154\132\230\155\180\230\150\176\239\188\129"
--[[Translation missing --]]
L["ASC"] = "ASC"
L["Available columns"] = "\229\143\175\231\148\168\231\154\132\230\160\143"
L["By Achievement Points"] = "\230\160\185\230\141\174\230\136\144\229\176\177\231\130\185\230\149\176"
L["By Class"] = "\230\160\185\230\141\174\232\129\140\228\184\154"
L["By Difficulty"] = "\230\160\185\230\141\174\233\154\190\229\186\166"
L["By Guildrank"] = "\230\160\185\230\141\174\229\133\172\228\188\154\233\152\182\231\186\167"
L["By Level"] = "\230\160\185\230\141\174\231\173\137\231\186\167"
L["By Name"] = "\230\160\185\230\141\174\229\144\141\231\167\176"
L["By Threshold"] = "\230\160\185\230\141\174\230\149\176\229\128\188"
L["By Zone"] = "\230\160\185\230\141\174\229\140\186\229\159\159"
L["Center"] = "\228\184\173\229\164\174"
L["change"] = "\229\143\152\230\155\180"
--[[Translation missing --]]
L["DESC"] = "DESC"
L["Displays both public and officer notes of your guild mates in a single column."] = "\229\144\140\230\151\182\230\152\190\231\164\186\229\133\172\228\188\154\228\188\154\229\145\152\231\154\132\229\133\172\229\188\128\230\179\168\232\174\176\228\184\142\229\185\178\233\131\168\230\179\168\232\174\176\229\156\168\229\144\140\228\184\128\230\160\143\228\184\138\227\128\130"
L["Displays the achievement points of your guild mates."] = "\230\152\190\231\164\186\229\133\172\228\188\154\228\188\154\229\145\152\231\154\132\230\136\144\229\176\177\231\130\185\230\149\176\227\128\130"
L["Displays the class of your guild mates. Choose whether to show the class name or the class icon."] = "\230\152\190\231\164\186\229\133\172\228\188\154\228\188\154\229\145\152\231\154\132\232\129\140\228\184\154\239\188\140\229\143\175\228\187\165\233\128\137\230\139\169\230\152\190\231\164\186\232\129\140\228\184\154\229\144\141\231\167\176\230\136\150\229\155\190\230\160\135\227\128\130"
L["Displays the following green icon when you are grouped with guild mates:"] = "\229\189\147\228\189\160\228\184\142\229\133\172\228\188\154\228\188\154\229\145\152\231\187\132\233\152\159\230\151\182\230\152\190\231\164\186\228\187\165\228\184\139\231\154\132\231\187\191\232\137\178\229\155\190\230\160\135\239\188\154"
L["Displays the guild exp contributed by your guild mates. The displayed number is divided by 1000."] = "\230\152\190\231\164\186\229\133\172\228\188\154\228\188\154\229\145\152\231\154\132\229\133\172\228\188\154\231\187\143\233\170\140\229\128\188\232\180\161\231\140\174\227\128\130\230\152\190\231\164\186\231\154\132\230\149\176\229\173\151\229\183\178\231\187\143\233\153\164\228\187\1651000\227\128\130"
L["Displays the guild rank of your guild mates."] = "\230\152\190\231\164\186\229\133\172\228\188\154\228\188\154\229\145\152\231\154\132\233\152\182\231\186\167\227\128\130"
L["Displays the level of your guild mates."] = "\230\152\190\231\164\186\229\133\172\228\188\154\228\188\154\229\145\152\231\154\132\231\173\137\231\186\167\227\128\130"
L["Displays the name of your guild mates. In addition, a short info is shown if they are AFK or DND."] = "\230\152\190\231\164\186\229\133\172\228\188\154\228\188\154\229\145\152\231\154\132\229\144\141\231\167\176\227\128\130\230\173\164\229\164\150\239\188\140\229\189\147\228\187\150\228\187\172\230\154\130\231\166\187\230\136\150\229\139\191\230\137\176\231\138\182\230\128\129\230\151\182\230\152\190\231\164\186\228\184\128\228\184\170\231\174\128\231\159\173\231\154\132\232\174\175\230\129\175\227\128\130"
L["Displays the officer note of your guild mates, if you can see it. The whole column is not shown otherwise."] = "\230\152\190\231\164\186\229\133\172\228\188\154\228\188\154\229\145\152\231\154\132\229\185\178\233\131\168\230\179\168\232\174\176\239\188\140\233\153\164\233\157\158\228\189\160\232\131\189\231\156\139\229\136\176\239\188\140\229\144\166\229\136\153\230\149\180\229\136\151\229\176\134\228\184\141\230\152\190\231\164\186\227\128\130"
L["Displays the public note of your guild mates."] = "\230\152\190\231\164\186\229\133\172\228\188\154\228\188\154\229\145\152\231\154\132\229\133\172\229\188\128\230\179\168\232\174\176\227\128\130"
L["Displays the tradeskills of your guild mates as little icons. Be sure to activate the red option if you want to use it."] = "\230\152\190\231\164\186\229\133\172\228\188\154\228\188\154\229\145\152\231\154\132\228\184\147\228\184\154\230\138\128\232\131\189\228\184\186\229\176\143\229\155\190\231\164\186\227\128\130\229\166\130\230\158\156\228\189\160\230\131\179\230\173\164\231\148\168\230\173\164\229\138\159\232\131\189\232\175\183\229\138\161\229\191\133\229\133\136\229\144\175\231\148\168\231\186\162\232\137\178\231\154\132\233\128\137\233\161\185\227\128\130"
L["Displays the zone of your guild mates."] = "\230\152\190\231\164\186\229\133\172\228\188\154\228\188\154\229\145\152\231\154\132\230\137\128\229\156\168\229\140\186\229\159\159\227\128\130"
L["Enable Script"] = "\229\144\175\231\148\168\232\132\154\230\156\172"
L["Enable Tradeskills"] = "\229\144\175\231\148\168\228\184\147\228\184\154\230\138\128\232\131\189"
L["If activated, clicking on the given cell will result in something special."] = "\229\166\130\230\158\156\229\144\175\231\148\168\239\188\140\231\130\185\229\135\187\231\137\185\229\174\154\231\154\132\229\141\149\228\189\141\229\176\134\228\188\154\229\175\188\232\135\180\230\159\144\228\186\155\231\137\185\230\174\138\231\154\132\228\184\156\232\165\191\227\128\130"
L["iGuild provides some pre-layoutet columns for character names, zones, etc. In order to display them in the tooltip, write their names in the desired order into the beneath input."] = "iGuild\230\143\144\228\190\155\230\159\144\228\186\155\233\162\132\232\174\190\231\154\132\230\160\143\231\155\174\229\166\130\232\167\146\232\137\178\229\144\141\231\167\176\227\128\129\229\140\186\229\159\159\227\128\129\231\173\137\231\173\137\227\128\130\228\184\186\228\186\134\230\152\190\231\164\186\232\191\153\228\186\155\228\191\161\230\129\175\229\156\168\229\183\165\229\133\183\230\143\144\231\164\186\228\184\138\239\188\140\232\175\183\229\156\168\228\184\139\230\150\185\232\190\147\229\133\165\230\137\128\233\156\128\231\154\132\233\161\186\229\186\143\227\128\130"
L["Invalid column name!"] = "\230\151\160\230\149\136\231\154\132\230\160\143\229\144\141\231\167\176\239\188\129"
L["Justification"] = "\229\175\185\233\189\144"
L["Left"] = "\229\183\166"
L["No guild"] = "\230\178\161\230\156\137\229\133\172\228\188\154"
L["Note"] = "\230\179\168\232\174\176"
L["OfficerNote"] = "\229\185\178\233\131\168\230\179\168\232\174\176"
L["Plugin Options"] = "\230\140\130\232\189\189\233\128\137\233\161\185"
L["Points"] = "\231\167\175\229\136\134"
L["Querying tradeskills needs extra memory. This is why you explicitly have to enable that. Don't forget to reload your UI!"] = "\230\159\165\232\175\162\228\184\147\228\184\154\230\138\128\232\131\189\233\156\128\232\166\129\233\162\157\229\164\150\231\154\132\229\134\133\229\173\152\227\128\130\232\191\153\229\176\177\230\152\175\228\184\186\228\187\128\228\185\136\228\189\160\233\156\128\232\166\129\231\161\174\232\174\164\229\144\175\231\148\168\229\174\131\239\188\140\229\136\171\229\191\152\228\186\134\233\135\141\232\189\189\228\189\160\231\154\132UI\239\188\129"
--[[Translation missing --]]
L["Remote Chat"] = "Remote Chat"
L["Right"] = "\229\143\179"
L["Show Guild Level"] = "\230\152\190\231\164\186\229\133\172\228\188\154\231\173\137\231\186\167"
L["Show Guild Name"] = "\230\152\190\231\164\186\229\133\172\228\188\154\229\144\141\231\167\176"
L["Show Guild XP"] = "\230\152\190\231\164\186\229\133\172\228\188\154\231\187\143\233\170\140"
L["Show Label"] = "\230\152\190\231\164\186\229\141\183\230\160\135"
L["Show Progress"] = "\230\152\190\231\164\186\232\191\155\229\186\166"
L["Sorting"] = "\230\142\146\229\186\143"
L["Tooltip Options"] = "\229\183\165\229\133\183\230\143\144\231\164\186\233\128\137\233\161\185"
L["Tradeskills"] = "\228\184\147\228\184\154\230\138\128\232\131\189"
L["Use Icon"] = "\228\189\191\231\148\168\229\155\190\231\164\186"

