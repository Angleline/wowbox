-- ResizeButton and DragButton are behind the scrollframe since 7.0
LootHistoryFrame:HookScript("OnShow", function(self)
    self.DragButton:SetFrameLevel(9999)
    self.ResizeButton:SetFrameLevel(9999)
end)
