﻿-- BlizzMmove, move the blizzard frames by yess
db = nil
local frame = CreateFrame("Frame")
local optionPanel = nil

local defaultDB = { 
	AchievementFrame = {save = true},
	CalendarFrame = {save = true},
	AuctionFrame = {save = true},
	GuildBankFrame = {save = true},
}

local function Print(...)
	local s = "BlizzMove:"
	for i=1,select("#", ...) do
		local x = select(i, ...)
		s = strjoin(" ",s,tostring(x))
	end
	--DEFAULT_CHAT_FRAME:AddMessage(s)
end

local function Debug(...)
--[===[@debug@
	local s = "Blizzmove Debug:"
	for i=1,select("#", ...) do
		local x = select(i, ...)
		s = strjoin(" ",s,tostring(x))
	end
	DEFAULT_CHAT_FRAME:AddMessage(s)
--@end-debug@]===]
end

local function createOwnHandlerFrame(frame, width, height, offX, offY, name)
	local handler = CreateFrame("Frame", "BlizzMoveHandler"..name)
	handler:SetWidth(width)
	handler:SetHeight(height)
	handler:SetParent(frame)
	handler:EnableMouse(true)
	handler:SetMovable(true) 
	handler:SetPoint("TOPLEFT", frame ,"TOPLEFT", offX, offY)
	--handler:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
	--                                        edgeFile = nil, 
	--                                       tile = true, tileSize = 16, edgeSize = 16, 
	--                                        insets = { left = 0, right = 0, top = 0, bottom = 0 }})
	--handler:SetBackdropColor(1,0,0,0.5)
	return handler
end

local function OnShow(self, ...)
	--Debug(self:GetName(), " settings:", settings)
	local settings = self.settings
	if settings and settings.point and settings.save then
		self:ClearAllPoints()
		self:SetPoint(settings.point,settings.relativeTo, settings.relativePoint, settings.xOfs,settings.yOfs)
		local scale = settings.scale
		if scale then 
			--Debug("scale:", scale)
			self:SetScale(scale)
		end
	end
end


local function OnMouseWheel(self, value, ...)
	if IsControlKeyDown() then
		local frameToMove = self.frameToMove
		local scale = frameToMove:GetScale() or 1
		if(value == 1) then --scale up 
			scale = scale +.1
			if(scale > 1.5) then 
				scale = 1.5
			end
		else -- scale down
			scale = scale -.1
			if(scale < .5) then
				scale = .5
			end
		end
		frameToMove:SetScale(scale)
		if self.settings then
			self.settings.scale = scale
		end
		--Debug("scroll", arg1, scale, frameToMove:GetScale())
	end
end

local function OnDragStart(self)
	local frameToMove = self.frameToMove
	local settings = frameToMove.settings
	if settings and not settings.default then -- set defaults 
		settings.default = {}
		local def = settings.default
		def.point, def.relativeTo , def.relativePoint, def.xOfs, def.yOfs = frameToMove:GetPoint()
		if def.relativeTo then
			def.relativeTo = def.relativeTo:GetName()
		end
	end
	frameToMove:StartMoving()
	frameToMove.isMoving = true
end

local function OnDragStop(self)
	local frameToMove = self.frameToMove
	local settings = frameToMove.settings
	frameToMove:StopMovingOrSizing()
	frameToMove.isMoving = false
	if settings then
			settings.point, settings.relativeTo, settings.relativePoint, settings.xOfs, settings.yOfs = frameToMove:GetPoint()
	end
end

local function OnMouseUp(self, ...)
	local frameToMove = self.frameToMove
	if IsControlKeyDown() then
		local settings = frameToMove.settings
		--toggle save
		if settings then
			settings.save = not settings.save
			if settings.save then
				Print("Frame: ",frameToMove:GetName()," will be saved.")
			else
				Print("Frame: ",frameToMove:GetName()," will be not saved.")
			end
		else
			Print("Frame: ",frameToMove:GetName()," will be saved.")
			db[frameToMove:GetName()] = {}
			settings = db[frameToMove:GetName()]
			settings.save = true
			settings.point, settings.relativeTo, settings.relativePoint, settings.xOfs, settings.yOfs = frameToMove:GetPoint()
			if settings.relativeTo then
			settings.relativeTo = settings.relativeTo:GetName()
			end
			frameToMove.settings = settings
		end
	end
end

