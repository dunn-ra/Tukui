-- Mark Bar created by Smelly
-- Credits to Hydra, Elv22, Safturento, and many more!
if not TukuiCF["others"].markbar == true then return end
--[[--------------------------------------------------
From TukuiMarkBar.toc
## Interface: 40000
## Title: |cffC495DDTukui|r Mark Bar
## Notes: HIDE YO KIDS, HIDE YO MARKS!
## Author: Smelly
## Version: 1.1
## RequiredDeps: Tukui

MarkBarLocal.lua
core.lua
----------------------------------------------------]]

local MarkBarLocal = { }
local client = GetLocale() 

MarkBarLocal.button_Clear = "Clear Target"
MarkBarLocal.button_MarkBar = "Mark Bar"

if client == "frFR" then -- French
	MarkBarLocal.button_Clear = "Supprimer l'objectif"
	MarkBarLocal.button_MarkBar = "Barre de symboles"
elseif client == "deDE" then -- German
	MarkBarLocal.button_Clear = "Ziel l??en"
	MarkBarLocal.button_MarkBar = "Raidsymbol-Leiste"
elseif client == "koKR" then -- Korean
	MarkBarLocal.button_Clear = "Clear Target"
	MarkBarLocal.button_MarkBar "Mark Bar"
elseif client == "ruRU" then -- Russian
	MarkBarLocal.button_Clear = "Clear Target"
	MarkBarLocal.button_MarkBar = "Mark Bar"
elseif client == "esES" then -- Spanish
	MarkBarLocal.button_Clear = "Limpiar Objetivo"
	MarkBarLocal.button_MarkBar = "Barra de Marcas de objetivo"
elseif client == "zhTW" then -- Taiwanese
	MarkBarLocal.button_Clear = "Clear Target"
	MarkBarLocal.button_MarkBar = "Mark Bar"
end
-- Config
font = TukuiCF.media.font           	-- Font to be used for button text
fontsize = 12                     		-- Size of font for button text
buttonwidth = TukuiDB.Scale(30)    		-- Width of menu buttons
buttonheight = TukuiDB.Scale(30)   		-- Height of menu buttons
toplayout = true						-- Position of the menu
datatext = false					-- Make it into a datatext

-- Default position of toggle button and background
local anchor = {}
if toplayout == true then
	anchor = {"TOPLEFT", UIParent, "TOPLEFT", 165, -3}
else
	anchor = {"BOTTOMLEFT", TukuiInfoRight, "TOPLEFT", 0, 3}
end

--Background Frame
local MarkBarBG = CreateFrame("Frame", "MarkBarBackground", UIParent)
TukuiDB.CreatePanel(MarkBarBG, buttonwidth * 4 + TukuiDB.Scale(10), buttonheight * 3, "BOTTOMLEFT", TukuiInfoRight, "TOPLEFT", 0, TukuiDB.Scale(3))
MarkBarBG:SetBackdropColor(unpack(TukuiCF["media"].backdropcolor))
MarkBarBG:SetFrameLevel(0)
MarkBarBG:SetFrameStrata("HIGH")
MarkBarBG:ClearAllPoints()
MarkBarBG:SetPoint(unpack(anchor))
MarkBarBG:Hide()

--Change border when mouse is inside the button
local function ButtonEnter(self)
	local color = RAID_CLASS_COLORS[TukuiDB.myclass]
	self:SetBackdropBorderColor(color.r, color.g, color.b)
end
 
--Change border back to normal when mouse leaves button
local function ButtonLeave(self)
	self:SetBackdropBorderColor(unpack(TukuiCF["media"].bordercolor))
end

