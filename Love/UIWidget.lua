----------------------------------------------------------------------------------------
--	UIWidget frame
----------------------------------------------------------------------------------------
local top = _G["UIWidgetTopCenterContainerFrame"]
top:ClearAllPoints()
top:SetPoint("TOP", UIParent, "TOP", 0, -60)

local below = _G["UIWidgetBelowMinimapContainerFrame"]
local function RepositionBelowFrame()
	below:ClearAllPoints()
	below:SetPoint("TOP", UIParent, "TOP", 0, -60)
end

RepositionBelowFrame()

--hooksecurefunc(below, "SetPoint", RepositionBelowFrame)

for _, frame in pairs({top, below}) do
	frame:EnableMouse(true)
	frame:SetMovable(true)
	frame:SetUserPlaced(true)
	frame:SetScript("OnMouseDown", function(self, button)
		if IsControlKeyDown() and button == "RightButton" then
			frame:ClearAllPoints()
			frame:SetPoint("TOP", UIParent, "TOP", 0, -60)
		else
			frame:ClearAllPoints()
			frame:StartMoving()			
		end
	end)
	frame:SetScript("OnMouseUp", function()
		frame:StopMovingOrSizing()
	end)
end