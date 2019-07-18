-- Title: ArtifactPowerUser
-- Version: 3.2
-- Notes: Creates button to use Artifact Power items faster
-- Author: FlyNeko
local addonName = ...
local db
local dbChar
local self
local itemLink, bag, slot
local Cache = {}
local tooltipName = "APUscanner"
local tooltipScanner = CreateFrame("GameTooltip", tooltipName, nil, "GameTooltipTemplate")
local ARTIFACT_POWER = ARTIFACT_POWER
local GetSpecializationInfo = GetSpecializationInfo
local GetLocale = GetLocale
local GetContainerNumSlots = GetContainerNumSlots
local GetContainerItemLink = GetContainerItemLink
local InCombatLockdown = InCombatLockdown
local UnitHasVehicleUI = UnitHasVehicleUI
local GetSpecialization = GetSpecialization
local GetContainerItemCooldown = GetContainerItemCooldown
local GetItemIcon = GetItemIcon
local GetNumSpecializations = GetNumSpecializations
local lower, tonumber = string.lower, tonumber
local tooltip = CreateFrame("GameTooltip", "APUtooltip", UIParent, "GameTooltipTemplate")

local L = {}
if GetLocale() == 'zhCN' then
	L["ArtifactPowerUser"] = "多玩:一键神器能量"
	L["Close:/apu disable"] = "关闭命令:/apu disable"
	L["|c0000FF00Left click|r to show/hide"] = "|c0000FF00左击|r 切换显示/隐藏"
	L["|c00FF0000Right click|r to lock/unlock"] = "|c00FF0000右击|r 切换锁定/解锁"
	L["ArtifactPowerUser disabled for current spec. Type /apu enable"] = "一键神器能量在当前天赋中被禁用. 输入/apu enable来启用";
	L["ArtifactPowerUser locked"] = "一键神器能量：锁定"
	L["ArtifactPowerUser unlocked"] = "一键神器能量：解锁"
	L["ArtifactPowerUser size = "] = "一键神器能量尺寸="
	L["Format /apu size 64"] = "格式：/apu size 40"
	L["ArtifactPowerUser disabled for "] = "一键神器能量已禁用于天赋："
	L["ArtifactPowerUser enabled for "] = "一键神器能量已启用于天赋："
	L["Possible commands: show, hide, toggle, size, lock, unlock, reset"] = "位置命令：show, hide, toggle, size, lock, unlock, reset"
	L["/apu disable - always hide for current spec. /apu enable - revert this"] = "/apu disable - 允许隐藏于当前天赋. /apu enable - 当前天赋显示"
	L["/apu specs - enable/disable specs by GUI"] = "/apu specs - 启用/禁用天赋图形界面"
	L["/apu ignore - ignore current item. Also usable with itemID or linked(shift-clicked) item. Reverse command /apu unignore item. \n/apu list - print all ignored items"] = "/apu ignore - 忽略当前物品. 总是不使用当前ID或链结（Shift+点击)的物品. 使用/apu unignore 恢复使用. \n/apu list - 打印所有被忽略的物品"
