--------------------------------------------------------------------
--[[ ZONE
--------------------------------------------------------------------

if TukuiCF["datatext"].zone == true then
	local zone = CreateFrame("Frame", "TukuiMinimapZone", UIParent)
	TukuiDB.CreatePanel(zone, (Minimap:GetWidth() + 4), 18, "TOP", Minimap, "BOTTOM", 0, -1)

	local ztext = TukuiMinimapZone:CreateFontString(nil, "OVERLAY")
	ztext:SetFont(TukuiCF.media.font, TukuiCF["datatext"].fontsize)
	ztext:SetPoint("CENTER", zone)

	local function OnEvent(self, event)
		local loc = GetMinimapZoneText()
		local pvpType, isFFA, zonePVPStatus = GetZonePVPInfo()
	
		if (pvpType == "sanctuary") then
			loc = "|cff69C9EF"..loc.."|r" -- light blue
		elseif (pvpType == "friendly") then
			loc = "|cff00ff00"..loc.."|r" -- green
		elseif (pvpType == "contested") then
			loc = "|cffffff00"..loc.."|r" -- yellow
		elseif (pvpType == "hostile" or pvpType == "combat" or pvpType == "arena" or not pvpType) then
			loc = "|cffff0000"..loc.."|r" -- red
		else
			loc = loc -- white
		end
		
		ztext:SetText(loc)
	end
	
	zone:RegisterEvent("PLAYER_ENTERING_WORLD")
	zone:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	zone:RegisterEvent("ZONE_CHANGED")
	zone:RegisterEvent("ZONE_CHANGED_INDOORS")
	zone:HookScript("OnEvent", OnEvent)
end--]]