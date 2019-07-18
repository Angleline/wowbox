	------------------------------------------------------------------------------------------
-- Love ver 1.0
-- 日期: 2010-3-29
-- 作者: dugu
-- 描述: 游戏中我们也有真心的朋友, 鱼别丢了, 我永远记得你; 现实中我们有自己心爱的人,
--			愿与之生死相随; 愿大家珍惜这份友情和爱情, 愿世间充满爱.
-- 版权所有 (c) duowan.com
------------------------------------------------------------------------------------------
LoveDB = {};
local ident; 
local palyerName;
local playerFaction;
local curRealm;
-----------------
-- 记录好友信息, 并可以导入小号
local db;
local PlayerList = {};
local IMPORT_FRIEND_TEXT = "";
if (GetLocale() == "zhCN") then
	IMPORT_FRIEND_LABEL = "确定将|cFF00FF00>>%s<<|R的好友导入当前角色";
	LOVE_SELECT_NAME = "选择名字";
	LOVE_SET_FOCUS = "◆Shift - 左键设置焦点";
	LOVE_CLEAR_FOCUS = "◆Shift - 右键取消焦点";
	LOVE_FRIEND_LOG_TEXT = "爱心工具";
	LOVE_FRIEND_LOG_TIP = "将所选角色的好友导入当前角色";	
	LOVE_FRIEND_LOG_NONE = "没有 > %s < 的好友信息";
	LOVE_IMPORT_BUTTON_TEXT = "导";
	LOVE_FRIEND_NO_SELECT = "请选择一个角色";
elseif (GetLocale() == "zhTW") then
	IMPORT_FRIEND_LABEL = "確定將|cFF00FF00>>%s<<|R的好友導入當前角色";
	LOVE_SELECT_NAME = "選擇名字";
	LOVE_SET_FOCUS = "Shift - 左鍵設置焦點";
	LOVE_CLEAR_FOCUS = "Shift - 右鍵取消焦點";
	LOVE_FRIEND_LOG_TEXT = "愛心工具";
	LOVE_FRIEND_LOG_TIP = "將所選角色的好友導入當前角色";	
	LOVE_FRIEND_LOG_NONE = "沒有 > %s < 的好友資訊";
	LOVE_IMPORT_BUTTON_TEXT = "導";
	LOVE_FRIEND_NO_SELECT = "請選擇一個角色";
else
	IMPORT_FRIEND_LABEL = "确定将|cFF00FF00>>%s<<|R的好友导入当前角色";
	LOVE_SELECT_NAME = "选择名字";
	LOVE_SET_FOCUS = "Shift - 左键设置焦点";
	LOVE_CLEAR_FOCUS = "Shift - 右键取消焦点";
	LOVE_FRIEND_LOG_TEXT = "love Tool";
	LOVE_FRIEND_LOG_TIP = "Click to inport frinds information";
	LOVE_FRIEND_LOG_NONE = "None infomation about this charactor > %s <";
	LOVE_IMPORT_BUTTON_TEXT = "IM";
	LOVE_FRIEND_NO_SELECT = "请选择一个角色";
end

local frame = CreateFrame("Frame");
frame:RegisterEvent("FRIENDLIST_UPDATE");
frame:RegisterEvent("ADDON_LOADED");

dwStaticPopupDialogs["IMPORT_FRIEND"] = {
	text = IMPORT_FRIEND_LABEL,
	button1 = OKAY,
	button2 = CANCEL,
	OnAccept = function(self)
		local name = Lib_UIDropDownMenu_GetText(ImPortFriendDropDown);
		ReAddFriends(name);
		self:Hide();
	end,	
	showAlert = 1,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
};

local function canAdd(name)
	for i, n in ipairs(db) do
		if (n == name) then
			return false;
		end
	end
	return true;
end

local function SaveFriendsInfo()
	local name, level, class, area, connected, status, note;
	local maxNum = C_FriendList.GetNumFriends();
	if not maxNum then return; end

	for index=1, maxNum do
		local info = C_FriendList.GetFriendInfoByIndex(index)
		if (canAdd(info.name)) then
			table.insert(db, info.name);
		end
	end
end

local function GetIdentInfo(id)	
	local releam, faction, name = strsplit("_", id);
	return releam, faction, name;
end

local function UpdatePlayerNames()
	local releam, faction, name;	
	for id, v in pairs(LoveDB) do
		releam, faction, name = GetIdentInfo(id);		
		if (releam == curRealm and faction == playerFaction and name ~= palyerName) then
			tinsert(PlayerList, name);
		end
	end