elseif GetLocale() == 'zhTW' then
	L["ArtifactPowerUser"] = "多玩:一鍵神器能量"
	L["Close:/apu disable"] = "關閉命令:/apu disable"
	L["|c0000FF00Left click|r to show/hide"] = "|c0000FF00左擊|r 切換顯示/隱藏"
	L["|c00FF0000Right click|r to lock/unlock"] = "|c00FF0000右擊|r 切換鎖定/解鎖"
	L["ArtifactPowerUser disabled for current spec. Type /apu enable"] = "一鍵神器能量在當前天賦中被禁用. 輸入/apu enable來啟用";
	L["ArtifactPowerUser locked"] = "一鍵神器能量：鎖定"
	L["ArtifactPowerUser unlocked"] = "一鍵神器能量：解鎖"
	L["ArtifactPowerUser size = "] = "一鍵神器能量尺寸="
	L["Format /apu size 64"] = "格式：/apu size 40"
	L["ArtifactPowerUser disabled for "] = "一鍵神器能量已禁用於天賦："
	L["ArtifactPowerUser enabled for "] = "一鍵神器能量已啟用於天賦："
	L["Possible commands: show, hide, toggle, size, lock, unlock, reset"] = "位置命令：show, hide, toggle, size, lock, unlock, reset"
	L["/apu disable - always hide for current spec. /apu enable - revert this"] = "/apu disable - 允許隱藏於當前天賦. /apu enable - 當前天賦顯示"
	L["/apu specs - enable/disable specs by GUI"] = "/apu specs - 啟用/禁用天賦圖形介面"
	L["/apu ignore - ignore current item. Also usable with itemID or linked(shift-clicked) item. Reverse command /apu unignore item. \n/apu list - print all ignored items"] = "/apu ignore - 忽略当前物品. 总是不使用当前ID或链结（Shift+点击)的物品. 使用/apu unignore 恢复使用. \n/apu list - 打印所有被忽略的物品"
else
	L["ArtifactPowerUser"] = "ArtifactPowerUser"
	L["Close:/apu disable"] = "Close:/apu disable"
	L["|c0000FF00Left click|r to show/hide"] = "|c0000FF00Left click|r to show/hide"
	L["|c00FF0000Right click|r to lock/unlock"] = "|c00FF0000Right click|r to lock/unlock"
	L["ArtifactPowerUser disabled for current spec. Type /apu enable"] = "ArtifactPowerUser disabled for current spec. Type /apu enable"
	L["ArtifactPowerUser locked"] = "ArtifactPowerUser locked"
	L["ArtifactPowerUser unlocked"] = "ArtifactPowerUser unlocked"
	L["ArtifactPowerUser size = "] = "ArtifactPowerUser size = "
	L["Format /apu size 64"] = "Format /apu size 64"
	L["ArtifactPowerUser disabled for "] = "ArtifactPowerUser disabled for "
	L["ArtifactPowerUser enabled for "] = "ArtifactPowerUser enabled for "
	L["Possible commands: show, hide, toggle, size, lock, unlock, reset"] = "Possible commands: show, hide, toggle, size, lock, unlock, reset"
	L["/apu disable - always hide for current spec. /apu enable - revert this"] = "/apu disable - always hide for current spec. /apu enable - revert this"
	L["/apu specs - enable/disable specs by GUI"] = "/apu specs - enable/disable specs by GUI"
	L["/apu ignore - ignore current item. Also usable with itemID or linked(shift-clicked) item. Reverse command /apu unignore item. \n/apu list - print all ignored items"] = "/apu ignore - ignore current item. Also usable with itemID or linked(shift-clicked) item. Reverse command /apu unignore item. \n/apu list - print all ignored items"
end

local ignoredItems = {
	[147717] = true,
}

local function ScanBags(type)
	for bag = 0, NUM_BAG_SLOTS do
		for slot = 1, GetContainerNumSlots(bag) do
			local itemLink = GetContainerItemLink(bag, slot)
			if itemLink and itemLink:match("item:%d+") then
				if Cache[itemLink] == type then
					return itemLink, bag, slot
				elseif not db.ignoredItems[tonumber(itemLink:match("item:(%d+)"))] then
					if type == "fish" then				
						if select(3,GetItemSpell(itemLink)) == 221474 then -- 221474 Throw Back
							Cache[itemLink] = type
							return itemLink, bag, slot
						end
					else
						tooltipScanner:SetOwner(UIParent, "ANCHOR_NONE")
						tooltipScanner:SetHyperlink(itemLink)
						for i = 2,4 do
							local tooltipText = _G[tooltipName.."TextLeft"..i]:GetText()
							if tooltipText and tooltipText:match("\124cFFE6CC80"..ARTIFACT_POWER.."\124r") then
								Cache[itemLink] = type
								return itemLink, bag, slot
							end
						end
					end
				end
			end
		end
	end
	return nil
