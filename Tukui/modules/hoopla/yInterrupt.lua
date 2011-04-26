local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

if C["misc"].interrupt ~= true then return end

local function OnEvent(self, event, ...)
	if (event == "COMBAT_LOG_EVENT_UNFILTERED") then
		if GetNumRaidMembers() > 5 then channel = "RAID" elseif GetNumPartyMembers() > 0 then channel = "PARTY" else return end
		local _, eventType, _, sourceName, _, _, destName, _, spellID, spellName, _, extraskillID, extraskillname = ...
		if (eventType == "SPELL_INTERRUPT") and sourceName == T.myname then
			SendChatMessage(GetSpellLink(extraskillID).." interrupted", channel)
		elseif (eventType == "SPELL_STOLEN") and sourceName == T.myname then
			SendChatMessage(GetSpellLink(extraskillID).." stolen", channel)
		end
	end
end

local yAnnounce = CreateFrame("Frame")
yAnnounce:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
yAnnounce:SetScript("OnEvent", OnEvent)