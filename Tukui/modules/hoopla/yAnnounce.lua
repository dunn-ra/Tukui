local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

if C.misc.announce ~= true then return end

local function Update(self, event, ...)
if T.toc < 40200 then
	timestamp, eventType, _, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellID, spellName, _, extraskillID, extraskillname = ...
else
	timestamp, eventType, _, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID, spellName, _, extraskillID, extraskillname = ...
end

if GetNumRaidMembers() >= 5 then channel = "RAID" elseif GetNumPartyMembers() >= 1 then channel = "PARTY" else return end
--local channel = "SAY"
	
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
		if sourceName == T.myname then
			if eventType == "SPELL_AURA_APPLIED" then
				if spellID == 2637 or spellID == 33786 or spellID == 339 then -- Hibernate, Cyclone, Roots
					SendChatMessage(GetSpellLink(spellID).." on "..destName, channel)
				elseif spellID == 3355 or spellID == 19386 then -- Freezing Trap, Wyvern Sting
					SendChatMessage(GetSpellLink(spellID).." on "..destName, channel)
				elseif spellID == 118 or spellID == 61305 or spellID == 28272 or spellID == 61721 or spellID == 61780 or spellID == 28271 then -- Polymorph
					SendChatMessage(GetSpellLink(spellID).." on "..destName, channel)
				elseif spellID == 10326 or spellID == 853 then -- Turn Evil, Hammer of Justice
					SendChatMessage(GetSpellLink(spellID).." on "..destName, channel)
				elseif spellID == 9484 or spellID == 605 then -- Shackle Undead, Mind Control
					SendChatMessage(GetSpellLink(spellID).." on "..destName, channel)
				elseif spellID == 6770 or spellID == 2094 or spellID == 51722 then -- Sap, Blind, Dismantle
					SendChatMessage(GetSpellLink(spellID).." on "..destName, channel)
				elseif spellID == 51514 or spellID == 76780 then -- Hex, Bind Elemental
					SendChatMessage(GetSpellLink(spellID).." on "..destName, channel)
				elseif spellID == 5484 or spellID == 710 or spellID == 5782 then -- Howl of Terror, Banish, Fear
					SendChatMessage(GetSpellLink(spellID).." on "..destName, channel)
				elseif spellID == 676 or spellID == 85388 or spellID == 12809 then -- Disarm, Throwdown, Concussion Blow
					SendChatMessage(GetSpellLink(spellID).." on "..destName, channel)
				end
			-- SPELL_AURA_APPLIED ended
			elseif eventType == "SPELL_CAST_SUCCESS" then
				if spellID == 32182 or spellID == 2825 or spellID == 80353 or spellID == 90355 then -- Bloodlust, Heroism, Timewarp, Ancient Hysteria
					SendChatMessage("Sorry, misclicked", channel)
				elseif spellID == 29893 or spellID == 698 or spellID == 43987 then -- Ritual of Souls, Ritual of Summoning, Ritual of Refreshment
					SendChatMessage(GetSpellLink(spellID)..", click it!", channel)
				end
			-- SPELL_CAST_SUCCESS ended
			elseif eventType == "SPELL_SUMMON" and C.misc.conjured == true then
				if spellID == 724 then -- Lightwell
					SendChatMessage(GetSpellLink(spellID).." up, click it!", channel)
				elseif spellID == 16190 or spellID == 98008 or spellID == 8143 then -- Mana Tide, Spirit Link, Tremor Totem
					SendChatMessage(GetSpellLink(spellID).." up.", channel)
				end
			-- SPELL_SUMMON ended
			elseif eventType == "SPELL_CAST_START" or eventType == "SPELL_CREATE" then
				if spellID == 92649 or spellID == 92712 or spellID == 87915 or spellID == 87644 or spellID == 87643 then -- Cauldron of Battle, Big Cauldron of Battle, Goblin Barbecue, Seafood Magnifique, Broiled Dragon
					SendChatMessage(GetSpellLink(spellID)..", eat!", channel)
				end
			-- SPELL_CAST_START and SPELL_CREATE ended
			end
		end
	end
end

local yAnnounce = CreateFrame("Frame")
yAnnounce:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
yAnnounce:SetScript("OnEvent", Update)