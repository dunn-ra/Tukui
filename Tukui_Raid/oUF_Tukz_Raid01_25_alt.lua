local ADDON_NAME, ns = ...
local oUF = oUFTukui or oUF
assert(oUF, "Tukui was unable to locate oUF install.")

ns._Objects = {}
ns._Headers = {}

local T, C, L = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales
if not C["unitframes"].enable == true or not C["unitframes"].dpsdebuff == true then return end
if C["unitframes"].enableraidframes ~= true then return end

local font2 = C["media"].uffont
local font1 = C["media"].font
local dn = C["unitframes"].debuffnumber

local function Shared(self, unit)
	self.colors = T.oUF_colors
	self:RegisterForClicks("AnyUp")
	self:SetScript('OnEnter', UnitFrame_OnEnter)
	self:SetScript('OnLeave', UnitFrame_OnLeave)
	
	self.menu = T.SpawnMenu
	
	self:SetBackdrop({bgFile = C["media"].blank, insets = {top = -T.mult, left = -T.mult, bottom = -T.mult, right = -T.mult}})
	self:SetBackdropColor(0,0,0)
	
	local health = CreateFrame('StatusBar', nil, self)
	health:Height(T.Scale(17*T.raidscale))
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
		health:SetStatusBarColor(unpack(C["unitframes"].hpcolor))
		health.bg:SetVertexColor(unpack(C["unitframes"].hpbg))
	else
		health.colorDisconnected = true	
		health.colorClass = true
		health.colorReaction = true			
	end
	
	local power = CreateFrame("StatusBar", nil, self)
	power:Height(T.Scale(2*T.raidscale))
	power:Point("TOPLEFT", health, "BOTTOMLEFT", 0, -1)
	power:SetPoint("TOPRIGHT", health, "BOTTOMRIGHT", 0, -1)
	power:SetStatusBarTexture(C["media"].normTex)
	self.Power = power
	
	power.frequentUpdates = true
	power.colorDisconnected = true

	power.bg = self.Power:CreateTexture(nil, "BORDER")
	power.bg:SetAllPoints(power)
	power.bg:SetTexture(C["media"].normTex)
	power.bg:SetAlpha(1)
	power.bg.multiplier = 0.4
	self.Power.bg = power.bg
	
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
	
	local name = health:CreateFontString(nil, 'OVERLAY')
	name:SetFont(font2, 11*T.raidscale, "THINOUTLINE")
	name:Point("LEFT", self, "LEFT", 5, 2)
	
	if C["unitframes"].unicolor == true then
		self:Tag(name, '[Tukui:getnamecolor][Tukui:namemedium] [Tukui:dead][Tukui:afk]')
	else
		self:Tag(name, "[Tukui:namemedium] [Tukui:dead][Tukui:afk]")
		name:SetTextColor(unpack(C["media"].tncolor))
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
	
	if C["unitframes"].aggro == true then
		table.insert(self.__elements, T.UpdateThreat)
		self:RegisterEvent('PLAYER_TARGET_CHANGED', T.UpdateThreat)
		self:RegisterEvent('UNIT_THREAT_LIST_UPDATE', T.UpdateThreat)
		self:RegisterEvent('UNIT_THREAT_SITUATION_UPDATE', T.UpdateThreat)
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
	
	local debuffs = CreateFrame('Frame', nil, self)
    debuffs:SetPoint('LEFT', self, 'RIGHT', 4, 0)
    debuffs:SetHeight(T.Scale(20*T.raidscale))
    debuffs:SetWidth(T.Scale(200*T.raidscale))
    debuffs.size = (T.Scale(20*T.raidscale))
    debuffs.spacing = 2
    debuffs.initialAnchor = 'LEFT'
	debuffs.num = dn
	debuffs.PostCreateIcon = T.PostCreateAura
	debuffs.PostUpdateIcon = T.PostUpdateAura
	self.Debuffs = debuffs
	
	self.DebuffHighlightAlpha = 1
	self.DebuffHighlightBackdrop = true
	self.DebuffHighlightFilter = true
	
	--local picon = self.Health:CreateTexture(nil, 'OVERLAY')
	--picon:SetPoint('CENTER', self.Health)
	--picon:SetSize(16, 16)
	--picon:SetTexture[[Interface\AddOns\Tukui\media\textures\picon]]
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

