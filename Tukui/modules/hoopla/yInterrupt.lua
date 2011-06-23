local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

if C["misc"].interrupt ~= true then return end

local function OnEvent(self, event, ...)
if T.toc < 40200 then
	_, eventType, _, _, sourceName, _, _, destName, _, spellID, spellName, _, extraskillID, extraskillname = ...
else
	_, eventType, _, _, sourceName, _, _, _, destName, _, _, spellID, spellName, _, extraskillID, extraskillname = ...
end
	if (event == "COMBAT_LOG_EVENT_UNFILTERED") then
		if GetNumRaidMembers() >= 5 then channel = "RAID" elseif GetNumPartyMembers() >= 1 then channel = "PARTY" else return end
		--local channel = "SAY"
		
		if (eventType == "SPELL_INTERRUPT") and sourceName == T.myname then
			SendChatMessage(GetSpellLink(extraskillID).." interrupted", channel)
		elseif (eventType == "SPELL_STOLEN") and sourceName == T.myname then
			SendChatMessage(GetSpellLink(extraskillID).." stolen.", channel)
		end
	end
end

local yInterrupt = CreateFrame("Frame")
yInterrupt:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
yInterrupt:SetScript("OnEvent", OnEvent)