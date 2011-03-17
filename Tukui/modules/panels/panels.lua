local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales
local pheight = C.datatext.panelsize
local pwidth = 75

local TukuiBar1 = CreateFrame("Frame", "TukuiBar1", UIParent, "SecureHandlerStateTemplate")
TukuiBar1:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOM", 0, pheight+1)
TukuiBar1:SetWidth((T.buttonsize * 12) + (T.buttonspacing * 11))
TukuiBar1:SetHeight((T.buttonsize) + (T.buttonspacing))
TukuiBar1:SetFrameStrata("BACKGROUND")
TukuiBar1:SetFrameLevel(1)

local TukuiBar2 = CreateFrame("Frame", "TukuiBar2", UIParent)
TukuiBar2:SetPoint("BOTTOMLEFT", TukuiBar1, "BOTTOMRIGHT", T.buttonspacing, 0)
TukuiBar2:SetWidth((T.buttonsize * 12) + (T.buttonspacing * 12))
TukuiBar2:SetHeight((T.buttonsize) + (T.buttonspacing))
TukuiBar2:SetFrameStrata("BACKGROUND")
TukuiBar2:SetFrameLevel(2)

local TukuiBar3 = CreateFrame("Frame", "TukuiBar3", UIParent)
TukuiBar3:SetPoint("BOTTOMLEFT", TukuiBar1, "TOPRIGHT", -((T.buttonsize * 6) + (T.buttonspacing * 5)), 0)
TukuiBar3:SetWidth((T.buttonsize * 12) + (T.buttonspacing * 11))
TukuiBar3:SetHeight((T.buttonsize) + (T.buttonspacing))
TukuiBar3:SetFrameStrata("BACKGROUND")
TukuiBar3:SetFrameLevel(2)
--TukuiBar3:SetAlpha(0)

local TukuiBar4 = CreateFrame("Frame", "TukuiBar4", UIParent)
TukuiBar4:SetPoint("RIGHT", UIParent, "RIGHT", -20, 0)
TukuiBar4:SetWidth(T.buttonsize)
TukuiBar4:SetHeight((T.buttonsize * 12) + (T.buttonspacing * 11))
TukuiBar4:SetFrameStrata("BACKGROUND")
TukuiBar4:SetFrameLevel(2)
TukuiBar4:SetAlpha(0)

local TukuiBar5 = CreateFrame("Frame", "TukuiBar5", UIParent)
TukuiBar5:SetPoint("TOPRIGHT", TukuiBar4, "TOPLEFT", 0,T.buttonspacing*2)
TukuiBar5:SetWidth(T.buttonsize)
TukuiBar5:SetHeight((T.buttonsize * 12) + (T.buttonspacing * 11))
TukuiBar5:SetFrameStrata("BACKGROUND")
TukuiBar5:SetFrameLevel(2)
TukuiBar5:SetAlpha(0)

local petbg = CreateFrame("Frame", "TukuiPetBar", UIParent, "SecureHandlerStateTemplate")
petbg:SetPoint("RIGHT", TukuiBar5, "LEFT", -T.petbuttonsize, 0)
petbg:SetWidth(T.petbuttonsize+T.petbuttonspacing)
petbg:SetHeight((T.petbuttonsize * 10) + (T.petbuttonspacing * 11))
petbg:SetAlpha(0)
local ltpetbg1 = CreateFrame("Frame", "TukuiLineToPetActionBarBackground", petbg)
ltpetbg1:SetParent(petbg)
ltpetbg1:SetFrameStrata("BACKGROUND")
ltpetbg1:SetFrameLevel(0)
ltpetbg1:SetAlpha(0)

-- INVISIBLE FRAME COVERING BOTTOM ACTIONBARS JUST TO PARENT UF CORRECTLY
local invbarbg = CreateFrame("Frame", "InvTukuiActionBarBackground", UIParent)
invbarbg:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 0)
invbarbg:SetWidth((T.buttonsize * 24) + (T.buttonspacing * 25))
invbarbg:SetHeight(1)

if C["actionbar"].cubes == true then
	-- Left Cube (BG stats, chat menu)
	local cubeleft = CreateFrame("Frame", "TukuiCubeLeft", TukuiBar1)
	cubeleft:CreatePanel("Transparent", 10, 10, "TOPRIGHT", TukuiBar1, "TOPLEFT", 0, 0)
	cubeleft:EnableMouse(true)
	cubeleft:SetScript("OnMouseDown", function(self, btn)
		if TukuiInfoLeftBattleGround and UnitInBattleground("player") then
			if btn == "RightButton" then
				if TukuiInfoLeftBattleGround:IsShown() then
					TukuiInfoLeftBattleGround:Hide()
				else
					TukuiInfoLeftBattleGround:Show()
				end
			end
		end
		if btn == "LeftButton" then	
			ToggleFrame(ChatMenu)
		end
	end)
	-- Right Cube (Recount/skada/Omen toggle, keyring)
	local cuberight = CreateFrame("Frame", "TukuiCubeRight", TukuiBar1)
	cuberight:CreatePanel("Transparent", 10, 10, "TOPLEFT", TukuiBar2, "TOPRIGHT", T.buttonspacing, 0)
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