end

local function Update()
	if InCombatLockdown() or UnitHasVehicleUI("player") then
		return
	end
	if not dbChar.hide and not dbChar.disable[GetSpecialization()] then
		local type = IsEquippedItem(133755) and "fish" or "normal" -- 133755 fishing artifact Underlight Angler
		itemLink, bag, slot = ScanBags(type)
		if itemLink then
			self:SetAttribute("type", "item")
			self:SetAttribute("item", bag.." "..slot)
			self:SetAttribute("shift-type1", "macro")	--ChatEdit_InsertLink(itemLink)
			self:SetAttribute("shift-macrotext1", "/run ChatEdit_InsertLink(\"" .. itemLink .. "\")" )
			local itemTexture = GetItemIcon(itemLink)
			self.icon:SetTexture(itemTexture)
			local start, duration, enable = GetContainerItemCooldown(bag, slot)
			if duration > 0 then
				self.cooldown:SetCooldown(start, duration)
			elseif self.cooldown:GetCooldownDuration() > 0 then
				self.cooldown:SetCooldown(0,0)
			end
			self:Show()
			if self:IsMouseOver() then	--update tooltip
				tooltip:SetHyperlink(itemLink)
			end
		else
			self:Hide()
		end
	else
		self:Hide()
	end
end

local function LoadSettings()
	if ArtifactPowerUserDB == nil then ArtifactPowerUserDB = {} end
	db = ArtifactPowerUserDB

	if ArtifactPowerUserCharacterDB == nil then ArtifactPowerUserCharacterDB = {} end
	dbChar = ArtifactPowerUserCharacterDB

	if db.size == nil then db.size = 40 end
	if db.position == nil then db.position = {} end
	if db.position.point == nil then db.position.point = "CENTER" end
	if db.position.relativePoint == nil then db.position.relativePoint = db.position.point or "CENTER" end
	if db.position.x == nil then db.position.x, db.position.y = 0, -150 end
	if db.lock == nil then db.lock = false end

	if dbChar.hide == nil then
		if db.hide ~= nil then
			dbChar.hide = db.hide	--update from prev version
			db.hide = nil
		else
			dbChar.hide = false
		end
	end
	if dbChar.disable == nil then dbChar.disable = {} end	--by specs
	if db.ignoredItems == nil then db.ignoredItems = ignoredItems end
end

