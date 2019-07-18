
--------------------------------------------------------------------------------
--- Author: SirMarklan
--
-- BFA Version
--
-- Hope you like my addOn ^^
--
-- Shift + C to confirm/ok/yes a PopUp Message
--------------------------------------------------------------------------------

local BtnEasyConfirm = CreateFrame("Button", 'BtnEasyConfirm', nil)
BtnEasyConfirm:RegisterForClicks("AnyDown")
BtnEasyConfirm:SetScript("OnEvent", function()
	SetBindingClick("SHIFT-C", BtnEasyConfirm:GetName())
end)
BtnEasyConfirm:RegisterEvent("PLAYER_LOGIN")

BtnEasyConfirm:SetScript("OnClick", function()
	EasyConfirm()
end)

-- EasyConfirmFirstFrame --
EasyConfirmFirstFrame = CreateFrame("Frame",nil,UIParent)
EasyConfirmFirstFrame:Hide()
EasyConfirmFirstFrame:SetWidth(400)
EasyConfirmFirstFrame:SetHeight(140)
EasyConfirmFirstFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, -100)
EasyConfirmFirstFrame:EnableMouse(true)
EasyConfirmFirstFrame:SetFrameStrata("High")
EasyConfirmFirstFrame.text = EasyConfirmFirstFrame.text or EasyConfirmFirstFrame:CreateFontString(nil,"ARTWORK","QuestMapRewardsFont")
EasyConfirmFirstFrame.text:SetScale(1.5)
EasyConfirmFirstFrame.text:SetAllPoints(true)
EasyConfirmFirstFrame.text:SetJustifyH("CENTER")
EasyConfirmFirstFrame.text:SetJustifyV("CENTER")
EasyConfirmFirstFrame.text:SetText("|cffbbf67fEasyConfirm is Up!|r\nSHIFT + C to confirm pop-ups\nYou need to reload the interface at least one time!\nClick the |cffffcc00'Confirm'|r button below.")
----------------------------------------------------
local LeaveBorder = EasyConfirmFirstFrame:CreateTexture(nil,"BACKGROUND")
LeaveBorder:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
LeaveBorder:SetPoint("TOPLEFT", -3, 3)
LeaveBorder:SetPoint("BOTTOMRIGHT", 3, -3)
LeaveBorder:SetVertexColor(0.2, 0.2, 0.2, 0.6)
----------------------------------------------------
local BorderBody = EasyConfirmFirstFrame:CreateTexture(nil,"ARTWORK")
BorderBody:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderBody:SetAllPoints(EasyConfirmFirstFrame)
BorderBody:SetVertexColor(0.34, 0.34, 0.34, 0.7)
----------------------------------------------------
local Texture = EasyConfirmFirstFrame:CreateTexture(nil,"BACKGROUND")
Texture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Texture:SetAllPoints(EasyConfirmFirstFrame)
EasyConfirmFirstFrame.texture = Texture
----------------------------------------------------
local FrameButton = CreateFrame("Button","FrameButton", EasyConfirmFirstFrame, "UIPanelButtonTemplate")
FrameButton:SetHeight(24)
FrameButton:SetWidth(70)
FrameButton:SetPoint("BOTTOM", EasyConfirmFirstFrame, "BOTTOM", 0, 10)
FrameButton:SetText("Confirm")
FrameButton:SetNormalTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
----------------------------------------------------
local BorderButton = FrameButton:CreateTexture(nil,"ARTWORK")
BorderButton:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderButton:SetAllPoints(FrameButton)
BorderButton:SetVertexColor(0.34, 0.34, 0.34, 0.7)
FrameButton:SetScript("OnClick", function()
	EasyConfirmFirstFrame:Hide()
	ReloadUI()
end)

-------------------------- Function --------------------------
function EasyConfirm()
	StaticPopup1Button1:Click()
	StaticPopup2Button1:Click()
	StaticPopup3Button1:Click()
	StaticPopup4Button1:Click()
	QuestFrameAcceptButton:Click()
	QuestFrameCompleteQuestButton:Click()
	QuestFrameCompleteButton:Click()
	LFGDungeonReadyDialogEnterDungeonButton:Click()
	GossipFrameGreetingGoodbyeButton:Click()
	--PVPReadyDialogEnterBattleButton:Click()
end

function EasyConfirmStart()
	EasyConfirmFirstFrame:Show()
end

-------------------------- Save --------------------------
local EasyConfirmSave = CreateFrame("Frame")
EasyConfirmSave:RegisterEvent("ADDON_LOADED")
EasyConfirmSave:RegisterEvent("PLAYER_LOGOUT")
EasyConfirmSave:SetScript("OnEvent", function(self, event, arg1)
	if ( event == "ADDON_LOADED" and arg1 == "Love" ) then
		if ( EasyConfirmCount == nil ) then
			EasyConfirmCount = 0
		end
		if ( EasyConfirmProfile == nil ) then
			EasyConfirmCount = EasyConfirmCount + 1
				EasyConfirmStart()
		else
			local name, elapsed = UnitName("player"), time() - EasyConfirmProfile
			C_Timer.After(3, function()
				print("你可以使用 |cffFFC125Shift + C|r 来确认对话框.")
			end)
			EasyConfirmFirstFrame:Hide()
		end
	elseif ( event == "PLAYER_LOGOUT" ) then
		EasyConfirmProfile = time()
	end
end)
