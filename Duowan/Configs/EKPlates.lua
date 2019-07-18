------------------------------------
-- dugu 2009-12-22
local TRINKET_TITLE, TRINKET_ENABLE, TRINKET_OPEN_OPTIONS

if (GetLocale() == "zhCN") then
	TRINKET_TITLE = "姓名版增强";
	TRINKET_ENABLE = "启用姓名版增强";
	EK_numberstyle = "数字模式";
	EK_numberstyle_DESC = "数字模式的开关需要重启后才生效";
	EK_name_mod = "玩家只显示姓名";
	EK_cbshield = "施法条不可打断图标";
	EK_HideArrow = "隐藏目标箭头";
	EK_HorizontalArrow = "横向箭头";
	EK_playerplate = "玩家个人资源";
	EK_playerplate_DESC = "开关此选项需要手工重载界面/rl"
	EK_auranum = "光环数量"
	EK_auraiconsize = "光环尺寸"
	EK_WhiteList = "技能白名单(勾选无效)"
	EK_WhiteList_DESC = "此项勾选无效，下面的技能可以勾选"
	EK_Inset = "姓名版不贴齐画面"
	FNP_LOCALE_OPTION_TEXT = "易爆球血条高亮"
	
elseif (GetLocale() == "zhTW") then
	TRINKET_TITLE = "姓名版增強";
	TRINKET_ENABLE = "啟用姓名版增強";
	EK_numberstyle = "數位模式";
	EK_numberstyle_DESC = "數位模式的開關需要重啟後才生效";
	EK_name_mod = "玩家只顯示姓名";
	EK_cbshield = "施法條不可打斷圖示";
	EK_HideArrow = "隱藏目標箭頭";
	EK_HorizontalArrow = "橫向箭頭";
	EK_playerplate = "玩家個人資源";
	EK_playerplate_DESC = "開關此選項需要手工重載介面/rl"
	EK_auranum = "光環數量"
	EK_auraiconsize = "光環尺寸"
	EK_WhiteList_DESC = "此項勾選無效，下面的技能可以勾選"
	EK_Inset = "姓名版不貼齊畫面"
	FNP_LOCALE_OPTION_TEXT = "易爆球血條高亮"
	
else
	TRINKET_TITLE = "姓名版增強";
	TRINKET_ENABLE = "啟用姓名版增強";
	EK_numberstyle = "數位模式";
	EK_numberstyle_DESC = "數位模式的開關需要重啟後才生效";
	EK_name_mod = "玩家只顯示姓名";
	EK_cbshield = "施法條不可打斷圖示";
	EK_HideArrow = "隱藏目標箭頭";
	EK_HorizontalArrow = "橫向箭頭";
	EK_playerplate = "玩家個人資源";
	EK_playerplate_DESC = "開關此選項需要手工重載介面/rl"
	EK_auranum = "光環數量"
	EK_auraiconsize = "光環尺寸"
	EK_WhiteList_DESC = "此項勾選無效，下面的技能可以勾選"
	EK_Inset = "姓名版不貼齊畫面"
	FNP_LOCALE_OPTION_TEXT = "易爆球血条高亮"
end