local function createQuestTrackerHandler()
	local handler = CreateFrame("Frame", "BlizzMoveHandlerQuestTracker")
	handler:SetParent(ObjectiveTrackerFrame)
	handler:EnableMouse(true)
	handler:SetMovable(true) 
	handler:SetAllPoints(ObjectiveTrackerFrame.HeaderMenu.Title)
	return handler
end	

local function SetMoveHandler(frameToMove, handler)
	if not frameToMove then
		return
	end
	if not handler then
		handler = frameToMove
	end
	
	local settings = db[frameToMove:GetName()]
	if not settings then
		settings = defaultDB[frameToMove:GetName()] or {}
		db[frameToMove:GetName()] = settings
	end
	frameToMove.settings = settings
	handler.frameToMove = frameToMove
	
	if not frameToMove.EnableMouse then return end
	
	--frameToMove:EnableMouse(true)
	frameToMove:SetMovable(true) 
	handler:RegisterForDrag("LeftButton");
	
	handler:SetScript("OnDragStart", OnDragStart)
	handler:SetScript("OnDragStop", OnDragStop)

	--override frame position according to settings when shown
	frameToMove:HookScript("OnShow", OnShow)			
	
	--hook OnMouseUp 
	handler:HookScript("OnMouseUp", OnMouseUp)
	
	--hook Scroll for setting scale
	handler:EnableMouseWheel(true) 
	handler:HookScript("OnMouseWheel",OnMouseWheel)
end

local function resetDB()
	for k, v in pairs(db) do
		local f = _G[k]
		if f and f.settings then
			f.settings.save = false
			local def = f.settings.default
			if def then
				f:ClearAllPoints()
				f:SetPoint(def.point,def.relativeTo, def.relativePoint, def.xOfs,def.yOfs)
			end
		end
	end
end

local function createOptionPanel()
	optionPanel = CreateFrame( "Frame", "BlizzMovePanel", UIParent );
	local title = optionPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
	title:SetPoint("TOPLEFT", 16, -16)
	local version = GetAddOnMetadata("DuowanMove","Version") or ""
	title:SetText("DuowanMove "..version)

	local subtitle = optionPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	subtitle:SetHeight(35)
	subtitle:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
	subtitle:SetPoint("RIGHT", optionPanel, -32, 0)
	subtitle:SetNonSpaceWrap(true)
	subtitle:SetJustifyH("LEFT")
	subtitle:SetJustifyV("TOP")

	subtitle:SetText("Click the button below to reset all frames.")

	local button = CreateFrame("Button",nil,optionPanel, "UIPanelButtonTemplate")
	button:SetWidth(100)
	button:SetHeight(30)
	button:SetScript("OnClick", resetDB)
	button:SetText("Reset")
	button:SetPoint("TOPLEFT",20,-60)
	
	optionPanel.name = "DuowanMove";
	InterfaceOptions_AddCategory(optionPanel);
end

local function checkBlizzLoaded()
	if IsAddOnLoaded("Blizzard_InspectUI") then
		SetMoveHandler(InspectFrame)
	elseif IsAddOnLoaded("Blizzard_GuildBankUI") then
		SetMoveHandler(GuildBankFrame)
	elseif IsAddOnLoaded("Blizzard_TradeSkillUI") then
		SetMoveHandler(TradeSkillFrame)
	elseif IsAddOnLoaded("Blizzard_ItemSocketingUI") then
		SetMoveHandler(ItemSocketingFrame)
	elseif IsAddOnLoaded("Blizzard_BarbershopUI") then
		SetMoveHandler(BarberShopFrame)
	elseif IsAddOnLoaded("Blizzard_GlyphUI") then
		SetMoveHandler(SpellBookFrame, GlyphFrame)
	elseif IsAddOnLoaded("Blizzard_MacroUI") then
		SetMoveHandler(MacroFrame)
	elseif IsAddOnLoaded("Blizzard_AchievementUI") then
		SetMoveHandler(AchievementFrame, AchievementFrameHeader)
	elseif IsAddOnLoaded("Blizzard_TalentUI") then
		SetMoveHandler(PlayerTalentFrame)
	elseif IsAddOnLoaded("Blizzard_Calendar") then
		SetMoveHandler(CalendarFrame)
	elseif IsAddOnLoaded("Blizzard_TrainerUI") then
		SetMoveHandler(ClassTrainerFrame)
	elseif IsAddOnLoaded("Blizzard_BindingUI") then
		SetMoveHandler(KeyBindingFrame)
	elseif IsAddOnLoaded("Blizzard_AuctionUI") then
		SetMoveHandler(AuctionFrame)
	elseif IsAddOnLoaded("Blizzard_GuildUI") then
		SetMoveHandler(GuildFrame, GuildFrame.TitleMouseover)
	elseif IsAddOnLoaded("Blizzard_LookingForGuildUI") then
		SetMoveHandler(LookingForGuildFrame)
	elseif IsAddOnLoaded("Blizzard_ReforgingUI") then
		SetMoveHandler(ReforgingFrame, ReforgingFrameInvisibleButton)
	elseif IsAddOnLoaded("Blizzard_VoidStorageUI") then
		SetMoveHandler(VoidStorageFrame)
	elseif IsAddOnLoaded("Blizzard_ItemAlterationUI") then
		SetMoveHandler(TransmogrifyFrame)
	elseif IsAddOnLoaded("Blizzard_EncounterJournal") then
		SetMoveHandler(EncounterJournal)
	elseif IsAddOnLoaded("Blizzard_Collections") then
		SetMoveHandler(CollectionsJournal)
	elseif IsAddOnLoaded("Blizzard_ArchaeologyUI") then
		SetMoveHandler(ArchaeologyFrame)
	elseif IsAddOnLoaded("Blizzard_PVPUI") then
    --    SetMoveHandler(PVEFrame, PVPUIFrame)
	elseif IsAddOnLoaded("Blizzard_GarrisonUI") then
        SetMoveHandler(GarrisonMissionFrame)
		SetMoveHandler(GarrisonCapacitiveDisplayFrame)
		SetMoveHandler(GarrisonLandingPage)
	end
