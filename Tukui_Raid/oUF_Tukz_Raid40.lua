local ADDON_NAME, ns = ...
local oUF = oUFTukui or oUF
assert(oUF, "Tukui was unable to locate oUF install.")

ns._Objects = {}
ns._Headers = {}

local T, C, L = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales

if not C["unitframes"].enable == true then return end
if C["unitframes"].enableraidframes ~= true then return end

local font2 = C["media"].uffont
local font1 = C["media"].font

local function Shared(self, unit)
	self.colors = T.oUF_colors
	self:RegisterForClicks("AnyUp")
	self:SetScript('OnEnter', UnitFrame_OnEnter)
	self:SetScript('OnLeave', UnitFrame_OnLeave)
	
	self.menu = T.SpawnMenu
	
	self:SetBackdrop({bgFile = C["media"].blank, insets = {top = -T.mult, left = -T.mult, bottom = -T.mult, right = -T.mult}})
	self:SetBackdropColor(0,0,0)
	
	local health = CreateFrame('StatusBar', nil, self)
	health:Height((T.Scale(12*T.raidscale)))
	health:SetPoint("TOPLEFT")
	health:SetPoint("TOPRIGHT")
	health:SetStatusBarTexture(C["media"].shpTex)
	self.Health = health

	health.bg = self.Health:CreateTexture(nil, 'BORDER')
	health.bg:SetAllPoints(self.Health)
	health.bg:SetTexture(C["media"].blank)
	health.bg:SetTexture(0.3, 0.3, 0.3)
	health.bg.multiplier = (0.3)
	self.Health.bg = health.bg
	
	health.PostUpdate = T.PostUpdatePetColor
	health.frequentUpdates = true
	
	if C.unitframes.unicolor == true then
		health.colorDisconnected = false
		health.colorClass = false
		health:SetStatusBarColor(unpack(C["media"].healthcolor))
		health.bg:SetVertexColor(unpack(C["media"].healthdeficit))	
	else
		health.colorDisconnected = true
		health.colorClass = true
		health.colorReaction = true			
	end
	
	local name = health:CreateFontString(nil, 'OVERLAY')
	name:SetFont(font2, 10*T.raidscale, "THINOUTLINE")
	name:Point("LEFT", self, "LEFT", 5, 0)
	
	if TukuiCF["unitframes"].unicolor == true then
		self:Tag(name, '[Tukui:getnamecolor][Tukui:nameshort] [Tukui:dead][Tukui:afk]')
	else
		self:Tag(name, "[Tukui:nameshort] [Tukui:dead][Tukui:afk]")
		name:SetTextColor(unpack(TukuiCF["media"].tncolor))
		name:SetShadowColor(0, 0, 0)
		name:SetShadowOffset(0.75, -0.75)
	end
	self.Name = name
	
	if C["unitframes"].showsymbols == true then
		RaidIcon = health:CreateTexture(nil, 'OVERLAY')
		RaidIcon:Height(13*T.raidscale)
		RaidIcon:Width(13*T.raidscale)
		RaidIcon:SetPoint("RIGHT", self, "RIGHT")
		RaidIcon:SetTexture("Interface\\AddOns\\Tukui\\medias\\textures\\raidicons.blp") -- thx hankthetank for texture
		self.RaidIcon = RaidIcon
	end
	
	local LFDRole = health:CreateTexture(nil, "OVERLAY")
    LFDRole:Height(6*T.raidscale)
    LFDRole:Width(6*T.raidscale)
	LFDRole:Point("LEFT", -3, 0)
	LFDRole:SetTexture("Interface\\AddOns\\Tukui\\medias\\textures\\lfdicons.blp")
	self.LFDRole = LFDRole
	
	local ReadyCheck = health:CreateTexture(nil, "OVERLAY")
	ReadyCheck:Height(12*T.raidscale)
	ReadyCheck:Width(12*T.raidscale)
	ReadyCheck:SetPoint('CENTER')
	self.ReadyCheck = ReadyCheck
	
	--local picon = self.Health:CreateTexture(nil, 'OVERLAY')
	--picon:SetPoint('CENTER', self.Health)
	--picon:SetSize(16, 16)
	--picon:SetTexture[[Interface\AddOns\Tukui\medias\textures\picon]]
	--picon.Override = T.Phasing
	--self.PhaseIcon = picon
	
	self.DebuffHighlightAlpha = 1
	self.DebuffHighlightBackdrop = true
	self.DebuffHighlightFilter = true

	if C["unitframes"].showsmooth == true then
		health.Smooth = true
	end
	
	if C["unitframes"].showrange == true then
		local range = {insideAlpha = 1, outsideAlpha = C["unitframes"].raidalphaoor}
		self.Range = range
	end
	
	return self
end

oUF:RegisterStyle('TukuiDpsR40', Shared)
oUF:Factory(function(self)
	oUF:SetActiveStyle("TukuiDpsR40")
		local raid = self:SpawnHeader("oUF_TukuiDpsRaid40", nil, "custom [@raid26,exists] show;hide",
			'oUF-initialConfigFunction', [[
			local header = self:GetParent()
			self:SetWidth(header:GetAttribute('initial-width'))
			self:SetHeight(header:GetAttribute('initial-height'))
			]],
			'initial-width', T.Scale(80*T.raidscale),
			'initial-height', T.Scale(12*T.raidscale),
			"showRaid", true,
			"groupFilter", "1,2,3,4,5,6,7,8",
			"groupingOrder", "1,2,3,4,5,6,7,8",
			"groupBy", "GROUP",
			"yOffset", T.Scale(-5*T.raidscale)
		)
		raid:SetPoint('TOPLEFT', UIParent, 5, -35)
end)