local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales
-- Interrupt announcement script, credits to Elv
if C["misc"].announceinterrupt ~= true then return end

local announce = CreateFrame("Frame")
announce:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
announce:SetScript("OnEvent", function(self, _, _, event, _, sourceName, _, _, destName, _, _, _, _, spellID, spellName)
	if not (event == "SPELL_INTERRUPT" and sourceName == T.myname) then return end
	
	if GetRealNumPartyMembers() > 0 then
		SendChatMessage(INTERRUPTED.." "..destName.."'s \124cff71d5ff\124Hspell:"..spellID.."\124h["..spellName.."]\124h\124r!", "PARTY", nil, nil)
	elseif GetRealNumRaidMembers() > 0 then
		SendChatMessage(INTERRUPTED.." "..destName.."'s \124cff71d5ff\124Hspell:"..spellID.."\124h["..spellName.."]\124h\124r!", "RAID", nil, nil)
	--elseif IsActiveBattlefieldArena() then
		--SendChatMessage(INTERRUPTED.." "..destName.."'s \124cff71d5ff\124Hspell:"..spellID.."\124h["..spellName.."]\124h\124r!", "PARTY", nil, nil)
	end
end)