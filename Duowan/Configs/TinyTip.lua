------------------------------------
-- dugu 2009-12-22
if (GetLocale() == "zhCN") then
	TINYTIP_TITLE = "鼠标提示";
	TINYTIP_OPTION1 = "提示详细设置";
	TINYTIP_OPTION2 = "观察相关设置";
	RELICINSPECTOR_DESC = "圣物观察";
	TINYTIP_OPTION3 = "重置设置"
	TINYTIP_OPTION4 = "圣物观察设置"
	TINYTIP_OPTION5 = "艾泽拉斯之心提示"
elseif (GetLocale() == "zhTW") then
	TINYTIP_TITLE = "滑鼠提示";
	TINYTIP_OPTION1 = "详细设置";
	TINYTIP_OPTION2 = "观察设置";
	TINYTIP_OPTION3 = "重置设置"
	TINYTIP_OPTION4 = "聖物觀察設置"
	TINYTIP_OPTION5 = "艾泽拉斯之心提示"
	RELICINSPECTOR_DESC = "聖物觀察";
else
	TINYTIP_TITLE = "鼠标提示";
	TINYTIP_OPTION1 = "详细设置";
	TINYTIP_OPTION2 = "观察设置";
	RELICINSPECTOR_DESC = "圣物观察";
	TINYTIP_OPTION3 = "重置设置"
	TINYTIP_OPTION4 = "圣物观察设置"
	TINYTIP_OPTION5 = "艾泽拉斯之心提示"
end

dwStaticPopupDialogs["DUOWAN_TINYTIP_RELOADUI"] = {
	text = "确定|cffff7000重置鼠标提示存档并重载界面|r?",
	button1 = TEXT(OKAY),
	button2 = TEXT(CANCEL),
	OnAccept = function()		
		BigTipDB = nil;
		TinyInspectDB = nil;
		RelicInspectorDB = nil;
		ReloadUI();
	end,
	OnCancel = function()
	end,
	timeout = 30,
	showAlert = 1,
	hideOnEscape = 1,
	whileDead = 1,
};

if (dwIsConfigurableAddOn("TinyTip")) then	
	dwRegisterMod(
		"TinyTip",
		TINYTIP_TITLE,
		"TinyTip",
		"",
		"Interface\\ICONS\\Achievement_BG_3flagcap_nodeaths",
		nil
	);

	dwRegisterButton(
		"TinyTip",
		TINYTIP_OPTION3, 
		function()	
			if (dwIsAddOnLoaded("TinyTip")) then
				dwStaticPopup_Show("DUOWAN_TINYTIP_RELOADUI");		
			end
		end
	);
	
	dwRegisterButton(
		"TinyTip",
		TINYTIP_OPTION1, 
		function()	
			if (dwIsAddOnLoaded("TinyTip")) then	
				SlashCmdList.TinyTooltip();
				HideUIPanel(DuowanConfigFrame);				
			end
		end
	);
	dwRegisterButton(
		"TinyTip",
		TINYTIP_OPTION2, 
		function()	
			if (dwIsAddOnLoaded("TinyTip")) then	
				SlashCmdList.TinyInspect();
				HideUIPanel(DuowanConfigFrame);				
			end
		end
	);
	
	dwRegisterCheckButton(
		"TinyTip",
		RELICINSPECTOR_DESC,
		nil,
		"ShowRelicInspector",
		1,
		function (arg)
			if(arg==1)then				
				if RelicInspectorDB then RelicInspectorDB.enabled = true; end
			else
				if RelicInspectorDB then RelicInspectorDB.enabled = false; end
			end
		end
	);
	dwRegisterButton(
		"TinyTip",
		TINYTIP_OPTION4, 
		function()	
			if (dwIsAddOnLoaded("RelicInspector")) then	
				InterfaceOptionsFrame_OpenToCategory("RelicInspector");
				InterfaceOptionsFrame_OpenToCategory("RelicInspector");
				InterfaceOptionsFrame_OpenToCategory("RelicInspector");
				HideUIPanel(DuowanConfigFrame);				
			end
		end
	);	
	dwRegisterCheckButton(
		"TinyTip",
		TINYTIP_OPTION5,
		nil,
		"azerite",
		1,
		function (arg)

		end
	);
end