if (dwIsConfigurableAddOn("EKPlates")) or (dwIsConfigurableAddOn("FilteredNamePlate")) then
	local C, G

	dwRegisterMod(
		"EKPLATES",
		TRINKET_TITLE,
		"EKPlates",
		"",
		"Interface\\ICONS\\INV_Jewelry_Necklace_15",
		nil
	);
	
	if (dwIsConfigurableAddOn("EKPlates")) then
		dwRegisterCheckButton(
			"EKPLATES",
			TRINKET_ENABLE,
			nil,
			"EKPLATES_OPTION1",
			0,
			function (arg)	
				if (arg == 1) then
					if (not dwIsAddOnLoaded("EKPlates")) then
						dwLoadAddOn("EKPlates");
						C, G = unpack(EKPlate);
						for k, v in pairs(C.WhiteList) do
							local SNAME, _ = GetSpellInfo(k);
							dwRegisterCheckButton(
								"EKPLATES",
								SNAME,
								nil,
								"EKPLATES_"..k,
								1,
								function (arg)	
									if (arg == 1) then
										if (not dwIsAddOnLoaded("EKPlates")) then
											C.WhiteList[k] = true;
											NamePlates_UpdateNamePlateOptions();
										end
									else
										if (dwIsAddOnLoaded("EKPlates")) then	
											C.WhiteList[k] = false;
											NamePlates_UpdateNamePlateOptions();
										end
									end
								end,
								1
							);
						end
					end
				else
					if (dwIsAddOnLoaded("EKPlates")) then	
						dwRequestReloadUI(nil);
					end
				end
			end
		);
		dwRegisterCheckButton(
			"EKPLATES",
			EK_numberstyle,
			EK_numberstyle_DESC,
			"EKPLATES_numberstyle",
			0,
			function (arg)	
				if (arg == 1) then
					if dwIsAddOnLoaded("EKPlates") then
						C.numberstyle = true;
						NamePlates_UpdateNamePlateOptions();
					end
				else
					if (dwIsAddOnLoaded("EKPlates")) then	
						C.numberstyle = false;
						NamePlates_UpdateNamePlateOptions();
					end
				end
			end,
			1
		);
		dwRegisterCheckButton(
			"EKPLATES",
			EK_Inset,
			nil,
			"EKPLATES_Inset",
			0,
			function (arg)	
				if (arg == 1) then
					if dwIsAddOnLoaded("EKPlates") then
						C.Inset = true;
						NamePlates_UpdateNamePlateOptions();
					end
				else
					if (dwIsAddOnLoaded("EKPlates")) then	
						C.Inset = false;
						NamePlates_UpdateNamePlateOptions();
					end
				end
			end,
			1
		);
		dwRegisterCheckButton(
			"EKPLATES",
			EK_name_mod,
			nil,
			"EKPLATES_name_mod",
			0,
			function (arg)	
				if (arg == 1) then
					if dwIsAddOnLoaded("EKPlates") then
						C.name_mod = true;
						NamePlates_UpdateNamePlateOptions();
					end
				else
					if (dwIsAddOnLoaded("EKPlates")) then	
						C.name_mod = false;
						NamePlates_UpdateNamePlateOptions();
					end
				end
			end,
			1
		);
		dwRegisterCheckButton(
			"EKPLATES",
			EK_cbshield,
			nil,
			"EKPLATES_cbshield",
			1,
			function (arg)	
				if (arg == 1) then
					if dwIsAddOnLoaded("EKPlates") then
						C.cbshield = true;
						NamePlates_UpdateNamePlateOptions();
					end
				else
					if (dwIsAddOnLoaded("EKPlates")) then	
						C.cbshield = false;
						NamePlates_UpdateNamePlateOptions();
					end
				end
			end,
			1
		);	
		
		dwRegisterCheckButton(
			"EKPLATES",
			EK_HideArrow,
			nil,
			"EKPLATES_HideArrow",
			0,
			function (arg)	
				if (arg == 1) then
					if dwIsAddOnLoaded("EKPlates") then
						C.HideArrow = true;
						NamePlates_UpdateNamePlateOptions();
					end
				else
					if (dwIsAddOnLoaded("EKPlates")) then	
						C.HideArrow = false;
						NamePlates_UpdateNamePlateOptions();
					end
				end
			end,
			1
		);
		
		dwRegisterCheckButton(
			"EKPLATES",
			EK_HorizontalArrow,
			nil,
			"EKPLATES_HorizontalArrow",
			0,
			function (arg)	
				if (arg == 1) then
					if dwIsAddOnLoaded("EKPlates") then
						C.HorizontalArrow = true;
						NamePlates_UpdateNamePlateOptions();
					end
				else
					if (dwIsAddOnLoaded("EKPlates")) then	
						C.HorizontalArrow = false;
						NamePlates_UpdateNamePlateOptions();
					end
				end
			end,
			1
		);
			
		dwRegisterCheckButton(
			"EKPLATES",
			EK_playerplate,
			EK_playerplate_DESC,
			"EKPLATES_classresource_show",
			0,
			function (arg)	
				if (arg == 1) then
					if dwIsAddOnLoaded("EKPlates") then
						C.classresource_show = true;
						NamePlates_UpdateNamePlateOptions();
					end
				else
					if (dwIsAddOnLoaded("EKPlates")) then
						C.classresource_show = false;
						NamePlates_UpdateNamePlateOptions();
					end
				end
			end,
			1
		);	
		
		dwRegisterSpinBox(
			"EKPLATES",
			EK_auranum,
			DUOWAN_SPINBOX_RANGE,
			"EKPLATES_auranum",
			{1, 20, 1},
			5,
			function(arg)
				if (dwIsAddOnLoaded("EKPlates")) then
					C.auranum = arg;
					NamePlates_UpdateNamePlateOptions();
				end
			end,
			1
		);
		
		dwRegisterSpinBox(
			"EKPLATES",
			EK_auraiconsize,
			DUOWAN_SPINBOX_RANGE,
			"EKPLATES_auraiconsize",
			{5, 50, 1},
			22,
			function(arg)
				if (dwIsAddOnLoaded("EKPlates")) then
					C.auraiconsize = arg;
					NamePlates_UpdateNamePlateOptions();
				end
			end,
			1
		);
		
		dwRegisterCheckButton(
			"EKPLATES",
			EK_WhiteList,
			EK_WhiteList_DESC,
			"EKPLATES_WhiteList",
			1,
			function (arg)
			end
		);
	end
	
		if (dwIsConfigurableAddOn("FilteredNamePlate")) then	
		dwRegisterButton(
			"EKPLATES",
			FNP_LOCALE_OPTION_TEXT, 
			function()			
				if (dwIsAddOnLoaded("FilteredNamePlate")) and FilteredNamePlate then
					HideUIPanel(DuowanConfigFrame);
					FilteredNamePlate:FNP_ChangeFrameVisibility()
				end
			end, 
			1
		);
	end
end