end

function ReAddFriends(name)
	assert(name and type(name) == "string", "Argument #1 must be a string value.");

	local id = name and string.format("%s_%s_%s", curRealm, playerFaction, name) or ident;
	local db = LoveDB[id];
	if (not db or db == {}) then
		print(format(LOVE_FRIEND_LOG_NONE, tostring(id)));
		return;
	end

	for i, name in ipairs(db.FriendsLogDB) do
		AddFriend(name);
	end
end

do
	local orgWidth = FriendsFrameBroadcastInput:GetWidth();
	FriendsFrameBroadcastInput:SetWidth(orgWidth-70);
end

local dropdown = CreateFrame("Frame", "ImPortFriendDropDown", FriendsListFrame, "Lib_UIDropDownMenuTemplate");
--dropdown:SetPoint("BOTTOMLEFT", IgnoreFrameToggleTab2, "BOTTOMRIGHT", -12, -6);
dropdown:SetPoint("TOPLEFT", FriendsListFrame, "TOPRIGHT", -98, -24);
Lib_UIDropDownMenu_SetWidth(dropdown, 26);
Lib_UIDropDownMenu_SetButtonWidth(dropdown, 24);
Lib_UIDropDownMenu_JustifyText(dropdown, "LEFT");
local name, fontHeight, flags = _G[dropdown:GetName().."Text"]:GetFont();
_G[dropdown:GetName().."Text"]:SetFont(name, 12, flags);
Lib_UIDropDownMenu_SetText(dropdown, LOVE_SELECT_NAME);

local dText = dropdown:CreateFontString(nil, "OVERLAY");
dText:SetFont(DUOWAN_CHANGELOG_FONT, 11, "OUTLINE");
dText:SetJustifyH("CENTER");
dText:SetTextColor(1, 1, 1);
dText:SetPoint("LEFT", dropdown, "LEFT", 22, 2);
dText:SetText("●");

local button = CreateFrame("Button", nil, FriendsListFrame, "UIPanelButtonTemplate");
button:RegisterForDrag("LeftButton");
button:SetWidth(25);
button:SetHeight(25);
button:SetPoint("LEFT", dropdown, "RIGHT", -15, 2);
button:EnableMouse(true);
button:SetMovable(true);
button:SetText(LOVE_IMPORT_BUTTON_TEXT);
button:SetScript("OnClick", function(self)
	local name = Lib_UIDropDownMenu_GetText(dropdown);
	if (LOVE_SELECT_NAME == name) then
		UIErrorsFrame:AddMessage(LOVE_FRIEND_NO_SELECT, 1, 0.2, 0);
	else
		IMPORT_FRIEND_TEXT = format(IMPORT_FRIEND_LABEL, name);
		dwStaticPopupDialogs["IMPORT_FRIEND"].text = IMPORT_FRIEND_TEXT;
		dwStaticPopup_Show("IMPORT_FRIEND");	
	end	
end);
button:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:SetText(LOVE_FRIEND_LOG_TEXT);
	GameTooltip:AddLine(LOVE_FRIEND_LOG_TIP, 1, 1, 1);	
	GameTooltip:Show();
end);
button:SetScript("OnLeave", function(self)
	GameTooltip:Hide();
end);
button:SetScript("OnDragStart", function(self)
	self:StartMoving();
end);
button:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing();
end);

