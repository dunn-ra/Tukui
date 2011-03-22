local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales
if not C["actionbar"].enable == true then return end

---------------------------------------------------------------------------
-- MultiBarBottomLeft as Bottom Left Side Bar #2
---------------------------------------------------------------------------

local bar = TukuiBar2
MultiBarBottomLeft:SetParent(bar)


for i = 1, 12 do
	local b = _G["MultiBarBottomLeftButton"..i]
	local b2 = _G["MultiBarBottomLeftButton"..i-1]
	b:SetSize(T.buttonsize, T.buttonsize)
	b:ClearAllPoints()
	b:SetFrameStrata("BACKGROUND")
	b:SetFrameLevel(15)
	
	if i == 1 then
		b:SetPoint("BOTTOMLEFT", bar, T.buttonspacing, T.buttonspacing)
	else
		b:SetPoint("LEFT", b2, "RIGHT", T.buttonspacing, 0)
	end
end

-- remove 4 buttons on low reso to fit bottom bar.
if T.lowversion then
	MultiBarBottomLeftButton11:SetAlpha(0)
	MultiBarBottomLeftButton11:SetScale(0.0001)
	MultiBarBottomLeftButton12:SetAlpha(0)
	MultiBarBottomLeftButton12:SetScale(0.0001)
end