end

local function OnEvent(self, event, arg1, arg2)	
	--	InterfaceOptionsFrame:HookScript("OnShow", function() 
	--		if not optionPanel then
	--			createOptionPanel()
	--		end
	--	end)
	--	frame:UnregisterEvent("PLAYER_ENTERING_WORLD")

	-- blizzard lod addons
	if arg1 == "Blizzard_InspectUI" then
		SetMoveHandler(InspectFrame)
	elseif arg1 == "Blizzard_GuildBankUI" then
		SetMoveHandler(GuildBankFrame)
	elseif arg1 == "Blizzard_TradeSkillUI" then
		SetMoveHandler(TradeSkillFrame)
	elseif arg1 == "Blizzard_ItemSocketingUI" then
		SetMoveHandler(ItemSocketingFrame)
	elseif arg1 == "Blizzard_BarbershopUI" then
		SetMoveHandler(BarberShopFrame)
	elseif arg1 == "Blizzard_GlyphUI" then
		SetMoveHandler(SpellBookFrame, GlyphFrame)
	elseif arg1 == "Blizzard_MacroUI" then
		SetMoveHandler(MacroFrame)
	elseif arg1 == "Blizzard_AchievementUI" then
		SetMoveHandler(AchievementFrame, AchievementFrameHeader)
	elseif arg1 == "Blizzard_TalentUI" then
		SetMoveHandler(PlayerTalentFrame)
	elseif arg1 == "Blizzard_Calendar" then
		SetMoveHandler(CalendarFrame)
	elseif arg1 == "Blizzard_TrainerUI" then
		SetMoveHandler(ClassTrainerFrame)
	elseif arg1 == "Blizzard_BindingUI" then
		SetMoveHandler(KeyBindingFrame)
	elseif arg1 == "Blizzard_AuctionUI" then
		SetMoveHandler(AuctionFrame)
	elseif arg1 == "Blizzard_GuildUI" then
		SetMoveHandler(GuildFrame, GuildFrame.TitleMouseover)
	elseif arg1 == "Blizzard_LookingForGuildUI" then
		SetMoveHandler(LookingForGuildFrame)
	elseif arg1 == "Blizzard_ReforgingUI" then
		SetMoveHandler(ReforgingFrame, ReforgingFrameInvisibleButton)
	elseif arg1 == "Blizzard_VoidStorageUI" then
		SetMoveHandler(VoidStorageFrame)
	elseif arg1 == "Blizzard_ItemAlterationUI" then
		SetMoveHandler(TransmogrifyFrame)
	elseif arg1 == "Blizzard_EncounterJournal" then
		SetMoveHandler(EncounterJournal)
	elseif arg1 == "Blizzard_Collections" then
		SetMoveHandler(CollectionsJournal)
	elseif arg1 == "Blizzard_ArchaeologyUI" then
		SetMoveHandler(ArchaeologyFrame)
	elseif arg1 == "Blizzard_PVPUI" then
   --     SetMoveHandler(PVEFrame, PVPUIFrame)
	elseif arg1 == "Blizzard_GarrisonUI" then
        SetMoveHandler(GarrisonMissionFrame)
		SetMoveHandler(GarrisonCapacitiveDisplayFrame)
		SetMoveHandler(GarrisonLandingPage)
	end
