if not TukuiCF["unitframes"].enable == true then return end

local font2 = TukuiCF["media"].uffont
local font1 = TukuiCF["media"].font

local function Shared(self, unit)
	self.colors = TukuiDB.oUF_colors
	self:RegisterForClicks("AnyUp")
	self:SetScript('OnEnter', UnitFrame_OnEnter)
	self:SetScript('OnLeave', UnitFrame_OnLeave)
	
	self.menu = TukuiDB.SpawnMenu
	
	self:SetBackdrop({bgFile = TukuiCF["media"].blank, insets = {top = -TukuiDB.mult, left = -TukuiDB.mult, bottom = -TukuiDB.mult, right = -TukuiDB.mult}})
	self:SetBackdropColor(0, 0, 0)
	
	local health = CreateFrame('StatusBar', nil, self)
    health:SetAllPoints(self)
	health:SetStatusBarTexture(TukuiCF["media"].normTex)
	self.Health = health

	health.bg = self.Health:CreateTexture(nil, 'BORDER')
	health.bg:SetAllPoints(self.Health)
	health.bg:SetTexture(TukuiCF["media"].blank)
	health.bg:SetTexture(0.3, 0.3, 0.3)
	health.bg.multiplier = (0.3)
	
	self.Health.bg = health.bg
	
	health.PostUpdate = TukuiDB.PostUpdatePetColor
	health.frequentUpdates = true
	
	if TukuiCF.unitframes.unicolor == true then
		health.colorDisconnected = false
		health.colorClass = false
		health:SetStatusBarColor(unpack(TukuiCF["media"].althealthcolor))
		health.bg:SetVertexColor(unpack(TukuiCF["media"].healthdeficit))
	else
		health.colorDisconnected = true
		health.colorClass = true
		health.colorReaction = true
	end
	
	local FrameBorder = CreateFrame("Frame", nil, self)
	FrameBorder:SetPoint("TOPLEFT", self, "TOPLEFT", TukuiDB.Scale(-1), TukuiDB.Scale(1))
	FrameBorder:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", TukuiDB.Scale(1), TukuiDB.Scale(-1))
	TukuiDB.SetTemplate(FrameBorder)
	FrameBorder:SetBackdropBorderColor(0, 0, 0)
	FrameBorder:SetFrameLevel(2)
	FrameBorder:SetAlpha(0)
	self.FrameBorder = FrameBorder

	local name = health:CreateFontString(nil, 'OVERLAY')
	name:SetFont(font2, 12*TukuiDB.raidscale, "THINOUTLINE")
	name:SetPoint("LEFT", self, "LEFT", TukuiDB.Scale(5), 0)
	--name.frequentUpdates = 0.2
	if TukuiCF["unitframes"].unicolor == true then
		self:Tag(name, '[Tukui:getnamecolor][Tukui:namemedium] [Tukui:afk]')
	else
		self:Tag(name, "[Tukui:namemedium]")
		name:SetTextColor(unpack(TukuiCF["media"].tncolor))
		name:SetShadowColor(0, 0, 0)
		name:SetShadowOffset(0.75, -0.75)
	end
	self.Name = name
	
	local leader = health:CreateTexture(nil, "OVERLAY")
    leader:SetHeight(TukuiDB.Scale(12*TukuiDB.raidscale))
    leader:SetWidth(TukuiDB.Scale(12*TukuiDB.raidscale))
    leader:SetPoint("TOPLEFT", 0, 6)
	self.Leader = leader
	
    local MasterLooter = health:CreateTexture(nil, "OVERLAY")
    MasterLooter:SetHeight(TukuiDB.Scale(12*TukuiDB.raidscale))
    MasterLooter:SetWidth(TukuiDB.Scale(12*TukuiDB.raidscale))
	self.MasterLooter = MasterLooter
    self:RegisterEvent("PARTY_LEADER_CHANGED", TukuiDB.MLAnchorUpdate)
    self:RegisterEvent("PARTY_MEMBERS_CHANGED", TukuiDB.MLAnchorUpdate)
	
	if TukuiCF["unitframes"].showsymbols == true then
		RaidIcon = health:CreateTexture(nil, 'OVERLAY')
		RaidIcon:SetHeight(TukuiDB.Scale(12*TukuiDB.raidscale))
		RaidIcon:SetWidth(TukuiDB.Scale(12*TukuiDB.raidscale))
		RaidIcon:SetPoint("RIGHT", self, "RIGHT")
		RaidIcon:SetTexture("Interface\\AddOns\\Tukui\\media\\textures\\raidicons.blp") -- thx hankthetank for texture
		self.RaidIcon = RaidIcon
	end
	
	if TukuiCF["unitframes"].aggro == true then
		table.insert(self.__elements, TukuiDB.UpdateThreat)
		self:RegisterEvent('PLAYER_TARGET_CHANGED', TukuiDB.UpdateThreat)
		self:RegisterEvent('UNIT_THREAT_LIST_UPDATE', TukuiDB.UpdateThreat)
		self:RegisterEvent('UNIT_THREAT_SITUATION_UPDATE', TukuiDB.UpdateThreat)
    end
	
	local ReadyCheck = health:CreateTexture(nil, "OVERLAY")
	ReadyCheck:SetHeight(TukuiDB.Scale(12*TukuiDB.raidscale))
	ReadyCheck:SetWidth(TukuiDB.Scale(12*TukuiDB.raidscale))
	ReadyCheck:SetPoint('RIGHT')
	self.ReadyCheck = ReadyCheck
	
	--local picon = self.Health:CreateTexture(nil, 'OVERLAY')
	--picon:SetPoint('CENTER', self.Health)
	--picon:SetSize(16, 16)
	--picon:SetTexture[[Interface\AddOns\Tukui\media\textures\picon]]
	--picon.Override = TukuiDB.Phasing
	--self.PhaseIcon = picon
	
	self.DebuffHighlightAlpha = 1
	self.DebuffHighlightBackdrop = true
	self.DebuffHighlightFilter = true

	if TukuiCF["unitframes"].showsmooth == true then
		health.Smooth = true
	end
	
	if TukuiCF["unitframes"].showrange == true then
		local range = {insideAlpha = 1, outsideAlpha = TukuiCF["unitframes"].raidalphaoor}
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
		'initial-width', TukuiDB.Scale(80*TukuiDB.raidscale),
		'initial-height', TukuiDB.Scale(15*TukuiDB.raidscale),
		"showRaid", true,
		"groupFilter", "1,2,3,4,5",
		"groupingOrder",
		"1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"yOffset", TukuiDB.Scale(-3)
	)
	raid:SetPoint('TOPLEFT', UIParent, TukuiDB.Scale(10), TukuiDB.Scale(-10))
end)