local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

if IsAddOnLoaded("SmellyPowerBar") then return end

-- Get rid of old Alt Power Bar
PlayerPowerBarAlt:UnregisterEvent("UNIT_POWER_BAR_SHOW")
PlayerPowerBarAlt:UnregisterEvent("UNIT_POWER_BAR_HIDE")
PlayerPowerBarAlt:UnregisterEvent("PLAYER_ENTERING_WORLD")
	
--Create the new bar
local AltPowerBar = CreateFrame("Frame", "TukuiAltPowerBar", TukuiMiddlePanel)
AltPowerBar:SetAllPoints()
AltPowerBar:SetFrameStrata("LOW")
AltPowerBar:SetFrameLevel(0)
AltPowerBar:EnableMouse(true)
AltPowerBar:SetTemplate("Panels")

-- Create Status Bar and Text
local AltPowerBarStatus = CreateFrame("StatusBar", "TukuiAltPowerBarStatus", AltPowerBar)
AltPowerBarStatus:SetFrameLevel(AltPowerBar:GetFrameLevel() + 1)
AltPowerBarStatus:SetStatusBarTexture(C.media.normTex)
AltPowerBarStatus:SetMinMaxValues(0, 100)
AltPowerBarStatus:Point("TOPLEFT", TukuiMiddlePanel, "TOPLEFT", 0, 0)
AltPowerBarStatus:Point("BOTTOMRIGHT", TukuiMiddlePanel, "BOTTOMRIGHT", 0, 0)
AltPowerBarStatus:SetStatusBarColor(75/255, 175/255, 76/255)

local AltPowerText = AltPowerBarStatus:CreateFontString(nil, "OVERLAY")
AltPowerText:SetFont(C.media.font, 11)
AltPowerText:Point("CENTER", AltPowerBar, "CENTER", 0, 0)

--Event handling
AltPowerBar:RegisterEvent("UNIT_POWER")
AltPowerBar:RegisterEvent("UNIT_POWER_BAR_SHOW")
AltPowerBar:RegisterEvent("UNIT_POWER_BAR_HIDE")
AltPowerBar:RegisterEvent("PLAYER_ENTERING_WORLD")
AltPowerBar:SetScript("OnEvent", function(self)
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	if UnitAlternatePowerInfo("player") then
		self:Show()
	else
		self:Hide()
	end
end)

-- Update Functions
local TimeSinceLastUpdate = 1
AltPowerBarStatus:SetScript("OnUpdate", function(self, elapsed)
	if not AltPowerBar:IsShown() then return end
	TimeSinceLastUpdate = TimeSinceLastUpdate + elapsed
	
	if (TimeSinceLastUpdate >= 1) then
		self:SetMinMaxValues(0, UnitPowerMax("player", ALTERNATE_POWER_INDEX))
		local power = UnitPower("player", ALTERNATE_POWER_INDEX)
		local mpower = UnitPowerMax("player", ALTERNATE_POWER_INDEX)
		self:SetValue(power)
		AltPowerText:SetText(power.."/"..mpower)
		self.TimeSinceLastUpdate = 0
	end
end)