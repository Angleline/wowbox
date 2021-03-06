--local zone = "Gate of the Setting Sun"
local zoneid = 440

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

GridStatusRaidDebuff:DebuffId(zoneid, 106857, 1, 6, 6) --Blackout Drunk
GridStatusRaidDebuff:DebuffId(zoneid, 107046, 1, 6, 6) --Water Strike
GridStatusRaidDebuff:DebuffId(zoneid, 114291, 1, 6, 6) --Explosive Brew

--Ook-Ook
GridStatusRaidDebuff:BossNameId(zoneid, 10, "Ook-Ook")
GridStatusRaidDebuff:DebuffId(zoneid, 106807, 11, 6, 6) 
GridStatusRaidDebuff:DebuffId(zoneid, 107351, 12, 6, 6) 
--Hoptallus
GridStatusRaidDebuff:BossNameId(zoneid, 20, "Hoptallus")
GridStatusRaidDebuff:DebuffId(zoneid, 112992, 21, 6, 6) 
--Yan-Zhu the Uncasked
GridStatusRaidDebuff:BossNameId(zoneid, 30, "Yan-Zhu the Uncasked")
GridStatusRaidDebuff:DebuffId(zoneid, 114548, 31, 6, 6) 
GridStatusRaidDebuff:DebuffId(zoneid, 106546, 32, 6, 6) 
GridStatusRaidDebuff:DebuffId(zoneid, 106851, 33, 6, 6) 
GridStatusRaidDebuff:DebuffId(zoneid, 114451, 34, 6, 6) 
GridStatusRaidDebuff:DebuffId(zoneid, 115003, 35, 6, 6) 
GridStatusRaidDebuff:DebuffId(zoneid, 114466, 36, 6, 6) 
