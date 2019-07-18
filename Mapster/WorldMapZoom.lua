
local f = CreateFrame ("frame", "FixWorldMapZoomFrame", UIParent)
f:RegisterEvent ("ADDON_LOADED")

local GetCursorPosition = GetCursorPosition
local hooksecurefunc = hooksecurefunc
local GetCurrentMapContinent = GetCurrentMapContinent

f:SetScript ("OnEvent", function (self, event, addonName)

	if (event == "ADDON_LOADED" and addonName == "WorldMapZoom") then
	
		--WorldMapFrame_OnHide
--		WorldMapFrame:HookScript ("OnHide", function()
		--	print (WorldMapScrollFrame.zoomedIn)
--		end)
		
		--install the fix
		
--		WorldMapScrollFrame:RegisterForDrag("LeftButton");
--		WorldMapScrollFrame:SetScript ("OnMouseDown", function()
--			print ("drag started")
--		end)
--		WorldMapFrame:HookScript ("OnMouseDown", function()
--			print ("drag started 2")
--		end)
		
		--

		WorldMapScrollFrame:HookScript ("OnMouseWheel", function()
			--if (InCombatLockdown() or UnitAffectingCombat ("player")) then
			--	return
			--end
			
			local HScroll = WorldMapScrollFrame:GetHorizontalScroll()
			local VScroll = WorldMapScrollFrame:GetVerticalScroll()

			if (MantainWorldMapZoomH ~= HScroll or MantainWorldMapZoomV ~= VScroll) then
				MantainWorldMapZoomMouseX, MantainWorldMapZoomMouseY = GetCursorPosition()
			end
			MantainWorldMapZoomH = HScroll
			MantainWorldMapZoomV = VScroll
			MantainWorldMapZoomScale = WorldMapDetailFrame:GetScale();
		end)
		
		local MAX_ZOOM = 1.4950;
		
		hooksecurefunc ("ToggleWorldMap", function()

			if (InCombatLockdown() or UnitAffectingCombat ("player")) then
				return
			end
		
			if (WorldMapFrame:IsShown()) then
			
				if ((MantainWorldMapZoomV and MantainWorldMapZoomH) and (MantainWorldMapZoomH ~= 0 or MantainWorldMapZoomV ~= 0)) then

					local last_opened = MantainWorldMapZoomLastOpened or time()
					MantainWorldMapZoomLastOpened = time()
					
					if (last_opened+120 < time()) then
						WorldMapScrollFrame_ResetZoom()
						MantainWorldMapZoomMouseX, MantainWorldMapZoomMouseY = nil, nil
						MantainWorldMapZoomH = nil
						MantainWorldMapZoomV = nil
						MantainWorldMapZoomScale = nil
						return
					end
				
					local scrollFrame = WorldMapScrollFrame;
					local oldScrollH = MantainWorldMapZoomH
					local oldScrollV = MantainWorldMapZoomV
					
					-- get the mouse position on the frame, with 0,0 at top left
					local cursorX, cursorY = MantainWorldMapZoomMouseX, MantainWorldMapZoomMouseY
					local relativeFrame;
					if ( WorldMapFrame_InWindowedMode() ) then
						relativeFrame = UIParent;
					else
						relativeFrame = WorldMapFrame;
					end
					local frameX = cursorX / relativeFrame:GetScale() - scrollFrame:GetLeft();
					local frameY = scrollFrame:GetTop() - cursorY / relativeFrame:GetScale();
					
					local oldScale = WorldMapDetailFrame:GetScale();
					--local newScale = oldScale + delta * 0.3;
					local newScale = MantainWorldMapZoomScale
					newScale = max(WORLDMAP_SETTINGS.size, newScale); 
					newScale = min(MAX_ZOOM, newScale);
					WorldMapDetailFrame:SetScale(newScale);
					QUEST_POI_FRAME_WIDTH = WorldMapDetailFrame:GetWidth() * newScale;
					QUEST_POI_FRAME_HEIGHT = WorldMapDetailFrame:GetHeight() * newScale;

					scrollFrame.maxX = QUEST_POI_FRAME_WIDTH - 1002 * WORLDMAP_SETTINGS.size;
					scrollFrame.maxY = QUEST_POI_FRAME_HEIGHT - 668 * WORLDMAP_SETTINGS.size;
					scrollFrame.zoomedIn = abs(WorldMapDetailFrame:GetScale() - WORLDMAP_SETTINGS.size) > 0.05;
					scrollFrame.continent = GetCurrentMapContinent();
					scrollFrame.mapID = GetCurrentMapAreaID();

					-- figure out new scroll values
					local scaleChange = newScale / oldScale;
					local newScrollH = scaleChange * ( frameX + oldScrollH ) - frameX;
					local newScrollV = scaleChange * ( frameY + oldScrollV ) - frameY;
					-- clamp scroll values
					newScrollH = min(newScrollH, scrollFrame.maxX);
					newScrollH = max(0, newScrollH);
					newScrollV = min(newScrollV, scrollFrame.maxY);
					newScrollV = max(0, newScrollV);
					
					-- set scroll values
					if (not InCombatLockdown() and not UnitAffectingCombat ("player")) then
						scrollFrame:SetHorizontalScroll(oldScrollH);
						scrollFrame:SetVerticalScroll(oldScrollV);
	
						WorldMapFrame_Update();
						WorldMapBlobFrame_DelayedUpdateBlobs();
						
						WorldMapFrame_CalculateHitTranslations (WorldMapBlobFrame)

						WorldMapScrollFrame_OnMouseWheel (WorldMapScrollFrame, 1)
						WorldMapScrollFrame_ReanchorQuestPOIs();
					end
					
				end
			else
				MantainWorldMapZoomLastOpened = time()
			end
		end)
		
	end
end)

