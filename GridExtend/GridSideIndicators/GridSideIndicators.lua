local L = GridSideIndicators_Locales
local GridFrame = Grid:GetModule("GridFrame")

GridSIFrame = GridFrame:NewModule("GridSideIndicators")




function GridSIFrame.New(parent)
    local f = CreateFrame("Frame", "GridSIFrame", parent)

     f:SetBackdrop({
         bgFile = "Interface\\BUTTONS\\WHITE8X8", 
         tile = true, 
         tileSize = 8,
         edgeFile = "Interface\\BUTTONS\\WHITE8X8", 
         edgeSize = 1,
         insets = {left = 1, right = 1, top = 1, bottom = 1},
     })
     f:SetBackdropBorderColor(0,0,0,1)
     f:SetBackdropColor(1,1,1,1)
     f:Hide()

     return f
end

function GridSIFrame:SetIndicator(color, text, value, maxValue, texture, texCoords, stack, start, duration)
	if not color then color = { r = 1, g = 1, b = 1, a = 1 } end
	self:SetBackdropColor(color.r, color.g, color.b, color.a)
	self:Show()
end



function GridSIFrame:ClearIndicator()
	self:SetBackdropColor(1, 1, 1, 1)
	self:Hide()
end






function GridSIFrame:OnInitialize()
    if not self.db then
        self.db = Grid.db:RegisterNamespace(self.moduleName, {
            profile = self.defaultDB or { }
        })
    end
    Grid:Debug("init GridSideIndicators")
    
    GridFrame:RegisterIndicator("side1", L["Top Side"], GridSIFrame.New, GridSIFrame.GridIndicatorReset, GridSIFrame.SetIndicator, GridSIFrame.ClearIndicator)
    GridFrame:RegisterIndicator("side2", L["Right Side"], GridSIFrame.New, GridSIFrame.GridIndicatorReset, GridSIFrame.SetIndicator, GridSIFrame.ClearIndicator)
    GridFrame:RegisterIndicator("side3", L["Bottom Side"], GridSIFrame.New, GridSIFrame.GridIndicatorReset, GridSIFrame.SetIndicator, GridSIFrame.ClearIndicator)
    GridFrame:RegisterIndicator("side4", L["Left Side"], GridSIFrame.New, GridSIFrame.GridIndicatorReset, GridSIFrame.SetIndicator, GridSIFrame.ClearIndicator)
end



function GridSIFrame.GridIndicatorReset(self)
	local f = self
        local indicator = self.__id
        local parent = self.__owner
        local pparent = self:GetParent()

        f:SetWidth(GridFrame.db.profile.cornerSize)
        f:SetHeight(GridFrame.db.profile.cornerSize)

	f:SetParent(f.__owner.indicators.bar)
        f:SetFrameLevel(f.__owner.indicators.bar:GetFrameLevel() + 1)
	f:ClearAllPoints()
		local borderSize = GridFrame.db.profile.borderSize
		-- position indicator wherever needed
		if indicator == "side1" then
			-- top
			f:SetPoint("TOP", parent, "TOP", 0, -borderSize)
		elseif indicator == "side2" then
			-- right
			f:SetPoint("RIGHT", parent, "RIGHT", -borderSize, 0)
		elseif indicator == "side3" then
			-- bottom
			f:SetPoint("BOTTOM", parent, "BOTTOM", 0, borderSize)
		elseif indicator == "side4" then
			-- left
			f:SetPoint("LEFT", parent, "LEFT", borderSize, 0)
		end
end

function GridSIFrame:Reset()
end
function GridSIFrame:OnEnable()
end
function GridSIFrame:OnDisable()
end
