local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

if C["misc"].interrupt ~= true then return end

function ShowSpellLink(spellID)
    local spellLink = GetSpellLink(spellID or 0)
end

local function OnEvent(self, event, ...)
	if (event == "COMBAT_LOG_EVENT_UNFILTERED") then
		local timestamp, eventType, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellID, spellName, _, extraskillID, extraskillname = ...
		if (eventType == "SPELL_INTERRUPT") and sourceName == UnitName("player") then
			if UnitInRaid("player") and GetNumRaidMembers() > 1 then
				SendChatMessage(GetSpellLink(extraskillID).." interrupted", "RAID")
			elseif UnitInParty("player") and GetNumPartyMembers() < 5 then
				SendChatMessage(GetSpellLink(extraskillID).." interrupted", "PARTY")
			end
		elseif (eventType == "SPELL_STOLEN") and sourceName == UnitName("player") then
			if UnitInRaid("player") and GetNumRaidMembers() > 1 then
				SendChatMessage(GetSpellLink(extraskillID).." stolen", "RAID")
			elseif UnitInParty("player") and GetNumPartyMembers() < 5 then
				SendChatMessage(GetSpellLink(extraskillID).." stolen", "PARTY")
			end
		end
	end
end

local yAnnounce = CreateFrame("Frame")
yAnnounce:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
yAnnounce:SetScript("OnEvent", OnEvent)