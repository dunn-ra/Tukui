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
--local normTex = C["media"].normTex
local normTex = C["media"].shpTex

local function Shared(self, unit)
	self.colors = T.oUF_colors
	self:RegisterForClicks("AnyUp")
	self:SetScript('OnEnter', UnitFrame_OnEnter)
	self:SetScript('OnLeave', UnitFrame_OnLeave)
	
	self.menu = T.SpawnMenu
	
	self:SetBackdrop({bgFile = C["media"].blank, insets = {top = -T.mult, left = -T.mult, bottom = -T.mult, right = -T.mult}})
	self:SetBackdropColor(0,0,0)
	
	local health = CreateFrame('StatusBar', nil, self)
	health:SetPoint("TOPLEFT")
	health:SetPoint("TOPRIGHT")
	health:Height(28*C["unitframes"].gridscale*T.raidscale)
	health:SetStatusBarTexture(normTex)
	self.Health = health
	
	if C["unitframes"].gridhealthvertical == true then
		health:SetOrientation('VERTICAL')
	end
	
	health.bg = health:CreateTexture(nil, 'BORDER')
	health.bg:SetAllPoints(health)
	self.Health.bg = health.bg
		
	health.value = health:CreateFontString(nil, "OVERLAY")
	health.value:Point("TOP", health, 0, -2)
	health.value:SetFont(font2, 11*C["unitframes"].gridscale*T.raidscale)
	health.value:SetTextColor(.5,1,1)
	health.value:SetShadowOffset(1, -1)
	self.Health.value = health.value
	
	health.PostUpdate = T.PostUpdateHealthRaid
	
	health.frequentUpdates = true

	if C.unitframes.unicolor == true then
		health.colorDisconnected = false
		health.colorClass = false
		health:SetStatusBarColor(unpack(C["unitframes"].hpcolor))
		health.bg:SetTexture(unpack(C["unitframes"].hpbg))
	else
		health.colorDisconnected = true
		health.colorClass = true
		health.colorReaction = true
		health.bg:SetTexture(unpack(C["unitframes"].hpbgc))
	end
		
	local power = CreateFrame("StatusBar", nil, self)
	power:SetHeight(2*C["unitframes"].gridscale*T.raidscale)
	power:Point("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -T.mult)
	power:Point("TOPRIGHT", self.Health, "BOTTOMRIGHT", 0, -T.mult)
	power:SetStatusBarTexture(normTex)
	self.Power = power

	power.frequentUpdates = true
	power.colorDisconnected = true

	power.bg = power:CreateTexture(nil, "BORDER")
	power.bg:SetAllPoints(power)
	power.bg:SetTexture(normTex)
	power.bg:SetAlpha(1)
	power.bg.multiplier = 0.4
	
	if C.unitframes.unicolor == true then
		power.colorClass = true
		power.bg.multiplier = 0.1				
	else
		power.colorPower = true
	end
	
	local AggroInd = CreateFrame("Frame", nil, health)
	AggroInd:SetPoint("TOPLEFT", health, "TOPLEFT", -1, 1)
	AggroInd:SetPoint("BOTTOMRIGHT", power, "BOTTOMRIGHT", 1, -1)
	AggroInd:SetTemplate("Default")
	AggroInd:SetFrameLevel(2)
	self.AggroInd = AggroInd
	
	local name = health:CreateFontString(nil, "OVERLAY")
    name:SetPoint("CENTER", health, "BOTTOM", T.Scale(1), T.Scale(8))
	name:SetFont(font2, 11*C["unitframes"].gridscale*T.raidscale, "THINOUTLINE")
	if C["unitframes"].unicolor == true then
		self:Tag(name, "[Tukui:nametiny]")
	else
		self:Tag(name, "[Tukui:nametiny]")
		name:SetTextColor(unpack(C["media"].tncolor))
		name:SetShadowColor(0, 0, 0)
		name:SetShadowOffset(1.25, -1.25)
	end
	self.Name = name
	
	local LFDRole = health:CreateTexture(nil, "OVERLAY")
    LFDRole:Height(6*T.raidscale)
    LFDRole:Width(6*T.raidscale)
	LFDRole:Point("TOP", 0, 3)
	LFDRole:SetTexture("Interface\\AddOns\\Tukui\\medias\\textures\\lfdicons.blp")
	self.LFDRole = LFDRole
	
    if C["unitframes"].aggro == true then
		table.insert(self.__elements, T.UpdateThreat)
		self:RegisterEvent('PLAYER_TARGET_CHANGED', T.UpdateThreat)
		self:RegisterEvent('UNIT_THREAT_LIST_UPDATE', T.UpdateThreat)
		self:RegisterEvent('UNIT_THREAT_SITUATION_UPDATE', T.UpdateThreat)
	end
	
	if C["unitframes"].showsymbols == true then
		local RaidIcon = health:CreateTexture(nil, 'OVERLAY')
		RaidIcon:Height(12*T.raidscale)
		RaidIcon:Width(12*T.raidscale)
		RaidIcon:SetPoint('RIGHT', self, 'RIGHT', (T.Scale(-1*T.raidscale)), (T.Scale(3*T.raidscale)))
		RaidIcon:SetTexture("Interface\\AddOns\\Tukui\\medias\\textures\\raidicons.blp") -- thx hankthetank for texture
		self.RaidIcon = RaidIcon
	end
	
	local ReadyCheck = power:CreateTexture(nil, "OVERLAY")
	ReadyCheck:Height(12*C["unitframes"].gridscale*T.raidscale)
	ReadyCheck:Width(12*C["unitframes"].gridscale*T.raidscale)
	ReadyCheck:SetPoint('TOP', self, 'TOP')
	self.ReadyCheck = ReadyCheck
	
	--local picon = self.Health:CreateTexture(nil, 'OVERLAY')
	--picon:SetPoint('CENTER', self.Health)
	--picon:SetSize(16, 16)
	--picon:SetTexture[[Interface\AddOns\Tukui\medias\textures\picon]]
	--picon.Override = T.Phasing
	--self.PhaseIcon = picon
	
	if not C["unitframes"].raidunitdebuffwatch == true then
		self.DebuffHighlightAlpha = 1
		self.DebuffHighlightBackdrop = true
		self.DebuffHighlightFilter = true
	end
	
	if C["unitframes"].showrange == true then
		local range = {insideAlpha = 1, outsideAlpha = C["unitframes"].raidalphaoor}
		self.Range = range
	end
	
	if C["unitframes"].showsmooth == true then
		health.Smooth = true
		power.Smooth = true
	end
	
	if C["unitframes"].healcomm then
		local mhpb = CreateFrame('StatusBar', nil, self.Health)
		if C["unitframes"].gridhealthvertical then
			mhpb:SetOrientation("VERTICAL")
			mhpb:SetPoint('BOTTOM', self.Health:GetStatusBarTexture(), 'TOP', 0, 0)
			mhpb:Width(60*C["unitframes"].gridscale*T.raidscale)
			mhpb:Height(30*C["unitframes"].gridscale*T.raidscale)
		else
			mhpb:SetPoint('TOPLEFT', self.Health:GetStatusBarTexture(), 'TOPRIGHT', 0, 0)
			mhpb:SetPoint('BOTTOMLEFT', self.Health:GetStatusBarTexture(), 'BOTTOMRIGHT', 0, 0)
			mhpb:Width(60*C["unitframes"].gridscale*T.raidscale)
		end				
		mhpb:SetStatusBarTexture(normTex)
		mhpb:SetStatusBarColor(0,1,.5,.25)

		local ohpb = CreateFrame('StatusBar', nil, self.Health)
		if C["unitframes"].gridhealthvertical then
			ohpb:SetOrientation("VERTICAL")
			ohpb:SetPoint('BOTTOM', mhpb:GetStatusBarTexture(), 'TOP', 0, 0)
			ohpb:Width(60*C["unitframes"].gridscale*T.raidscale)
			ohpb:Height(30*C["unitframes"].gridscale*T.raidscale)
		else
			ohpb:SetPoint('TOPLEFT', mhpb:GetStatusBarTexture(), 'TOPRIGHT', 0, 0)
			ohpb:SetPoint('BOTTOMLEFT', mhpb:GetStatusBarTexture(), 'BOTTOMRIGHT', 0, 0)
			ohpb:Width(60*C["unitframes"].gridscale*T.raidscale)
		end
		ohpb:SetStatusBarTexture(normTex)
		ohpb:SetStatusBarColor(0,1,0,.25)

		self.HealPrediction = {
			myBar = mhpb,
			otherBar = ohpb,
			maxOverflow = 1,
		}
	end
	
	if C["unitframes"].raidunitdebuffwatch == true then
		-- AuraWatch (corner icon)
		T.createAuraWatch(self,unit)
		
		-- Raid Debuffs (big middle icon)
		local RaidDebuffs = CreateFrame('Frame', nil, self)
		RaidDebuffs:Height(22*C["unitframes"].gridscale)
		RaidDebuffs:Width(22*C["unitframes"].gridscale)
		RaidDebuffs:Point('CENTER', health, 0, 0)
		RaidDebuffs:SetFrameStrata(health:GetFrameStrata())
		RaidDebuffs:SetFrameLevel(health:GetFrameLevel() + 2)
		
		RaidDebuffs:SetTemplate("Default")
		
		RaidDebuffs.icon = RaidDebuffs:CreateTexture(nil, 'OVERLAY')
		RaidDebuffs.icon:SetTexCoord(.1,.9,.1,.9)
		RaidDebuffs.icon:Point("TOPLEFT", 2, -2)
		RaidDebuffs.icon:Point("BOTTOMRIGHT", -2, 2)
		
		if C["unitframes"].auratimer then
			RaidDebuffs.cd = CreateFrame('Cooldown', nil, RaidDebuffs)
			RaidDebuffs.cd:Point("TOPLEFT", 2, -2)
			RaidDebuffs.cd:Point("BOTTOMRIGHT", -2, 2)
			RaidDebuffs.cd.noOCC = true -- remove this line if you want cooldown number on it
		end
		
		RaidDebuffs.count = RaidDebuffs:CreateFontString(nil, 'OVERLAY')
		RaidDebuffs.count:SetFont(C["media"].uffont, 9*C["unitframes"].gridscale, "THINOUTLINE")
		RaidDebuffs.count:SetPoint('BOTTOMRIGHT', RaidDebuffs, 'BOTTOMRIGHT', 0, 2)
		RaidDebuffs.count:SetTextColor(1,.9,0)
		
		self.RaidDebuffs = RaidDebuffs
    end

	return self
end

oUF:RegisterStyle('TukuiHealR25R40', Shared)
oUF:Factory(function(self)
	oUF:SetActiveStyle("TukuiHealR25R40")	
	if C["unitframes"].gridonly ~= true then
		local raid = self:SpawnHeader("TukuiGrid", nil, "custom [@raid16,exists] show;hide",
			'oUF-initialConfigFunction', [[
				local header = self:GetParent()
				self:SetWidth(header:GetAttribute('initial-width'))
				self:SetHeight(header:GetAttribute('initial-height'))
			]],
			'initial-width', T.Scale(66*C["unitframes"].gridscale*T.raidscale),
			'initial-height', T.Scale(50*C["unitframes"].gridscale*T.raidscale),	
			"showRaid", true,
			"xoffset", T.Scale(3),
			"yOffset", T.Scale(-3),
			"point", "LEFT",
			"groupFilter", "1,2,3,4,5,6,7,8",
			"groupingOrder", "1,2,3,4,5,6,7,8",
			"groupBy", "GROUP",
			"maxColumns", 8,
			"unitsPerColumn", 5,
			"columnSpacing", T.Scale(3),
			"columnAnchorPoint", "TOP"		
		)
		raid:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 18, -250*T.raidscale)
	else
		local raid = self:SpawnHeader("TukuiGrid", nil, "raid,party",
			'oUF-initialConfigFunction', [[
				local header = self:GetParent()
				self:SetWidth(header:GetAttribute('initial-width'))
				self:SetHeight(header:GetAttribute('initial-height'))
			]],
			'initial-width', T.Scale(60*C["unitframes"].gridscale*T.raidscale),
			'initial-height', T.Scale(31*C["unitframes"].gridscale*T.raidscale),
			"showParty", true,
			"showPlayer", C["unitframes"].showplayerinparty, 
			"showRaid", true, 
			"xoffset", T.Scale(3),
			"yOffset", T.Scale(-3),
			"point", "LEFT",
			"groupFilter", "1,2,3,4,5,6,7,8",
			"groupingOrder", "1,2,3,4,5,6,7,8",
			"groupBy", "GROUP",
			"maxColumns", 8,
			"unitsPerColumn", 5,
			"columnSpacing", T.Scale(3),
			"columnAnchorPoint", "TOP"		
		)
		raid:SetPoint("BOTTOM", TukuiViewport, "TOP", 0, 90*T.raidscale)
		
		local pets = {} 
			pets[1] = oUF:Spawn('partypet1', 'oUF_TukuiPartyPet1') 
			pets[1]:Point('TOPLEFT', raid, 'TOPLEFT', 0, -50*C["unitframes"].gridscale*T.raidscale + -3)
			pets[1]:Size(60*C["unitframes"].gridscale*T.raidscale, 31*C["unitframes"].gridscale*T.raidscale)
		for i = 2, 4 do 
			pets[i] = oUF:Spawn('partypet'..i, 'oUF_TukuiPartyPet'..i) 
			pets[i]:Point('LEFT', pets[i-1], 'RIGHT', 3, 0)
			pets[i]:Size(60*C["unitframes"].gridscale*T.raidscale, 31*C["unitframes"].gridscale*T.raidscale)
		end
		
		if C.unitframes.pets then
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
	end
end)

-- only show 5 groups in raid (25 mans raid)
local MaxGroup = CreateFrame("Frame")
MaxGroup:RegisterEvent("PLAYER_ENTERING_WORLD")
MaxGroup:RegisterEvent("ZONE_CHANGED_NEW_AREA")
MaxGroup:SetScript("OnEvent", function(self)
	local inInstance, instanceType = IsInInstance()
	local _, _, _, _, maxPlayers, _, _ = GetInstanceInfo()
	if inInstance and instanceType == "raid" and maxPlayers ~= 40 then
		TukuiGrid:SetAttribute("groupFilter", "5,4,3,2,1")
	else
		TukuiGrid:SetAttribute("groupFilter", "8,7,6,5,4,3,2,1")
	end
end)