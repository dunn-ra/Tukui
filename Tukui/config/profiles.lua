local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

-- Character class
if T.myclass == "PRIEST" then
	-- C["unitframes"].enable = false
end

-- Character name
if T.myname == "Cyrosh" then
	-- C["unitframes"].enable = false
end

-- Character level
if T.level < 85 then
	-- C["unitframes"].enable = false
end

-- credits dajova
local TelUI_AddonSkins = CreateFrame("Frame")
TelUI_AddonSkins:RegisterEvent("ADDON_LOADED")
TelUI_AddonSkins:SetScript("OnEvent", function(self, event, addon)
	if not addon == "TelUI_AddonSkins" then return end

	CustomSkin = { }

	CustomSkin.normTexture = C["media"].normTex
	CustomSkin.bgTexture = C["media"].blank
	CustomSkin.font = C["media"].font
	CustomSkin.fontSize = 12
	CustomSkin.fontFlags = "OUTLINE"
	CustomSkin.buttonSize = T.buttonsize
	CustomSkin.buttonSpacing = T.buttonspacing
	CustomSkin.borderWidth = T.Scale(2)
	CustomSkin.buttonZoom = { .08, .92, .08, .92 }
	CustomSkin.barSpacing = 1
	CustomSkin.barHeight = 17

	function CustomSkin:SkinBackgroundFrame(frame)
		self:SkinFrame(frame)
		frame:SetTemplate("Default")
		frame:CreateShadow("Default")
	end

	self:UnregisterEvent("ADDON_LOADED")
end)