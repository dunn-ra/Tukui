-- variables
local ui = TukuiCF["uisizes"]

TukuiDB.buttonsize = TukuiDB.Scale(ui.btnsize)
TukuiDB.petbuttonsize = TukuiDB.Scale(ui.petbtnsize)
TukuiDB.buttonspacing = TukuiDB.Scale(5)
TukuiDB.petbuttonspacing = TukuiDB.Scale(5)

-- MAIN ACTIONBAR
local barbg = CreateFrame("Frame", "TukuiActionBarBackground", UIParent)
if TukuiDB.lowversion then
	TukuiDB.CreatePanel(barbg, 1, 1, "BOTTOM", bottompanel, "BOTTOM", (((TukuiDB.buttonsize * 2) + (TukuiDB.buttonspacing * 3)) / 2), TukuiDB.Scale(3))
else
	TukuiDB.CreatePanel(barbg, 1, 1, "BOTTOM", bottompanel, "BOTTOM", 0, TukuiDB.Scale(3))
end
barbg:SetWidth((TukuiDB.buttonsize * 24) + (TukuiDB.buttonspacing * 25))
barbg:SetHeight(TukuiDB.buttonsize + (TukuiDB.buttonspacing * 2))
barbg:SetFrameStrata("BACKGROUND")
barbg:SetFrameLevel(2)
barbg:Hide()

-- INVISIBLE FRAME COVERING TukuiActionBarBackground
local invbarbg = CreateFrame("Frame", "InvTukuiActionBarBackground", UIParent)
invbarbg:SetSize(barbg:GetWidth(), barbg:GetHeight())
invbarbg:SetPoint("BOTTOM", 0, TukuiDB.Scale(14))

-- THIRD ACTIONBAR
if TukuiCF.actionbar.bottomrows == 2 then
	local bar3bg = CreateFrame("Frame", "TukuiActionBar3Background", UIParent)
	TukuiDB.CreatePanel(bar3bg, 1, 1, "BOTTOM", TukuiActionBarBackground, "TOP", 0, TukuiDB.Scale(-6))
	bar3bg:SetWidth((TukuiDB.buttonsize * 12) + (TukuiDB.buttonspacing * 13))
	bar3bg:SetHeight(TukuiDB.buttonsize + (TukuiDB.buttonspacing * 2))
	bar3bg:SetFrameStrata("BACKGROUND")
	bar3bg:SetFrameLevel(2)
	bar3bg:Hide()
end

-- BOTTOM PANEL
local bottompanel = CreateFrame("Frame", "TukuiBottomPanel", UIParent)
TukuiDB.CreateTransPanel(bottompanel, UIParent:GetWidth() + (TukuiDB.mult * 2), 18, "BOTTOMLEFT", UIParent, "BOTTOMLEFT", -TukuiDB.mult, -TukuiDB.mult)
bottompanel:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", TukuiDB.mult, -TukuiDB.mult)
bottompanel:SetFrameLevel(1)
bottompanel:SetFrameStrata("BACKGROUND")

-- RIGHT BAR BACKGROUND
if TukuiCF["actionbar"].enable == true then
	local barbgr = CreateFrame("Frame", "TukuiActionBarBackgroundRight", UIParent)
	TukuiDB.CreatePanel(barbgr, 1, (TukuiDB.buttonsize * 12) + (TukuiDB.buttonspacing * 13), "RIGHT", UIParent, "RIGHT", TukuiDB.Scale(-3), TukuiDB.Scale(-13.5))
	if TukuiCF["actionbar"].rightbars == 1 then
		barbgr:SetWidth(TukuiDB.buttonsize + (TukuiDB.buttonspacing * 1.5))
	elseif TukuiCF["actionbar"].rightbars == 2 then
		barbgr:SetWidth((TukuiDB.buttonsize * 2) + (TukuiDB.buttonspacing * 2.5))
	elseif TukuiCF["actionbar"].rightbars == 3 then
		barbgr:SetWidth((TukuiDB.buttonsize * 3) + (TukuiDB.buttonspacing * 3.5))
	else
		barbgr:Hide()
	end
	barbgr:Hide()
	local petbg = CreateFrame("Frame", "TukuiPetActionBarBackground", UIParent)
	if TukuiCF["actionbar"].rightbars > 0 then
		TukuiDB.CreatePanel(petbg, TukuiDB.petbuttonsize + (TukuiDB.petbuttonspacing * 1.5), (TukuiDB.petbuttonsize * 10) + (TukuiDB.petbuttonspacing * 9), "RIGHT", barbgr, "LEFT", TukuiDB.Scale(1), 0)
	else
		TukuiDB.CreatePanel(petbg, TukuiDB.petbuttonsize + (TukuiDB.petbuttonspacing * 1.5), (TukuiDB.petbuttonsize * 10) + (TukuiDB.petbuttonspacing * 9), "RIGHT", UIParent, "RIGHT", TukuiDB.Scale(-3), TukuiDB.Scale(-13.5))
	end
	petbg:Hide()
end

