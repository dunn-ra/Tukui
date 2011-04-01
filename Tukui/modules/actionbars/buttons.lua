local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales
-- This is the file for our action bars settings in game via mouseover buttons around action bars.

local bs = (T.buttonsize*3)+(T.buttonspacing*2)

local function ShowOrHideBar(bar, button)
	local db = TukuiDataPerChar
	if bar:IsShown() then
		bar:Hide()
	else
		bar:Show()
	end
end

local function MoveButtonBar(button, bar)
	local db = TukuiDataPerChar
	
	if button == TukuiBar3Button then
		if bar:IsShown() then
			db.hidebar3 = false
			button:ClearAllPoints()
			button:Point("BOTTOM", TukuiBar3, "TOP", T.buttonspacing, 2)
			button:SetBackdropBorderColor(.86,.07,.23)
			button.text:Point("CENTER", 0, T.Scale(3))
			button.text:SetText("|cffDC143C-|r")
		else
			db.hidebar3 = true
			button:ClearAllPoints()
			if T.lowversion then
				button:Point("BOTTOMLEFT", TukuiBar1, "TOPRIGHT", -((T.buttonsize*5)+(T.buttonspacing*2)), 2)
			else
				button:Point("BOTTOMLEFT", TukuiBar1, "TOPRIGHT", -((T.buttonsize*3)+T.buttonspacing), 2)
			end
			button:SetBackdropBorderColor(.4,.80,0)
			button.text:Point("CENTER", 0, T.Scale(1))
			button.text:SetText("|cff66CD00+|r")
		end
	end
	
	if button == TukuiBar5Button then
		if bar:IsShown() then
			db.hidebar5 = false
			TukuiBar4Button:Hide()
			button:ClearAllPoints()
			button:Height(bs*2)
			button:Point("RIGHT", UIParent, "RIGHT", -1, T.buttonspacing)
			button:SetBackdropBorderColor(.86,.07,.23)
			button.text:SetText("|cffDC143C-|r")
			TukuiPetBar:SetPoint("RIGHT", TukuiBar5, "LEFT", -T.petbuttonsize, 0)
		else
			db.hidebar5 = true -- DONE!
			TukuiBar4Button:Show()
			button:ClearAllPoints()
			button:Height(bs)
			button:Point("BOTTOMRIGHT", UIParent, "RIGHT", -1, T.buttonspacing)
			button:SetBackdropBorderColor(.4,.80,0)
			button.text:Point("CENTER", T.Scale(1), T.Scale(1))
			button.text:SetText("|cff66CD00+|r")
			button:Show()
			TukuiPetBar:SetPoint("RIGHT", TukuiBar4, "LEFT", -T.petbuttonsize/2, 0)
		end
	end
	
	if button == TukuiBar4Button then
		if bar:IsShown() then
			db.hidebar4 = false
			button:ClearAllPoints()
			button:Height(bs)
			button:Point("TOPRIGHT", UIParent, "RIGHT", -1, 0)
			button:SetBackdropBorderColor(.86,.07,.23)
			button.text:SetText("|cffDC143C-|r")
			TukuiBar5Button:Show()
			TukuiPetBar:SetPoint("RIGHT", TukuiBar4, "LEFT", -T.petbuttonsize/2, 0)
		else
			db.hidebar4 = true
			TukuiBar5Button:Hide()
			button:ClearAllPoints()
			button:Height(bs*2)
			button:Point("RIGHT", UIParent, "RIGHT", -1, T.buttonspacing)
			button:SetBackdropBorderColor(.4,.80,0)
			button.text:Point("CENTER", T.Scale(1), T.Scale(1))
			button.text:SetText("|cff66CD00+|r")
			TukuiPetBar:SetPoint("RIGHT", UIParent, "RIGHT", -T.petbuttonsize/2, 0)
		end
	end
end

