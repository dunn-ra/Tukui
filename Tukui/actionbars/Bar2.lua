if not TukuiCF["actionbar"].enable == true then return end

---------------------------------------------------------------------------
-- setup MultiBarBottomLeft as bar #2
---------------------------------------------------------------------------

local TukuiBar2 = CreateFrame("Frame","TukuiBar2",UIParent)
TukuiBar2:SetAllPoints(TukuiActionBarBackground)
MultiBarBottomLeft:SetParent(TukuiBar2)

for i=1, 12 do
	local b = _G["MultiBarBottomLeftButton"..i]
	local b2 = _G["MultiBarBottomLeftButton"..i-1]
	b:SetSize(TukuiDB.buttonsize, TukuiDB.buttonsize)
	b:ClearAllPoints()
	if i == 1 then
		b:SetPoint("LEFT", ActionButton12, "RIGHT", TukuiDB.Scale(5), 0)
	else
		b:SetPoint("LEFT", b2, "RIGHT", TukuiDB.buttonspacing, 0)
	end
end

-- remove 4 buttons on low reso to fit bottom bar.
if TukuiDB.lowversion then
	MultiBarBottomLeftButton11:SetAlpha(0)
	MultiBarBottomLeftButton11:SetScale(0.0001)
	MultiBarBottomLeftButton12:SetAlpha(0)
	MultiBarBottomLeftButton12:SetScale(0.0001)
end