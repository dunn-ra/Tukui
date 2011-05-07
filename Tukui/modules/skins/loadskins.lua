--[[
	File version v91.109
	(C)2010 Darth Android / Telroth-The Venture Co.
]]

-- Don't run if TelUI is loaded, or TukUI isn't.
local T, C, L = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales
if IsAddOnLoaded("TelUI") or Mod_AddonSkins or not IsAddOnLoaded("Tukui") then return end

local TukVer = tonumber(T.version)

Mod_AddonSkins = CreateFrame("Frame")
local Mod_AddonSkins = Mod_AddonSkins

function Mod_AddonSkins:SkinFrame(frame)
	frame:SetTemplate("Default")
	frame:CreateShadow("Default")
end

function Mod_AddonSkins:SkinBackgroundFrame(frame)
	frame:SetTemplate("Transparent")
	frame:CreateShadow("Default")
end

function Mod_AddonSkins:SkinButton(button)
	self:SkinFrame(button)
	button:StyleButton(button.GetCheckedTexture and button:GetCheckedTexture())
end

function Mod_AddonSkins:SkinActionButton(button)
	if not button then return end
	self:SkinButton(button)
	local name = button:GetName()
	button.count = button.count or _G[name.."Count"]
	if button.count then
		button.count:SetFont(self.font,self.fontSize,self.fontFlags)
		button.count:SetDrawLayer("OVERLAY")
	end
	button.hotkey = button.hotkey or _G[name.."HotKey"]
	if button.hotkey then
		button.hotkey:SetFont(self.font,self.fontSize,self.fontFlags)
		button.hotkey:SetDrawLayer("OVERLAY")
	end
	button.icon = button.icon or _G[name.."Icon"]
	if button.icon then
		button.icon:SetTexCoord(unpack(self.buttonZoom))
		button.icon:SetDrawLayer("ARTWORK",-1)
		button.icon:ClearAllPoints()
		button.icon:SetPoint("TOPLEFT",button,"TOPLEFT",self.borderWidth, -self.borderWidth)
		button.icon:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT",-self.borderWidth, self.borderWidth)
	end
	button.textName = button.textName or _G[name.."Name"]
	if button.textName then
		button.textName:SetAlpha(0)
	end
	button.cd = button.cd or _G[name.."Cooldown"]
end

Mod_AddonSkins.barTexture = C["media"].normTex
Mod_AddonSkins.bgTexture = C["media"].blank
Mod_AddonSkins.font = C["media"].font
Mod_AddonSkins.smallFont = C["media"].font
Mod_AddonSkins.fontSize = 12
Mod_AddonSkins.fontFlags = "OUTLINE"
Mod_AddonSkins.buttonSize = T.buttonsize
Mod_AddonSkins.buttonSpacing = T.buttonspacing
Mod_AddonSkins.borderWidth = T.Scale(2)
Mod_AddonSkins.buttonZoom = { .08, .92, .08, .92} 
Mod_AddonSkins.barSpacing = T.Scale(1)
Mod_AddonSkins.barHeight = T.Scale(20)
Mod_AddonSkins.skins = {}
Mod_AddonSkins.__index = Mod_AddonSkins

-- TukUI-Specific Integration Support

local CustomSkin = setmetatable(CustomSkin or {},Mod_AddonSkins)

-- Custom SexyCooldown positioning. This is used to lock the bars into place above the action bar or over either info bar.
-- To achieve this, the user must name their bar either "actionbar", "infoleft", or "inforight" depending on where they want
-- the bar anchored.
if not CustomSkin.PositionSexyCooldownBar then
	function CustomSkin:PositionSexyCooldownBar(bar)
		if bar.settings.bar.name == "actionbar" then
			self:SCDStripLayoutSettings(bar)
			bar.settings.bar.inactiveAlpha = 1
			bar:SetHeight(self.buttonSize)
			bar:SetWidth(TukuiActionBarBackground:GetWidth() - 2 * self.buttonSpacing)
			bar:SetPoint("TOPLEFT",TukuiActionBarBackground,"TOPLEFT",self.buttonSpacing,-self.buttonSpacing)
			bar:SetPoint("TOPRIGHT",TukuiActionBarBackground,"TOPRIGHT",-self.buttonSpacing,-self.buttonSpacing)
			if not TukuiActionBarBackground.resized then
				TukuiActionBarBackground:SetHeight(TukuiActionBarBackground:GetHeight() + self.buttonSize + self.buttonSpacing)
				InvTukuiActionBarBackground:SetHeight(TukuiActionBarBackground:GetHeight())
				TukuiActionBarBackground.resized = true
			end
		elseif bar.settings.bar.name == "infoleft" then
			self:SCDStripLayoutSettings(bar)
			bar.settings.bar.inactiveAlpha = 0
			bar:SetAllPoints(TukuiInfoLeft)
		elseif bar.settings.bar.name == "inforight" then
			self:SCDStripLayoutSettings(bar)
			bar.settings.bar.inactiveAlpha = 0
			bar:SetAllPoints(TukuiInfoRight)
		end
	end
end

-- Dummy function expected by some skins
function dummy() end


function Mod_AddonSkins:RegisterSkin(name, initFunc)
	self = Mod_AddonSkins -- Static function
	if type(initFunc) ~= "function" then error("initFunc must be a function!",2) end
	self.skins[name] = initFunc
	if name == "LibSharedMedia" then -- Load LibSharedMedia early.
		initFunc(self, CustomSkin, self, CustomSkin, CustomSkin)
		self.skins[name] = nil
	end
end

Mod_AddonSkins:RegisterEvent("PLAYER_LOGIN")
Mod_AddonSkins:SetScript("OnEvent",function(self)
	self:UnregisterEvent("PLAYER_LOGIN")
	self:SetScript("OnEvent",nil)
	-- Initialize all skins
	for name, func in pairs(self.skins) do
		func(self,CustomSkin,self,CustomSkin,CustomSkin) -- Mod_AddonSkins functions as skin, layout, and config.
	end
end)