-- Mark Button BG and icons
icon = CreateFrame("Button", "tmb_Icon", MarkBarBG)
mark = CreateFrame("Button", "tmb_Menu", MarkBarBG)
for i = 1, 8 do
	mark[i] = CreateFrame("Button", "tbm_Mark"..i, MarkBarBG)
	TukuiDB.CreatePanel(mark[i], buttonwidth, buttonheight, "LEFT", MarkBarBG, "LEFT", TukuiDB.Scale(2), TukuiDB.Scale(-2))
	if i == 1 then
		mark[i]:SetPoint("TOPLEFT", MarkBarBG, "TOPLEFT",  TukuiDB.Scale(2), TukuiDB.Scale(-2))
	elseif i == 5 then
		mark[i]:SetPoint("TOP", mark[1], "BOTTOM", 0, TukuiDB.Scale(-2))
	else
		mark[i]:SetPoint("LEFT", mark[i-1], "RIGHT", TukuiDB.Scale(2), 0)
	end
	mark[i]:EnableMouse(true)
	mark[i]:SetScript("OnEnter", ButtonEnter)
	mark[i]:SetScript("OnLeave", ButtonLeave)
	mark[i]:RegisterForClicks("AnyUp")
	mark[i]:SetFrameStrata("HIGH")
	
	icon[i] = CreateFrame("Button", "icon"..i, MarkBarBG)
	icon[i]:SetNormalTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcons")
	icon[i]:SetSize(20, 20)
	icon[i]:SetPoint("CENTER", mark[i])
	icon[i]:SetFrameStrata("HIGH")
	
	-- Set up each button
	if i == 1 then -- Skull
		mark[i]:SetScript("OnMouseUp", function() SetRaidTarget("target", 8) end)
		icon[i]:GetNormalTexture():SetTexCoord(0.75,1,0.25,0.5)
	elseif i == 2 then -- Cross
		mark[i]:SetScript("OnMouseUp", function() SetRaidTarget("target", 7) end)
		icon[i]:GetNormalTexture():SetTexCoord(0.5,0.75,0.25,0.5)
	elseif i == 3 then -- Square
		mark[i]:SetScript("OnMouseUp", function() SetRaidTarget("target", 6) end)
		icon[i]:GetNormalTexture():SetTexCoord(0.25,0.5,0.25,0.5)
	elseif i == 4 then -- Moon
		mark[i]:SetScript("OnMouseUp", function() SetRaidTarget("target", 5) end)
		icon[i]:GetNormalTexture():SetTexCoord(0,0.25,0.25,0.5)
	elseif i == 5 then -- Triangle
		mark[i]:SetScript("OnMouseUp", function() SetRaidTarget("target", 4) end)
		icon[i]:GetNormalTexture():SetTexCoord(0.75,1,0,0.25)
	elseif i == 6 then -- Diamond
		mark[i]:SetScript("OnMouseUp", function() SetRaidTarget("target", 3) end)
		icon[i]:GetNormalTexture():SetTexCoord(0.5,0.75,0,0.25)
	elseif i == 7 then -- Circle
		mark[i]:SetScript("OnMouseUp", function() SetRaidTarget("target", 2) end)
		icon[i]:GetNormalTexture():SetTexCoord(0.25,0.5,0,0.25)
	elseif i == 8 then -- Star
		mark[i]:SetScript("OnMouseUp", function() SetRaidTarget("target", 1) end)
		icon[i]:GetNormalTexture():SetTexCoord(0,0.25,0,0.25)
	end
end
 
-- Create Button for clear target
local ClearTargetButton = CreateFrame("Button", "ClearTargetButton", MarkBarBackground)
TukuiDB.CreatePanel(ClearTargetButton, (TukuiDB.Scale(buttonwidth) * 4) + 6, 22, "TOPLEFT", mark[5], "BOTTOMLEFT", 0, TukuiDB.Scale(-2))
ClearTargetButton:SetScript("OnEnter", ButtonEnter)
ClearTargetButton:SetScript("OnLeave", ButtonLeave)
ClearTargetButton:SetScript("OnMouseUp", function() SetRaidTarget("target", 0) end)
ClearTargetButton:SetFrameStrata("HIGH")

local ClearTargetButtonText = ClearTargetButton:CreateFontString("ClearTargetButtonText","OVERLAY", ClearTargetButton)
ClearTargetButtonText:SetFont(TukuiCF.media.font,fontsize,"OUTLINE")
ClearTargetButtonText:SetText(MarkBarLocal.button_Clear)
ClearTargetButtonText:SetPoint("CENTER")
ClearTargetButtonText:SetJustifyH("CENTER", 1, 0)

