-- loot assignment fix
-- there is a bug in LootHistoryDropDown. The playerId in this frame is not updated during rolls.
-- then it assigns loot to the wrong person.

local orgLootHistoryPlayerFrameOnClick = LootHistoryPlayerFrame_OnClick
function LootHistoryPlayerFrame_OnClick(self, button)
    if ( C_LootHistory.CanMasterLoot(self.itemIdx, self.playerIdx) ) then
        LootHistoryDropDown.playerName = C_LootHistory.GetPlayerInfo(self.itemIdx, self.playerIdx)
    end

    return orgLootHistoryPlayerFrameOnClick(self, button)
end

local orgLootHistoryFrameUpdatePlayerFrames = LootHistoryFrame_UpdatePlayerFrames
function LootHistoryFrame_UpdatePlayerFrames(self, itemIdx)

    if LootHistoryDropDown.playerIdx and LootHistoryDropDown.itemIdx and LootHistoryDropDown.itemIdx == itemIdx then
        local name = C_LootHistory.GetPlayerInfo(itemIdx, LootHistoryDropDown.playerIdx)
        if name ~= LootHistoryDropDown.playerName then
            -- error case with wrong playerId in Dropdown

            local _, _, numPlayers = C_LootHistory.GetItem(itemIdx);
            for i=1,numPlayers do
                name = C_LootHistory.GetPlayerInfo(itemIdx, i)
                if name == LootHistoryDropDown.playerName then
                    LootHistoryDropDown.playerIdx = i;
                    break
                end
            end
        end
    end

    return orgLootHistoryFrameUpdatePlayerFrames(self, itemIdx)
end