end

-- Interface
local enable = false;
local loaded = false;
function BlizzMove_Toggle(switch)
	enable = switch;
	if (switch and not loaded) then			
		db = BlizzMoveDB or defaultDB
		BlizzMoveDB = db
		--SetMoveHandler(frameToMove, handlerFrame)
		SetMoveHandler(CharacterFrame,PaperDollFrame)
		SetMoveHandler(CharacterFrame,TokenFrame)
		SetMoveHandler(CharacterFrame,SkillFrame)
		SetMoveHandler(CharacterFrame,ReputationFrame)
		SetMoveHandler(CharacterFrame,PetPaperDollFrameCompanionFrame)
		SetMoveHandler(SpellBookFrame)
		SetMoveHandler(QuestLogFrame)
		SetMoveHandler(FriendsFrame)
		SetMoveHandler(WorldMapFrame,WorldMapTitleButton)
		SetMoveHandler(GameMenuFrame)
		SetMoveHandler(GossipFrame)
		SetMoveHandler(DressUpFrame)
		--SetMoveHandler(QuestFrame)
		SetMoveHandler(MerchantFrame)
		SetMoveHandler(HelpFrame)
		SetMoveHandler(MailFrame)
		SetMoveHandler(MailFrame, SendMailFrame)
		SetMoveHandler(BankFrame)
		SetMoveHandler(VideoOptionsFrame)
		SetMoveHandler(InterfaceOptionsFrame)
		SetMoveHandler(LootFrame)
		SetMoveHandler(RaidBrowserFrame)
		SetMoveHandler(TradeFrame)
		SetMoveHandler(PVEFrame)
		SetMoveHandler(QuestLogPopupDetailFrame)
		SetMoveHandler(ColorPickerFrame, createOwnHandlerFrame(ColorPickerFrame, 132, 32, 117, 8, "ColorPickerFrame"))
		
		SetMoveHandler(ObjectiveTrackerFrame, createQuestTrackerHandler())
		ObjectiveTrackerFrame.BlocksFrame.QuestHeader:EnableMouse(true)
		SetMoveHandler(ObjectiveTrackerFrame, ObjectiveTrackerFrame.BlocksFrame.QuestHeader)
		ObjectiveTrackerFrame.BlocksFrame.AchievementHeader:EnableMouse(true)
		SetMoveHandler(ObjectiveTrackerFrame, ObjectiveTrackerFrame.BlocksFrame.AchievementHeader)
		ObjectiveTrackerFrame.BlocksFrame.ScenarioHeader:EnableMouse(true)
		SetMoveHandler(ObjectiveTrackerFrame, ObjectiveTrackerFrame.BlocksFrame.ScenarioHeader)
		
		checkBlizzLoaded()
		frame:RegisterEvent("ADDON_LOADED") --for blizz lod addons
		frame:SetScript("OnEvent", OnEvent)
		loaded = true;
	end
end
----------------------------------------------------------
-- User function to move/lock a frame with a handler
-- handler, the frame the user has clicked on
-- frameToMove, the handler itself, a parent frame of handler 
--              that has UIParent as Parent or nil  
----------------------------------------------------------
BlizzMove = {}
function BlizzMove:Toggle(handler)
	if not handler then
		handler = GetMouseFocus()
	end
	
	if handler:GetName() == "WorldFrame" then
		return
	end
	
	local lastParent = handler
	local frameToMove = handler
	local i=0
	--get the parent attached to UIParent from handler
	while lastParent and lastParent ~= UIParent and i < 100 do
			frameToMove = lastParent --set to last parent
			lastParent = lastParent:GetParent()
			i = i +1
	end
	if handler and frameToMove then
		if handler:GetScript("OnDragStart") then
			handler:SetScript("OnDragStart", nil)
		--	Print("Frame: ",frameToMove:GetName()," locked.")
		else
		--	Print("Frame: ",frameToMove:GetName()," to move with handler ",handler:GetName())
			SetMoveHandler(frameToMove, handler)
		end
	
	else
	--	Print("Error parent not found.")
	end
	
end

BINDING_HEADER_BLIZZMOVE = "BlizzMove";
BINDING_NAME_MOVEFRAME = "Move/Lock a Frame";
