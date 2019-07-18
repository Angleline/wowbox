-- Check to make sure we are using a compatible version of GridStatusRaidDebuff.

-- Disable if we are using an incompatible version of GridStatusRaidDebuff.

local GSRDVersion = GetAddOnMetadata("GridExtend","Version")

GridStatusRD_WoD = {}

GridStatusRD_BfA = {}

GridStatusRD_Legion = {}

GridStatusRD_MoP = {}

do
	local a, b = strsplit(".", GSRDVersion) -- e.g. "4", "0", "6"
	GridStatusRD_WoD.rd_version = 100*a + b -- e.g. 40006
	GridStatusRD_BfA.rd_version = 100*a + b -- e.g. 40006
	GridStatusRD_Legion.rd_version = 100*a + b -- e.g. 40006
	GridStatusRD_MoP.rd_version = 100*a + b -- e.g. 40006
end