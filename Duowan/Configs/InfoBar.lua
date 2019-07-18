------------------------------------
-- cadcamzy 2018-12-12

if (GetLocale() == "zhCN") then
	CHOCOLATEBAR_TITLE	= "多玩信息条";
	CHOCOLATEBAR_ENABLE = "开启多玩信息条";
	CHOCOLATEBAR_OPTION = "更多配置";
	CHOCOLATEBAR_NAME	= "信息条面板";
	iCPU_ENABLE = 'iCPU 开启';
	iGear_ENABLE = 'iGear 开启';
	iMail_ENABLE = 'iMail 开启';
	iGuild_ENABLE = 'iGuild 开启';
	iReputation_ENABLE = 'iReputation 开启';
elseif (GetLocale() == "zhTW") then
	CHOCOLATEBAR_TITLE	= "多玩信息條";
	CHOCOLATEBAR_ENABLE = "開啟多玩資訊條";
	CHOCOLATEBAR_OPTION = "更多配置";
	CHOCOLATEBAR_NAME	= "信息条面版";
	iCPU_ENABLE = 'iCPU 开启';
	iGear_ENABLE = 'iGear 开启';
	iMail_ENABLE = 'iMail 开启';
	iGuild_ENABLE = 'iGuild 开启';
	iReputation_ENABLE = 'iReputation 开启';
else
	CHOCOLATEBAR_TITLE	= "多玩信息条";
	CHOCOLATEBAR_ENABLE = "开启多玩信息条";
	CHOCOLATEBAR_OPTION = "更多配置";
	CHOCOLATEBAR_NAME	= "信息条面板";
	iCPU_ENABLE = 'iCPU 开启';
	iGear_ENABLE = 'iGear 开启';
	iMail_ENABLE = 'iMail 开启';
	iGuild_ENABLE = 'iGuild 开启';
	iReputation_ENABLE = 'iReputation 开启';
end

if (dwIsConfigurableAddOn("ChocolateBar")) then
	dwRegisterMod(
		"CHOCOLATEBAR",
		CHOCOLATEBAR_TITLE,
		"ChocolateBar",
		"",
		"Interface\\ICONS\\INV_Misc_Ticket_Tarot_Maelstrom_01",		
		nil
	);
	
	dwRegisterCheckButton(
		"CHOCOLATEBAR",
		CHOCOLATEBAR_ENABLE,
		DUOWAN_RELOAD_DESC,
		"enable",
		1,
		function (arg)		
			if (arg == 1) then
				if (not dwIsAddOnLoaded("ChocolateBar")) then
					dwLoadAddOn("ChocolateBar");
				end
			else
				if (dwIsAddOnLoaded("ChocolateBar")) then
					dwRequestReloadUI();
				end				
			end
		end
	);

	dwRegisterButton(
		"CHOCOLATEBAR",
		CHOCOLATEBAR_OPTION, 
		function()
			if (dwIsAddOnLoaded("ChocolateBar")) then
				LibStub("AceConfigDialog-3.0"):Open("ChocolateBar")
			end
		end, 
		1
	);
	
	if (dwIsConfigurableAddOn("iCPU")) then
		dwRegisterCheckButton(
			"CHOCOLATEBAR",
			iCPU_ENABLE,
			DUOWAN_RELOAD_DESC,
			"iCPU",
			1,
			function (arg)		
				if (arg == 1) then
					if (not dwIsAddOnLoaded("iCPU")) then
						dwLoadAddOn("iCPU");
					end
				else
					if (dwIsAddOnLoaded("iCPU")) then
						dwRequestReloadUI();
					end				
				end
			end
		);
	end
	
	if (dwIsConfigurableAddOn("iGear")) then
		dwRegisterCheckButton(
			"CHOCOLATEBAR",
			iGear_ENABLE,
			DUOWAN_RELOAD_DESC,
			"iGear",
			1,
			function (arg)		
				if (arg == 1) then
					if (not dwIsAddOnLoaded("iGear")) then
						dwLoadAddOn("iGear");
					end
				else
					if (dwIsAddOnLoaded("iGear")) then
						dwRequestReloadUI();
					end				
				end
			end
		);
	end
	
	if (dwIsConfigurableAddOn("iMail")) then
		dwRegisterCheckButton(
			"CHOCOLATEBAR",
			iMail_ENABLE,
			DUOWAN_RELOAD_DESC,
			"iMail",
			1,
			function (arg)		
				if (arg == 1) then
					if (not dwIsAddOnLoaded("iMail")) then
						dwLoadAddOn("iMail");
					end
				else
					if (dwIsAddOnLoaded("iMail")) then
						dwRequestReloadUI();
					end				
				end
			end
		);
	end
	
	if (dwIsConfigurableAddOn("iGuild")) then
		dwRegisterCheckButton(
			"CHOCOLATEBAR",
			iGuild_ENABLE,
			DUOWAN_RELOAD_DESC,
			"iGuild",
			1,
			function (arg)		
				if (arg == 1) then
					if (not dwIsAddOnLoaded("iGuild")) then
						dwLoadAddOn("iGuild");
					end
				else
					if (dwIsAddOnLoaded("iGuild")) then
						dwRequestReloadUI();
					end				
				end
			end
		);
	end

	if (dwIsConfigurableAddOn("iReputation")) then
		dwRegisterCheckButton(
			"CHOCOLATEBAR",
			iReputation_ENABLE,
			DUOWAN_RELOAD_DESC,
			"iReputation",
			1,
			function (arg)		
				if (arg == 1) then
					if (not dwIsAddOnLoaded("iReputation")) then
						dwLoadAddOn("iReputation");
					end
				else
					if (dwIsAddOnLoaded("iReputation")) then
						dwRequestReloadUI();
					end				
				end
			end
		);
	end
end