frame:SetScript("OnEvent", function(self, event, name)
	if (event == "ADDON_LOADED" and name == "Love") then
		self:UnregisterEvent("ADDON_LOADED");
		palyerName = UnitName("player");
		curRealm = GetRealmName();
		playerFaction = UnitFactionGroup("player");
		
		ident =  string.format("%s_%s_%s", curRealm, playerFaction, palyerName);
		LoveDB = LoveDB or {};
		LoveDB[ident] = LoveDB[ident] or {};
		LoveDB[ident].FriendsLogDB = LoveDB[ident].FriendsLogDB or {};
		db = LoveDB[ident].FriendsLogDB;
		SaveFriendsInfo();
		UpdatePlayerNames();
		
		Lib_UIDropDownMenu_Initialize(dropdown, function()	
			local info = Lib_UIDropDownMenu_CreateInfo();
			for i=1, #(PlayerList) do
				info.text = PlayerList[i];
				info.func = function(self)
					Lib_UIDropDownMenu_SetSelectedID(dropdown, self:GetID());					
				end;
				info.checked = nil;
				Lib_UIDropDownMenu_AddButton(info);
			end
		end);

		if (#(PlayerList) == 0) then
			Lib_UIDropDownMenu_DisableDropDown(dropdown);
			button:Disable();
		end
	elseif (event == "FRIENDLIST_UPDATE") then
		SaveFriendsInfo();
	end
end)

-- 接口
function Love_ImportFriend_Toggle(switch)
	if (switch) then
		button:Show();
		dropdown:Show();
	else
		button:Hide();
		dropdown:Hide();
	end
end
-----------------------------
-- 便捷焦点功能

local focusenabled = false;
local focusshowtip = false;
function Love_UnitFrame_OnEnter(self)
	if (focusenabled  and focusshowtip) then	
		if (self:GetName() == "TargetFrame") then
			GameTooltip:AddLine(LOVE_SET_FOCUS, 0, 0.68, 0.85);					
		elseif (self:GetName() == "TgFocusFrame" or self:GetName() == "FocusFrame") then
			GameTooltip:AddLine(LOVE_CLEAR_FOCUS, 0, 0.68, 0.85);	
		end
		
		GameTooltip:Show();	
	end	
end

hooksecurefunc("UnitFrame_OnEnter", Love_UnitFrame_OnEnter);
TargetFrame:HookScript("OnEnter", Love_UnitFrame_OnEnter);
FocusFrame:HookScript("OnEnter", Love_UnitFrame_OnEnter);

FocusFrame:HookScript("OnDragStart", function(self)
	if (FOCUS_FRAME_LOCKED) then
		if (IsShiftKeyDown()) then
			self:StartMoving();
		end
	end
end);

FocusFrame:HookScript("OnDragStop", function(self)
	self:StopMovingOrSizing();
	ValidateFramePosition(self, 25);
end);

function Love_QuickFocus_Toggle(switch)
	if (switch) then
		TargetFrame:SetAttribute("shift-type1", "focus");				
		--TgFocusFrame:SetAttribute("shift-type2", "macro");
		--TgFocusFrame:SetAttribute("macrotext", "/clearfocus");	
		FocusFrame:SetAttribute("shift-type2", "macro");
		FocusFrame:SetAttribute("macrotext", "/clearfocus");	
		focusenabled = true;
	else
		TargetFrame:SetAttribute("shift-type1", "");		
		--TgFocusFrame:SetAttribute("shift-type2", "");
		--TgFocusFrame:SetAttribute("macrotext", "");	
		FocusFrame:SetAttribute("shift-type2", "");
		FocusFrame:SetAttribute("macrotext", "");	
		focusenabled = false;
	end
end

function Love_QuickFocus_ShowTip(switch)
	if (switch) then
		focusshowtip = true;
	else
		focusshowtip = false;
	end
end

------------------------
-- 双采功能

local enableshuangcai = false;
--[[
local tracking_time = 0; 
local tracking_count = 0;
local DW_FINDING_HERB, DW_FINDING_MINING;
local tracking_herb, tracking_mining;
local curtacking = "mining";
if (GetLocale() == "zhCN") then
	DW_FINDING_HERB = "寻找草药";
	DW_FINDING_MINING = "寻找矿物";
elseif (GetLocale() == "zhTW") then
	DW_FINDING_HERB = "尋找草藥";
	DW_FINDING_MINING = "尋找礦物";
else
	DW_FINDING_HERB = "Find Herbs";
	DW_FINDING_MINING = "Find Minerals";
end

local frame = CreateFrame("Frame", nil, UIParent);
local function Love_ShuangCai_OnUpdate(self, elapsed)
	if (enableshuangcai) then
		tracking_time = tracking_time + elapsed;
		if (tracking_time > 3) then	
			tracking_time = 0;

			local count = GetNumTrackingTypes();
			if (tracking_count ~= count) then
				local name;
				tracking_herb, tracking_mining = false, false; 
				for i=1, count do
					name = GetTrackingInfo(i);
					if (name == DW_FINDING_HERB) then
						tracking_herb = i;
					elseif (name == DW_FINDING_MINING) then
						tracking_mining = i;
					end
				end
				tracking_count = count;
			end
			
			if (tracking_herb and tracking_mining) then
				if (curtacking == "mining") then
					local start, duration, enabled = GetSpellCooldown(DW_FINDING_MINING); 
					local spell = UnitCastingInfo("player"); 
					local combat = UnitAffectingCombat("player"); 
					if (not (combat or spell or (start and duration and start > 0 and duration > 0))) then
						SetTracking(tracking_mining); 
						curtacking = "herb"; 
					end
				else
					local start, duration, enabled = GetSpellCooldown(DW_FINDING_HERB); 
					local spell = UnitCastingInfo("player"); 
					local combat = UnitAffectingCombat("player"); 
					if (not (combat or spell or (start and duration and start > 0 and duration > 0))) then
						SetTracking(tracking_herb); 
						curtacking = "mining"; 
					end
				end				
			end
		end
	end
end

frame:SetScript("OnUpdate", Love_ShuangCai_OnUpdate);
]]
function Love_ShuangCai_Toggle(switch)
	enableshuangcai = switch;
end

do 
--https://ngabbs.com/read.php?&tid=16502533&pid=324283944&to=1
    local Challengesf = CreateFrame("Frame");
    Challengesf:RegisterEvent("ADDON_LOADED")
    Challengesf:SetScript("OnEvent", function(cs, event, addon)
        if addon ~= "Blizzard_ChallengesUI" then return end
		cs:UnregisterEvent(event)
        local levels = { nil, 380, 385, 390, 390, 395, 400, 400, 405, 410, 410, 410, 410, 410, 410, 410, 410, 410, 410, 410, 410, 410, 410, 410, 410 } 
        local titans = { nil, nil, nil, nil, nil, nil, nil, nil, nil, 625, 667, 709, 751, 793, 835, 866, 897, 928, 959, 990, 1010,1030,1050,1070,1090} 
        ChallengesFrame.WeeklyInfo.Child.WeeklyChest:HookScript("OnEnter", function(cf)
            if GameTooltip:IsVisible() then
                GameTooltip:AddLine(" ")
                GameTooltip:AddLine("钥石层数  奖励装等  奖励精华")
                local start = 2
                if cf.level and cf.level > 0 then
                    start = cf.level - 3
                elseif cf.ownedKeystoneLevel and cf.ownedKeystoneLevel > 0 then
                    start = cf.ownedKeystoneLevel - 5
                end
                for i = start, start + 9 do
                    if levels[i] or titans[i] then
                        local line = "    %2d层 |T130758:10:35:0:0:32:32:10:22:10:22|t %s |T130758:10:25:0:0:32:32:10:22:10:22|t %s" 
                        local level = levels[i] and format("%d", levels[i]) or " ? "
                        local titan = titans[i] and format("%4d", titans[i]) or "  ? "
                        GameTooltip:AddLine(format(line, i, level, titan))
                    else
                        break
                    end
                end

                GameTooltip:AddLine(" ")
                GameTooltip:AddLine("385随机 需要165 分解返35")
                GameTooltip:AddLine("400随机 需要675 分解返115")
                GameTooltip:AddLine("415随机 需要1725 分解返365")
                GameTooltip:AddLine("415指定 需要7150")
                GameTooltip:AddLine("其他：340返1 355返3 370返12")
                GameTooltip:Show()
            end
        end)
    end)
end

--This function handles disabling of OrderHall Bar or resizing of ElvUIParent if needed
function DWHandleCommandBar()
	if (dwGetCVar("LoveMod", "OrderHallCommandBar") == 1) then
		local bar = _G.OrderHallCommandBar
		bar:UnregisterAllEvents()
		bar:SetScript('OnShow', bar.Hide)
		_G.OrderHallCommandBarIsDwHide = true;
		bar:Hide()
		_G.UIParent:UnregisterEvent('UNIT_AURA')--Only used for OrderHall Bar
	end
end

if _G.OrderHallCommandBar then
	DWHandleCommandBar()
else
	local frame = CreateFrame('Frame')
	frame:RegisterEvent('ADDON_LOADED')
	frame:SetScript('OnEvent', function(Frame, event, addon)
		if event == 'ADDON_LOADED' and addon == 'Blizzard_OrderHallUI' then
			if InCombatLockdown() then
				Frame:RegisterEvent('PLAYER_REGEN_ENABLED')
			else
				DWHandleCommandBar()
			end
			Frame:UnregisterEvent(event)
		elseif event == 'PLAYER_REGEN_ENABLED' then
			DWHandleCommandBar()
			Frame:UnregisterEvent(event)
		end
	end)
end