local function CreateButton()
	if not self then
		self = CreateFrame("Button", "ArtifactPowerUserButton", UIParent, "ActionButtonTemplate, SecureActionButtonTemplate")
	end
	self:SetFrameStrata("MEDIUM")
	self:SetClampedToScreen(true)
	self:SetSize(db.size, db.size)
	self:ClearAllPoints() --by eui.cc
	self:SetPoint(db.position.point, UIParent, db.position.relativePoint, db.position.x, db.position.y)
	self:SetMovable(not db.lock)

	self.NormalTexture:SetTexture(nil)

	self:EnableMouse(true)
	self:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    self:HookScript("OnClick", function(self, button) if button == "RightButton" then return ArtifactPowerUserOptions:Show() end end) --by eui.cc
	self:RegisterForDrag("LeftButton")

	self:RegisterEvent("BAG_UPDATE_DELAYED")
	self:RegisterEvent("PLAYER_REGEN_DISABLED")
	self:RegisterEvent("PLAYER_REGEN_ENABLED")
    self:RegisterEvent("PET_BATTLE_OPENING_START")
    self:RegisterEvent("PET_BATTLE_CLOSE")
    self:RegisterEvent("UNIT_ENTERED_VEHICLE")
    self:RegisterEvent("UNIT_EXITED_VEHICLE")
	self:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")

	self:SetScript("OnEvent", function(self, event, ...)
		if event == "BAG_UPDATE_DELAYED" or event == "PLAYER_SPECIALIZATION_CHANGED" then
			Update()
		elseif event == "PLAYER_REGEN_DISABLED" or event == "PET_BATTLE_OPENING_START" or (event == "UNIT_ENTERED_VEHICLE" and ... == "player" and not InCombatLockdown()) then
			self:Hide()
			self:UnregisterEvent("BAG_UPDATE_DELAYED")
		elseif event == "PLAYER_REGEN_ENABLED" or event == "PET_BATTLE_CLOSE" or (event == "UNIT_EXITED_VEHICLE" and ... == "player") then
			Update()
			self:RegisterEvent("BAG_UPDATE_DELAYED")
		end

	end)

	self:SetScript("OnHide", function(self)
		self:SetAttribute("type", nil)
		self:SetAttribute("item", nil)
	end)
	self:SetScript("OnEnter", function(self)
		if itemLink then
			tooltip:SetOwner(self, "ANCHOR_RIGHT")
			tooltip:SetHyperlink(itemLink)
            tooltip:AddLine(" ")
            tooltip:AddLine(L["ArtifactPowerUser"])
            tooltip:AddLine(L["Close:/apu disable"])
            tooltip:Show()
		end
	end)
	self:SetScript("OnLeave", function(self)
		tooltip:Hide()
	end)
	self:SetScript("OnDragStart", function(self)
		if self:IsMovable() then
			self:StartMoving()
		end
	end)
	self:SetScript("OnReceiveDrag", function(self)
		self:StopMovingOrSizing()
		db.position.point, _, db.position.relativePoint, db.position.x, db.position.y = self:GetPoint()
	end)

	Update()
end

local function SlashShow()
	dbChar.hide = false
	Update()
	if dbChar.disable[GetSpecialization()] then
		print("ArtifactPowerUser disabled for current spec. Type /apu enable")
	end
end
local function SlashHide()
	dbChar.hide = true
	if not InCombatLockdown() then
		self:Hide()
	end
end
local function SlashToggle()
	if dbChar.hide then
		SlashShow()
	else
		SlashHide()
	end
end
local function SlashLock(lock)
	if lock == nil then
		lock = not db.lock
	end
	if lock then
		db.lock = true
		self:SetMovable(false)
		print(L["ArtifactPowerUser locked"])
	else
		db.lock = false
		self:SetMovable(true)
		print(L["ArtifactPowerUser unlocked"])
	end
end
local function SlashFunction(msg)
	msg = string.lower(msg)
	local command, param = msg:match("^(%S*)%s*(.-)$")
	if command == "show" then
		SlashShow()
	elseif command == "hide" then
		SlashHide()
	elseif command == "toggle" then
		SlashToggle()
	elseif command == "size" then
		local size = tonumber(param)
		if size then
			db.size = size
			self:SetSize(size, size)
			print(L["ArtifactPowerUser size = "]..size)
		else
			print(L["Format /apu size 64"])
		end
	elseif command == "lock" then
		SlashLock(true)
	elseif command == "unlock" then
		SlashLock(false)
	elseif command == "reset" then
		db.position.point = "CENTER"; db.position.relativePoint = "CENTER"; db.position.x, db.position.y = 0, -150
        self:ClearAllPoints() --by eui.cc
		self:SetPoint(db.position.point, UIParent, db.position.relativePoint, db.position.x, db.position.y)
	elseif command == "disable" then
		local spec = GetSpecialization()
		dbChar.disable[spec] = true
		if not InCombatLockdown() then
			self:Hide()
		end
		print(L["ArtifactPowerUser disabled for "]..select(2,GetSpecializationInfo(spec)))
	elseif command == "enable" then
		local spec = GetSpecialization()
		dbChar.disable[spec] = nil
		Update()
		print(L["ArtifactPowerUser enabled for "]..select(2,GetSpecializationInfo(spec)))
	elseif command == "specs" or command == "spec" then
		ArtifactPowerUserOptions:Show()
	elseif command == "ignore" then
		if param == "" then
			if self:IsShown() then --ignore current item
				db.ignoredItems[tonumber(itemLink:match("item:(%d+)"))] = true
			end
		else
			local itemID = tonumber(param)
			if itemID then
				db.ignoredItems[itemID] = true
			elseif param:match("item:%d+") then
				db.ignoredItems[tonumber(param:match("item:(%d+)"))] = true
			end
		end
		Update()
	elseif command == "unignore" then
		local itemID = tonumber(param)
		if itemID then
			db.ignoredItems[itemID] = nil
		elseif param:match("item:%d+") then
			db.ignoredItems[tonumber(param:match("item:(%d+)"))] = nil
		end
		Update()
	elseif command == "list" then --show ignored items
		local f = true
		for i in pairs (db.ignoredItems) do
			local link = select(2,GetItemInfo(i))
			print(link," (ID ",i,")")
			f = false
		end
		if f then
			print("Nothing ignored")		
		end
	else
		print(L["Possible commands: show, hide, toggle, size N, lock, unlock, reset"])
		print(L["/apu disable - always hide for current spec. /apu enable - revert this"])
		print(L["/apu specs - enable/disable specs by GUI"])
		print(L["/apu ignore - ignore current item. Also usable with itemID or linked(shift-clicked) item. Reverse command /apu unignore item. \n/apu list - print all ignored items"] )
	end
