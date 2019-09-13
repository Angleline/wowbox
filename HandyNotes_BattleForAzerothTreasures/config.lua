local myname, ns = ...

ns.defaults = {
    profile = {
        show_on_world = true,
        show_on_minimap = false,
        show_junk = false,
        show_npcs = true,
        show_treasure = true,
        found = false,
        repeatable = true,
        icon_scale = 0.9,
        icon_alpha = 0.9,
        icon_item = false,
        tooltip_item = true,
        tooltip_questid = false,
    },
    char = {
        hidden = {
            ['*'] = {},
        },
    },
}


local L = {}
if GetLocale() == 'zhCN' then
	L["Icon settings"] = "图标设置"
	L["These settings control the look and feel of the icon."] = "这些设置将控制图标的外观.";
	L["Icon Scale"] = "图标比例"
	L["Icon Alpha"] = "图标透明度"
	L["Minimap"] = "小地图"
	L["World Map"] = "世界地图"
	L["What to display"] = "显示内容"
	L["Use item icons"] = "使用物品图标"
	L["Show the icons for items, if known; otherwise, the achievement icon will be used"] = "显示已知的物品图标或成就图标"
	L["Use item tooltips"] = "使用物品提示"
	L["Show the full tooltips for items"] = "显示完整的物品提示信息"
    L["Show found"] = "显示已找到的"
    L["Show waypoints for items you've already found?"] = "显示已发现的路径点?"
    L["Show NPCs"] = "显示稀有"
    L["Show rare NPCs to be killed, generally for items or achievements"] = "显示已被击杀过的稀有,通常为物品掉落或成就"
	L["Show treasure"] = "显示宝藏"
	L["Show treasure that can be looted"] = "显示能被拾取的宝藏"
	L["Junk"] = "垃圾"
	L["Show items which don't count for any achievement"] = "显示无任何成就的物品"
	L["Show quest ids"] = "显示任务ID"
	L["Show the internal id of the quest associated with this node. Handy if you want to report a problem with it."] = "显示内置的路径点任务ID,通常为了反馈问题."
	L["Reset hidden nodes"] = "重设隐藏的路径点"
	L["Show all nodes that you manually hid by right-clicking on them and choosing \"hide\"."] = "显示所有的路径点，包括你手工隐藏和关闭的."
elseif GetLocale() == 'zhTW' then
	L["Icon settings"] = "圖示設置"
	L["These settings control the look and feel of the icon."] = "這些設置將控制圖示的外觀.";
	L["Icon Scale"] = "圖示比例"
	L["Icon Alpha"] = "圖示透明度"
	L["Minimap"] = "小地圖"
	L["World Map"] = "世界地圖"
	L["What to display"] = "顯示內容"
	L["Use item icons"] = "使用物品圖示"
	L["Show the icons for items, if known; otherwise, the achievement icon will be used"] = "顯示已知的物品圖示或成就圖示"
	L["Use item tooltips"] = "使用物品提示"
	L["Show the full tooltips for items"] = "顯示完整的物品提示資訊"
    L["Show found"] = "顯示已找到的"
    L["Show waypoints for items you've already found?"] = "顯示已發現的路徑點?"
    L["Show NPCs"] = "顯示稀有"
    L["Show rare NPCs to be killed, generally for items or achievements"] = "顯示已被擊殺過的稀有,通常為物品掉落或成就"
	L["Show treasure"] = "顯示寶藏"
	L["Show treasure that can be looted"] = "顯示能被拾取的寶藏"
	L["Junk"] = "垃圾"
	L["Show items which don't count for any achievement"] = "顯示無任何成就的物品"
	L["Show quest ids"] = "顯示任務ID"
	L["Show the internal id of the quest associated with this node. Handy if you want to report a problem with it."] = "顯示內置的路徑點任務ID,通常為了回饋問題."
	L["Reset hidden nodes"] = "重設隱藏的路徑點"
	L["Show all nodes that you manually hid by right-clicking on them and choosing \"hide\"."] = "顯示所有的路徑點，包括你手工隱藏和關閉的."
else
	L["Icon settings"] = "Icon settings"
	L["These settings control the look and feel of the icon."] = "These settings control the look and feel of the icon.";
	L["Icon Scale"] = "Icon Scale"
	L["Icon Alpha"] = "Icon Alpha"
	L["Minimap"] = "Minimap"
	L["World Map"] = "World Map"
	L["What to display"] = "What to display"
	L["Use item icons"] = "Use item icons"
	L["Show the icons for items, if known; otherwise, the achievement icon will be used"] = "Show the icons for items, if known; otherwise, the achievement icon will be used"
	L["Use item tooltips"] = "Use item tooltips"
	L["Show the full tooltips for items"] = "Show the full tooltips for items"
    L["Show found"] = "Show found"
    L["Show waypoints for items you've already found?"] = "Show waypoints for items you've already found?"
    L["Show NPCs"] = "Show NPCs"
    L["Show rare NPCs to be killed, generally for items or achievements"] = "Show rare NPCs to be killed, generally for items or achievements"
	L["Show treasure"] = "Show treasure"
	L["Show treasure that can be looted"] = "Show treasure that can be looted"
	L["Junk"] = "Junk"
	L["Show items which don't count for any achievement"] = "Show items which don't count for any achievement"
	L["Show quest ids"] = "Show quest ids"
	L["Show the internal id of the quest associated with this node. Handy if you want to report a problem with it."] = "Show the internal id of the quest associated with this node. Handy if you want to report a problem with it."
	L["Reset hidden nodes"] = "Reset hidden nodes"
	L["Show all nodes that you manually hid by right-clicking on them and choosing \"hide\"."] = "Show all nodes that you manually hid by right-clicking on them and choosing \"hide\"."
end