-- MOVE/HIDE SOME ELEMENTS IF CHAT BACKGROUND IS ENABLED -- placeholder TBR
local movechat = 5
--if C.chat.background then movechat = 10 ileftlv:SetAlpha(0) irightlv:SetAlpha(0) end

-- INFO LEFT (FOR STATS) -- placeholder TBR
local ileft = CreateFrame("Frame", "TukuiInfoLeft", TukuiBar1)
ileft:CreatePanel("Default", T.InfoLeftRightWidth, 23, "LEFT", ltoabl, "LEFT", 14 - movechat, 0)
ileft:SetFrameLevel(2)
ileft:SetFrameStrata("BACKGROUND")
ileft:Hide()

-- INFO RIGHT (FOR STATS) -- placeholder TBR
local iright = CreateFrame("Frame", "TukuiInfoRight", TukuiBar1)
iright:CreatePanel("Default", T.InfoLeftRightWidth, 23, "RIGHT", ltoabr, "RIGHT", -14 + movechat, 0)
iright:SetFrameLevel(2)
iright:SetFrameStrata("BACKGROUND")
iright:Hide()

-- Viewport
local viewport = CreateFrame("Frame", "TukuiViewport", UIParent)
viewport:CreatePanel("Transparent", UIParent:GetWidth() + (T.mult * 2), 8, "BOTTOMLEFT", UIParent, "BOTTOMLEFT", -T.mult, -T.mult)
viewport:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", T.mult, -T.mult)
viewport:SetFrameLevel(1)
viewport:SetFrameStrata("BACKGROUND")

-- Middle panel
local mpanel = CreateFrame("Frame", "TukuiMiddlePanel", UIParent)
mpanel:CreatePanel("Panels", 125, pheight, "BOTTOM", UIParent, "BOTTOM", 0, 2)
mpanel:SetFrameLevel(2)
mpanel:SetFrameStrata("BACKGROUND")

-- Left panels
local l = {}
for i = 1, 4 do
local mpleft = CreateFrame("Frame", "TukuiDatapanelL"..i, UIParent)
	mpleft:CreatePanel("Panels", pwidth, pheight, "RIGHT", TukuiMiddlePanel, "LEFT", -((i-1)*(pwidth+1)+1), 0)
	mpleft:SetFrameLevel(2)
	mpleft:SetFrameStrata("BACKGROUND")
	mpleft = l[i]
end

-- Right panels
local r = {}
for ii = 1, 4 do
local mpright = CreateFrame("Frame", "TukuiDatapanelR"..ii, UIParent)
	mpright:CreatePanel("Panels", pwidth, pheight, "LEFT", TukuiMiddlePanel, "RIGHT", ((ii-1)*(pwidth+1)+1), 0)
	mpright:SetFrameLevel(2)
	mpright:SetFrameStrata("BACKGROUND")
	mpright = r[ii]
end

-- Chat background
if C.chat.background then
	local chatleftbg = CreateFrame("Frame", "TukuiChatBackgroundLeft", TukuiViewport)
	chatleftbg:CreatePanel("Transparent", C.chat.width+12, C.chat.height+12, "BOTTOMLEFT", TukuiViewport, "TOPLEFT", 1, -1)
	
	if C.chat.rightpanel == true then
		local chatrightbg = CreateFrame("Frame", "TukuiChatBackgroundRight", TukuiViewport)
		chatrightbg:CreatePanel("Transparent", C.chat.width+12, C.chat.height+12, "BOTTOMRIGHT", viewport, "TOPRIGHT", -1, -1)
	end
end

-- Battleground stats
if C["datatext"].battleground == true then
	local bgframe = CreateFrame("Frame", "TukuiBattleGround", UIParent)
	bgframe:CreatePanel("Panels", 1, 1, "RIGHT", TukuiMiddlePanel, "LEFT", 0, 0)
	bgframe:ClearAllPoints()
	bgframe:Height(pheight)
	bgframe:Point("TOPLEFT", TukuiDatapanelL4, 0, 0)
	bgframe:Point("BOTTOMRIGHT", TukuiDatapanelL1, 0, 0)
	bgframe:SetFrameStrata("LOW")
	bgframe:SetFrameLevel(0)
	bgframe:EnableMouse(true)
end