end

function ArtifactPowerUserOptions_OnShow()
	for i = 1, GetNumSpecializations() do
		local button
		if not _G["APUSpec"..i] then button = CreateFrame("CheckButton", "APUSpec"..i, ArtifactPowerUserOptions, "UICheckButtonTemplate") end
		button = _G["APUSpec"..i]
		if i == GetSpecialization() then
			button.text:SetFontObject("GameFontGreen")
		else
			button.text:SetFontObject("GameFontHighlight")
		end
		button.text:SetText(select(2,GetSpecializationInfo(i)))
		button:SetChecked(not dbChar.disable[i])
		button:SetPoint("TOPLEFT",20,-20-((i-1)*32))
		button:SetScript("OnClick",function(self)
			if self:GetChecked() then dbChar.disable[i] = nil else dbChar.disable[i] = true end
			Update()
		end)
	end
end
local dataobj = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject(addonName, {
	type = "launcher",
	icon = C_ArtifactUI.GetEquippedArtifactInfo() and GetItemIcon(C_ArtifactUI.GetEquippedArtifactInfo()) or "Interface\\Icons\\INV_Staff_2h_ArtifactAegwynsStaff_D_01",
	OnClick = function(clickedframe, button)
		if button == "LeftButton" then
			SlashToggle()
		elseif button == "RightButton" then
			SlashLock()
		end
	end,
})
function dataobj:OnTooltipShow()
	self:AddLine(L["ArtifactPowerUser"])
	self:AddLine(L["|c0000FF00Left click|r to show/hide"])
	self:AddLine(L["|c00FF0000Right click|r to lock/unlock"])
end

do
	local f = CreateFrame("Frame")

	f:RegisterEvent("ADDON_LOADED")
	f:RegisterEvent("PLAYER_ENTERING_WORLD")
	f:SetScript("OnEvent", function(self, event, ...)
		if event == "ADDON_LOADED" and (...) == addonName then
			LoadSettings()
		elseif event == "PLAYER_ENTERING_WORLD" then
			CreateButton()
		end
	end)

	SLASH_ARTIFACTPOWERUSER1 = "/apu"
	SlashCmdList["ARTIFACTPOWERUSER"] = SlashFunction
	_G["BINDING_NAME_CLICK ArtifactPowerUserButton:LeftButton"] = "ArtifactPowerUse"
	BINDING_HEADER_ARTIFACTPOWERUSER = L["ArtifactPowerUser"]
end

function DWArtifactPowerButtonShowToggle(toggle)
	if toggle then
		SlashShow()
	else
		SlashHide()
	end
end