ns.options = {
    type = "group",
    name = myname:gsub("HandyNotes_", ""),
    get = function(info) return ns.db[info[#info]] end,
    set = function(info, v)
        ns.db[info[#info]] = v
        ns.HL:SendMessage("HandyNotes_NotifyUpdate", myname:gsub("HandyNotes_", ""))
    end,
    args = {
        icon = {
            type = "group",
            name = L["Icon settings"],
            inline = true,
            args = {
                desc = {
                    name = L["These settings control the look and feel of the icon."],
                    type = "description",
                    order = 0,
                },
                icon_scale = {
                    type = "range",
                    name = L["Icon Scale"],
                    desc = "The scale of the icons",
                    min = 0.25, max = 2, step = 0.01,
                    order = 20,
                },
                icon_alpha = {
                    type = "range",
                    name = L["Icon Alpha"],
                    desc = "The alpha transparency of the icons",
                    min = 0, max = 1, step = 0.01,
                    order = 30,
                },
                show_on_world = {
                    type = "toggle",
                    name = L["World Map"],
                    desc = "Show icons on world map",
                    order = 40,
                },
                show_on_minimap = {
                    type = "toggle",
                    name = L["Minimap"],
                    desc = "Show icons on the minimap",
                    order = 50,
                },
            },
        },
        display = {
            type = "group",
            name = L["What to display"],
            inline = true,
            args = {
                icon_item = {
                    type = "toggle",
                    name = L["Use item icons"],
                    desc = L["Show the icons for items, if known; otherwise, the achievement icon will be used"],
                    order = 0,
                },
                tooltip_item = {
                    type = "toggle",
                    name = L["Use item tooltips"],
                    desc = L["Show the full tooltips for items"],
                    order = 10,
                },
                found = {
                    type = "toggle",
                    name = L["Show found"],
                    desc = L["Show waypoints for items you've already found?"],
                    order = 20,
                },
                show_npcs = {
                    type = "toggle",
                    name = L["Show NPCs"],
                    desc = L["Show rare NPCs to be killed, generally for items or achievements"],
                    order = 30,
                },
                show_treasure = {
                    type = "toggle",
                    name = L["Show treasure"],
                    desc = L["Show treasure that can be looted"],
                    order = 30,
                },
                show_junk = {
                    type = "toggle",
                    name = L["Junk"],
                    desc = L["Show items which don't count for any achievement"],
                    order = 40,
                },
                -- repeatable = {
                --     type = "toggle",
                --     name = "Show repeatable",
                --     desc = "Show items which are repeatable? This generally means ones which have a daily tracking quest attached",
                --     order = 40,
                -- },
                tooltip_questid = {
                    type = "toggle",
                    name = L["Show quest ids"],
                    desc = L["Show the internal id of the quest associated with this node. Handy if you want to report a problem with it."],
                    order = 40,
                },
                unhide = {
                    type = "execute",
                    name = L["Reset hidden nodes"],
                    desc = L["Show all nodes that you manually hid by right-clicking on them and choosing \"hide\"."],
                    func = function()
                        for map,coords in pairs(ns.hidden) do
                            wipe(coords)
                        end
                        ns.HL:Refresh()
                    end,
                    order = 50,
                },
            },
        },
    },
}

local allQuestsComplete = function(quests)
    if type(quests) == 'table' then
        -- if it's a table, only count as complete if all quests are complete
        for _, quest in ipairs(quests) do
            if not IsQuestFlaggedCompleted(quest) then
                return false
            end
        end
        return true
    elseif IsQuestFlaggedCompleted(quests) then
        return true
    end
end

local playerHasBuff = function(spellid)
    local buffname = GetSpellInfo(spellid)
    for i = 1, 40 do
        local name = UnitBuff("player", i)
        if not name then
            -- reached the end, probably
            return
        end
        if buffname == name then
            return UnitBuff("player",i)
        end
    end
end

local player_faction = UnitFactionGroup("player")
local player_name = UnitName("player")
ns.should_show_point = function(coord, point, currentZone, isMinimap)
    if isMinimap and not ns.db.show_on_minimap and not point.minimap then
        return false
    elseif not isMinimap and not ns.db.show_on_world then
        return false
    end
    if ns.hidden[currentZone] and ns.hidden[currentZone][coord] then
        return false
    end
    if ns.outdoors_only and IsIndoors() then
        return false
    end
    if point.junk and not ns.db.show_junk then
        return false
    end
    if point.faction and point.faction ~= player_faction then
        return false
    end
    if (not ns.db.found) then
        if point.quest then
            if allQuestsComplete(point.quest) then
                return false
            end
        elseif point.achievement then
            local completedByMe = select(13, GetAchievementInfo(point.achievement))
            if completedByMe then
                return false
            end
            if point.criteria then
                local _, _, completed, _, _, completedBy = GetAchievementCriteriaInfoByID(point.achievement, point.criteria)
                if completed and completedBy == player_name then
                    return false
                end
            end
        end
        if point.follower and C_Garrison.IsFollowerCollected(point.follower) then
            return false
        end
        if point.toy and point.item and PlayerHasToy(point.item) then
            return false
        end
    end
    -- if (not ns.db.repeatable) and point.repeatable then
    --     return false
    -- end
    if not point.follower then
        if point.npc then
            if not ns.db.show_npcs then
                return false
            end
        else
            -- Not an NPC, not a follower, must be treasure
            if not ns.db.show_treasure then
                return false
            end
        end
    end
    if point.requires_buff and not playerHasBuff(point.requires_buff) then
        return false
    end
    if point.requires_no_buff and playerHasBuff(point.requires_no_buff) then
        return false
    end
    if point.hide_before and not ns.db.upcoming and not allQuestsComplete(point.hide_before) then
        return false
    end
    return true
end