oUF:RegisterStyle('TukuiDpsP05R10R15R25db', Shared)
oUF:Factory(function(self)
	oUF:SetActiveStyle("TukuiDpsP05R10R15R25db")

	local raid = self:SpawnHeader("oUF_TukuiDpsRaid05101525db", nil, "custom [@raid26,exists] hide;show",
		'oUF-initialConfigFunction', [[
			local header = self:GetParent()
			self:SetWidth(header:GetAttribute('initial-width'))
			self:SetHeight(header:GetAttribute('initial-height'))
		]],
		'initial-width', T.Scale(95*T.raidscale),
		'initial-height', T.Scale(20*T.raidscale),	
		"showParty", true,
		"showPlayer", C["unitframes"].showplayerinparty,
		"showRaid", true,
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"yOffset", T.Scale(-4*T.raidscale)
	)
	raid:SetPoint('TOPLEFT', UIParent, 1, -300*T.raidscale)
	
	if C.unitframes.pets then
		local pets = {} 
			pets[1] = oUF:Spawn('partypet1', 'oUF_TukuiPartyPet1') 
			pets[1]:SetPoint('TOPLEFT', raid, 'TOPLEFT', 0, -120*T.raidscale)
			pets[1]:Size(95*T.raidscale, 15*T.raidscale)
		for i =2, 4 do 
			pets[i] = oUF:Spawn('partypet'..i, 'oUF_TukuiPartyPet'..i) 
			pets[i]:SetPoint('TOP', pets[i-1], 'BOTTOM', 0, -8)
			pets[i]:Size(95*T.raidscale, 15*T.raidscale)
		end
	end
	
	local RaidMove = CreateFrame("Frame")
	RaidMove:RegisterEvent("PLAYER_LOGIN")
	RaidMove:RegisterEvent("RAID_ROSTER_UPDATE")
	RaidMove:RegisterEvent("PARTY_LEADER_CHANGED")
	RaidMove:RegisterEvent("PARTY_MEMBERS_CHANGED")
	RaidMove:SetScript("OnEvent", function(self)
		if InCombatLockdown() then
			self:RegisterEvent("PLAYER_REGEN_ENABLED")
		else
			self:UnregisterEvent("PLAYER_REGEN_ENABLED")
			local numraid = GetNumRaidMembers()
			local numparty = GetNumPartyMembers()
			if numparty > 0 and numraid == 0 or numraid > 0 and numraid <= 5 then
				raid:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 10, -399*T.raidscale)
				if C.unitframes.pets then for i,v in ipairs(pets) do v:Disable() end end
			elseif numraid > 5 and numraid < 11 then
				raid:SetPoint('TOPLEFT', UIParent, 15, -300*T.raidscale)
				if C.unitframes.pets then for i,v in ipairs(pets) do v:Disable() end end
			elseif numraid > 10 and numraid < 16 then
				raid:SetPoint('TOPLEFT', UIParent, 15, -230*T.raidscale)
				if C.unitframes.pets then for i,v in ipairs(pets) do v:Disable() end end
			elseif numraid > 15 and numraid < 26 then
				raid:SetPoint('TOPLEFT', UIParent, 15, -150*T.raidscale)
				if C.unitframes.pets then for i,v in ipairs(pets) do v:Disable() end end
			elseif numraid > 25 then
				if C.unitframes.pets then for i,v in ipairs(pets) do v:Disable() end end
			end
		end
	end)
end)