if not TukuiCF["unitframes"].enable == true then return end

local font2 = TukuiCF["media"].uffont
local font1 = TukuiCF["media"].font
local normTex = TukuiCF["media"].normTex
local backdrop = {
	bgFile = TukuiCF["media"].blank,
	insets = {top = -TukuiDB.mult, left = -TukuiDB.mult, bottom = -TukuiDB.mult, right = -TukuiDB.mult},
}

local function Shared(self, unit)
	self.colors = TukuiDB.oUF_colors
	self:RegisterForClicks("AnyUp")
	self:SetScript('OnEnter', UnitFrame_OnEnter)
	self:SetScript('OnLeave', UnitFrame_OnLeave)
	
	self.menu = TukuiDB.SpawnMenu
	
	self:SetBackdrop({bgFile = TukuiCF["media"].blank, insets = {top = -TukuiDB.mult, left = -TukuiDB.mult, bottom = -TukuiDB.mult, right = -TukuiDB.mult}})
	self:SetBackdropColor(0, 0, 0)
	
	local health = CreateFrame('StatusBar', nil, self)
	health:SetPoint("TOPLEFT")
	health:SetPoint("TOPRIGHT")
	health:SetHeight(TukuiDB.Scale(30*TukuiCF["unitframes"].gridscale*TukuiDB.raidscale))
	health:SetStatusBarTexture(normTex)
	health:SetBackdrop(backdrop)
	health:SetBackdropColor(0, 0, 0)
	self.Health = health
	
	if TukuiCF["unitframes"].gridhealthvertical == true then
		health:SetOrientation('VERTICAL')
	end
	
	health.bg = health:CreateTexture(nil, 'BORDER')
	health.bg:SetAllPoints(health)
	health.bg:SetTexture(normTex)
	health.bg:SetTexture(0.3, 0.3, 0.3)
	health.bg.multiplier = (0.3)
	self.Health.bg = health.bg

	health.value = health:CreateFontString(nil, "OVERLAY")
	health.value:SetPoint("TOP", health, 0, TukuiDB.Scale(-2))
	health.value:SetFont(font2, 11*TukuiCF["unitframes"].gridscale*TukuiDB.raidscale)
	health.value:SetTextColor(.05, 1, 1)
	health.value:SetShadowOffset(1, -1)
	self.Health.value = health.value
	
	health.PostUpdate = TukuiDB.PostUpdateHealthRaid
	
	health.frequentUpdates = true
	
	local FrameBorder = CreateFrame("Frame", nil, self)
	FrameBorder:SetPoint("TOPLEFT", self, "TOPLEFT", TukuiDB.Scale(-1), TukuiDB.Scale(1))
	FrameBorder:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", TukuiDB.Scale(1), TukuiDB.Scale(-1))
	TukuiDB.SetTemplate(FrameBorder)
	FrameBorder:SetBackdropBorderColor(0, 0, 0)
	FrameBorder:SetFrameLevel(3)
	FrameBorder:SetAlpha(0)
	self.FrameBorder = FrameBorder
	
	if TukuiCF.unitframes.unicolor == true then
		health.colorDisconnected = false
		health.colorClass = false
		health:SetStatusBarColor(unpack(TukuiCF["media"].healthcolor))
		health.bg:SetVertexColor(unpack(TukuiCF["media"].healthdeficit))
	else
		health.colorDisconnected = true
		health.colorClass = true
		health.colorReaction = true			
	end
	
	local power = CreateFrame("StatusBar", nil, self)
	power:SetHeight(3*TukuiCF["unitframes"].gridscale*TukuiDB.raidscale)
	power:SetPoint("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -TukuiDB.mult)
	power:SetPoint("TOPRIGHT", self.Health, "BOTTOMRIGHT", 0, -TukuiDB.mult)
	power:SetStatusBarTexture(normTex)
	power:SetBackdrop(backdrop)
	power:SetBackdropColor(0, 0, 0)
	self.Power = power

	power.frequentUpdates = true
	power.colorDisconnected = true

	power.bg = power:CreateTexture(nil, "BORDER")
	power.bg:SetAllPoints(power)
	power.bg:SetTexture(normTex)
	power.bg:SetAlpha(1)
	power.bg.multiplier = 0.4
	
	if TukuiCF.unitframes.unicolor == true then
		power.colorClass = true
		power.bg.multiplier = 0.1				
	else
		power.colorPower = true
	end

	local name = health:CreateFontString(nil, "OVERLAY")
    name:SetPoint("CENTER", health, "BOTTOM", TukuiDB.Scale(1), TukuiDB.Scale(8))
	name:SetFont(font2, 12*TukuiCF["unitframes"].gridscale*TukuiDB.raidscale, "THINOUTLINE")
	--name.frequentUpdates = 0.2
	if TukuiCF["unitframes"].unicolor == true then
		self:Tag(name, "[Tukui:nameshort]")
	else
		self:Tag(name, "[Tukui:nameshort]")
		name:SetTextColor(unpack(TukuiCF["media"].tncolor))
		name:SetShadowColor(0, 0, 0)
		name:SetShadowOffset(1.25, -1.25)
	end
	self.Name = name
	
    if TukuiCF["unitframes"].aggro == true then
		table.insert(self.__elements, TukuiDB.UpdateThreat)
		self:RegisterEvent('PLAYER_TARGET_CHANGED', TukuiDB.UpdateThreat)
		self:RegisterEvent('UNIT_THREAT_LIST_UPDATE', TukuiDB.UpdateThreat)
		self:RegisterEvent('UNIT_THREAT_SITUATION_UPDATE', TukuiDB.UpdateThreat)
	end
	
	if TukuiCF["unitframes"].showsymbols == true then
		local RaidIcon = health:CreateTexture(nil, 'OVERLAY')
		RaidIcon:SetHeight(TukuiDB.Scale(12*TukuiDB.raidscale))
		RaidIcon:SetWidth(TukuiDB.Scale(12*TukuiDB.raidscale))
		RaidIcon:SetPoint('RIGHT', self, 'RIGHT', (TukuiDB.Scale(-1*TukuiDB.raidscale)), (TukuiDB.Scale(3*TukuiDB.raidscale)))
		RaidIcon:SetTexture("Interface\\AddOns\\Tukui\\media\\textures\\raidicons.blp")-- thx hankthetank for texture
		self.RaidIcon = RaidIcon
	end
	
	local ReadyCheck = health:CreateTexture(nil, "OVERLAY")
	ReadyCheck:SetHeight(TukuiDB.Scale(12*TukuiCF["unitframes"].gridscale*TukuiDB.raidscale))
	ReadyCheck:SetWidth(TukuiDB.Scale(12*TukuiCF["unitframes"].gridscale*TukuiDB.raidscale))
	ReadyCheck:SetPoint('TOP', self, 'TOP')	
	self.ReadyCheck = ReadyCheck
	
	--local picon = self.Health:CreateTexture(nil, 'OVERLAY')
	--picon:SetPoint('CENTER', self.Health)
	--picon:SetSize(16, 16)
	--picon:SetTexture[[Interface\AddOns\Tukui\media\textures\picon]]
	--picon.Override = TukuiDB.Phasing
	--self.PhaseIcon = picon
	
	if not TukuiCF["unitframes"].raidunitdebuffwatch == true then
		self.DebuffHighlightAlpha = 1
		self.DebuffHighlightBackdrop = true
		self.DebuffHighlightFilter = true
	end
	
	if TukuiCF["unitframes"].showrange == true then
		local range = {insideAlpha = 1, outsideAlpha = TukuiCF["unitframes"].raidalphaoor}
		self.Range = range
	end
	
	if TukuiCF["unitframes"].showsmooth == true then
		health.Smooth = true
		power.Smooth = true
	end
	
	if TukuiCF["unitframes"].healcomm then
		local mhpb = CreateFrame('StatusBar', nil, self.Health)
		if TukuiCF["unitframes"].gridhealthvertical then
			mhpb:SetOrientation("VERTICAL")
			mhpb:SetPoint('BOTTOM', self.Health:GetStatusBarTexture(), 'TOP', 0, 0)
			mhpb:SetWidth(TukuiDB.Scale(60*TukuiCF["unitframes"].gridscale*TukuiDB.raidscale))
			mhpb:SetHeight(TukuiDB.Scale(30*TukuiCF["unitframes"].gridscale*TukuiDB.raidscale))		
		else
			mhpb:SetPoint('TOPLEFT', self.Health:GetStatusBarTexture(), 'TOPRIGHT', 0, 0)
			mhpb:SetPoint('BOTTOMLEFT', self.Health:GetStatusBarTexture(), 'BOTTOMRIGHT', 0, 0)
			mhpb:SetWidth(TukuiDB.Scale(66*TukuiCF["unitframes"].gridscale*TukuiDB.raidscale))
		end				
		mhpb:SetStatusBarTexture(normTex)
		mhpb:SetStatusBarColor(0, 1, 0.5, 0.25)

		local ohpb = CreateFrame('StatusBar', nil, self.Health)
		ohpb:SetPoint('TOPLEFT', mhpb:GetStatusBarTexture(), 'TOPRIGHT', 0, 0)
		if TukuiCF["unitframes"].gridhealthvertical then
			ohpb:SetOrientation("VERTICAL")
			ohpb:SetPoint('BOTTOM', mhpb:GetStatusBarTexture(), 'TOP', 0, 0)
			ohpb:SetWidth(TukuiDB.Scale(60*TukuiCF["unitframes"].gridscale*TukuiDB.raidscale))
			ohpb:SetHeight(TukuiDB.Scale(30*TukuiCF["unitframes"].gridscale*TukuiDB.raidscale))
		else
			ohpb:SetPoint('TOPLEFT', mhpb:GetStatusBarTexture(), 'TOPRIGHT', 0, 0)
			ohpb:SetPoint('BOTTOMLEFT', mhpb:GetStatusBarTexture(), 'BOTTOMRIGHT', 0, 0)
			ohpb:SetWidth(TukuiDB.Scale(66*TukuiCF["unitframes"].gridscale*TukuiDB.raidscale))
		end
		ohpb:SetStatusBarTexture(normTex)
		ohpb:SetStatusBarColor(0, 1, 0, 0.25)

		self.HealPrediction = {
			myBar = mhpb,
			otherBar = ohpb,
			maxOverflow = 1,
		}
	end
	
	if TukuiCF["unitframes"].raidunitdebuffwatch == true then
		-- AuraWatch (corner icon)
		TukuiDB.createAuraWatch(self,unit)
		
		-- Raid Debuffs (big middle icon)
		local RaidDebuffs = CreateFrame('Frame', nil, self)
		RaidDebuffs:SetHeight(TukuiDB.Scale(22*TukuiCF["unitframes"].gridscale))
		RaidDebuffs:SetWidth(TukuiDB.Scale(22*TukuiCF["unitframes"].gridscale))
		RaidDebuffs:SetPoint('CENTER', health, 0,0)
		RaidDebuffs:SetFrameStrata(health:GetFrameStrata())
		RaidDebuffs:SetFrameLevel(health:GetFrameLevel() + 2)
		
		TukuiDB.SetTemplate(RaidDebuffs)
		
		RaidDebuffs.icon = RaidDebuffs:CreateTexture(nil, 'OVERLAY')
		RaidDebuffs.icon:SetTexCoord(.1,.9,.1,.9)
		RaidDebuffs.icon:SetPoint("TOPLEFT", TukuiDB.Scale(2), TukuiDB.Scale(-2))
		RaidDebuffs.icon:SetPoint("BOTTOMRIGHT", TukuiDB.Scale(-2), TukuiDB.Scale(2))
		
		if TukuiCF["unitframes"].auratimer then
			RaidDebuffs.cd = CreateFrame('Cooldown', nil, RaidDebuffs)
			RaidDebuffs.cd:SetPoint("TOPLEFT", TukuiDB.Scale(2), TukuiDB.Scale(-2))
			RaidDebuffs.cd:SetPoint("BOTTOMRIGHT", TukuiDB.Scale(-2), TukuiDB.Scale(2))
			RaidDebuffs.cd.noOCC = true -- remove this line if you want cooldown number on it
		end
		
		RaidDebuffs.count = RaidDebuffs:CreateFontString(nil, 'OVERLAY')
		RaidDebuffs.count:SetFont(TukuiCF["media"].uffont, 9*TukuiCF["unitframes"].gridscale, "THINOUTLINE")
		RaidDebuffs.count:SetPoint('BOTTOMRIGHT', RaidDebuffs, 'BOTTOMRIGHT', 0, 2)
		RaidDebuffs.count:SetTextColor(1, .9, 0)
		
		self.RaidDebuffs = RaidDebuffs
    end
	
	return self
end

oUF:RegisterStyle('TukuiHealR25R40', Shared)
oUF:Factory(function(self)
	oUF:SetActiveStyle("TukuiHealR25R40")	
	if TukuiCF["unitframes"].gridonly ~= true then
		local raid = self:SpawnHeader("oUF_TukuiHealRaid2540", nil, "custom [@raid16,exists] show;hide",
			'oUF-initialConfigFunction', [[
				local header = self:GetParent()
				self:SetWidth(header:GetAttribute('initial-width'))
				self:SetHeight(header:GetAttribute('initial-height'))
			]],
			'initial-width', TukuiDB.Scale(66*TukuiCF["unitframes"].gridscale*TukuiDB.raidscale),
			'initial-height', TukuiDB.Scale(50*TukuiCF["unitframes"].gridscale*TukuiDB.raidscale),	
			"showRaid", true,
			"xoffset", TukuiDB.Scale(3),
			"yOffset", TukuiDB.Scale(-3),
			"point", "LEFT",
			"groupFilter", "1,2,3,4,5,6,7,8",
			"groupingOrder", "1,2,3,4,5,6,7,8",
			"groupBy", "GROUP",
			"maxColumns", 5,
			"unitsPerColumn", 5,
			"columnSpacing", TukuiDB.Scale(3),
			"columnAnchorPoint", "TOP"		
		)
		raid:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 18, -250*TukuiDB.raidscale)
	else
		local raid = self:SpawnHeader("oUF_TukuiHealRaid2540", nil, "raid,party",
			'oUF-initialConfigFunction', [[
				local header = self:GetParent()
				self:SetWidth(header:GetAttribute('initial-width'))
				self:SetHeight(header:GetAttribute('initial-height'))
			]],
			'initial-width', TukuiDB.Scale(60*TukuiCF["unitframes"].gridscale*TukuiDB.raidscale),
			'initial-height', TukuiDB.Scale(34*TukuiCF["unitframes"].gridscale*TukuiDB.raidscale),
			"showParty", true,
			"showPlayer", TukuiCF["unitframes"].showplayerinparty, 
			"showRaid", true, 
			"xoffset", TukuiDB.Scale(4),
			"yOffset", TukuiDB.Scale(0),
			"point", "LEFT",
			"groupFilter", "1,2,3,4,5,6,7,8",
			"groupingOrder", "1,2,3,4,5,6,7,8",
			"groupBy", "GROUP",
			"maxColumns", 5,
			"unitsPerColumn", 5,
			"columnSpacing", TukuiDB.Scale(6),
			"columnAnchorPoint", "TOP"		
		)
		if TukuiDB.lowversion ~= true then
			raid:SetPoint("CENTER", TukuiBottomPanel, "TOP", 0, 125*TukuiDB.raidscale)
		else
			raid:SetPoint("CENTER", TukuiBottomPanel, "TOP", -33.5, 125*TukuiDB.raidscale)
		end
		
		local pets = {} 
			pets[1] = oUF:Spawn('partypet1', 'oUF_TukuiPartyPet1') 
			pets[1]:SetPoint('TOPLEFT', raid, 'TOPLEFT', 0, -50*TukuiCF["unitframes"].gridscale*TukuiDB.raidscale + TukuiDB.Scale(-3))
			pets[1]:SetSize(TukuiDB.Scale(66*TukuiCF["unitframes"].gridscale*TukuiDB.raidscale), TukuiDB.Scale(50*TukuiCF["unitframes"].gridscale*TukuiDB.raidscale))
		for i =2, 4 do 
			pets[i] = oUF:Spawn('partypet'..i, 'oUF_TukuiPartyPet'..i) 
			pets[i]:SetPoint('LEFT', pets[i-1], 'RIGHT', TukuiDB.Scale(3), 0)
			pets[i]:SetSize(TukuiDB.Scale(66*TukuiCF["unitframes"].gridscale*TukuiDB.raidscale), TukuiDB.Scale(50*TukuiCF["unitframes"].gridscale*TukuiDB.raidscale))
		end
		
		local ShowPet = CreateFrame("Frame")
		ShowPet:RegisterEvent("PLAYER_ENTERING_WORLD")
		ShowPet:RegisterEvent("RAID_ROSTER_UPDATE")
		ShowPet:RegisterEvent("PARTY_LEADER_CHANGED")
		ShowPet:RegisterEvent("PARTY_MEMBERS_CHANGED")
		ShowPet:SetScript("OnEvent", function(self)
			if InCombatLockdown() then
				self:RegisterEvent("PLAYER_REGEN_ENABLED")
			else
				self:UnregisterEvent("PLAYER_REGEN_ENABLED")
				local numraid = GetNumRaidMembers()
				local numparty = GetNumPartyMembers()
				if numparty > 0 and numraid == 0 or numraid > 0 and numraid <= 5 then
					for i,v in ipairs(pets) do v:Disable() end
				else
					for i,v in ipairs(pets) do v:Disable() end
				end
			end
		end)		
	end
end)