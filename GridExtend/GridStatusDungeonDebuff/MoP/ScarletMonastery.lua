--local zone = "Scarlet Monastery"
local zoneid = 435

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

GridStatusRaidDebuff:DebuffId(zoneid, 42380, 1, 6, 6) --Conflagration
GridStatusRaidDebuff:DebuffId(zoneid, 42514, 1, 6, 6) --Squash Soul

--Thalnos
GridStatusRaidDebuff:BossNameId(zoneid, 10, "Thalnos")
GridStatusRaidDebuff:DebuffId(zoneid, 115144, 11, 6, 6) 
GridStatusRaidDebuff:DebuffId(zoneid, 115289, 12, 6, 6) 
GridStatusRaidDebuff:DebuffId(zoneid, 115297, 13, 6, 6) 		
--Brother Korloff
GridStatusRaidDebuff:BossNameId(zoneid, 20, "Brother Korloff")
GridStatusRaidDebuff:DebuffId(zoneid, 113764, 21, 6, 6) 
GridStatusRaidDebuff:DebuffId(zoneid, 114460, 22, 6, 6) 
--High Inquisitor Whitemane
