local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

if C["misc"].iannounce ~= true then return end

function ShowSpellLink(spellID)
    local spellLink = GetSpellLink(spellID or 0)
end

local function OnEvent(self, event, ...)
	if (event == "COMBAT_LOG_EVENT_UNFILTERED") then
		-- pvp zone
		local timestamp, eventType, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellID, spellName, _, extraskillID, extraskillname = ...
		if (eventType == "SPELL_INTERRUPT") and sourceName == UnitName("player") then
			if UnitInParty("player") then
				SendChatMessage(GetSpellLink(extraskillID).." interrupted", "PARTY")
			elseif UnitInRaid("player") then
				SendChatMessage(GetSpellLink(extraskillID).." interrupted", "RAID")
			else
				SendChatMessage(GetSpellLink(extraskillID).." interrupted", "SAY")
			end
		elseif (eventType == "SPELL_STOLEN") and sourceName == UnitName("player") then
			if UnitInParty("player") then
				SendChatMessage(GetSpellLink(extraskillID).." stolen", "PARTY")
			elseif UnitInRaid("player") then
				SendChatMessage(GetSpellLink(extraskillID).." stolen", "RAID")
			else
				SendChatMessage(GetSpellLink(extraskillID).." stolen", "SAY")
			end
		end
	end
end

local yAnnounce = CreateFrame("Frame")
yAnnounce:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
yAnnounce:SetScript("OnEvent", OnEvent)