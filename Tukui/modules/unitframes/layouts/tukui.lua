local ADDON_NAME, ns = ...
local oUF = ns.oUF or oUF
assert(oUF, "Tukui was unable to locate oUF install.")

ns._Objects = {}
ns._Headers = {}

local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales
if not C["unitframes"].enable == true then return end

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local font1 = C["media"].uffont
local font2 = C["media"].font
local normTex = C["media"].normTex
local hpTex = C["media"].hpTex
local glowTex = C["media"].glowTex
local bubbleTex = C["media"].bubbleTex
local uf = C["ufsizes"]

local ufwidth
local hpheight
local cbplayer
local cbtarget

local backdrop = {
	bgFile = C["media"].blank,
	insets = {top = -T.mult, left = -T.mult, bottom = -T.mult, right = -T.mult},
}

------------------------------------------------------------------------
--	Layout
------------------------------------------------------------------------

local function Shared(self, unit)
	-- set our own colors
	self.colors = T.oUF_colors
	
	-- register click
	self:RegisterForClicks("AnyUp")
	self:SetScript('OnEnter', UnitFrame_OnEnter)
	self:SetScript('OnLeave', UnitFrame_OnLeave)
	
	-- menu? lol
	self.menu = T.SpawnMenu

	-- backdrop for every units
	self:SetBackdrop(backdrop)
	self:SetBackdropColor(0, 0, 0)

	-- this is the glow border
	self:CreateShadow("Default")
	
	-- unitframe sizes
	if T.lowversion then
		ufwidth = T.Scale(180)
	else
		ufwidth = T.Scale(250)
	end
	hpheight = T.Scale(uf.playerheight)
	pwrheight = T.Scale(uf.playerheight/4)
	ufheight = T.Scale(pwrheight+hpheight+1)
	--assisttank_width = TukuiDB.Scale(ui.assisttankw)
	--assisttank_height = TukuiDB.Scale(ui.assisttankh)
	cbplayer = T.Scale(uf.playercastbar)
	cbtarget = T.Scale(uf.targetcastbar)
	-- small frames
	sufwidth = T.Scale((ufwidth/5)*2)
	shpheight = T.Scale(hpheight*0.8)
	spwrheight = T.Scale(pwrheight*0.8)
	sufheight = T.Scale(ufheight*0.8)
	
	------------------------------------------------------------------------
	--	Features we want for all units at the same time
	------------------------------------------------------------------------
	
	-- here we create an invisible frame for all element we want to show over health/power.
	local InvFrame = CreateFrame("Frame", nil, self)
	InvFrame:SetFrameStrata("HIGH")
	InvFrame:SetFrameLevel(5)
	InvFrame:SetAllPoints()
	
	-- symbols, now put the symbol on the frame we created above.
	local RaidIcon = InvFrame:CreateTexture(nil, "OVERLAY")
	RaidIcon:SetTexture("Interface\\AddOns\\Tukui\\medias\\textures\\raidicons.blp") -- thx hankthetank for texture
	RaidIcon:SetHeight(20)
	RaidIcon:SetWidth(20)
	if unit == "player" then
		RaidIcon:SetAlpha(0)
	elseif unit == "target" then
		RaidIcon:SetPoint("TOP", 0, 10)
	end
	self.RaidIcon = RaidIcon
	
	------------------------------------------------------------------------
	--	Player and Target units layout (mostly mirror'd)
	------------------------------------------------------------------------
	
	if (unit == "player" or unit == "target") then
		-- create a panel
		local panel = CreateFrame("Frame", nil, self)
		panel:CreatePanel("Default", ufwidth, ufheight, "BOTTOM", self, "BOTTOM", 0, 0)
		panel:SetFrameLevel(2)
		panel:SetFrameStrata("MEDIUM")
		panel:SetBackdropBorderColor(unpack(C["media"].altbordercolor))
		self.panel = panel
		panel:Hide()
	
		-- health bar
		local health = CreateFrame('StatusBar', nil, self)
		health:Height(hpheight)
		health:SetPoint("TOPLEFT")
		health:SetPoint("TOPRIGHT")
		health:SetStatusBarTexture(hpTex)
				
		-- health bar background
		local healthBG = health:CreateTexture(nil, 'BORDER')
		healthBG:SetAllPoints()
		
		health.value = T.SetFontString(health, font1, 10)
		health.value:SetShadowOffset(T.mult, -T.mult)
		health.value:Point("RIGHT", health, "RIGHT", -5, 0)
		health.PostUpdate = T.PostUpdateHealth
				
		self.Health = health
		self.Health.bg = healthBG

		health.frequentUpdates = true
		if C["unitframes"].showsmooth == true then
			health.Smooth = true
		end
		
		if C["unitframes"].unicolor == true then
			health.colorTapping = false
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor(unpack(C["media"].healthcolor))
			healthBG:SetTexture(unpack(C["media"].healthdeficit))
		else
			health.colorDisconnected = true
			health.colorTapping = true	
			health.colorClass = true
			health.colorReaction = true
			healthBG:SetTexture(unpack(C["media"].unihealthcolor))
		end

		-- power
		local power = CreateFrame('StatusBar', nil, self)
		power:Height(pwrheight)
		power:Point("TOPLEFT", health, "BOTTOMLEFT", 0, -1)
		power:Point("TOPRIGHT", health, "BOTTOMRIGHT", 0, -1)
		power:SetStatusBarTexture(normTex)
		
		local powerBG = power:CreateTexture(nil, 'BORDER')
		powerBG:SetAllPoints(power)
		powerBG:SetTexture(normTex)
		powerBG.multiplier = 0.3
		
		power.value = T.SetFontString(health, font1, 10)
		power.value:Point("LEFT", health, "LEFT", 5, 0)
		power.PreUpdate = T.PreUpdatePower
		power.PostUpdate = T.PostUpdatePower
				
		self.Power = power
		self.Power.bg = powerBG
		
		power.frequentUpdates = true
		power.colorDisconnected = true

		if C["unitframes"].showsmooth == true then
			power.Smooth = true
		end
		
		if C["unitframes"].unicolor == true then
			power.colorTapping = true
			power.colorClass = true
			--powerBG.multiplier = 0.1				
		else
			power.colorPower = true
		end
		
		-- Unit name
		local Name = health:CreateFontString(nil, "OVERLAY")
		Name:SetJustifyH("LEFT")
		Name:SetFont(font1, 12, "THINOUTLINE")
		if (unit == "player") and C["unitframes"].displayname == true then
			Name:Point("TOPRIGHT", panel, "BOTTOMRIGHT", 0, -3)
			self:Tag(Name, '[Tukui:getnamecolor][Tukui:namelong]')
		elseif (unit == "target") then
			Name:Point("TOPLEFT", panel, "BOTTOMLEFT", 0, -3)
			self:Tag(Name, '[Tukui:getnamecolor][Tukui:namelong] [Tukui:diffcolor][level] [shortclassification]')
			Name.colorTapping = true
		end

		-- portraits
		if (C["unitframes"].charportrait == true) then
			local portrait = CreateFrame("PlayerModel", self:GetName().."_Portrait", self)
			portrait:SetFrameLevel(2)
			portrait:SetAlpha(1)
			portrait:SetWidth(ufheight*2)
			portrait:SetHeight((ufheight*2)-1)
			if unit == "player" then
				portrait:Point("TOPRIGHT", panel, "TOPLEFT", -5, 0)
			elseif unit == "target" then
				portrait:Point("TOPLEFT", panel, "TOPRIGHT", 5, 0)
			end
			table.insert(self.__elements, T.HidePortrait)
			self.Portrait = portrait
			
			portrait.bg = CreateFrame("Frame", nil, portrait)
			portrait.bg:CreatePanel("Default", 1, 1, "BOTTOMLEFT", portrait, "BOTTOMLEFT", 0, -1)
			portrait.bg:Point("TOPRIGHT", portrait, "TOPRIGHT", 0, 0)
			portrait.bg:SetBackdrop(backdrop)
			portrait.bg:SetBackdropColor(0,0,0)
		end
		
		if T.myclass == "PRIEST" and C["unitframes"].weakenedsoulbar then
			local ws = CreateFrame("StatusBar", self:GetName().."_WeakenedSoul", power)
			ws:SetAllPoints(power)
			ws:SetStatusBarTexture(C.media.normTex)
			ws:GetStatusBarTexture():SetHorizTile(false)
			ws:SetBackdrop(backdrop)
			ws:SetBackdropColor(unpack(C.media.backdropcolor))
			ws:SetStatusBarColor(191/255, 10/255, 10/255)
			
			self.WeakenedSoul = ws
		end
		
		--[[ leaving here just in case someone want to use it, we now use our own Alt Power Bar.
		-- alt power bar
		local AltPowerBar = CreateFrame("StatusBar", self:GetName().."_AltPowerBar", self.Health)
		AltPowerBar:SetFrameLevel(0)
		AltPowerBar:SetFrameStrata("LOW")
		AltPowerBar:SetHeight(5)
		AltPowerBar:SetStatusBarTexture(C.media.normTex)
		AltPowerBar:GetStatusBarTexture():SetHorizTile(false)
		AltPowerBar:SetStatusBarColor(163/255,  24/255,  24/255)
		AltPowerBar:EnableMouse(true)

		AltPowerBar:Point("LEFT", TukuiInfoLeft, 2, -2)
		AltPowerBar:Point("RIGHT", TukuiInfoLeft, -2, 2)
		AltPowerBar:Point("TOP", TukuiInfoLeft, 2, -2)
		AltPowerBar:Point("BOTTOM", TukuiInfoLeft, -2, 2)
		
		AltPowerBar:SetBackdrop({
			bgFile = C["media"].blank, 
			edgeFile = C["media"].blank, 
			tile = false, tileSize = 0, edgeSize = 1, 
			insets = { left = 0, right = 0, top = 0, bottom = T.Scale(-1)}
		})
		AltPowerBar:SetBackdropColor(0, 0, 0)

		self.AltPowerBar = AltPowerBar
		--]]
			
		if (unit == "player") then
			local AggroInd = CreateFrame("Frame", nil, health)
			AggroInd:SetPoint("TOPLEFT", health, "TOPLEFT", -1, 1)
			AggroInd:SetPoint("BOTTOMRIGHT", power, "BOTTOMRIGHT", 1, -1)
			AggroInd:SetTemplate("Transparent")
			AggroInd:SetFrameLevel(1)
			AggroInd:SetAlpha(0)
			self.AggroInd = AggroInd
			
			-- combat icon
			local Combat = health:CreateTexture(nil, "OVERLAY")
			Combat:Height(ufheight)
			Combat:Width(ufheight)
			Combat:SetPoint("LEFT", panel, "RIGHT", 3, 0)
			Combat:SetVertexColor(0.69, 0.31, 0.31)
			self.Combat = Combat

			-- custom info (low mana warning)
			FlashInfo = CreateFrame("Frame", "TukuiFlashInfo", self)
			FlashInfo:SetScript("OnUpdate", T.UpdateManaLevel)
			FlashInfo.parent = self
			FlashInfo:SetAllPoints(panel)
			FlashInfo.ManaLevel = T.SetFontString(FlashInfo, font1, 12, "OUTLINE")
			FlashInfo.ManaLevel:SetPoint("TOP", power, "BOTTOM", 0, -1)
			self.FlashInfo = FlashInfo
			
			-- pvp status text
			local status = T.SetFontString(panel, font1, 12)
			status:SetPoint("CENTER", panel, "CENTER", 0, 0)
			status:SetTextColor(0.69, 0.31, 0.31)
			--status:Hide()
			self.Status = status
			self:Tag(status, "[pvp]")
			
			-- leader icon
			local Leader = InvFrame:CreateTexture(nil, "OVERLAY")
			Leader:Height(14)
			Leader:Width(14)
			Leader:Point("TOPLEFT", 2, 8)
			self.Leader = Leader
			
			-- master looter
			local MasterLooter = InvFrame:CreateTexture(nil, "OVERLAY")
			MasterLooter:Height(14)
			MasterLooter:Width(14)
			self.MasterLooter = MasterLooter
			self:RegisterEvent("PARTY_LEADER_CHANGED", T.MLAnchorUpdate)
			self:RegisterEvent("PARTY_MEMBERS_CHANGED", T.MLAnchorUpdate)

			-- experience bar on player via mouseover for player currently levelling a character
			if not C["stexperience"].enable == true then
				if T.level ~= MAX_PLAYER_LEVEL then
					local Experience = CreateFrame("StatusBar", self:GetName().."_Experience", self)
					Experience:SetStatusBarTexture(normTex)
					Experience:SetStatusBarColor(0, 0.4, 1, .8)
					Experience:SetBackdrop(backdrop)
					Experience:SetBackdropColor(unpack(C["media"].backdropcolor))
					Experience:Width(ufwidth)
					Experience:Height(pwrheight)
					Experience:Point("TOPLEFT", power, 0, 0)
					Experience:Point("BOTTOMRIGHT", power, 0, 0)
					Experience:SetFrameLevel(10)
					Experience:SetAlpha(0)				
					Experience:HookScript("OnEnter", function(self) self:SetAlpha(1) end)
					Experience:HookScript("OnLeave", function(self) self:SetAlpha(0) end)
					Experience.Tooltip = true						
					Experience.Rested = CreateFrame('StatusBar', nil, self)
					Experience.Rested:SetParent(Experience)
					Experience.Rested:SetAllPoints(Experience)
					local Resting = Experience:CreateTexture(nil, "OVERLAY")
					Resting:SetHeight(22)
					Resting:SetWidth(22)
					if T.myclass == "SHAMAN" or T.myclass == "DEATHKNIGHT" or T.myclass == "PALADIN" or T.myclass == "WARLOCK" or T.myclass == "DRUID" or T.myclass == "ROGUE" then
						Resting:SetPoint("BOTTOMLEFT", -11, (hpheight+4+(pwrheight*2)))
					else
						Resting:SetPoint("BOTTOMLEFT", -11, (hpheight+4+pwrheight))
					end
					Resting:SetTexture([=[Interface\CharacterFrame\UI-StateIcon]=])
					Resting:SetTexCoord(0, 0.5, 0, 0.421875)
					self.Resting = Resting
					self.Experience = Experience
				end

				-- reputation bar for max level character
				if T.level == MAX_PLAYER_LEVEL then
					local Reputation = CreateFrame("StatusBar", self:GetName().."_Reputation", self)
					Reputation:SetStatusBarTexture(normTex)
					Reputation:SetBackdrop(backdrop)
					Reputation:SetBackdropColor(unpack(C["media"].backdropcolor))
					Reputation:Width(ufwidth)
					Reputation:Height(pwrheight)
					Reputation:Point("TOPLEFT", power, 0, 0)
					Reputation:Point("BOTTOMRIGHT", power, 0, 0)
					Reputation:SetFrameLevel(10)
					Reputation:SetAlpha(0)

					Reputation:HookScript("OnEnter", function(self) self:SetAlpha(1) end)
					Reputation:HookScript("OnLeave", function(self) self:SetAlpha(0) end)

					Reputation.PostUpdate = T.UpdateReputationColor
					Reputation.Tooltip = true
					self.Reputation = Reputation
				end
			end
			
			-- show druid mana when shapeshifted in bear, cat or whatever
			if T.myclass == "DRUID" then
				CreateFrame("Frame"):SetScript("OnUpdate", function() T.UpdateDruidMana(self) end)
				local DruidMana = T.SetFontString(health, font1, 9)
				DruidMana:SetTextColor(1, 0.49, 0.04)
				self.DruidMana = DruidMana
			end
			
			if C["unitframes"].classbar then
				if T.myclass == "DRUID" then			
					local eclipseBar = CreateFrame('Frame', nil, self)
					eclipseBar:Point("BOTTOMLEFT", self, "TOPLEFT", 0, 1)
					eclipseBar:Width(ufwidth)
					eclipseBar:Height(pwrheight)
					eclipseBar:SetFrameStrata("MEDIUM")
					eclipseBar:SetFrameLevel(8)
					eclipseBar:SetTemplate("Default")
					eclipseBar:SetBackdropBorderColor(0,0,0,0)
					eclipseBar:SetScript("OnShow", function() T.EclipseDisplay(self, false) end)
					eclipseBar:SetScript("OnUpdate", function() T.EclipseDisplay(self, true) end) -- just forcing 1 update on login for buffs/shadow/etc.
					eclipseBar:SetScript("OnHide", function() T.EclipseDisplay(self, false) end)
					
					local lunarBar = CreateFrame('StatusBar', nil, eclipseBar)
					lunarBar:SetPoint('LEFT', eclipseBar, 'LEFT', 0, 0)
					lunarBar:SetSize(eclipseBar:GetWidth(), eclipseBar:GetHeight())
					lunarBar:SetStatusBarTexture(normTex)
					lunarBar:SetStatusBarColor(.30, .52, .90)
					eclipseBar.LunarBar = lunarBar

					local solarBar = CreateFrame('StatusBar', nil, eclipseBar)
					solarBar:SetPoint('LEFT', lunarBar:GetStatusBarTexture(), 'RIGHT', 0, 0)
					solarBar:SetSize(eclipseBar:GetWidth(), eclipseBar:GetHeight())
					solarBar:SetStatusBarTexture(normTex)
					solarBar:SetStatusBarColor(.80, .82,  .60)
					eclipseBar.SolarBar = solarBar

					local eclipseBarText = eclipseBar:CreateFontString(nil, 'OVERLAY')
					eclipseBarText:SetPoint('CENTER', health, "CENTER", 0, 0)
					eclipseBarText:SetFont(font1, 11, "OUTLINE")
					eclipseBar.PostUpdatePower = T.EclipseDirection
					
					-- hide "low mana" text on load if eclipseBar is show
					if eclipseBar and eclipseBar:IsShown() then FlashInfo.ManaLevel:SetAlpha(0) end

					self.EclipseBar = eclipseBar
					self.EclipseBar.Text = eclipseBarText
				end

				-- set holy power bar or shard bar
				if (T.myclass == "WARLOCK" or T.myclass == "PALADIN") then					
					local bars = CreateFrame("Frame", nil, self)
					bars:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 1)
					bars:Width(ufwidth)
					bars:Height(pwrheight)
					bars:SetBackdrop(backdrop)
					bars:SetBackdropColor(0, 0, 0)
					
					for i = 1, 3 do					
						bars[i] = CreateFrame("StatusBar", self:GetName().."_Shard"..i, self)
						bars[i]:Height(pwrheight)				
						bars[i]:SetStatusBarTexture(normTex)
						bars[i]:GetStatusBarTexture():SetHorizTile(false)

						bars[i].bg = bars[i]:CreateTexture(nil, 'BORDER')
						
						if TukuiDB.myclass == "WARLOCK" then
							bars[i]:SetStatusBarColor(153/255,102/255,204/255)
							bars[i].bg:SetTexture(255/255,102/255,104/255)
						elseif TukuiDB.myclass == "PALADIN" then
							bars[i]:SetStatusBarColor(228/255,225/255,16/255)
							bars[i].bg:SetTexture(228/255,225/255,16/255)
						end
						
						if i == 1 then
							bars[i]:SetPoint("LEFT", bars)
							bars[i]:Width((ufwidth - 3) / 3)
							bars[i].bg:SetAllPoints(bars[i])
						else
							bars[i]:Point("LEFT", bars[i-1], "RIGHT", 1, 0)
							bars[i]:Width((ufwidth - 2) / 3)
							bars[i].bg:SetAllPoints(bars[i])
						end
						
						bars[i].bg:SetTexture(normTex)					
						bars[i].bg:SetAlpha(.6)
					end
					
					if T.myclass == "WARLOCK" then
						bars.Override = T.UpdateShards
						self.SoulShards = bars
					elseif T.myclass == "PALADIN" then
						bars.Override = T.UpdateHoly
						self.HolyPower = bars
					end
				end

				-- deathknight runes
				if T.myclass == "DEATHKNIGHT" then
					local Runes = CreateFrame("Frame", nil, self)
					Runes:Point("BOTTOMLEFT", self, "TOPLEFT", 0,1)
					Runes:Height(pwrheight)
					Runes:Width(ufwidth)
					Runes:SetBackdrop(backdrop)
					Runes:SetBackdropColor(0, 0, 0)

					for i = 1, 6 do
						Runes[i] = CreateFrame("StatusBar", self:GetName().."_Runes"..i, health)
						Runes[i]:SetHeight(pwrheight)
						if i == 1 then
							Runes[i]:Width(((ufwidth - 7) / 6) -1)
						else
							Runes[i]:Width((ufwidth - 7) / 6)
						end
						if (i == 1) then
							Runes[i]:Point("BOTTOMLEFT", self, "TOPLEFT", 0, 1)
						else
							Runes[i]:Point("TOPLEFT", Runes[i-1], "TOPRIGHT", 1, 0)
						end
						Runes[i]:SetStatusBarTexture(normTex)
						Runes[i]:GetStatusBarTexture():SetHorizTile(false)
					end

					self.Runes = Runes
				end
				
				-- shaman totem bar
				if T.myclass == "SHAMAN" then
					local TotemBar = {}
					TotemBar.Destroy = true
					for i = 1, 4 do
						TotemBar[i] = CreateFrame("StatusBar", self:GetName().."_TotemBar"..i, self)

						if i == 1 then
						   TotemBar[i]:Point("BOTTOMLEFT", self, "TOPLEFT", 0, 1)
						   TotemBar[i]:Width(((ufwidth-3)/4)-1)
						else
						   TotemBar[i]:Point("TOPLEFT", TotemBar[i-1], "TOPRIGHT", 1, 0)
						   TotemBar[i]:Width((ufwidth-3)/4)
						end

						TotemBar[i]:SetStatusBarTexture(normTex)
						TotemBar[i]:Height(pwrheight)
						TotemBar[i]:SetBackdrop(backdrop)
						TotemBar[i]:SetBackdropColor(0, 0, 0)
						TotemBar[i]:SetMinMaxValues(0, 1)

						TotemBar[i].bg = TotemBar[i]:CreateTexture(nil, "BORDER")
						TotemBar[i].bg:SetAllPoints(TotemBar[i])
						TotemBar[i].bg:SetTexture(normTex)
						TotemBar[i].bg.multiplier = 0.3
					end
					self.TotemBar = TotemBar
				end
				
				-- combo points
				if T.myclass == "ROGUE" or T.myclass == "DRUID" then
					local CPoints = {}
					CPoints.unit = PlayerFrame.unit
					for i = 1, 5 do
						CPoints[i] = CreateFrame("StatusBar", "ComboPoint"..i, self)
						CPoints[i]:Height(pwrheight)
						CPoints[i]:SetStatusBarTexture(normTex)
						CPoints[i]:GetStatusBarTexture():SetHorizTile(false)
						CPoints[i]:SetBackdrop(backdrop)
						CPoints[i]:SetBackdropColor(0, 0, 0)

						if i == 1 then
							CPoints[i]:Point("BOTTOMLEFT", TukuiPlayer, "TOPLEFT", 0, 1)
							CPoints[i]:Width(((ufwidth - 6) / 5)+1)
						else
							CPoints[i]:Point("TOPLEFT", CPoints[i-1], "TOPRIGHT", 1, 0)
							CPoints[i]:Width((ufwidth - 6) / 5)
						end
					end
					CPoints[1]:SetStatusBarColor(.69,.31,.31)
					CPoints[2]:SetStatusBarColor(.69,.31,.31)
					CPoints[3]:SetStatusBarColor(.65,.63,.35)
					CPoints[4]:SetStatusBarColor(.65,.63,.35)
					CPoints[5]:SetStatusBarColor(.33,.59,.33)
					self.CPoints = CPoints
				end
			end
			
			-- script for pvp status and low mana
			self:SetScript("OnEnter", function(self)
				if self.EclipseBar and self.EclipseBar:IsShown() then 
					self.EclipseBar.Text:Hide()
				end
				FlashInfo.ManaLevel:Hide()
				status:Show()
				UnitFrame_OnEnter(self) 
			end)
			self:SetScript("OnLeave", function(self) 
				if self.EclipseBar and self.EclipseBar:IsShown() then 
					self.EclipseBar.Text:Show()
				end
				FlashInfo.ManaLevel:Show()
				status:Hide()
				UnitFrame_OnLeave(self) 
			end)
		end
		
		if (unit == "target" and C["unitframes"].targetauras) or (unit == "player" and C["unitframes"].playerauras) then
			local buffs = CreateFrame("Frame", nil, self)
			local debuffs = CreateFrame("Frame", nil, self)
			local ba = 0
			if T.lowversion then ba = 3 end
			
			if (T.myclass == "SHAMAN" or T.myclass == "DEATHKNIGHT" or T.myclass == "PALADIN" or T.myclass == "WARLOCK" or T.myclass == "ROGUE") and (C["unitframes"].playerauras) and (unit == "player") and (C["unitframes"].classbar == true) then
				buffs:SetPoint("TOPLEFT", self, "TOPLEFT", 0, 35-ba)
			else
				buffs:SetPoint("TOPLEFT", self, "TOPLEFT", 0, 30-ba)
			end

			if T.lowversion then
				buffs:SetHeight(24)
				buffs:SetWidth(182)
				buffs.size = 24
				buffs.num = 7
				
				debuffs:SetHeight(24)
				debuffs:SetWidth(182)
				debuffs:SetPoint("BOTTOMLEFT", buffs, "TOPLEFT", -2, 2)
				debuffs.size = 24
				debuffs.num = 21
			else
				buffs:SetHeight(26)
				buffs:SetWidth(252)
				buffs.size = 26
				buffs.num = 9
				
				debuffs:SetHeight(26)
				debuffs:SetWidth(252)
				debuffs:SetPoint("BOTTOMLEFT", buffs, "TOPLEFT", -2, 2)
				debuffs.size = 26
				debuffs.num = 24
			end
			
			buffs.spacing = 2
			buffs.initialAnchor = 'TOPLEFT'
			buffs.PostCreateIcon = T.PostCreateAura
			buffs.PostUpdateIcon = T.PostUpdateAura
			self.Buffs = buffs	
						
			debuffs.spacing = 2
			debuffs.initialAnchor = 'TOPRIGHT'
			debuffs["growth-y"] = "UP"
			debuffs["growth-x"] = "LEFT"
			debuffs.PostCreateIcon = T.PostCreateAura
			debuffs.PostUpdateIcon = T.PostUpdateAura
			
			-- an option to show only our debuffs on target
			if unit == "target" then
				debuffs.onlyShowPlayer = C.unitframes.onlyselfdebuffs
			end
			
			self.Debuffs = debuffs
		end
		
		-- cast bar for player and target
		if (C["unitframes"].unitcastbar == true) then
			-- castbar of player and target
			local castbar = CreateFrame("StatusBar", self:GetName().."CastBar", self)
			castbar:SetStatusBarTexture(normTex)
			castbar:Height(hpheight*1.2)
			if unit == "player" then
				castbar:Width(cbplayer)
			elseif unit == "target" then
				castbar:Width(cbtarget)
			end
			castbar:SetBackdrop(backdrop)
			castbar:SetBackdropColor(0,0,0)
			
			local anchor = CreateFrame("Button", castbar:GetName().."Anchor", UIParent)
			anchor:Size((T.buttonsize*9)+(T.buttonspacing*7), hpheight*1.2)
			anchor:SetMovable(true)
			anchor:SetClampedToScreen(true)
			anchor:SetTemplate("Default")
			anchor:SetBackdropBorderColor(1,0,0)
			anchor:Hide()
			anchor.text = T.SetFontString(anchor, font1, 12)
			anchor.text:SetPoint("CENTER")
			anchor.text:SetText(castbar:GetName())
			anchor.text.Show = function() anchor:Show() end
			anchor.text.Hide = function() anchor:Hide() end
			
			castbar.bg = castbar:CreateTexture(nil, "BORDER")
			castbar.bg:SetAllPoints(castbar)
			castbar.bg:SetTexture(normTex)
			castbar.bg:SetVertexColor(.15,.15,.15)
			
			castbar.time = T.SetFontString(castbar, font1, 12)
			castbar.time:Point("RIGHT", castbar, "RIGHT", -5, 1)
			castbar.time:SetTextColor(0.84, 0.75, 0.65)
			castbar.time:SetJustifyH("RIGHT")
			castbar.time:SetShadowColor(0, 0, 0)
			castbar.time:SetShadowOffset(1.25, -1.25)
			
			castbar.Text = T.SetFontString(castbar, font1, 12)
			castbar.Text:Point("LEFT", castbar, "LEFT", 5, 1)
			castbar.Text:SetWidth(200)
			castbar.Text:SetTextColor(0.84, 0.75, 0.65)
			castbar.Text:SetShadowColor(0, 0, 0)
			castbar.Text:SetShadowOffset(1.25, -1.25)
			
			castbar.CustomTimeText = T.CustomCastTimeText
			castbar.CustomDelayText = T.CustomCastDelayText
			castbar.PostCastStart = T.CheckCast
			castbar.PostChannelStart = T.CheckChannel
			
			if C["unitframes"].cbicons == true then
				castbar.button = CreateFrame("Frame", nil, castbar)
				castbar.button:Size(castbar:GetHeight() * 1.5)
				castbar.button:SetTemplate("Buffs")
				castbar.button:SetPoint("LEFT", -(castbar:GetHeight() * 2), 0)

				castbar.icon = castbar.button:CreateTexture(nil, "ARTWORK")
				castbar.icon:Point("TOPLEFT", castbar.button, 2, -2)
				castbar.icon:Point("BOTTOMRIGHT", castbar.button, -2, 2)
				castbar.icon:SetTexCoord(.08,.92,.08,.92)
			end
			
			-- cast bar latency on player
			if unit == "player" and C["unitframes"].cblatency == true then
				castbar.safezone = castbar:CreateTexture(nil, "ARTWORK")
				castbar.safezone:SetTexture(normTex)
				castbar.safezone:SetVertexColor(.54,.10,.10,.75)
				castbar.SafeZone = castbar.safezone
			end
			
			local fc = CreateFrame("Frame")
				fc:RegisterEvent("ADDON_LOADED")
				fc:SetScript("OnEvent", function(self, event, addon)
				if addon == "Tukui_Raid" then
					if unit == "player" then
						castbar:SetPoint("CENTER", anchor, "CENTER", 0, 0)
						anchor:SetPoint("BOTTOM", TukuiBar3Button, "TOP", T.buttonspacing, 12)
					elseif unit == "target" then
						castbar:SetPoint("CENTER", anchor, "CENTER", 0, 0)
						anchor:SetPoint("BOTTOM", UIParent, "BOTTOM", T.buttonspacing, 325)
					end
				elseif addon == "Tukui_Raid_Healing" then
					if unit == "player" then
						castbar:SetPoint("CENTER", anchor, "CENTER", 0, 0)
						castbar.button:SetPoint("LEFT", -(castbar:GetHeight() * 2), 0)
						anchor:SetPoint("RIGHT", TukuiBar3Button, "TOP", -((T.buttonsize*4)+(T.buttonspacing*5)), 5)
					elseif unit == "target" then
						castbar.button:ClearAllPoints()
						castbar:SetPoint("CENTER", anchor, "CENTER", 0, 0)
						castbar.button:SetPoint("RIGHT", (castbar:GetHeight() * 2), 0)
						anchor:SetPoint("LEFT", TukuiBar3Button, "TOP", ((T.buttonsize*4)+(T.buttonspacing*5)), 5)
					end
				elseif not addon == "Tukui_Raid" or addon == "Tukui_Raid_Healing" then
					if unit == "player" then
						castbar:SetPoint("CENTER", anchor, "CENTER", 0, 0)
						anchor:SetPoint("BOTTOM", TukuiBar3Button, "TOP", T.buttonspacing, 12)
					elseif unit == "target" then
						castbar:SetPoint("CENTER", anchor, "CENTER", 0, 0)
						anchor:SetPoint("BOTTOM", UIParent, "BOTTOM", T.buttonspacing, 325)
					end
				end
			end)
					
			self.Castbar = castbar
			self.Castbar.Time = castbar.time
			self.Castbar.Icon = castbar.icon
			
			-- swing bar
			if C.unitframes.swing == true then
				local swing = CreateFrame("StatusBar", self:GetName().."SwingBar", UIParent)
				swing:Size(TukuiPlayerCastBar:GetWidth(), 4)
				swing:SetPoint("TOP", TukuiPlayerCastBar, "BOTTOM", 0, -1)

				swing.bg = CreateFrame("Frame", nil, swing)
				swing.bg:SetAllPoints(swing)
				
				swing.texture = normTex
				swing.color = {1,1,1,1}
				swing.textureBG = normTex
				swing.colorBG = {0,0,0,.5}
				
				self.Swing = swing
			end
		end
		
		-- add combat feedback support
		if C["unitframes"].combatfeedback == true then
			local CombatFeedbackText 
			CombatFeedbackText = T.SetFontString(health, font1, 13, "OUTLINE")
			CombatFeedbackText:SetPoint("CENTER", 0, 1)
			CombatFeedbackText.colors = {
				DAMAGE = {0.69, 0.31, 0.31},
				CRUSHING = {0.69, 0.31, 0.31},
				CRITICAL = {0.69, 0.31, 0.31},
				GLANCING = {0.69, 0.31, 0.31},
				STANDARD = {0.84, 0.75, 0.65},
				IMMUNE = {0.84, 0.75, 0.65},
				ABSORB = {0.84, 0.75, 0.65},
				BLOCK = {0.84, 0.75, 0.65},
				RESIST = {0.84, 0.75, 0.65},
				MISS = {0.84, 0.75, 0.65},
				HEAL = {0.33, 0.59, 0.33},
				CRITHEAL = {0.33, 0.59, 0.33},
				ENERGIZE = {0.31, 0.45, 0.63},
				CRITENERGIZE = {0.31, 0.45, 0.63},
			}
			self.CombatFeedbackText = CombatFeedbackText
		end
		
		if C["unitframes"].healcomm then
			local mhpb = CreateFrame('StatusBar', nil, self.Health)
			mhpb:SetPoint('TOPLEFT', self.Health:GetStatusBarTexture(), 'TOPRIGHT', 0, 0)
			mhpb:SetPoint('BOTTOMLEFT', self.Health:GetStatusBarTexture(), 'BOTTOMRIGHT', 0, 0)
			if T.lowversion then
				mhpb:SetWidth(186)
			else
				mhpb:SetWidth(250)
			end
			mhpb:SetStatusBarTexture(hpTex)
			mhpb:SetStatusBarColor(0, 1, 0.5, 0.25)
			mhpb:SetMinMaxValues(0,1)

			local ohpb = CreateFrame('StatusBar', nil, self.Health)
			ohpb:SetPoint('TOPLEFT', mhpb:GetStatusBarTexture(), 'TOPRIGHT', 0, 0)
			ohpb:SetPoint('BOTTOMLEFT', mhpb:GetStatusBarTexture(), 'BOTTOMRIGHT', 0, 0)
			ohpb:SetWidth(250)
			ohpb:SetStatusBarTexture(hpTex)
			ohpb:SetStatusBarColor(0, 1, 0, 0.25)

			self.HealPrediction = {
				myBar = mhpb,
				otherBar = ohpb,
				maxOverflow = 1,
			}
		end
		
		-- player aggro
		if C["unitframes"].playeraggro == true then
			table.insert(self.__elements, T.UpdateThreat)
			self:RegisterEvent('PLAYER_TARGET_CHANGED', T.UpdateThreat)
			self:RegisterEvent('UNIT_THREAT_LIST_UPDATE', T.UpdateThreat)
			self:RegisterEvent('UNIT_THREAT_SITUATION_UPDATE', T.UpdateThreat)
		end
	end
	
	------------------------------------------------------------------------
	--	Target of Target unit layout
	------------------------------------------------------------------------
	
	if (unit == "targettarget") then
		-- create panel
		local panel = CreateFrame("Frame", nil, self)
		panel:CreatePanel("Default", sufwidth, ufheight, "BOTTOM", self, "BOTTOM", 0, 0)
		panel:SetFrameLevel(2)
		panel:SetFrameStrata("MEDIUM")
		panel:SetBackdropBorderColor(unpack(C["media"].altbordercolor))
		self.panel = panel
		panel:Hide()
		
		-- health bar
		local health = CreateFrame('StatusBar', nil, self)
		health:Height(shpheight)
		health:SetPoint("TOPLEFT")
		health:SetPoint("TOPRIGHT")
		health:SetStatusBarTexture(hpTex)
		
		-- health bar background
		local healthBG = health:CreateTexture(nil, 'BORDER')
		healthBG:SetAllPoints()
		healthBG:SetTexture(unpack(C["media"].healthdeficit))
	
		health.value = T.SetFontString(health, font1, 10)
		health.value:Point("RIGHT", health, "RIGHT", -2, 0)
		health.PostUpdate = T.PostUpdateHealth
				
		self.Health = health
		self.Health.bg = healthBG
		
		health.frequentUpdates = true
		if C["unitframes"].showsmooth == true then
			health.Smooth = true
		end
		
		if C["unitframes"].unicolor == true then
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor(unpack(C["media"].healthcolor))	
		else
			health.colorDisconnected = true
			health.colorClass = true
			health.colorReaction = true			
		end
		
		-- power
		local power = CreateFrame('StatusBar', nil, self)
		power:Height(spwrheight)
		power:Point("TOPLEFT", health, "BOTTOMLEFT", 0, -1)
		power:Point("TOPRIGHT", health, "BOTTOMRIGHT", 0, -1)
		power:SetStatusBarTexture(normTex)
		
		local powerBG = power:CreateTexture(nil, 'BORDER')
		powerBG:SetAllPoints(power)
		powerBG:SetTexture(normTex)
		powerBG.multiplier = 0.3
				
		self.Power = power
		self.Power.bg = powerBG
		
		power.frequentUpdates = true

		if C["unitframes"].showsmooth == true then
			power.Smooth = true
		end
		
		if C["unitframes"].unicolor == true then
			power.colorClass = true
			--powerBG.multiplier = 0.1				
		else
			power.colorPower = true
		end
		
		-- Unit name
		local Name = health:CreateFontString(nil, "OVERLAY")
		Name:SetPoint("LEFT", health, "LEFT", 5, 0)
		Name:SetFont(font1, 10)
		Name:SetJustifyH("LEFT")

		self:Tag(Name, '[Tukui:getnamecolor][Tukui:nameshort]')
		self.Name = Name
		
		if C["unitframes"].totdebuffs == true and T.lowversion ~= true then
			local debuffs = CreateFrame("Frame", nil, health)
			debuffs:SetHeight(20)
			debuffs:SetWidth(127)
			debuffs.size = 20
			debuffs.spacing = 2
			debuffs.num = 6

			debuffs:SetPoint("TOPLEFT", health, "TOPLEFT", -0.5, 24)
			debuffs.initialAnchor = "TOPLEFT"
			debuffs["growth-y"] = "UP"
			debuffs.PostCreateIcon = T.PostCreateAura
			debuffs.PostUpdateIcon = T.PostUpdateAura
			self.Debuffs = debuffs
		end
	end
	
	------------------------------------------------------------------------
	--	Pet unit layout
	------------------------------------------------------------------------
	
	if (unit == "pet") then
		-- create panel
		local panel = CreateFrame("Frame", nil, self)
		panel:CreatePanel("Default", sufwidth, ufheight, "BOTTOM", self, "BOTTOM", 0, 0)
		panel:SetFrameLevel(2)
		panel:SetFrameStrata("MEDIUM")
		panel:SetBackdropBorderColor(unpack(C["media"].altbordercolor))
		self.panel = panel
		panel:Hide()
		
		-- health bar
		local health = CreateFrame('StatusBar', nil, self)
		health:Height(shpheight)
		health:SetPoint("TOPLEFT")
		health:SetPoint("TOPRIGHT")
		health:SetStatusBarTexture(hpTex)
		
		health.PostUpdate = T.PostUpdatePetColor
		
		-- health bar background
		local healthBG = health:CreateTexture(nil, 'BORDER')
		healthBG:SetAllPoints()
		healthBG:SetTexture(unpack(C["media"].healthdeficit))
	
		health.value = T.SetFontString(health, font1, 10)
		health.value:Point("RIGHT", health, "RIGHT", -2, 0)
		health.PostUpdate = T.PostUpdateHealth
				
		self.Health = health
		self.Health.bg = healthBG
		
		health.frequentUpdates = true
		if C["unitframes"].showsmooth == true then
			health.Smooth = true
		end
		
		if C["unitframes"].unicolor == true then
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor(unpack(C["media"].healthcolor))	
		else
			health.colorDisconnected = true
			health.colorClass = true
			health.colorReaction = true			
			if T.myclass == "HUNTER" then
				health.colorHappiness = true
			end
		end

		-- power
		local power = CreateFrame('StatusBar', nil, self)
		power:Height(spwrheight)
		power:Point("TOPLEFT", health, "BOTTOMLEFT", 0, -1)
		power:Point("TOPRIGHT", health, "BOTTOMRIGHT", 0, -1)
		power:SetStatusBarTexture(normTex)
		
		local powerBG = power:CreateTexture(nil, 'BORDER')
		powerBG:SetAllPoints(power)
		powerBG:SetTexture(normTex)
		powerBG.multiplier = 0.3
				
		self.Power = power
		self.Power.bg = powerBG
		
		power.frequentUpdates = true

		if C["unitframes"].showsmooth == true then
			power.Smooth = true
		end
		
		if C["unitframes"].unicolor == true then
			power.colorClass = true
			--powerBG.multiplier = 0.1				
		else
			power.colorPower = true
		end

		-- Unit name
		local Name = health:CreateFontString(nil, "OVERLAY")
		Name:SetPoint("LEFT", health, "LEFT", 5, 0)
		Name:SetFont(font1, 10)
		Name:SetJustifyH("LEFT")

		self:Tag(Name, '[Tukui:getnamecolor][Tukui:nameshort] [Tukui:diffcolor][level]')
		self.Name = Name
		--[[
		if (C["unitframes"].unitcastbar == true) then
			local castbar = CreateFrame("StatusBar", self:GetName().."CastBar", self)
			castbar:SetStatusBarTexture(normTex)
			self.Castbar = castbar
			
			if not T.lowversion then
				castbar.bg = castbar:CreateTexture(nil, "BORDER")
				castbar.bg:SetAllPoints(castbar)
				castbar.bg:SetTexture(normTex)
				castbar.bg:SetVertexColor(0.15, 0.15, 0.15)
				castbar:SetFrameLevel(6)
				castbar:Point("TOPLEFT", panel, 2, -2)
				castbar:Point("BOTTOMRIGHT", panel, -2, 2)
				
				castbar.CustomTimeText = T.CustomCastTimeText
				castbar.CustomDelayText = T.CustomCastDelayText
				castbar.PostCastStart = T.CheckCast
				castbar.PostChannelStart = T.CheckChannel

				castbar.time = T.SetFontString(castbar, font1, 12)
				castbar.time:Point("RIGHT", panel, "RIGHT", -4, 0)
				castbar.time:SetTextColor(0.84, 0.75, 0.65)
				castbar.time:SetJustifyH("RIGHT")

				castbar.Text = T.SetFontString(castbar, font1, 12)
				castbar.Text:Point("LEFT", panel, "LEFT", 4, 0)
				castbar.Text:SetTextColor(0.84, 0.75, 0.65)
				
				self.Castbar.Time = castbar.time
			end
		end--]]
		
		-- update pet name, this should fix "UNKNOWN" pet names on pet unit, health and bar color sometime being "grayish".
		self:RegisterEvent("UNIT_PET", T.updateAllElements)
	end


	------------------------------------------------------------------------
	--	Focus unit layout
	------------------------------------------------------------------------
	
	if (unit == "focus") then
		-- create a panel
		local panel = CreateFrame("Frame", nil, self)
		panel:CreatePanel("Default", ufwidth, ufheight, "BOTTOM", self, "BOTTOM", 0, 0)
		panel:SetFrameLevel(2)
		panel:SetFrameStrata("MEDIUM")
		panel:SetBackdropBorderColor(unpack(C["media"].altbordercolor))
		self.panel = panel
		panel:Hide()
	
		-- health bar
		local health = CreateFrame('StatusBar', nil, self)
		health:Height(hpheight)
		health:SetPoint("TOPLEFT")
		health:SetPoint("TOPRIGHT")
		health:SetStatusBarTexture(hpTex)
		
		health.frequentUpdates = true
		health.colorDisconnected = true
		if C["unitframes"].showsmooth == true then
			health.Smooth = true
		end
		health.colorClass = true
		
		local healthBG = health:CreateTexture(nil, 'BORDER')
		healthBG:SetAllPoints()
		healthBG:SetTexture(unpack(C["media"].healthdeficit))

		health.value = T.SetFontString(health, font1, 10)
		health.value:Point("RIGHT", health, "RIGHT", -5, 0)
		health.PostUpdate = T.PostUpdateHealth
				
		self.Health = health
		self.Health.bg = healthBG
		
		health.frequentUpdates = true
		if C["unitframes"].showsmooth == true then
			health.Smooth = true
		end
		
		if C["unitframes"].unicolor == true then
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor(unpack(C["media"].healthcolor))
		else
			health.colorDisconnected = true
			health.colorClass = true
			health.colorReaction = true	
		end
	
		-- power
		local power = CreateFrame('StatusBar', nil, self)
		power:Height(pwrheight)
		power:Point("TOPLEFT", health, "BOTTOMLEFT", 0, -1)
		power:Point("TOPRIGHT", health, "BOTTOMRIGHT", 0, -1)
		power:SetStatusBarTexture(normTex)
		
		power.frequentUpdates = true
		power.colorPower = true
		
		if C["unitframes"].showsmooth == true then
			power.Smooth = true
		end

		local powerBG = power:CreateTexture(nil, 'BORDER')
		powerBG:SetAllPoints(power)
		powerBG:SetTexture(normTex)
		powerBG.multiplier = 0.3
		
		power.value = T.SetFontString(health, font1, 10)
		power.value:Point("LEFT", health, "LEFT", 5, 0)
		power.PreUpdate = T.PreUpdatePower
		power.PostUpdate = T.PostUpdatePower
		
		if C["unitframes"].unicolor == true then
			power.colorClass = true
			--powerBG.multiplier = 0.1				
		else
			power.colorPower = true
		end
		
		self.Power = power
		self.Power.bg = powerBG
		
		-- names
		local Name = health:CreateFontString(nil, "OVERLAY")
		Name:Point("CENTER", health, "CENTER", 0, 0)
		Name:SetJustifyH("CENTER")
		Name:SetFont(font1, 12, "THINOUTLINE")
		--Name:SetShadowColor(0, 0, 0)
		--Name:SetShadowOffset(1.25, -1.25)
		
		self:Tag(Name, '[Tukui:getnamecolor][Tukui:namelong]')
		self.Name = Name

		-- create debuff
		local debuffs = CreateFrame("Frame", nil, self)
		debuffs:SetHeight(ufheight)
		debuffs:SetWidth(200)
		debuffs:Point('RIGHT', self, 'LEFT', -4, 0)
		debuffs.size = ufheight
		debuffs.num = 5
		debuffs.spacing = 2
		debuffs.initialAnchor = 'RIGHT'
		debuffs["growth-x"] = "LEFT"
		debuffs.PostCreateIcon = T.PostCreateAura
		debuffs.PostUpdateIcon = T.PostUpdateAura
		self.Debuffs = debuffs
	end
	
	------------------------------------------------------------------------
	--	Focus target unit layout
	------------------------------------------------------------------------

	if (unit == "focustarget") then
		-- create a panel
		local panel = CreateFrame("Frame", nil, self)
		panel:CreatePanel("Default", ufwidth, ufheight, "BOTTOM", self, "BOTTOM", 0, 0)
		panel:SetFrameLevel(2)
		panel:SetFrameStrata("MEDIUM")
		panel:SetBackdropBorderColor(unpack(C["media"].altbordercolor))
		self.panel = panel
		panel:Hide()
	
		-- health bar
		local health = CreateFrame('StatusBar', nil, self)
		health:Height(hpheight)
		health:SetPoint("TOPLEFT")
		health:SetPoint("TOPRIGHT")
		health:SetStatusBarTexture(hpTex)
		
		health.frequentUpdates = true
		health.colorDisconnected = true
		if C["unitframes"].showsmooth == true then
			health.Smooth = true
		end
		health.colorClass = true
		
		local healthBG = health:CreateTexture(nil, 'BORDER')
		healthBG:SetAllPoints()
		healthBG:SetTexture(unpack(C["media"].healthdeficit))

		health.value = T.SetFontString(health, font1, 10)
		health.value:Point("RIGHT", health, "RIGHT", -5, 0)
		health.PostUpdate = T.PostUpdateHealth
				
		self.Health = health
		self.Health.bg = healthBG
		
		health.frequentUpdates = true
		if C["unitframes"].showsmooth == true then
			health.Smooth = true
		end
		
		if C["unitframes"].unicolor == true then
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor(unpack(C["media"].healthcolor))	
		else
			health.colorDisconnected = true
			health.colorClass = true
			health.colorReaction = true	
		end
	
		-- power
		local power = CreateFrame('StatusBar', nil, self)
		power:Height(pwrheight)
		power:Point("TOPLEFT", health, "BOTTOMLEFT", 0, -1)
		power:Point("TOPRIGHT", health, "BOTTOMRIGHT", 0, -1)
		power:SetStatusBarTexture(normTex)
		
		power.frequentUpdates = true
		power.colorPower = true
		
		if C["unitframes"].showsmooth == true then
			power.Smooth = true
		end

		local powerBG = power:CreateTexture(nil, 'BORDER')
		powerBG:SetAllPoints(power)
		powerBG:SetTexture(normTex)
		powerBG.multiplier = 0.3
		
		power.value = T.SetFontString(health, font1, 10)
		power.value:Point("LEFT", health, "LEFT", 5, 0)
		power.PreUpdate = T.PreUpdatePower
		power.PostUpdate = T.PostUpdatePower
		
		if C["unitframes"].unicolor == true then
			power.colorClass = true
			--powerBG.multiplier = 0.1				
		else
			power.colorPower = true
		end
		
		self.Power = power
		self.Power.bg = powerBG
		
		-- names
		local Name = health:CreateFontString(nil, "OVERLAY")
		Name:Point("CENTER", health, "CENTER", 0, 0)
		Name:SetJustifyH("CENTER")
		Name:SetFont(font1, 12, "THINOUTLINE")
		--Name:SetShadowColor(0, 0, 0)
		--Name:SetShadowOffset(1.25, -1.25)
		
		self:Tag(Name, '[Tukui:getnamecolor][Tukui:namelong]')
		self.Name = Name

		-- create debuff
		local debuffs = CreateFrame("Frame", nil, self)
		debuffs:SetHeight(ufheight)
		debuffs:SetWidth(200)
		debuffs:Point('RIGHT', self, 'LEFT', -4, 0)
		debuffs.size = ufheight
		debuffs.num = 5
		debuffs.spacing = 2
		debuffs.initialAnchor = 'RIGHT'
		debuffs["growth-x"] = "LEFT"
		debuffs.PostCreateIcon = T.PostCreateAura
		debuffs.PostUpdateIcon = T.PostUpdateAura
		self.Debuffs = debuffs
		
		local castbar = CreateFrame("StatusBar", self:GetName().."CastBar", self)
		castbar:SetStatusBarTexture(normTex)
		castbar:Height(hpheight*0.8)
		castbar:SetPoint("LEFT", castbar:GetHeight()*1.6, 0)
		castbar:SetPoint("RIGHT", 0, 0)
		castbar:SetPoint("BOTTOM", 0, -18)
		castbar:SetBackdrop(backdrop)
		castbar:SetBackdropColor(0, 0, 0)
		
		castbar.bg = castbar:CreateTexture(nil, "BORDER")
		castbar.bg:SetAllPoints(castbar)
		castbar.bg:SetTexture(normTex)
		castbar.bg:SetVertexColor(.15, .15, .15)
		
		castbar.time = T.SetFontString(castbar, font1, 11)
		castbar.time:Point("RIGHT", castbar, "RIGHT", -5, 1)
		castbar.time:SetTextColor(0.84, 0.75, 0.65)
		castbar.time:SetJustifyH("RIGHT")
		castbar.CustomTimeText = T.CustomCastTimeText
		
		castbar.Text = T.SetFontString(castbar, font1, 12)
		castbar.Text:Point("LEFT", castbar, "LEFT", 8, 1)
		castbar.Text:SetTextColor(0.84, 0.75, 0.65)
		
		castbar.CustomDelayText = T.CustomCastDelayText
		castbar.PostCastStart = T.CheckCast
		castbar.PostChannelStart = T.CheckChannel
		
		castbar.button = CreateFrame("Frame", nil, castbar)
		castbar.button:Size(castbar:GetHeight()*1.2)
		castbar.button:SetTemplate("Buffs")
		castbar.button:SetPoint("LEFT", -castbar:GetHeight()*1.6, 0)

		castbar.icon = castbar.button:CreateTexture(nil, "ARTWORK")
		castbar.icon:Point("TOPLEFT", castbar.button, 2, -2)
		castbar.icon:Point("BOTTOMRIGHT", castbar.button, -2, 2)
		castbar.icon:SetTexCoord(0.08, 0.92, 0.08, .92)
		
		self.Castbar = castbar
		self.Castbar.Time = castbar.time
		self.Castbar.Icon = castbar.icon
	end

	------------------------------------------------------------------------
	--	Arena or boss units layout (both mirror'd)
	------------------------------------------------------------------------
	
	if (unit and unit:find("arena%d") and C["arena"].unitframes == true) or (unit and unit:find("boss%d") and C["unitframes"].showboss == true) then
		-- Right-click focus on arena or boss units
		self:SetAttribute("type2", "focus")
		
		-- create panel
		local panel = CreateFrame("Frame", nil, self)
		panel:CreatePanel("Default", (ufwidth/0.8), ufheight, "BOTTOM", self, "BOTTOM", 0, 0)
		panel:SetFrameLevel(2)
		panel:SetFrameStrata("MEDIUM")
		panel:SetBackdropBorderColor(unpack(C["media"].altbordercolor))
		self.panel = panel
		panel:Hide()
		
		-- health bar
		local health = CreateFrame('StatusBar', nil, self)
		health:Height(hpheight)
		health:SetPoint("TOPLEFT")
		health:SetPoint("TOPRIGHT")
		health:SetStatusBarTexture(hpTex)
		
		health.frequentUpdates = true
		health.colorDisconnected = true
		if C["unitframes"].showsmooth == true then
			health.Smooth = true
		end
		health.colorClass = true
		
		-- health bar background
		local healthBG = health:CreateTexture(nil, 'BORDER')
		healthBG:SetAllPoints()
		healthBG:SetTexture(unpack(C["media"].healthdeficit))
	
		health.value = T.SetFontString(health, font1, 11)
		health.value:Point("RIGHT", health, "RIGHT", -2, 0)
		health.PostUpdate = T.PostUpdateHealth
				
		self.Health = health
		self.Health.bg = healthBG
		
		if C["unitframes"].unicolor == true then
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor(unpack(C["media"].healthcolor))	
		else
			health.colorDisconnected = true
			health.colorClass = true
			health.colorReaction = true			
		end
		
		-- power
		local power = CreateFrame('StatusBar', nil, self)
		power:Height(pwrheight)
		power:Point("TOPLEFT", health, "BOTTOMLEFT", 0, -1)
		power:Point("TOPRIGHT", health, "BOTTOMRIGHT", 0, -1)
		power:SetStatusBarTexture(normTex)
		
		power.frequentUpdates = true
		power.colorPower = true
		
		if C["unitframes"].showsmooth == true then
			power.Smooth = true
		end
		
		local powerBG = power:CreateTexture(nil, 'BORDER')
		powerBG:SetAllPoints(power)
		powerBG:SetTexture(normTex)
		powerBG.multiplier = 0.3
		
		power.value = T.SetFontString(health, font1, 11)
		power.value:Point("LEFT", health, "LEFT", 2, 0)
		power.PreUpdate = T.PreUpdatePower
		power.PostUpdate = T.PostUpdatePower
		
		self.Power = power
		self.Power.bg = powerBG
		
		power.frequentUpdates = true

		if C["unitframes"].showsmooth == true then
			power.Smooth = true
		end
		
		if C["unitframes"].unicolor == true then
			power.colorClass = true
			--powerBG.multiplier = 0.1				
		else
			power.colorPower = true
		end

		-- Unit name
		local Name = health:CreateFontString(nil, "OVERLAY")
		Name:SetPoint("BOTTOMLEFT", health, "TOPLEFT", 0, 2)
		Name:SetFont(font1, 12, "OUTLINE")
		Name:SetJustifyH("LEFT")
		Name.frequentUpdates = 0.2
		
		self:Tag(Name, '[Tukui:getnamecolor][Tukui:namelong]')
		self.Name = Name
		
		if (unit and unit:find("boss%d")) then
			-- alt power bar
			local AltPowerBar = CreateFrame("StatusBar", nil, self.Health)
			AltPowerBar:SetFrameLevel(self.Health:GetFrameLevel() + 1)
			AltPowerBar:Height(pwrheight)
			AltPowerBar:SetStatusBarTexture(C.media.normTex)
			AltPowerBar:GetStatusBarTexture():SetHorizTile(false)
			AltPowerBar:SetStatusBarColor(1, 0, 0)

			AltPowerBar:SetPoint("LEFT")
			AltPowerBar:SetPoint("RIGHT")
			AltPowerBar:SetPoint("TOP", self.Health, "TOP")
			
			AltPowerBar:SetBackdrop({
			  bgFile = C["media"].blank, 
			  edgeFile = C["media"].blank, 
			  tile = false, tileSize = 0, edgeSize = T.Scale(1), 
			  insets = { left = 0, right = 0, top = 0, bottom = T.Scale(-1)}
			})
			AltPowerBar:SetBackdropColor(0, 0, 0)

			self.AltPowerBar = AltPowerBar
			
			-- create buff at left of unit if they are boss units
			local buffs = CreateFrame("Frame", nil, self)
			buffs:SetHeight(ufheight)
			buffs:SetWidth(252)
			buffs:Point("RIGHT", self, "LEFT", -4, 0)
			buffs.size = ufheight
			buffs.num = 3
			buffs.spacing = 2
			buffs.initialAnchor = 'RIGHT'
			buffs["growth-x"] = "LEFT"
			buffs.PostCreateIcon = T.PostCreateAura
			buffs.PostUpdateIcon = T.PostUpdateAura
			self.Buffs = buffs
			
			-- because it appear that sometime elements are not correct.
			self:HookScript("OnShow", T.updateAllElements)
		end

		-- create debuff for arena units
		local debuffs = CreateFrame("Frame", nil, self)
		debuffs:SetHeight(ufheight)
		debuffs:SetWidth(200)
		debuffs:SetPoint('LEFT', self, 'RIGHT', T.Scale(4), 0)
		debuffs.size = ufheight
		debuffs.num = 5
		debuffs.spacing = 2
		debuffs.initialAnchor = 'LEFT'
		debuffs["growth-x"] = "RIGHT"
		debuffs.PostCreateIcon = T.PostCreateAura
		debuffs.PostUpdateIcon = T.PostUpdateAura
		self.Debuffs = debuffs
				
		-- trinket feature via trinket plugin
		if (C.arena.unitframes) and (unit and unit:find('arena%d')) then
			local Trinketbg = CreateFrame("Frame", nil, self)
			Trinketbg:SetHeight(ufheight)
			Trinketbg:SetWidth(ufheight)
			Trinketbg:SetPoint("RIGHT", self, "LEFT", -6, 0)				
			Trinketbg:SetTemplate("Default")
			Trinketbg:SetFrameLevel(0)
			self.Trinketbg = Trinketbg
			
			local Trinket = CreateFrame("Frame", nil, Trinketbg)
			Trinket:SetAllPoints(Trinketbg)
			Trinket:SetPoint("TOPLEFT", Trinketbg, 1, -1)
			Trinket:SetPoint("BOTTOMRIGHT", Trinketbg, -1, 1)
			Trinket:SetFrameLevel(1)
			Trinket.trinketUseAnnounce = true
			self.Trinket = Trinket
			
			local Talents = T.SetFontString(health, font1, 11)
			Talents:Point("CENTER", health, "CENTER", 0, 0)
			Talents:SetTextColor(1,0,0)
			--self.Talents:SetPoint("BOTTOM", self.Health, 0, -2)
			Talents = self.Talents
		end
		
		-- boss & arena frames cast bar!
		local castbar = CreateFrame("StatusBar", self:GetName().."CastBar", self)
		castbar:SetStatusBarTexture(normTex)
		castbar:Height(hpheight*0.8)
		castbar:SetPoint("LEFT", castbar:GetHeight()*1.6, 0)
		castbar:SetPoint("RIGHT", 0, 0)
		castbar:SetPoint("BOTTOM", 0, -18)
		castbar:SetBackdrop(backdrop)
		castbar:SetBackdropColor(0, 0, 0)
		
		castbar.bg = castbar:CreateTexture(nil, "BORDER")
		castbar.bg:SetAllPoints(castbar)
		castbar.bg:SetTexture(normTex)
		castbar.bg:SetVertexColor(.15, .15, .15)
		
		castbar.time = T.SetFontString(castbar, font1, 11)
		castbar.time:Point("RIGHT", castbar, "RIGHT", -5, 1)
		castbar.time:SetTextColor(0.84, 0.75, 0.65)
		castbar.time:SetJustifyH("RIGHT")
		castbar.CustomTimeText = T.CustomCastTimeText
		
		castbar.Text = T.SetFontString(castbar, font1, 12)
		castbar.Text:Point("LEFT", castbar, "LEFT", 8, 1)
		castbar.Text:SetTextColor(0.84, 0.75, 0.65)
		
		castbar.CustomDelayText = T.CustomCastDelayText
		castbar.PostCastStart = T.CheckCast
		castbar.PostChannelStart = T.CheckChannel
		
		castbar.button = CreateFrame("Frame", nil, castbar)
		castbar.button:Size(castbar:GetHeight()*1.2)
		castbar.button:SetTemplate("Buffs")
		castbar.button:SetPoint("LEFT", -castbar:GetHeight()*1.6, 0)

		castbar.icon = castbar.button:CreateTexture(nil, "ARTWORK")
		castbar.icon:Point("TOPLEFT", castbar.button, 2, -2)
		castbar.icon:Point("BOTTOMRIGHT", castbar.button, -2, 2)
		castbar.icon:SetTexCoord(0.08, 0.92, 0.08, .92)
		
		--self:Tag(power.value, '[Tukui:power]')
					
		self.Castbar = castbar
		self.Castbar.Time = castbar.time
		self.Castbar.Icon = castbar.icon
	end

	------------------------------------------------------------------------
	--	Main tanks and Main Assists layout (both mirror'd)
	------------------------------------------------------------------------
	
	if(self:GetParent():GetName():match"TukuiMainTank" or self:GetParent():GetName():match"TukuiMainAssist") then
		-- Right-click focus on maintank or mainassist units
		self:SetAttribute("type2", "focus")
		
		-- health 
		local health = CreateFrame('StatusBar', nil, self)
		health:Height(20)
		health:SetPoint("TOPLEFT")
		health:SetPoint("TOPRIGHT")
		health:SetStatusBarTexture(hpTex)
		
		local healthBG = health:CreateTexture(nil, 'BORDER')
		healthBG:SetAllPoints()
		healthBG:SetTexture(.1, .1, .1)
				
		self.Health = health
		self.Health.bg = healthBG
		
		health.frequentUpdates = true
		if C["unitframes"].showsmooth == true then
			health.Smooth = true
		end
		
		if C["unitframes"].unicolor == true then
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor(.3, .3, .3, 1)
			healthBG:SetVertexColor(.1, .1, .1, 1)
		else
			health.colorDisconnected = true
			health.colorClass = true
			health.colorReaction = true	
		end
		
		-- names
		local Name = health:CreateFontString(nil, "OVERLAY")
		Name:SetPoint("CENTER", health, "CENTER", 0, 0)
		Name:SetJustifyH("CENTER")
		Name:SetFont(font1, 12, "OUTLINE")
		Name:SetShadowColor(0, 0, 0)
		Name:SetShadowOffset(1.25, -1.25)
		
		self:Tag(Name, '[Tukui:getnamecolor][Tukui:nameshort]')
		self.Name = Name
	end
	
	return self
end

------------------------------------------------------------------------
--	Default position of Tukui unitframes
------------------------------------------------------------------------
local adjust = 0
if T.lowversion then adjust = -25 end

oUF:RegisterStyle('Tukui', Shared)

-- player
local player = oUF:Spawn('player', "TukuiPlayer")
player:Size(ufwidth, ufheight)
-- target
local target = oUF:Spawn('target', "TukuiTarget")
target:Size(ufwidth, ufheight)
-- target of target
local tot = oUF:Spawn('targettarget', "TukuiTargetTarget")
tot:SetPoint("TOPRIGHT", TukuiTarget, "BOTTOMRIGHT", 0, -4)
tot:Size(sufwidth, sufheight)
-- pet
local pet = oUF:Spawn('pet', "TukuiPet")
pet:SetPoint("TOPLEFT", TukuiPlayer, "BOTTOMLEFT", 0, -4)
pet:Size(sufwidth, sufheight)
-- focus
local focus = oUF:Spawn('focus', "TukuiFocus")
focus:SetPoint("BOTTOMLEFT", InvTukuiActionBarBackground, "TOPLEFT", -80, 600)
focus:Size(ufwidth*0.80, ufheight)

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "Tukui_Raid" then
		player:SetPoint("RIGHT", TukuiBar3Button, "LEFT", (T.buttonsize*2+T.buttonspacing)+adjust, 80)
		target:SetPoint("LEFT", TukuiBar3Button, "RIGHT", -(T.buttonsize*2+T.buttonspacing)-adjust, 80)
	elseif addon == "Tukui_Raid_Healing" then
		player:SetPoint("RIGHT", TukuiBar3Button, "LEFT", -25-adjust, 120)
		target:SetPoint("LEFT", TukuiBar3Button, "RIGHT", 25+adjust, 120)
	elseif not addon == "Tukui_Raid" or addon == "Tukui_Raid_Healing" then
		player:SetPoint("RIGHT", TukuiBar3Button, "LEFT", (T.buttonsize*2+T.buttonspacing)+adjust, 80)
		target:SetPoint("LEFT", TukuiBar3Button, "RIGHT", -(T.buttonsize*2+T.buttonspacing)-adjust, 80)
	end
end)

if C.unitframes.showfocustarget then
	local focustarget = oUF:Spawn("focustarget", "TukuiFocusTarget")
	focustarget:SetPoint("TOP", focus, "BOTTOM", 0, -15)
	focustarget:Size(ufwidth*0.80, ufheight)
end


if C.arena.unitframes then
	local arena = {}
	for i = 1, 5 do
		arena[i] = oUF:Spawn("arena"..i, "TukuiArena"..i)
		if i == 1 then
			arena[i]:SetPoint("BOTTOMRIGHT", InvTukuiActionBarBackground, "TOPRIGHT", 150, 500)
		else
			arena[i]:SetPoint("BOTTOM", arena[i-1], "TOP", 0, 35)
		end
		arena[i]:Size((ufwidth*0.8), ufheight)
	end
end

if C["unitframes"].showboss then
	for i = 1,MAX_BOSS_FRAMES do
		local t_boss = _G["Boss"..i.."TargetFrame"]
		t_boss:UnregisterAllEvents()
		t_boss.Show = T.dummy
		t_boss:Hide()
		_G["Boss"..i.."TargetFrame".."HealthBar"]:UnregisterAllEvents()
		_G["Boss"..i.."TargetFrame".."ManaBar"]:UnregisterAllEvents()
	end

	local boss = {}
	for i = 1, MAX_BOSS_FRAMES do
		boss[i] = oUF:Spawn("boss"..i, "TukuiBoss"..i)
		if i == 1 then
			boss[i]:SetPoint("BOTTOMRIGHT", InvTukuiActionBarBackground, "TOPRIGHT", 150, 500)
		else
			boss[i]:SetPoint("BOTTOM", boss[i-1], "TOP", 0, 35)
		end
		boss[i]:Size((ufwidth*0.8), ufheight)
	end
end

local assisttank_width = 100
local assisttank_height  = 20
if C["unitframes"].maintank == true then
	local tank = oUF:SpawnHeader('TukuiMainTank', nil, 'raid',
		'oUF-initialConfigFunction', ([[
			self:SetWidth(%d)
			self:SetHeight(%d)
		]]):format(assisttank_width, assisttank_height),
		'showRaid', true,
		'groupFilter', 'MAINTANK',
		'yOffset', 7,
		'point' , 'BOTTOM',
		'template', 'oUF_TukuiMtt'
	)
	tank:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
end
 
if C["unitframes"].mainassist == true then
	local assist = oUF:SpawnHeader("TukuiMainAssist", nil, 'raid',
		'oUF-initialConfigFunction', ([[
			self:SetWidth(%d)
			self:SetHeight(%d)
		]]):format(assisttank_width, assisttank_height),
		'showRaid', true,
		'groupFilter', 'MAINASSIST',
		'yOffset', 7,
		'point' , 'BOTTOM',
		'template', 'oUF_TukuiMtt'
	)
	if C["unitframes"].maintank == true then
		assist:SetPoint("TOPLEFT", TukuiMainTank, "BOTTOMLEFT", 2, -50)
	else
		assist:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	end
end

-- this is just a fake party to hide Blizzard frame if no Tukui raid layout are loaded.
local party = oUF:SpawnHeader("oUF_noParty", nil, "party", "showParty", true)

------------------------------------------------------------------------
-- Right-Click on unit frames menu. 
-- Doing this to remove SET_FOCUS eveywhere.
-- SET_FOCUS work only on default unitframes.
-- Main Tank and Main Assist, use /maintank and /mainassist commands.
------------------------------------------------------------------------

do
	UnitPopupMenus["SELF"] = { "PVP_FLAG", "LOOT_METHOD", "LOOT_THRESHOLD", "OPT_OUT_LOOT_TITLE", "LOOT_PROMOTE", "DUNGEON_DIFFICULTY", "RAID_DIFFICULTY", "RESET_INSTANCES", "RAID_TARGET_ICON", "SELECT_ROLE", "CONVERT_TO_PARTY", "CONVERT_TO_RAID", "LEAVE", "CANCEL" };
	UnitPopupMenus["PET"] = { "PET_PAPERDOLL", "PET_RENAME", "PET_ABANDON", "PET_DISMISS", "CANCEL" };
	UnitPopupMenus["PARTY"] = { "MUTE", "UNMUTE", "PARTY_SILENCE", "PARTY_UNSILENCE", "RAID_SILENCE", "RAID_UNSILENCE", "BATTLEGROUND_SILENCE", "BATTLEGROUND_UNSILENCE", "WHISPER", "PROMOTE", "PROMOTE_GUIDE", "LOOT_PROMOTE", "VOTE_TO_KICK", "UNINVITE", "INSPECT", "ACHIEVEMENTS", "TRADE", "FOLLOW", "DUEL", "RAID_TARGET_ICON", "SELECT_ROLE", "PVP_REPORT_AFK", "RAF_SUMMON", "RAF_GRANT_LEVEL", "CANCEL" }
	UnitPopupMenus["PLAYER"] = { "WHISPER", "INSPECT", "INVITE", "ACHIEVEMENTS", "TRADE", "FOLLOW", "DUEL", "RAID_TARGET_ICON", "RAF_SUMMON", "RAF_GRANT_LEVEL", "CANCEL" }
	UnitPopupMenus["RAID_PLAYER"] = { "MUTE", "UNMUTE", "RAID_SILENCE", "RAID_UNSILENCE", "BATTLEGROUND_SILENCE", "BATTLEGROUND_UNSILENCE", "WHISPER", "INSPECT", "ACHIEVEMENTS", "TRADE", "FOLLOW", "DUEL", "RAID_TARGET_ICON", "SELECT_ROLE", "RAID_LEADER", "RAID_PROMOTE", "RAID_DEMOTE", "LOOT_PROMOTE", "RAID_REMOVE", "PVP_REPORT_AFK", "RAF_SUMMON", "RAF_GRANT_LEVEL", "CANCEL" };
	UnitPopupMenus["RAID"] = { "MUTE", "UNMUTE", "RAID_SILENCE", "RAID_UNSILENCE", "BATTLEGROUND_SILENCE", "BATTLEGROUND_UNSILENCE", "RAID_LEADER", "RAID_PROMOTE", "RAID_MAINTANK", "RAID_MAINASSIST", "RAID_TARGET_ICON", "LOOT_PROMOTE", "RAID_DEMOTE", "RAID_REMOVE", "PVP_REPORT_AFK", "CANCEL" };
	UnitPopupMenus["VEHICLE"] = { "RAID_TARGET_ICON", "VEHICLE_LEAVE", "CANCEL" }
	UnitPopupMenus["TARGET"] = { "RAID_TARGET_ICON", "CANCEL" }
	UnitPopupMenus["ARENAENEMY"] = { "CANCEL" }
	UnitPopupMenus["FOCUS"] = { "RAID_TARGET_ICON", "CANCEL" }
	UnitPopupMenus["BOSS"] = { "RAID_TARGET_ICON", "CANCEL" }
end