if datatext == false then
--Create toggle button
	local ToggleButton = CreateFrame("Frame", "ToggleButton", UIParent)
	TukuiDB.CreateTransPanel(ToggleButton, 100, 20, "CENTER", UIParent, "CENTER", 0, 0)
	ToggleButton:ClearAllPoints()
	ToggleButton:SetPoint(unpack(anchor))
	ToggleButton:EnableMouse(true)
	ToggleButton:SetScript("OnEnter", ButtonEnter)
	ToggleButton:SetScript("OnLeave", ButtonLeave)

	local ToggleButtonText = ToggleButton:CreateFontString(nil ,"OVERLAY")
	ToggleButtonText:SetFont(TukuiCF.media.font, fontsize)
	ToggleButtonText:SetText(MarkBarLocal.button_MarkBar)
	ToggleButtonText:SetPoint("CENTER", ToggleButton, "CENTER")
	
	--Create close button
	local CloseButton = CreateFrame("Frame", "CloseButton", MarkBarBackground)
	TukuiDB.CreatePanel(CloseButton, 15, 15, "TOPRIGHT", MarkBarBackground, "TOPLEFT", TukuiDB.Scale(-3), 0)
	CloseButton:EnableMouse(true)
	CloseButton:SetScript("OnEnter", ButtonEnter)
	CloseButton:SetScript("OnLeave", ButtonLeave)
	
	local CloseButtonText = CloseButton:CreateFontString(nil, "OVERLAY")
	CloseButtonText:SetFont(TukuiCF.media.font, fontsize)
	CloseButtonText:SetText("X")
	CloseButtonText:SetPoint("CENTER", CloseButton, "CENTER")

	ToggleButton:SetScript("OnMouseDown", function()
		if MarkBarBackground:IsShown() then
			MarkBarBackground:Hide()
		else
			MarkBarBackground:Show()
		end
	end)
	
	CloseButton:SetScript("OnMouseDown", function()
		if MarkBarBackground:IsShown() then
			MarkBarBackground:Hide()
		else
			ToggleButton:Show()
		end
	end)
end

--Setup datatext position and function
if datatext == true then
	if TukuiCF["datatext"].raidmarks and TukuiCF["datatext"].raidmarks > 0 then
		--Create toggle button
		local ToggleButton = CreateFrame("Frame", "dToggleButton", UIParent)
		ToggleButton:EnableMouse(true)
		ToggleButton:SetWidth(80)
		TukuiDB.PP(TukuiCF["datatext"].raidmarks, dToggleButton)

		local ToggleButtonText = TukuiInfoLeft:CreateFontString(nil ,"OVERLAY")
		ToggleButtonText:SetFont(TukuiCF.media.font, fontsize)
		ToggleButtonText:SetText(MarkBarLocal.button_MarkBar)
		ToggleButtonText:SetPoint("CENTER", ToggleButton, "CENTER")

		dToggleButton:SetScript("OnMouseDown", function()
			if MarkBarBackground:IsShown() then
				MarkBarBackground:Hide()
			else
				MarkBarBackground:Show()
			end
		end)
	end
end

--Check if we are Raid Leader or Raid Officer
local function CheckRaidStatus()
	local inInstance, instanceType = IsInInstance()
	local partyMembers = GetNumPartyMembers()
 
	if not UnitInRaid("player") and partyMembers >= 1 then return true
	elseif UnitIsRaidOfficer("player") then return true
	elseif not inInstance or instanceType == "pvp" or instanceType == "arena" then return false
	end
end

--Automatically show/hide the frame if we have RaidLeader or RaidOfficer
local LeadershipCheck = CreateFrame("Frame")
LeadershipCheck:RegisterEvent("RAID_ROSTER_UPDATE")
LeadershipCheck:RegisterEvent("PARTY_MEMBERS_CHANGED")
LeadershipCheck:RegisterEvent("PLAYER_ENTERING_WORLD")
LeadershipCheck:SetScript("OnEvent", function(self, event)
	if CheckRaidStatus() then
		if datatext == true then
			dToggleButton:Show()
			MarkBarBackground:Hide()
		else
			ToggleButton:Show()
			MarkBarBackground:Hide()
		end
	else
		if datatext == true then
			--Hide Everything..
			dToggleButton:Hide()
			MarkBarBackground:Hide()
		else
			ToggleButton:Hide()
			MarkBarBackground:Hide()
		end
	end
end)