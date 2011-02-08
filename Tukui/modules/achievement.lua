-- Fix for achievement and dungeon frames
function AchievementAlertFrame_FixAnchors()
    if (not AchievementAlertFrame1) then return end
    
    AchievementAlertFrame1:ClearAllPoints();
    AchievementAlertFrame1:SetPoint("TOP", UIParent, "TOP", 0, -175)
end

function DungeonCompletionAlertFrame_FixAnchors()
	if (not DungeonCompletionAlertFrame1) then return end
	
	DungeonCompletionAlertFrame1:ClearAllPoints();
	DungeonCompletionAlertFrame1:SetPoint("TOP", AchievementAlertFrame1, "BOTTOM", 0, -20)
end

WorldStateAlwaysUpFrame:ClearAllPoints()
WorldStateAlwaysUpFrame:SetPoint("TOP", UIParent, "TOP", 0, TukuiDB.Scale(-45))