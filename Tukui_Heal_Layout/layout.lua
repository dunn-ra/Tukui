if not TukuiCF["unitframes"].enable == true then return end

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local db = TukuiCF["unitframes"]
local ui = TukuiCF["uisizes"]
-- fonts
local font1 = TukuiCF["media"].uffont
local font2 = TukuiCF["media"].font
local font3 = TukuiCF["media"].nfont
-- textures
local normTex = TukuiCF["media"].normTex
local hpTex = TukuiCF["media"].hpText
local glowTex = TukuiCF["media"].glowTex
local bubbleTex = TukuiCF["media"].bubbleTex
--[-[ unitframe size
local ufwidth
local hpheight
local btnsize
local assisttank_width
local assisttank_height
--]]
-- backdrop setting
local backdrop = {
	bgFile = TukuiCF["media"].blank,
	insets = {top = -TukuiDB.mult, left = -TukuiDB.mult, bottom = -TukuiDB.mult, right = -TukuiDB.mult},
}

------------------------------------------------------------------------
--	Layout
------------------------------------------------------------------------
-- local funtion
local function Shared(self, unit)
	-- set our own colors
	self.colors = TukuiDB.oUF_colors
	
	-- register click
	self:RegisterForClicks("AnyUp")
	self:SetScript('OnEnter', UnitFrame_OnEnter)
	self:SetScript('OnLeave', UnitFrame_OnLeave)
	
	-- menu? lol
	self.menu = TukuiDB.SpawnMenu

	-- backdrop for every units
	self:SetBackdrop(backdrop)
	self:SetBackdropColor(0, 0, 0)

	-- this is the glow border
	TukuiDB.CreateShadow(self)

	--[-[ unitframe sizes
	ufwidth = TukuiDB.Scale(ui.playerwidth*0.95)
	hpheight = TukuiDB.Scale(ui.playerheight)
	pwrheight = TukuiDB.Scale(ui.playerheight / 4)
	ufheight = TukuiDB.Scale(pwrheight + hpheight + 1)
	assisttank_width = TukuiDB.Scale(ui.assisttankw)
	assisttank_height = TukuiDB.Scale(ui.assisttankh)
	btnsize = TukuiDB.buttonsize
	if TukuiDB.lowversion then
		ufwidth = TukuiDB.Scale(ui.playerwidth*0.85)
	end
	-- small frames
	sufwidth = TukuiDB.Scale((ufwidth / 2) - (ufwidth * 0.02))
	shpheight = TukuiDB.Scale(hpheight * 0.8)
	spwrheight = TukuiDB.Scale(pwrheight * 0.8)
	sufheight = TukuiDB.Scale(ufheight * 0.8)
	--]]
	
	------------------------------------------------------------------------
	--  Features we want for all units at the same time
	------------------------------------------------------------------------
	-- here we create an invisible frame for all element we want to show over health/power.	
	local InvFrame = CreateFrame("Frame", nil, self)
	InvFrame:SetFrameStrata("HIGH")
	InvFrame:SetFrameLevel(5)
	InvFrame:SetAllPoints()
	
	-- symbols, now put the symbol on the frame we created above.
	local RaidIcon = InvFrame:CreateTexture(nil, "OVERLAY")
	RaidIcon:SetTexture("Interface\\AddOns\\Tukui\\media\\textures\\raidicons.blp") -- thx hankthetank for texture
	RaidIcon:SetHeight(22)
	RaidIcon:SetWidth(22)
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
		local panel = CreateFrame("Frame", nil, self)
		TukuiDB.CreatePanel(panel, ufwidth, ufheight, "BOTTOM", self, "BOTTOM", 0, 0)
		panel:SetFrameLevel(2)
		panel:SetFrameStrata("MEDIUM")
		panel:SetBackdropBorderColor(unpack(TukuiCF["media"].altbordercolor))
		self.panel = panel
		panel:Hide() -- hide panel
		
		-- health bar
		local health = CreateFrame('StatusBar', nil, self)
		health:SetHeight(hpheight)
		health:SetPoint("TOPLEFT")
		health:SetPoint("TOPRIGHT")
		health:SetStatusBarTexture(hpTex)

		local healthBG = health:CreateTexture(nil, 'BORDER')
		healthBG:SetAllPoints()
		healthBG:SetTexture(unpack(TukuiCF["media"].healthdeficit))

		health.value = TukuiDB.SetFontString(health, font2, 11)
		health.value:SetPoint("RIGHT", health, "RIGHT", TukuiDB.Scale(-5), 1)
		health.value:SetShadowColor(0, 0, 0)
		health.value:SetShadowOffset(1.25, -1.25)
		health.PostUpdate = TukuiDB.PostUpdateHealth

		self.Health = health
		self.Health.bg = healthBG

		health.frequentUpdates = true
		if db.showsmooth == true then
			health.Smooth = true
		end

		if db.unicolor == true then
			health.colorTapping = false
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor(unpack(TukuiCF["media"].healthcolor))
		else
			health.colorDisconnected = true
			health.colorTapping = true
			health.colorClass = true
			health.colorReaction = true		
		end

		-- power
		local power = CreateFrame('StatusBar', nil, self)
		power:SetHeight(pwrheight)
		power:SetPoint("TOPLEFT", health, "BOTTOMLEFT", 0, -TukuiDB.mult)
		power:SetPoint("TOPRIGHT", health, "BOTTOMRIGHT", 0, -TukuiDB.mult)
		power:SetStatusBarTexture(normTex)

		local powerBG = power:CreateTexture(nil, 'BORDER')
		powerBG:SetAllPoints(power)
		powerBG:SetTexture(normTex)
		powerBG.multiplier = 0.3

		power.value = TukuiDB.SetFontString(power, font3, 12, "THINOUTLINE")
		power.value:SetPoint("CENTER", power, "CENTER", 0, 0)
		power.PreUpdate = TukuiDB.PreUpdatePower
		power.PostUpdate = TukuiDB.PostUpdatePower

		self.Power = power
		self.Power.bg = powerBG

		power.frequentUpdates = true
		power.colorDisconnected = true

		if db.showsmooth == true then
			power.Smooth = true
		end

		if db.unicolor == true then
			power.colorTapping = true
			power.colorClass = true
			powerBG.multiplier = 0.1				
		else
			power.colorPower = true
		end

		local FrameBorder = CreateFrame("Frame", nil, self)
		FrameBorder:SetPoint("TOPLEFT", self, "TOPLEFT", TukuiDB.Scale(-1), TukuiDB.Scale(1))
		FrameBorder:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", TukuiDB.Scale(1), TukuiDB.Scale(-1))
		TukuiDB.SetTemplate(FrameBorder)
		FrameBorder:SetBackdropBorderColor(0, 0, 0)
		FrameBorder:SetFrameLevel(2)
		FrameBorder:SetAlpha(0)
		self.FrameBorder = FrameBorder

		-- Unit name
		local Name = health:CreateFontString(nil, "OVERLAY")
		Name:SetPoint("LEFT", health, "LEFT", TukuiDB.Scale(5), TukuiDB.Scale(1))
		
		Name:SetJustifyH("LEFT")
		Name:SetFont(font2, 13)
		Name:SetShadowColor(0, 0, 0)
		Name:SetShadowOffset(1.25, -1.25)
		if unit == "player" then
			if db.unicolor == true then
				self:Tag(Name, '[Tukui:getnamecolor][Tukui:namelong] [Tukui:afk] [Tukui:dead]')
			else
				self:Tag(Name, '[Tukui:namelong] [Tukui:afk] [Tukui:dead]')
				Name:SetTextColor(unpack(TukuiCF["media"].tncolor))
			end
		elseif unit == "target" then
			if db.unicolor == true then
				self:Tag(Name, '[Tukui:getnamecolor][Tukui:namelong] [Tukui:diffcolor][level]')
			else
				self:Tag(Name, '[Tukui:namelong] [Tukui:diffcolor][level]')
				Name:SetTextColor(unpack(TukuiCF["media"].tncolor))
			end
		end
		--self.Name = Name
		
		-- player aggro
		if db.playeraggro == true then
			table.insert(self.__elements, TukuiDB.UpdateThreat)
			self:RegisterEvent('PLAYER_TARGET_CHANGED', TukuiDB.UpdateThreat)
			self:RegisterEvent('UNIT_THREAT_LIST_UPDATE', TukuiDB.UpdateThreat)
			self:RegisterEvent('UNIT_THREAT_SITUATION_UPDATE', TukuiDB.UpdateThreat)
		end
		
		-- portraits
		if db.charportrait == true then
			local portrait = CreateFrame("PlayerModel", nil, self)
			portrait:SetFrameLevel(8)
			portrait:SetHeight(ufheight)
			portrait:SetWidth(ufheight)
			portrait:SetAlpha(1)
			portrait:SetBackdrop(backdrop)
			portrait:SetBackdropColor(.1, .1, .1)

			if unit == "player" then
				portrait:SetPoint("RIGHT", health, "LEFT", TukuiDB.Scale(-9), TukuiDB.Scale(-4))
			elseif unit == "target" then
				portrait:SetPoint("LEFT", health, "RIGHT", TukuiDB.Scale(9), TukuiDB.Scale(-4))
			end
			table.insert(self.__elements, TukuiDB.HidePortrait)
			self.Portrait = portrait
		end

		-- alt power bar
		local AltPowerBar = CreateFrame("StatusBar", nil, self.Health)
		AltPowerBar:SetFrameLevel(5)
		AltPowerBar:SetHeight(hpheight)
		AltPowerBar:SetWidth(ufwidth)
		AltPowerBar:SetStatusBarTexture(TukuiCF.media.normTex)
		AltPowerBar:GetStatusBarTexture():SetHorizTile(false)
		AltPowerBar:SetStatusBarColor(.69, .09, .12, 1)

		AltPowerBar:SetPoint("CENTER", UIParent, "CENTER", 0, TukuiDB.Scale(300))

		AltPowerBar:SetBackdrop(backdrop)
		AltPowerBar:SetBackdropColor(unpack(TukuiCF["media"].altbackdropcolor))

		self.AltPowerBar = AltPowerBar

		if (unit == "player") then	
			-- combat icon
			local Combat = health:CreateTexture(nil, "OVERLAY")
			Combat:SetHeight(TukuiDB.Scale(20))
			Combat:SetWidth(TukuiDB.Scale(20))
			Combat:SetPoint("CENTER", health, "CENTER", 0, TukuiDB.Scale(3))
			Combat:SetVertexColor(0.69, 0.31, 0.31)
			self.Combat = Combat
			-- custom info (low mana warning)
			FlashInfo = CreateFrame("Frame", "TukuiFlashInfo", self)
			FlashInfo:SetScript("OnUpdate", TukuiDB.UpdateManaLevel)
			FlashInfo.parent = self
			FlashInfo:SetToplevel(true)
			FlashInfo:SetAllPoints(health)
			FlashInfo.ManaLevel = TukuiDB.SetFontString(FlashInfo, font2, 11, "THINOUTLINE")
			FlashInfo.ManaLevel:SetPoint("LEFT", power, "LEFT", TukuiDB.Scale(6), 0)
			self.FlashInfo = FlashInfo
			-- pvp status text
			local status = TukuiDB.SetFontString(health, font1, 12)
			status:SetPoint("CENTER", health, "CENTER", 0, TukuiDB.Scale(2))
			status:SetTextColor(0.69, 0.31, 0.31, 0)
			self.Status = status
			self:Tag(status, "[pvp]")
			-- leader icon
			local Leader = InvFrame:CreateTexture(nil, "OVERLAY")
			Leader:SetHeight(TukuiDB.Scale(14))
			Leader:SetWidth(TukuiDB.Scale(14))
			Leader:SetPoint("TOPLEFT", TukuiDB.Scale(2), TukuiDB.Scale(8))
			self.Leader = Leader
			-- master looter
			local MasterLooter = InvFrame:CreateTexture(nil, "OVERLAY")
			MasterLooter:SetHeight(TukuiDB.Scale(14))
			MasterLooter:SetWidth(TukuiDB.Scale(14))
			self.MasterLooter = MasterLooter
			self:RegisterEvent("PARTY_LEADER_CHANGED", TukuiDB.MLAnchorUpdate)
			self:RegisterEvent("PARTY_MEMBERS_CHANGED", TukuiDB.MLAnchorUpdate)

			--[[ the threat bar on info left panel ? :P NYI
			if (db.showthreat == true) then
				local ThreatBar = CreateFrame("StatusBar", self:GetName()..'_ThreatBar', TukuiInfoLeft)
				ThreatBar:SetFrameLevel(5)
				ThreatBar:SetPoint("TOPLEFT", TukuiInfoLeft, TukuiDB.Scale(2), TukuiDB.Scale(-2))
				ThreatBar:SetPoint("BOTTOMRIGHT", TukuiInfoLeft, TukuiDB.Scale(-2), TukuiDB.Scale(2))
			  
				ThreatBar:SetStatusBarTexture(normTex)
				ThreatBar:GetStatusBarTexture():SetHorizTile(false)
				ThreatBar:SetBackdrop(backdrop)
				ThreatBar:SetBackdropColor(0, 0, 0, 0)
		   
				ThreatBar.Text = TukuiDB.SetFontString(ThreatBar, font2, 12)
				ThreatBar.Text:SetPoint("RIGHT", ThreatBar, "RIGHT", TukuiDB.Scale(-30), 0)
		
				ThreatBar.Title = TukuiDB.SetFontString(ThreatBar, font2, 12)
				ThreatBar.Title:SetText(tukuilocal.unitframes_ouf_threattext)
				ThreatBar.Title:SetPoint("LEFT", ThreatBar, "LEFT", TukuiDB.Scale(30), 0)
					  
				ThreatBar.bg = ThreatBar:CreateTexture(nil, 'BORDER')
				ThreatBar.bg:SetAllPoints(ThreatBar)
				ThreatBar.bg:SetTexture(0.1,0.1,0.1)
		   
				ThreatBar.useRawThreat = false
				self.ThreatBar = ThreatBar
			end--]]
			
			-- reputation bar for max level character
			if TukuiDB.level == MAX_PLAYER_LEVEL then
				local Reputation = CreateFrame("StatusBar", self:GetName().."_Reputation", self)
				Reputation:SetStatusBarTexture(normTex)
				Reputation:SetBackdrop(backdrop)
				Reputation:SetBackdropColor(unpack(TukuiCF["media"].altbackdropcolor))
				Reputation:SetWidth(ufwidth)
				Reputation:SetHeight(pwrheight)
				Reputation:SetPoint("TOPLEFT", power, 0, 0)
				Reputation:SetFrameLevel(10)
				Reputation:SetAlpha(0)
				Reputation:HookScript("OnEnter", function(self) self:SetAlpha(1) end)
				Reputation:HookScript("OnLeave", function(self) self:SetAlpha(0) end)
				Reputation.PostUpdate = TukuiDB.UpdateReputationColor
				Reputation.Tooltip = true
				self.Reputation = Reputation
			end
			
			-- experience bar on player via mouseover for player currently levelling a character
			if TukuiDB.level ~= MAX_PLAYER_LEVEL then
				local Experience = CreateFrame("StatusBar", self:GetName().."_Experience", self)
				Experience:SetStatusBarTexture(normTex)
				Experience:SetStatusBarColor(0, 0.4, 1, .8)
				Experience:SetBackdrop(backdrop)
				Experience:SetBackdropColor(unpack(TukuiCF["media"].altbackdropcolor))
				Experience:SetWidth(ufwidth)
				Experience:SetHeight(pwrheight)
				Experience:SetPoint("TOPLEFT", power, 0, 0)
				Experience:SetFrameLevel(10)
				Experience:SetAlpha(0)				
				Experience:HookScript("OnEnter", function(self) self:SetAlpha(1) end)
				Experience:HookScript("OnLeave", function(self) self:SetAlpha(0) end)
				Experience.Tooltip = true						
				Experience.Rested = CreateFrame('StatusBar', nil, self)
				Experience.Rested:SetParent(Experience)
				Experience.Rested:SetAllPoints(Experience)
				self.Experience = Experience
			end
			
			-- show druid mana when shapeshifted in bear, cat or whatever
			if TukuiDB.myclass == "DRUID" then
				CreateFrame("Frame"):SetScript("OnUpdate", function() TukuiDB.UpdateDruidMana(self) end)
				local DruidMana = TukuiDB.SetFontString(health, font3, 10, "THINOUTLINE")
				DruidMana:SetTextColor(1, 0.49, 0.04)
				self.DruidMana = DruidMana
				
				local eclipseBar = CreateFrame('Frame', nil, self)
				eclipseBar:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, TukuiDB.Scale(1))
				eclipseBar:SetWidth(ufwidth)
				eclipseBar:SetHeight(pwrheight)
				eclipseBar:SetFrameStrata("MEDIUM")
				eclipseBar:SetFrameLevel(8)
				
				TukuiDB.SetCyTemplate(eclipseBar)
				eclipseBar:SetBackdrop(backdrop)
				eclipseBar:SetBackdropColor(0, 0, 0)
				
				eclipseBar:SetScript("OnShow", function() TukuiDB.EclipseDisplay(self, false) end)
				eclipseBar:SetScript("OnUpdate", function() TukuiDB.EclipseDisplay(self, true) end) -- just forcing 1 update on login for buffs/shadow/etc.
				eclipseBar:SetScript("OnHide", function() TukuiDB.EclipseDisplay(self, false) end)
				
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
				eclipseBarText:SetPoint('CENTER', health, 'CENTER', 0,  TukuiDB.Scale(2))
				eclipseBarText:SetFont(font2, 13, "THINOUTLINE")
				eclipseBar.PostUpdatePower = TukuiDB.EclipseDirection
				
				-- hide "low mana" text and combat icon on load if eclipseBar is show
				if eclipseBar and eclipseBar:IsShown() then FlashInfo.ManaLevel:SetAlpha(0) end
				if eclipseBar and eclipseBar:IsShown() then Combat:SetAlpha(0) end

				self.EclipseBar = eclipseBar
				self.EclipseBar.Text = eclipseBarText
			end

			-- set holy power bar or shard bar
			if (TukuiDB.myclass == "WARLOCK" or TukuiDB.myclass == "PALADIN") and db.powerbar == true then
				local bars = CreateFrame("Frame", nil, self)
				bars:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, TukuiDB.Scale(1))
				bars:SetWidth(ufwidth)
				bars:SetHeight(pwrheight)
				TukuiDB.SetTemplate(bars)
				--bars:SetBackdropBorderColor(0,0,0,0)
				bars:SetBackdrop(backdrop)
				bars:SetBackdropColor(0, 0, 0)
				
				for i = 1, 3 do					
					bars[i]=CreateFrame("StatusBar", self:GetName().."_Shard"..i, self)
					bars[i]:SetHeight(pwrheight)				
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
						bars[i]:SetWidth((ufwidth - 2) / 3)
						bars[i].bg:SetAllPoints(bars[i])
					else
						bars[i]:SetPoint("LEFT", bars[i-1], "RIGHT", TukuiDB.Scale(1), 0)
						bars[i]:SetWidth((ufwidth - 2) / 3)
						bars[i].bg:SetAllPoints(bars[i])
					end
					
					bars[i].bg:SetTexture(normTex)					
					bars[i].bg:SetAlpha(.15)
				end
				
				if TukuiDB.myclass == "WARLOCK" then
					bars.Override = TukuiDB.UpdateShards				
					self.SoulShards = bars
				elseif TukuiDB.myclass == "PALADIN" then
					bars.Override = TukuiDB.UpdateHoly
					self.HolyPower = bars
				end
			end
			
			-- set combobar for rogue/druid -- credits to jasje
			if (TukuiDB.myclass == "ROGUE" or TukuiDB.myclass == "DRUID") and db.combobar == true then
				local CPoints = {}
				CPoints.unit = PlayerFrame.unit
				
				for i = 1, 5 do
					CPoints[i] = CreateFrame('StatusBar', "ComboPoint"..i, self)
					CPoints[i]:SetHeight(pwrheight)
					CPoints[i]:SetWidth((ufwidth - 4) / 5)
					
					CPoints[i]:SetStatusBarTexture(normTex)
					CPoints[i]:GetStatusBarTexture():SetHorizTile(false)
					CPoints[i]:SetStatusBarColor(0.69, 0.31, 0.31)
					CPoints[i]:SetBackdrop(backdrop)
					CPoints[i]:SetBackdropColor(0, 0, 0)
					
					if i == 1 then
						CPoints[i]:SetPoint("BOTTOMLEFT", oUF_Tukz_player, "TOPLEFT", 0, TukuiDB.Scale(1))
					else
						CPoints[i]:SetPoint("TOPLEFT", CPoints[i-1], "TOPRIGHT", TukuiDB.Scale(1), 0)
					end
				end
				
				CPoints[2]:SetStatusBarColor(0.69, 0.31, 0.31)
				CPoints[3]:SetStatusBarColor(0.65, 0.63, 0.35)
				CPoints[4]:SetStatusBarColor(0.65, 0.63, 0.35)
				CPoints[5]:SetStatusBarColor(0.33, 0.59, 0.33)

				self.CPoints = CPoints
				self.CPoints.Override = TukuiDB.ComboDisplay
				self:RegisterEvent("UNIT_COMBO_POINTS", TukuiDB.UpdateCPoints)
			end

			-- deathknight runes
			if TukuiDB.myclass == "DEATHKNIGHT" and db.runebar == true then
				local Runes = CreateFrame("Frame", nil, self)
				Runes:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, TukuiDB.Scale(1))
				Runes:SetHeight(pwrheight)
				Runes:SetWidth(ufwidth)
				Runes:SetBackdrop(backdrop)
				Runes:SetBackdropColor(0, 0, 0)

				for i = 1, 6 do
					Runes[i] = CreateFrame("StatusBar", self:GetName().."_Runes"..i, self)
					Runes[i]:SetHeight(pwrheight)
					Runes[i]:SetWidth((ufwidth - 5) / 6)
					if (i == 1) then
						Runes[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, TukuiDB.Scale(1))
					else
						Runes[i]:SetPoint("TOPLEFT", Runes[i-1], "TOPRIGHT", TukuiDB.Scale(1), 0)
					end
					Runes[i]:SetStatusBarTexture(normTex)
					Runes[i]:GetStatusBarTexture():SetHorizTile(false)
				end

				self.Runes = Runes
			end
			
			-- shaman totem bar
			if TukuiDB.myclass == "SHAMAN" and db.totemtimer == true then
				local TotemBar = {}
				TotemBar.Destroy = true
				for i = 1, 4 do
					TotemBar[i] = CreateFrame("StatusBar", self:GetName().."_TotemBar"..i, self)
					if (i == 1) then
					   TotemBar[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, TukuiDB.Scale(1))
					else
					   TotemBar[i]:SetPoint("TOPLEFT", TotemBar[i-1], "TOPRIGHT", TukuiDB.Scale(1), 0)
					end
					TotemBar[i]:SetStatusBarTexture(normTex)
					TotemBar[i]:SetHeight(pwrheight)
					TotemBar[i]:SetWidth((ufwidth - 3) / 4)
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
			
			-- swing bar
			if db.swing == true then
				local Swing = CreateFrame("StatusBar", self:GetName().."_SwingBar", health)
				self.Swing = Swing

				self.Swing:SetHeight(pwrheight)
				self.Swing:SetWidth(ufwidth)
				self.Swing:SetPoint("TOP", health, "TOP", 0, 0)

				self.Swing.bg = CreateFrame("Frame", nil, self.Swing)
				self.Swing.bg:SetPoint("TOPLEFT", TukuiDB.Scale(-2), TukuiDB.Scale(2))
				self.Swing.bg:SetPoint("BOTTOMRIGHT", TukuiDB.Scale(2), TukuiDB.Scale(-2))
				
				self.Swing.texture = hpTex
				self.Swing.color = {0.94, 0.85, 0.75, 1}
				self.Swing.textureBG = hpTex
				self.Swing.colorBG = {0, 0, 0, 0.3}
			end
			
			-- script for pvp status and low mana
			self:SetScript("OnEnter", function(self)
				if self.EclipseBar and self.EclipseBar:IsShown() then
					self.EclipseBar.Text:Hide()
				end
				FlashInfo.ManaLevel:SetAlpha(0)
				status:SetAlpha(1)
				UnitFrame_OnEnter(self)
			end)
			self:SetScript("OnLeave", function(self) 
				if self.EclipseBar and self.EclipseBar:IsShown() then
					self.EclipseBar.Text:Show()
				end
				FlashInfo.ManaLevel:SetAlpha(1)
				status:SetAlpha(0)
				UnitFrame_OnLeave(self)
			end)
		end

		if (unit == "target" and db.targetauras) or (unit == "player" and db.playerauras) then
			local buffs = CreateFrame("Frame", nil, self)
			local debuffs = CreateFrame("Frame", nil, self)
			
			if (TukuiDB.myclass == "SHAMAN" or TukuiDB.myclass == "ROGUE" or TukuiDB.myclass == "DEATHKNIGHT" or TukuiDB.myclass == "PALADIN" or TukuiDB.myclass == "WARLOCK") and (db.playerauras) and (unit == "player") then
				if TukuiDB.lowversion then
					buffs:SetPoint("TOPLEFT", self, "TOPLEFT", 0, 34)
				else
					buffs:SetPoint("TOPLEFT", self, "TOPLEFT", 0, 38)
				end
			else
				if TukuiDB.lowversion then
					buffs:SetPoint("TOPLEFT", self, "TOPLEFT", 0, 26)
				else
					buffs:SetPoint("TOPLEFT", self, "TOPLEFT", 0, 30)
				end
			end
			
			if TukuiDB.lowversion then
				buffs:SetHeight(22.5)
				buffs:SetWidth(ufwidth)
				buffs.size = 22.5
				buffs.num = 7
				
				debuffs:SetHeight(22.5)
				debuffs:SetWidth(ufwidth)
				debuffs:SetPoint("BOTTOMLEFT", buffs, "TOPLEFT", 0, 6)
				debuffs.size = 22.5
				debuffs.num = 21
			else				
				buffs:SetHeight(23.2)
				buffs:SetWidth(ufwidth)
				buffs.size = 23.2
				buffs.num = 8
				
				debuffs:SetHeight(23.2)
				debuffs:SetWidth(ufwidth)
				debuffs:SetPoint("BOTTOMLEFT", buffs, "TOPLEFT", 0, 6)
				debuffs.size = 23.2
				debuffs.num = 24
			end

			buffs.spacing = 2
			buffs.initialAnchor = 'TOPLEFT'
			buffs.PostCreateIcon = TukuiDB.PostCreateAura
			buffs.PostUpdateIcon = TukuiDB.PostUpdateAura
			self.Buffs = buffs	

			debuffs.spacing = 2
			debuffs.initialAnchor = 'TOPRIGHT'
			debuffs["growth-y"] = "UP"
			debuffs["growth-x"] = "LEFT"
			debuffs.PostCreateIcon = TukuiDB.PostCreateAura
			debuffs.PostUpdateIcon = TukuiDB.PostUpdateAura
			self.Debuffs = debuffs
		end
		
		-- castbar for player and target
		if (db.unitcastbar == true) then
			-- castbar of player and target
			local castbar = CreateFrame("StatusBar", self:GetName().."_Castbar", self)
			castbar:SetStatusBarTexture(normTex)
			castbar:SetFrameLevel(6)
			
			castbar.CustomTimeText = TukuiDB.CustomCastTimeText
			castbar.CustomDelayText = TukuiDB.CustomCastDelayText
			castbar.PostCastStart = TukuiDB.CheckCast
			castbar.PostChannelStart = TukuiDB.CheckChannel
			
			castbar.bg = castbar:CreateTexture(nil, "BORDER")
			castbar.bg:SetAllPoints(castbar)
			castbar.bg:SetTexture(normTex)
			castbar.bg:SetVertexColor(.15, .15, .15)
			
			castbar.time = TukuiDB.SetFontString(castbar, font3, 12)
			castbar.time:SetTextColor(.84, .75, .65)
			castbar.time:SetJustifyH("RIGHT")
			castbar.time:SetShadowColor(0, 0, 0)
			castbar.time:SetShadowOffset(1.25, -1.25)

			castbar.Text = TukuiDB.SetFontString(castbar, font2, 13)
			castbar.Text:SetTextColor(.84, .75, .65)
			castbar.Text:SetShadowColor(0, 0, 0)
			castbar.Text:SetShadowOffset(1.25, -1.25)
			
			castbar:SetBackdrop(backdrop)
			castbar:SetBackdropColor(0, 0, 0)
			
			if db.separatecastbar ~= true then
				castbar:SetPoint("TOPLEFT", power, TukuiDB.Scale(1), TukuiDB.Scale(1))
				castbar:SetPoint("BOTTOMRIGHT", power, TukuiDB.Scale(-1), TukuiDB.Scale(-1))
				castbar.time:SetPoint("RIGHT", castbar, "RIGHT", TukuiDB.Scale(-6), TukuiDB.Scale(-4))
				castbar.Text:SetPoint("LEFT", castbar, "LEFT", TukuiDB.Scale(-6), TukuiDB.Scale(-4))
			else
				castbar:SetHeight(hpheight)
				castbar.time:SetPoint("RIGHT", castbar, "RIGHT", TukuiDB.Scale(-5), TukuiDB.Scale(-1))
				castbar.Text:SetPoint("LEFT", castbar, "LEFT", TukuiDB.Scale(5), TukuiDB.Scale(1))
				castbar:SetWidth(ufwidth)
				if unit == "player" then
					castbar:SetPoint("BOTTOM", oUF_Tukz_player, "BOTTOM", 0, TukuiDB.Scale(-60))
				elseif unit == "target" then
					castbar:SetPoint("BOTTOM", oUF_Tukz_target, "BOTTOM", 0, TukuiDB.Scale(-60))
				end
			end			
			
			if db.cbicons == true and db.separatecastbar == true then
				castbar.button = CreateFrame("Frame", nil, castbar)
				if unit == "player" then
					castbar.button:SetHeight(hpheight*1.1)
					castbar.button:SetWidth(hpheight*1.1)
					castbar.button:SetPoint("LEFT", TukuiDB.Scale(-25), 0)
				elseif unit == "target" then
					castbar.button:SetHeight(hpheight*1.1)
					castbar.button:SetWidth(hpheight*1.1)
					castbar.button:SetPoint("RIGHT", TukuiDB.Scale(25), 0)
				end
				TukuiDB.SetCyTemplate(castbar.button)
				TukuiDB.CreateShadow(castbar.button)

				castbar.icon = castbar.button:CreateTexture(nil, "ARTWORK")
				castbar.icon:SetPoint("TOPLEFT", castbar.button, TukuiDB.Scale(1), TukuiDB.Scale(-1))
				castbar.icon:SetPoint("BOTTOMRIGHT", castbar.button, TukuiDB.Scale(-1), TukuiDB.Scale(1))
				castbar.icon:SetTexCoord(.08, .92, .08, .92)
			end
			
			-- cast bar latency on player
			if unit == "player" and db.cblatency == true then
				castbar.safezone = castbar:CreateTexture(nil, "ARTWORK")
				castbar.safezone:SetTexture(normTex)
				castbar.safezone:SetVertexColor(.90, .1, .1, .55)
				castbar.SafeZone = castbar.safezone
			end
					
			self.Castbar = castbar
			self.Castbar.Time = castbar.time
			self.Castbar.Icon = castbar.icon
		end

		-- add combat feedback support
		if db.combatfeedback == true then
			local CombatFeedbackText 
			if TukuiDB.lowversion then
				CombatFeedbackText = TukuiDB.SetFontString(health, font2, 12, "OUTLINE")
			else
				CombatFeedbackText = TukuiDB.SetFontString(health, font2, 14, "OUTLINE")
			end
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
		
		if db.healcomm then
			local mhpb = CreateFrame('StatusBar', nil, self.Health)
			mhpb:SetPoint('TOPLEFT', self.Health:GetStatusBarTexture(), 'TOPRIGHT', 0, 0)
			mhpb:SetPoint('BOTTOMLEFT', self.Health:GetStatusBarTexture(), 'BOTTOMRIGHT', 0, 0)
			mhpb:SetWidth(ufwidth)
			mhpb:SetStatusBarTexture(normTex)
			mhpb:SetStatusBarColor(0, 1, 0.5, 0.25)
			mhpb:SetMinMaxValues(0,1)

			local ohpb = CreateFrame('StatusBar', nil, self.Health)
			ohpb:SetPoint('TOPLEFT', mhpb:GetStatusBarTexture(), 'TOPRIGHT', 0, 0)
			ohpb:SetPoint('BOTTOMLEFT', mhpb:GetStatusBarTexture(), 'BOTTOMRIGHT', 0, 0)
			ohpb:SetWidth(ufwidth)
			ohpb:SetStatusBarTexture(normTex)
			ohpb:SetStatusBarColor(0, 1, 0, 0.25)

			self.HealPrediction = {
				myBar = mhpb,
				otherBar = ohpb,
				maxOverflow = 1,
			}
		end
	end
	
	------------------------------------------------------------------------
	--	Target of Target unit layout
	------------------------------------------------------------------------
	
	if (unit == "targettarget") then
		local panel = CreateFrame("Frame", nil, self)
		TukuiDB.CreatePanel(panel, ufwidth, ufheight, "BOTTOM", self, "BOTTOM", 0, 0)
		panel:SetFrameLevel(2)
		panel:SetFrameStrata("MEDIUM")
		panel:SetBackdropBorderColor(unpack(TukuiCF["media"].altbordercolor))
		panel:Hide()
		self.panel = panel
		
		-- health bar
		local health = CreateFrame('StatusBar', nil, self)
		health:SetHeight(shpheight)
		health:SetPoint("TOPLEFT")
		health:SetPoint("TOPRIGHT")
		health:SetStatusBarTexture(normTex)
		
		local healthBG = health:CreateTexture(nil, 'BORDER')
		healthBG:SetAllPoints()
		healthBG:SetTexture(unpack(TukuiCF["media"].healthdeficit))
		
		self.Health = health
		self.Health.bg = healthBG
		
		health.frequentUpdates = true
		if db.showsmooth == true then
			health.Smooth = true
		end
		
		-- power
		local power = CreateFrame('StatusBar', nil, self)
		power:SetHeight(spwrheight)
		power:SetPoint("TOPLEFT", health, "BOTTOMLEFT", 0, -TukuiDB.mult)
		power:SetPoint("TOPRIGHT", health, "BOTTOMRIGHT", 0, -TukuiDB.mult)
		power:SetStatusBarTexture(normTex)
		
		power.frequentUpdates = true
		power.colorPower = true
		if db.showsmooth == true then
			power.Smooth = true
		end

		local powerBG = power:CreateTexture(nil, 'BORDER')
		powerBG:SetAllPoints(power)
		powerBG:SetTexture(normTex)
		powerBG.multiplier = 0.3

		self.Power = power
		self.Power.bg = powerBG
		
		if db.unicolor == true then
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor(unpack(TukuiCF["media"].healthcolor))
		else
			health.colorDisconnected = true
			health.colorClass = true
			health.colorReaction = true
		end
		
		-- Unit name
		local Name = health:CreateFontString(nil, "OVERLAY")
		Name:SetPoint("CENTER", health, "CENTER", 0, 0)
		Name:SetFont(font2, 12)
		Name:SetJustifyH("CENTER")
		Name:SetShadowColor(0, 0, 0)
		Name:SetShadowOffset(1.25, -1.25)

		if db.unicolor == true then
			self:Tag(Name, '[Tukui:getnamecolor][Tukui:namemedium]')
		else
			self:Tag(Name, '[Tukui:namemedium]')
			Name:SetTextColor(unpack(TukuiCF["media"].tncolor))
		end
		self.Name = Name
		
		if db.totdebuffs == true then
			local debuffs = CreateFrame("Frame", nil, health)
			debuffs:SetHeight(20)
			debuffs:SetWidth(sufwidth)
			debuffs.size = 20
			debuffs.spacing = 2
			debuffs.num = 6

			debuffs:SetPoint("TOPLEFT", health, "TOPLEFT", -0.5, 24)
			debuffs.initialAnchor = "TOPLEFT"
			debuffs["growth-y"] = "UP"
			debuffs.PostCreateIcon = TukuiDB.PostCreateAura
			debuffs.PostUpdateIcon = TukuiDB.PostUpdateAura
			self.Debuffs = debuffs
		end
	end
	
	------------------------------------------------------------------------
	--	Pet unit layout
	------------------------------------------------------------------------
	
	if (unit == "pet") then
		-- health bar
		local health = CreateFrame('StatusBar', nil, self)
		health:SetHeight(shpheight)
		health:SetPoint("TOPLEFT")
		health:SetPoint("TOPRIGHT")
		health:SetStatusBarTexture(hpTex)

		self.Health = health
		self.Health.bg = healthBG
		
		local healthBG = health:CreateTexture(nil, 'BORDER')
		healthBG:SetAllPoints()
		healthBG:SetTexture(unpack(TukuiCF["media"].healthdeficit))
		
		health.frequentUpdates = true
		if db.showsmooth == true then
			health.Smooth = true
		end
		
		if db.unicolor == true then
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor(unpack(TukuiCF["media"].healthcolor))
		else
			health.colorDisconnected = true
			health.colorClass = true
			health.colorReaction = true
			if TukuiDB.myclass == "HUNTER" then
				health.colorHappiness = true
			end
		end
		
		-- power
		local power = CreateFrame('StatusBar', nil, self)
		power:SetHeight(spwrheight)
		power:SetPoint("TOPLEFT", health, "BOTTOMLEFT", 0, -TukuiDB.mult)
		power:SetPoint("TOPRIGHT", health, "BOTTOMRIGHT", 0, -TukuiDB.mult)
		power:SetStatusBarTexture(normTex)

		power.frequentUpdates = true
		power.colorPower = true

		if db.showsmooth == true then
			power.Smooth = true
		end

		local powerBG = power:CreateTexture(nil, 'BORDER')
		powerBG:SetAllPoints(power)
		powerBG:SetTexture(normTex)
		powerBG.multiplier = 0.3

		self.Power = power
		self.Power.bg = powerBG

		-- Unit name
		local Name = health:CreateFontString(nil, "OVERLAY")
		Name:SetPoint("CENTER", health, "CENTER", 0, 0)
		Name:SetFont(font2, 12)
		Name:SetJustifyH("CENTER")
		Name:SetShadowColor(0, 0, 0)
		Name:SetShadowOffset(1.25, -1.25)

		if db.unicolor == true then
			self:Tag(Name, '[Tukui:getnamecolor][Tukui:nameshort] [Tukui:diffcolor][level]')
		else
			self:Tag(Name, '[Tukui:nameshort] [Tukui:diffcolor][level]')
			Name:SetTextColor(unpack(TukuiCF["media"].tncolor))
		end
		self.Name = Name
		
		-- update pet name, this should fix "UNKNOWN" pet names on pet unit and health/power colors.
		self:RegisterEvent("UNIT_PET", TukuiDB.updateAllElements)
	end

	------------------------------------------------------------------------
	--	Focus unit layout
	------------------------------------------------------------------------
	if (unit == "focus") then
		local health = CreateFrame('StatusBar', nil, self)
		health:SetHeight(shpheight)
		health:SetPoint("TOPLEFT")
		health:SetPoint("TOPRIGHT")
		health:SetStatusBarTexture(hpTex)
		
		local healthBG = health:CreateTexture(nil, 'BORDER')
		healthBG:SetAllPoints()
		healthBG:SetTexture(unpack(TukuiCF["media"].healthdeficit))
		
		health.value = TukuiDB.SetFontString(health, font3, 10)
		health.value:SetPoint("RIGHT", health, "RIGHT", TukuiDB.Scale(-4), 0)
		health.value:SetShadowColor(0, 0, 0)
		health.value:SetShadowOffset(1.25, -1.25)
		health.PostUpdate = TukuiDB.PostUpdateHealth
		
		self.Health = health
		self.Health.bg = healthBG
		
		health.frequentUpdates = true
		if db.showsmooth == true then
			health.Smooth = true
		end
		
		-- power
		local power = CreateFrame('StatusBar', nil, self)
		power:SetHeight(spwrheight)
		power:SetPoint("TOPLEFT", health, "BOTTOMLEFT", 0, -TukuiDB.mult)
		power:SetPoint("TOPRIGHT", health, "BOTTOMRIGHT", 0, -TukuiDB.mult)
		power:SetStatusBarTexture(normTex)
		
		power.frequentUpdates = true
		power.colorPower = true

		if db.showsmooth == true then
			power.Smooth = true
		end

		local powerBG = power:CreateTexture(nil, 'BORDER')
		powerBG:SetAllPoints(power)
		powerBG:SetTexture(normTex)
		powerBG.multiplier = 0.3

		self.Power = power
		self.Power.bg = powerBG
		
		if db.unicolor == true then
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor(unpack(TukuiCF["media"].healthcolor))
		else
			health.colorDisconnected = true
			health.colorClass = true
			health.colorReaction = true
		end
		
		-- Unit name
		local Name = health:CreateFontString(nil, "OVERLAY")
		Name:SetPoint("LEFT", health, "LEFT", TukuiDB.Scale(4), 0)
		Name:SetJustifyH("LEFT")
		Name:SetFont(font2, 13)
		Name:SetShadowColor(0, 0, 0)
		Name:SetShadowOffset(1.25, -1.25)

		if db.unicolor == true then
			self:Tag(Name, '[Tukui:getnamecolor][Tukui:namemedium]')
		else
			self:Tag(Name, '[Tukui:namemedium]')
			Name:SetTextColor(unpack(TukuiCF["media"].tncolor))
		end
		
		self.Name = Name

		--[[ create focus debuff feature NYI
		if db.focusdebuffs == true then
			local debuffs = CreateFrame("Frame", nil, self)
			debuffs:SetHeight(26)
			debuffs:SetWidth(TukuiCF["panels"].tinfowidth - 10)
			debuffs.size = 26
			debuffs.spacing = 2
			debuffs.num = 40
						
			debuffs:SetPoint("TOPRIGHT", self, "TOPRIGHT", 2, 38)
			debuffs.initialAnchor = "TOPRIGHT"
			debuffs["growth-y"] = "UP"
			debuffs["growth-x"] = "LEFT"
			
			debuffs.PostCreateIcon = TukuiDB.PostCreateAura
			debuffs.PostUpdateIcon = TukuiDB.PostUpdateAura
			self.Debuffs = debuffs
		end--]]
		
		-- focus cast bar in the center of the screen
		if db.unitcastbar == true then
			local castbar = CreateFrame("StatusBar", self:GetName().."_Castbar", self)
			castbar:SetHeight(TukuiDB.Scale(22))
			castbar:SetWidth(TukuiDB.Scale(250))
			castbar:SetStatusBarTexture(normTex)
			castbar:SetFrameLevel(6)
			castbar:SetPoint("CENTER", UIParent, "CENTER", 0, 200)
			
			castbar.bg = castbar:CreateTexture(nil, "BORDER")
			castbar.bg:SetAllPoints(castbar)
			castbar.bg:SetTexture(normTex)
			castbar.bg:SetVertexColor(.15, .15, .15)
			
			castbar:SetBackdrop(backdrop)
			castbar:SetBackdropColor(0, 0, 0)

			castbar.time = TukuiDB.SetFontString(castbar, font3, 13)
			castbar.time:SetPoint("RIGHT", castbar, "RIGHT", TukuiDB.Scale(-4), 0)
			castbar.time:SetTextColor(.84, .75, .65)
			castbar.time:SetJustifyH("RIGHT")
			castbar.time:SetShadowColor(0, 0, 0)
			castbar.time:SetShadowOffset(1.25, -1.25)
			castbar.CustomTimeText = CustomCastTimeText
			
			castbar.Text = TukuiDB.SetFontString(castbar, font2, 13)
			castbar.Text:SetPoint("LEFT", castbar, "LEFT", TukuiDB.Scale(4), 0)
			castbar.Text:SetTextColor(0.84, 0.75, 0.65)
			
			castbar.CustomDelayText = TukuiDB.CustomCastDelayText
			castbar.PostCastStart = TukuiDB.CheckCast
			castbar.PostChannelStart = TukuiDB.CheckChannel
			
			if db.cbicons == true then
				castbar.button = CreateFrame("Frame", nil, castbar)
				castbar.button:SetHeight(TukuiDB.Scale(40))
				castbar.button:SetWidth(TukuiDB.Scale(40))
				castbar.button:SetPoint("CENTER", 0, TukuiDB.Scale(50))

				castbar.icon = castbar.button:CreateTexture(nil, "ARTWORK")
				castbar.icon:SetPoint("TOPLEFT", castbar.button, 0, 0)
				castbar.icon:SetPoint("BOTTOMRIGHT", castbar.button, 0, 0)
				castbar.icon:SetTexCoord(.08, .92, .08, .92)
				
				TukuiDB.SetTemplate(castbar.button)
			end

			self.Castbar = castbar
			self.Castbar.Time = castbar.time
			self.Castbar.Icon = castbar.icon
		end
	end
	
	------------------------------------------------------------------------
	--	Focus target unit layout
	------------------------------------------------------------------------
	if (unit == "focustarget") then
		-- create panel if higher version
		local panel = CreateFrame("Frame", nil, self)
		TukuiDB.CreatePanel(panel, 129, 17, "BOTTOM", self, "BOTTOM", 0, 0)
		panel:SetFrameLevel(2)
		panel:SetFrameStrata("MEDIUM")
		panel:SetBackdropBorderColor(unpack(TukuiCF["media"].altbordercolor))
		self.panel = panel
		panel:Hide() -- hide panel
		
		-- health bar
		local health = CreateFrame('StatusBar', nil, self)
		health:SetHeight(hpheight)
		health:SetPoint("TOPLEFT")
		health:SetPoint("TOPRIGHT")
		health:SetStatusBarTexture(hpTex)
		
		local healthBG = health:CreateTexture(nil, 'BORDER')
		healthBG:SetAllPoints()
		healthBG:SetTexture(unpack(TukuiCF["media"].healthdeficit))
		
		-- health value
		health.value = TukuiDB.SetFontString(health, font3, 11)
		health.value:SetPoint("RIGHT", health, "RIGHT", TukuiDB.Scale(-5), 1)
		health.value:SetShadowColor(0, 0, 0)
		health.value:SetShadowOffset(1.25, -1.25)
		health.PostUpdate = TukuiDB.PostUpdateHealth
		
		self.Health = health
		self.Health.bg = healthBG
		
		health.frequentUpdates = true
		if db.showsmooth == true then
			health.Smooth = true
		end
		
		if db.unicolor == true then
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor(unpack(TukuiCF["media"].healthcolor))
		else
			health.colorDisconnected = true
			health.colorClass = true
			health.colorReaction = true
		end
		
		-- power
		local power = CreateFrame('StatusBar', nil, self)
		power:SetHeight(pwrheight)
		power:SetPoint("TOPLEFT", health, "BOTTOMLEFT", 0, -TukuiDB.mult)
		power:SetPoint("TOPRIGHT", health, "BOTTOMRIGHT", 0, -TukuiDB.mult)
		power:SetStatusBarTexture(normTex)
		
		-- power bg
		local powerBG = power:CreateTexture(nil, 'BORDER')
		powerBG:SetAllPoints(power)
		powerBG:SetTexture(normTex)
		powerBG.multiplier = 0.3
		
		-- power value
		power.value = TukuiDB.SetFontString(power, font3, 11, "THINOUTLINE")
		power.value:SetPoint("CENTER", power, "CENTER", 0, 0)
		power.PreUpdate = TukuiDB.PreUpdatePower
		power.PostUpdate = TukuiDB.PostUpdatePower

		self.Power = power
		self.Power.bg = powerBG

		power.frequentUpdates = true
		power.colorDisconnected = true

		if db.showsmooth == true then
			power.Smooth = true
		end
		
		-- theme
		if db.unicolor == true then
			power.colorTapping = true
			power.colorClass = true
			powerBG.multiplier = 0.1				
		else
			power.colorPower = true
		end
		
		-- Unit name
		local Name = health:CreateFontString(nil, "OVERLAY")
		Name:SetPoint("LEFT", health, "LEFT", TukuiDB.Scale(5), TukuiDB.Scale(1))
		Name:SetFont(font2, 12)
		Name:SetJustifyH("CENTER")
		Name:SetShadowColor(0, 0, 0)
		Name:SetShadowOffset(1.25, -1.25)

		if db.unicolor == true then
			self:Tag(Name, '[Tukui:getnamecolor][Tukui:namelong]')
		else
			self:Tag(Name, '[Tukui:namelong]')
			Name:SetTextColor(unpack(TukuiCF["media"].tncolor))
		end
		self.Name = Name
	end
	
	------------------------------------------------------------------------
	--	Arena or boss units layout (both mirror'd)
	------------------------------------------------------------------------

	if (unit and unit:find("arena%d") and TukuiCF["arena"].unitframes == true) or (unit and unit:find("boss%d") and db.showboss == true) then
		-- Right-click focus on arena or boss units
		self:SetAttribute("type2", "focus")

		local health = CreateFrame('StatusBar', nil, self)
		health:SetHeight(hpheight)
		health:SetPoint("TOPLEFT")
		health:SetPoint("TOPRIGHT")
		health:SetStatusBarTexture(hpTex)

		local healthBG = health:CreateTexture(nil, 'BORDER')
		healthBG:SetAllPoints()
		healthBG:SetTexture(unpack(TukuiCF["media"].healthdeficit))

		health.value = TukuiDB.SetFontString(health, font3, 11)
		health.value:SetPoint("RIGHT", health, "RIGHT", TukuiDB.Scale(-5), 1)
		health.value:SetShadowColor(0, 0, 0)
		health.value:SetShadowOffset(1.25, -1.25)
		health.PostUpdate = TukuiDB.PostUpdateHealth

		self.Health = health
		self.Health.bg = healthBG

		health.frequentUpdates = true
		if db.showsmooth == true then
			health.Smooth = true
		end

		if db.unicolor == true then
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor(unpack(TukuiCF["media"].healthcolor))
		else
			health.colorTapping = true
			health.colorClass = true
			health.colorReaction = true
			healthBG.multiplier = 0.3
		end

		local power = CreateFrame('StatusBar', nil, self)
		power:SetHeight(pwrheight)
		power:SetPoint("TOPLEFT", health, "BOTTOMLEFT", 0, -TukuiDB.mult)
		power:SetPoint("TOPRIGHT", health, "BOTTOMRIGHT", 0, -TukuiDB.mult)
		power:SetStatusBarTexture(normTex)

		power.frequentUpdates = true
		power.colorPower = true
		if db.showsmooth == true then
			power.Smooth = true
		end

		local powerBG = power:CreateTexture(nil, 'BORDER')
		powerBG:SetAllPoints(power)
		powerBG:SetTexture(normTex)
		powerBG.multiplier = 0.3

		power.value = TukuiDB.SetFontString(power, font3, 12, "THINOUTLINE")
		power.value:SetPoint("CENTER", power, "CENTER", 0, 0)
		power.value:SetShadowColor(0, 0, 0)
		power.value:SetShadowOffset(1.25, -1.25)
		power.PreUpdate = TukuiDB.PreUpdatePower
		power.PostUpdate = TukuiDB.PostUpdatePower

		self.Power = power
		self.Power.bg = powerBG

		if db.unicolor == true then
			power.colorTapping = true
			power.colorClass = true
			powerBG.multiplier = 0.1				
		else
			power.colorPower = true
		end

		local Name = health:CreateFontString(nil, "OVERLAY")
		Name:SetPoint("LEFT", health, "LEFT", TukuiDB.Scale(5), 0)
		Name:SetJustifyH("LEFT")
		Name:SetFont(font2, 13)
		Name:SetShadowColor(0, 0, 0)
		Name:SetShadowOffset(1.25, -1.25)
		Name.frequentUpdates = 0.2

		if db.unicolor == true then
			self:Tag(Name, '[Tukui:getnamecolor][Tukui:namelong]')
		else
			self:Tag(Name, '[Tukui:namelong]')
			Name:SetTextColor(unpack(TukuiCF["media"].tncolor))
		end

		self.Name = Name

		if (unit and unit:find("boss%d")) then
			-- alt power bar
			local AltPowerBar = CreateFrame("StatusBar", nil, self.Health)
			AltPowerBar:SetFrameLevel(5)
			AltPowerBar:SetHeight(hpheight)
			AltPowerBar:SetWidth(ufwidth)
			AltPowerBar:SetStatusBarTexture(TukuiCF.media.normTex)
			AltPowerBar:GetStatusBarTexture():SetHorizTile(false)
			AltPowerBar:SetStatusBarColor(.69, .09, .12, 1)

			AltPowerBar:SetPoint("CENTER", UIParent, "CENTER", 0, TukuiDB.Scale(300))

			AltPowerBar:SetBackdrop(backdrop)
			AltPowerBar:SetBackdropColor(unpack(TukuiCF["media"].altbackdropcolor))

			self.AltPowerBar = AltPowerBar
			
			-- create buff at left of unit if they are boss units
			local buffs = CreateFrame("Frame", nil, self)
			buffs:SetHeight(ufheight)
			buffs:SetWidth(ufwidth)
			buffs:SetPoint("RIGHT", self, "LEFT", TukuiDB.Scale(-5), 0)
			buffs.size = ufheight
			buffs.num = 5
			buffs.spacing = 2
			buffs.initialAnchor = 'RIGHT'
			buffs["growth-x"] = "LEFT"
			buffs.PostCreateIcon = TukuiDB.PostCreateAura
			buffs.PostUpdateIcon = TukuiDB.PostUpdateAura
			self.Buffs = buffs
		end

		-- create debuff for arena units
		local debuffs = CreateFrame("Frame", nil, self)
		debuffs:SetHeight(ufheight)
		debuffs:SetWidth(ufwidth)
		debuffs:SetPoint('LEFT', self, 'RIGHT', TukuiDB.Scale(5), 0)
		debuffs.size = ufheight
		debuffs.num = 5
		debuffs.spacing = 2
		debuffs.initialAnchor = 'LEFT'
		debuffs["growth-x"] = "RIGHT"
		debuffs.PostCreateIcon = TukuiDB.PostCreateAura
		debuffs.PostUpdateIcon = TukuiDB.PostUpdateAura
		self.Debuffs = debuffs

		-- trinket feature via trinket plugin
		if (TukuiCF.arena.unitframes) and (unit and unit:find('arena%d')) then
			local Trinketbg = CreateFrame("Frame", nil, self)
			Trinketbg:SetHeight(ufheight)
			Trinketbg:SetWidth(ufheight)
			Trinketbg:SetPoint("RIGHT", self, "LEFT", TukuiDB.Scale(-5), 0)				
			TukuiDB.SetTemplate(Trinketbg)
			Trinketbg:SetFrameLevel(0)
			self.Trinketbg = Trinketbg
			
			local Trinket = CreateFrame("Frame", nil, Trinketbg)
			Trinket:SetAllPoints(Trinketbg)
			Trinket:SetPoint("TOPLEFT", Trinketbg, TukuiDB.Scale(2), TukuiDB.Scale(-2))
			Trinket:SetPoint("BOTTOMRIGHT", Trinketbg, TukuiDB.Scale(-2), TukuiDB.Scale(2))
			Trinket:SetFrameLevel(1)
			Trinket.trinketUseAnnounce = true
			self.Trinket = Trinket
		end
		
		-- boss & arena frames cast bar!
		local castbar = CreateFrame("StatusBar", self:GetName().."_Castbar", self)
		castbar:SetPoint("LEFT", 0, 0)
		castbar:SetPoint("RIGHT", 0, 0)
		castbar:SetPoint("BOTTOM", 0, (TukuiDB.Scale(-21)))
		
		castbar:SetHeight(hpheight*0.9)
		castbar:SetStatusBarTexture(normTex)
		castbar:SetFrameLevel(6)
		
		castbar.bg = castbar:CreateTexture(nil, "BORDER")
		castbar.bg:SetAllPoints(castbar)
		castbar.bg:SetTexture(normTex)
		castbar.bg:SetVertexColor(.15, .15, .15)

		castbar:SetBackdrop(backdrop)
		castbar:SetBackdropColor(0, 0, 0)

		castbar.time = TukuiDB.SetFontString(castbar, font2, 12)
		castbar.time:SetPoint("RIGHT", castbar, "RIGHT", TukuiDB.Scale(-4), 0)
		castbar.time:SetTextColor(.84, .75, .65)
		castbar.time:SetJustifyH("RIGHT")
		castbar.time:SetShadowColor(0, 0, 0)
		castbar.time:SetShadowOffset(1.25, -1.25)
		castbar.CustomTimeText = TukuiDB.CustomCastTimeText

		castbar.Text = TukuiDB.SetFontString(castbar, font2, 13)
		castbar.Text:SetPoint("LEFT", castbar, "LEFT", 4, 0)
		castbar.Text:SetTextColor(.84, .75, .65)
		castbar.Text:SetShadowColor(0, 0, 0)
		castbar.Text:SetShadowOffset(1.25, -1.25)
		
		castbar.CustomDelayText = TukuiDB.CustomCastDelayText
		castbar.PostCastStart = TukuiDB.CheckCast
		castbar.PostChannelStart = TukuiDB.CheckChannel
		
		if db.cbicons == true then
			castbar:SetPoint("LEFT", (castbar:GetHeight()+4), 0)
			
			castbar.button = CreateFrame("Frame", nil, castbar)
			castbar.button:SetHeight(castbar:GetHeight())
			castbar.button:SetWidth(castbar:GetHeight())
			castbar.button:SetPoint("RIGHT", castbar, "LEFT", TukuiDB.Scale(-4), 0)
			TukuiDB.SetTemplate(castbar.button)
			
			castbar.icon = castbar.button:CreateTexture(nil, "ARTWORK")
			castbar.icon:SetPoint("TOPLEFT", castbar.button, TukuiDB.Scale(1), TukuiDB.Scale(-1))
			castbar.icon:SetPoint("BOTTOMRIGHT", castbar.button, TukuiDB.Scale(-1), TukuiDB.Scale(1))
			castbar.icon:SetTexCoord(0.08, 0.92, 0.08, .92)
		end
		
		self.Castbar = castbar
		self.Castbar.Time = castbar.time
		self.Castbar.Icon = castbar.icon
	end

	------------------------------------------------------------------------
	--	Main tanks and Main Assists layout (both mirror'd)
	------------------------------------------------------------------------
	
	if(self:GetParent():GetName():match"oUF_MainTank" or self:GetParent():GetName():match"oUF_MainAssist") then
		-- Right-click focus on maintank or mainassist units
		self:SetAttribute("type2", "focus")
		
		-- health 
		local health = CreateFrame('StatusBar', nil, self)
		health:SetHeight(assisttank_height)
		health:SetPoint("TOPLEFT")
		health:SetPoint("TOPRIGHT")
		health:SetStatusBarTexture(normTex)
		
		local healthBG = health:CreateTexture(nil, 'BORDER')
		healthBG:SetAllPoints()
		healthBG:SetTexture(unpack(TukuiCF["media"].healthdeficit))

		self.Health = health
		self.Health.bg = healthBG
		
		health.frequentUpdates = true
		if db.showsmooth == true then
			health.Smooth = true
		end
		
		if db.unicolor == true then
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor(unpack(TukuiCF["media"].healthcolor))
		else
			health.colorDisconnected = true
			health.colorClass = true
			health.colorReaction = true
		end
	
		--RaidIcon:SetPoint("RIGHT", self, "RIGHT")
	
		-- names
		local Name = health:CreateFontString(nil, "OVERLAY")
		Name:SetPoint("LEFT", health, "LEFT", TukuiDB.Scale(5), 0)
		Name:SetJustifyH("CENTER")
		Name:SetFont(font2, 12)
		Name:SetShadowColor(0, 0, 0)
		Name:SetShadowOffset(1.25, -1.25)

		if db.unicolor == true then
			self:Tag(Name, '[Tukui:getnamecolor][Tukui:namelong]')
		else
			self:Tag(Name, '[Tukui:namelong]')
			Name:SetTextColor(unpack(TukuiCF["media"].tncolor))
		end		

		self.Name = Name
	end

	return self
end

------------------------------------------------------------------------
--	Default position of Tukui unitframes
------------------------------------------------------------------------

oUF:RegisterStyle('Tukz', Shared)

-- player
local player = oUF:Spawn('player', "oUF_Tukz_player")
player:SetSize(ufwidth, ufheight)
if TukuiDB.lowversion then
	player:SetPoint("BOTTOMLEFT", InvTukuiActionBarBackground, "TOPLEFT", TukuiDB.Scale(35.5), TukuiDB.Scale(90))
else
	player:SetPoint("BOTTOMLEFT", InvTukuiActionBarBackground, "TOPLEFT", TukuiDB.Scale(-27.5), TukuiDB.Scale(97))
end

-- target
local target = oUF:Spawn('target', "oUF_Tukz_target")
target:SetSize(ufwidth, ufheight)
if TukuiDB.lowversion then
	target:SetPoint("BOTTOMRIGHT", InvTukuiActionBarBackground, "TOPRIGHT", TukuiDB.Scale(-35.5), TukuiDB.Scale(90))
else
	target:SetPoint("BOTTOMRIGHT", InvTukuiActionBarBackground, "TOPRIGHT", TukuiDB.Scale(25.5), TukuiDB.Scale(97))
end

-- focus
local focus = oUF:Spawn('focus', "oUF_Tukz_focus")
focus:SetSize(sufwidth, sufheight)
if TukuiCF["unitframes"].separatecastbar == true then
	focus:SetPoint("TOPRIGHT", oUF_Tukz_player, "BOTTOMRIGHT", 0, TukuiDB.Scale(-7))
else
	focus:SetPoint("TOPRIGHT", oUF_Tukz_player, "BOTTOMRIGHT", 0, TukuiDB.Scale(-12))
end

-- tot
local tot = oUF:Spawn('targettarget', "oUF_Tukz_targettarget")
tot:SetSize(sufwidth, sufheight)
if TukuiCF["unitframes"].separatecastbar == true then
	tot:SetPoint("TOPRIGHT", oUF_Tukz_target, "BOTTOMRIGHT", 0, TukuiDB.Scale(-7))
else
	tot:SetPoint("TOPRIGHT", oUF_Tukz_target, "BOTTOMRIGHT", 0, TukuiDB.Scale(-12))
end

-- pet
local pet = oUF:Spawn('pet', "oUF_Tukz_pet")
pet:SetSize(sufwidth, sufheight)
if TukuiCF["unitframes"].separatecastbar == true then
	pet:SetPoint("TOPLEFT", oUF_Tukz_player, "BOTTOMLEFT", 0, TukuiDB.Scale(-7))
else
	pet:SetPoint("TOPLEFT", oUF_Tukz_player, "BOTTOMLEFT", 0, TukuiDB.Scale(-12))
end

-- focus target
if db.showfocustarget then
	local focustarget = oUF:Spawn("focustarget", "oUF_Tukz_focustarget")
	focustarget:SetPoint("BOTTOM", UIParent, "BOTTOM", TukuiDB.Scale(-215), TukuiDB.Scale(400))
	focustarget:SetSize(ufwidth*0.8, ufheight)
end

-- arena
if TukuiCF.arena.unitframes then
	local arena = {}
	for i = 1, 5 do
		arena[i] = oUF:Spawn("arena"..i, "oUF_Arena"..i)
		if i == 1 then
			arena[i]:SetPoint("BOTTOM", UIParent, "BOTTOM", 375, 450)
		else
			arena[i]:SetPoint("BOTTOM", arena[i-1], "TOP", 0, 10)
		end
		arena[i]:SetSize(ufwidth, ufheight)
	end
end

-- boss
if db.showboss then
	for i = 1,MAX_BOSS_FRAMES do
		local t_boss = _G["Boss"..i.."TargetFrame"]
		t_boss:UnregisterAllEvents()
		t_boss.Show = TukuiDB.dummy
		t_boss:Hide()
		_G["Boss"..i.."TargetFrame".."HealthBar"]:UnregisterAllEvents()
		_G["Boss"..i.."TargetFrame".."ManaBar"]:UnregisterAllEvents()
	end

	local boss = {}
	for i = 1, MAX_BOSS_FRAMES do
		boss[i] = oUF:Spawn("boss"..i, "oUF_Boss"..i)
		if i == 1 then
			boss[i]:SetPoint("BOTTOM", UIParent, "BOTTOM", 375, 450)
		else
			boss[i]:SetPoint('BOTTOM', boss[i-1], 'TOP', 0, 10)             
		end
		boss[i]:SetSize(ufwidth, ufheight)
	end
end

-- maintank
if TukuiCF["unitframes"].maintank == true then
	local tank = oUF:SpawnHeader('oUF_MainTank', nil, 'raid',
		'oUF-initialConfigFunction', ([[
			self:SetWidth(%d)
			self:SetHeight(%d)
		]]):format(assisttank_width, assisttank_height),
		'showRaid', true,
		'groupFilter', 'MAINTANK',
		'yOffset', 7,
		'point' , 'BOTTOM',
		'template', 'oUF_tukzMtt'
	)
	tank:SetPoint("LEFT", UIParent, "TOPLEFT", 225, -150)
end
 
if TukuiCF["unitframes"].mainassist == true then
	local assist = oUF:SpawnHeader("oUF_MainAssist", nil, 'raid',
		'oUF-initialConfigFunction', ([[
			self:SetWidth(%d)
			self:SetHeight(%d)
		]]):format(assisttank_width, assisttank_height),
		'showRaid', true,
		'groupFilter', 'MAINASSIST',
		'yOffset', 7,
		'point' , 'BOTTOM',
		'template', 'oUF_tukzMtt'
	)
	if TukuiCF["unitframes"].maintank == true then
		assist:SetPoint("TOPLEFT", oUF_MainTank, "BOTTOMLEFT", 2, -50)
	else
		assist:SetPoint("LEFT", UIParent, "TOPLEFT", 225, -150)
	end
end

-- this is just a fake party to hide Blizzard frame if no Tukui raid layout are loaded.
local party = oUF:SpawnHeader("oUF_noParty", nil, "party", "showParty", true)

------------------------------------------------------------------------
--	Just a command to test buffs/debuffs alignment
------------------------------------------------------------------------

local testui = TestUI or function() end
TestUI = function()
	testui()
	UnitAura = function()
		-- name, rank, texture, count, dtype, duration, timeLeft, caster
		return 'penancelol', 'Rank 2', 'Interface\\Icons\\Spell_Holy_Penance', random(5), 'Magic', 0, 0, "player"
	end
	if(oUF) then
		for i, v in pairs(oUF.units) do
			if(v.UNIT_AURA) then
				v:UNIT_AURA("UNIT_AURA", v.unit)
			end
		end
	end
end
SlashCmdList.TestUI = TestUI
SLASH_TestUI1 = "/testui"

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