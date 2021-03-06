local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

if C.bars.threat ~= true then return end

local pheight = C.datatext.panelsize

local TukuiThreatBar = CreateFrame("StatusBar", "TukuiThreatBar", TukuiDatapanelR1)
TukuiThreatBar:ClearAllPoints()
TukuiThreatBar:Point("TOPLEFT", TukuiDatapanelR1, "TOPLEFT", 1, -1)
if T.lowversion then
	TukuiThreatBar:Point("BOTTOMRIGHT", TukuiDatapanelR3, "BOTTOMRIGHT", -1, 1)
else
	TukuiThreatBar:Point("BOTTOMRIGHT", TukuiDatapanelR4, "BOTTOMRIGHT", -1, 1)
end
TukuiThreatBar:SetFrameLevel(10)

TukuiThreatBar:SetStatusBarTexture(C.media.normTex)
TukuiThreatBar:GetStatusBarTexture():SetHorizTile(false)
TukuiThreatBar:SetBackdrop({bgFile = C.media.blank})
TukuiThreatBar:SetBackdropColor(0, 0, 0, 0)
TukuiThreatBar:SetMinMaxValues(0, 100)

TukuiThreatBar.text = T.SetFontString(TukuiThreatBar, C.media.font, C.datatext.fontsize+1)
TukuiThreatBar.text:Point("RIGHT", TukuiThreatBar, "RIGHT", T.Scale(-30), 0)
TukuiThreatBar.text:SetShadowOffset(T.mult, -T.mult)
TukuiThreatBar.text:SetShadowColor(0,0,0,1)

TukuiThreatBar.Title = T.SetFontString(TukuiThreatBar, C.media.font, C.datatext.fontsize)
TukuiThreatBar.Title:SetText(L.unitframes_ouf_threattext)
TukuiThreatBar.Title:SetPoint("LEFT", TukuiThreatBar, "LEFT", T.Scale(30), 0)

TukuiThreatBar.bg = TukuiThreatBar:CreateTexture(nil, 'BORDER')
TukuiThreatBar.bg:SetAllPoints(TukuiThreatBar)
TukuiThreatBar.bg:SetTexture(unpack(C["media"].pbackdropcolor))

TukuiThreatBar.border = TukuiThreatBar:CreateTexture(nil, 'BORDER')
TukuiThreatBar.border:Point("TOPLEFT", TukuiDatapanelR1, "TOPLEFT", 0, 0)
if T.lowversion then
	TukuiThreatBar.border:Point("BOTTOMRIGHT", TukuiDatapanelR3, "BOTTOMRIGHT", 0, 0)
else
	TukuiThreatBar.border:Point("BOTTOMRIGHT", TukuiDatapanelR4, "BOTTOMRIGHT", 0, 0)
end
TukuiThreatBar.border:SetTexture(0,0,0)

local function OnEvent(self, event, ...)
	local party = GetNumPartyMembers()
	local raid = GetNumRaidMembers()
	local pet = select(1, HasPetUI())
	if event == "PLAYER_ENTERING_WORLD" then
		self:Hide()
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	elseif event == "PLAYER_REGEN_ENABLED" then
		self:Hide()
	elseif event == "PLAYER_REGEN_DISABLED" then
		if party > 0 or raid > 0 or pet == 1 then
			self:Show()
		else
			self:Hide()
		end
	else
		if (InCombatLockdown()) and (party > 0 or raid > 0 or pet == 1) then
			self:Show()
		else
			self:Hide()
		end
	end
end

local function OnUpdate(self, event, unit)
	if UnitAffectingCombat(self.unit) then
		local _, _, threatpct, rawthreatpct, _ = UnitDetailedThreatSituation(self.unit, self.tar)
		local threatval = threatpct or 0
		
		self:SetValue(threatval)
		self.text:SetFormattedText("%3.1f", threatval)
		
		local r, g, b = oUFTukui.ColorGradient(threatval/100, 0,.8,0,.8,.8,0,.8,0,0)
		self:SetStatusBarColor(r, g, b)
		
		if threatval > 0 then
			self:SetAlpha(1)
		else
			self:SetAlpha(0)
		end		
	end
end

TukuiThreatBar:RegisterEvent("PLAYER_ENTERING_WORLD")
TukuiThreatBar:RegisterEvent("PLAYER_REGEN_ENABLED")
TukuiThreatBar:RegisterEvent("PLAYER_REGEN_DISABLED")
TukuiThreatBar:SetScript("OnEvent", OnEvent)
TukuiThreatBar:SetScript("OnUpdate", OnUpdate)
TukuiThreatBar.unit = "player"
TukuiThreatBar.tar = TukuiThreatBar.unit.."target"
TukuiThreatBar.Colors = aggroColors
TukuiThreatBar:SetAlpha(0)