-- CUBES
if TukuiCF["actionbar"].cubes == true then
	-- LEFT CUBE
	local cubeleft = CreateFrame("Frame", "TukuiCubeLeft", UIParent)
	TukuiDB.CreateTransPanel(cubeleft, 8, 8, "TOPRIGHT", barbg, "TOPLEFT", TukuiDB.Scale(2), TukuiDB.Scale(-5))
	cubeleft:EnableMouse(true)
	cubeleft:SetScript("OnMouseDown", function(self, btn)
	--if TukuiInfoLeftBattleGround and UnitInBattleground("player") then
		if btn == "LeftButton" then
			ToggleFrame(ChatMenu)
		--elseif btn == "RightButton" then
		end
	end)
	-- RIGHT CUBE
	local cuberight = CreateFrame("Frame", "TukuiCubeRight", UIParent)
	if TukuiDB.lowversion then
		TukuiDB.CreateTransPanel(cuberight, 8, 8, "TOPLEFT", barbg, "TOPRIGHT", -((TukuiDB.buttonsize*2)+(TukuiDB.buttonspacing*2)+4), TukuiDB.Scale(-5))
	else
		TukuiDB.CreateTransPanel(cuberight, 8, 8, "TOPLEFT", barbg, "TOPRIGHT", TukuiDB.Scale(-4), TukuiDB.Scale(-5))
	end
	cuberight:EnableMouse(true)
	cuberight:SetScript("OnMouseDown", function(self, btn)
		if btn == "RightButton" then
			if IsAddOnLoaded("Recount") then
				SlashCmdList.ACECONSOLE_RECOUNT('toggle')
			elseif IsAddOnLoaded("Skada") then
				SlashCmdList.ACECONSOLE_SKADA('toggle')
			end
		elseif btn == "LeftButton" then
			if IsAddOnLoaded("Omen") then
				SlashCmdList.ACECONSOLE_OMEN('toggle')
			end
		elseif btn == "MiddleButton" then
			ToggleKeyRing()
		end
	end)
end

-- INFO LEFT (FOR STATS) - INV
local ileft = CreateFrame("Frame", "TukuiInfoLeft", barbg)
TukuiDB.CreatePanel(ileft, TukuiCF["chat"].panelwidth, 20, "LEFT", bottompanel, "TOPLEFT", TukuiDB.Scale(8), TukuiDB.Scale(-5))
ileft:SetFrameLevel(2)
ileft:SetFrameStrata("BACKGROUND")
ileft:Hide()

-- INFO RIGHT (FOR STATS) - INV
local iright = CreateFrame("Frame", "TukuiInfoRight", barbg)
TukuiDB.CreatePanel(iright, TukuiCF["chat"].panelwidth, 20, "RIGHT", bottompanel, "RIGHT", TukuiDB.Scale(-8), TukuiDB.Scale(-5))
iright:SetFrameLevel(1)
iright:SetFrameStrata("BACKGROUND")
iright:Hide()

-- MINIMAP DATA PANELS
if TukuiMinimap and TukuiCF["datatext"].minimapstats == true then
	local minimapstatsleft = CreateFrame("Frame", "TukuiMinimapStatsLeft", TukuiMinimap)
	local minimapstatsright = CreateFrame("Frame", "TukuiMinimapStatsRight", TukuiMinimap)
	
	if TukuiCF["actionbar"].translucid ~= true then
		TukuiDB.CreatePanel(minimapstatsleft, ((TukuiMinimap:GetWidth() + 4) / 2) - 1, 19, "TOPLEFT", TukuiMinimap, "BOTTOMLEFT", 0, TukuiDB.Scale(-2))
		TukuiDB.CreatePanel(minimapstatsright, ((TukuiMinimap:GetWidth() + 4) / 2) - 1, 19, "TOPRIGHT", TukuiMinimap, "BOTTOMRIGHT", 0, TukuiDB.Scale(-2))
	else
		TukuiDB.CreateTransPanel(minimapstatsleft, ((TukuiMinimap:GetWidth() / 2) - 1), 17, "TOPLEFT", TukuiMinimap, "BOTTOMLEFT", 0, TukuiDB.Scale(-1))
		TukuiDB.CreateTransPanel(minimapstatsright, ((TukuiMinimap:GetWidth() / 2) - 2), 17, "TOPRIGHT", TukuiMinimap, "BOTTOMRIGHT", 0, TukuiDB.Scale(-1))
	end
end

--[[BATTLEGROUND STATS FRAME
if TukuiCF["datatext"].battleground == true then
	local bgframe = CreateFrame("Frame", "TukuiBottomPanel", UIParent)
	TukuiDB.CreatePanel(bgframe, 1, 1, "TOPLEFT", UIParent, "BOTTOMLEFT", 0, 0)
	bgframe:SetAllPoints(ileft)
	bgframe:SetFrameStrata("LOW")
	bgframe:SetFrameLevel(0)
	bgframe:EnableMouse(true)
end--]]

-- CHAT BACKGROUND
if TukuiCF["chat"].enable == true and TukuiCF["chat"].background == true then
	local chatbg = CreateFrame("Frame", "Chatbg", UIParent)
	TukuiDB.CreateTransPanel(chatbg, TukuiCF["chat"].panelwidth, 0, "BOTTOMLEFT", UIParent, 0, 0)
	chatbg:ClearAllPoints()
	chatbg:SetPoint("TOPLEFT", ChatFrame1, "TOPLEFT", -3, 2)
	chatbg:SetPoint("BOTTOMRIGHT", ChatFrame1, "BOTTOMRIGHT", 2, -4)
	chatbg:SetFrameStrata("BACKGROUND")
	chatbg:SetAlpha(.7)
end