local function DrPepper(self, bar) -- guess what! :P
	-- yep, you cannot drink DrPepper while in combat. :(
	if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end
	
	local button = self
	
	ShowOrHideBar(bar, button)
	MoveButtonBar(button, bar)
end

local TukuiBar3Button = CreateFrame("Button", "TukuiBar3Button", UIParent)
TukuiBar3Button:Width(bs*2)
TukuiBar3Button:Height(12)
TukuiBar3Button:Point("BOTTOM", TukuiBar3, "TOP", T.buttonspacing, 2)
TukuiBar3Button:SetTemplate("Panels")
TukuiBar3Button:RegisterForClicks("AnyUp")
TukuiBar3Button:SetAlpha(0)
TukuiBar3Button:SetBackdropBorderColor(.86,.07,.23)
TukuiBar3Button:SetScript("OnClick", function(self) DrPepper(self, TukuiBar3) end)
TukuiBar3Button:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
TukuiBar3Button:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
TukuiBar3Button.text = T.SetFontString(TukuiBar3Button, C.media.uffont, 20)
TukuiBar3Button.text:Point("CENTER", 0, T.Scale(3))
TukuiBar3Button.text:SetText("|cffDC143C-|r")

local TukuiBar4Button = CreateFrame("Button", "TukuiBar4Button", UIParent) -- DONE!
TukuiBar4Button:Width(12)
TukuiBar4Button:Height(bs)
TukuiBar4Button:Point("TOPRIGHT", UIParent, "RIGHT", -1, 0)
TukuiBar4Button:SetTemplate("Panels")
TukuiBar4Button:RegisterForClicks("AnyUp")
TukuiBar4Button:SetAlpha(0)
TukuiBar4Button:SetBackdropBorderColor(.86,.07,.23)
TukuiBar4Button:SetScript("OnClick", function(self) DrPepper(self, TukuiBar4) end)
TukuiBar4Button:SetScript("OnEnter", function(self) self:SetAlpha(1) TukuiBar5Button:SetAlpha(1) end)
TukuiBar4Button:SetScript("OnLeave", function(self) self:SetAlpha(0) TukuiBar5Button:SetAlpha(0) end)
TukuiBar4Button.text = T.SetFontString(TukuiBar4Button, C.media.uffont, 20)
TukuiBar4Button.text:Point("CENTER", 0, T.Scale(1))
TukuiBar4Button.text:SetText("|cffDC143C-|r")

local TukuiBar5Button = CreateFrame("Button", "TukuiBar5Button", UIParent)
TukuiBar5Button:Width(12)
TukuiBar5Button:Height(bs*2)
TukuiBar5Button:Point("RIGHT", UIParent, "RIGHT", -1, T.buttonspacing)
TukuiBar5Button:SetTemplate("Panels")
TukuiBar5Button:RegisterForClicks("AnyUp")
TukuiBar5Button:SetAlpha(0)
TukuiBar4Button:Hide()
TukuiBar5Button:SetBackdropBorderColor(.86,.07,.23)
TukuiBar5Button:SetScript("OnClick", function(self) DrPepper(self, TukuiBar5) end)
TukuiBar5Button:SetScript("OnEnter", function(self) self:SetAlpha(1) TukuiBar4Button:SetAlpha(1) end)
TukuiBar5Button:SetScript("OnLeave", function(self) self:SetAlpha(0) TukuiBar4Button:SetAlpha(0) end)
TukuiBar5Button.text = T.SetFontString(TukuiBar5Button, C.media.uffont, 20)
TukuiBar5Button.text:Point("CENTER", 0, T.Scale(1))
TukuiBar5Button.text:SetText("|cffDC143C-|r")

-- exit vehicle button on left side of bottom action bar
local vehicleleft = CreateFrame("Button", "TukuiExitVehicleButtonLeft", UIParent, "SecureHandlerClickTemplate")
vehicleleft:SetAllPoints(TukuiBar3Button)
vehicleleft:SetFrameStrata(TukuiBar3Button:GetFrameStrata())
vehicleleft:SetFrameLevel(TukuiBar3Button:GetFrameLevel() + 1)
vehicleleft:SetTemplate("Default")
vehicleleft:SetBackdropBorderColor(.86,.07,.23)
vehicleleft:RegisterForClicks("AnyUp")
vehicleleft:SetScript("OnClick", function() VehicleExit() end)
vehicleleft.text = T.SetFontString(vehicleleft, C.media.uffont, 20)
vehicleleft.text:SetPoint("CENTER", 0, T.Scale(3))
vehicleleft.text:SetText("|cffDC143C-|r")
RegisterStateDriver(vehicleleft, "visibility", "[target=vehicle,exists] show;hide")

--------------------------------------------------------------
-- DrPepper taste is really good with Vodka. 
--------------------------------------------------------------

local init = CreateFrame("Frame")
init:RegisterEvent("VARIABLES_LOADED")
init:SetScript("OnEvent", function(self, event)
	if not TukuiDataPerChar then TukuiDataPerChar = {} end
	local db = TukuiDataPerChar
	
	if db.hidebar3 then
		DrPepper(TukuiBar3Button, TukuiBar3)
	end
	if db.hidebar5 then
		DrPepper(TukuiBar5Button, TukuiBar5)
	end
	if db.hidebar4 then
		DrPepper(TukuiBar4Button, TukuiBar4)
	end
end)