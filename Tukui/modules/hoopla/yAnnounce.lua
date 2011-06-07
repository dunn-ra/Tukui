local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

if C.misc.announce ~= true then return end

local function Update(self, event, ...)
local _, eventType, _, _, sourceName, _, _, destName, _, spellID, spellName, _, extraskillID, extraskillname = ...
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
		if sourceName == T.myname or sourceName == T.mypet then
			if GetNumRaidMembers() >= 5 then channel = "RAID" elseif GetNumPartyMembers() >= 1 then channel = "PARTY" else return end
			--local channel = "SAY"
			if eventType == "SPELL_AURA_APPLIED" then -- CCs
				-- Druid
				if spellID == 2637 or spellID == 33786 or spellID == 339 then -- Hibernate, Cyclone, Roots
					SendChatMessage(GetSpellLink(spellID).." on "..destName..".", channel)
				-- Hunter
				elseif spellID == 3355 or spellID == 19386 then -- Freezing Trap, Wyvern Sting
					SendChatMessage(GetSpellLink(spellID).." on "..destName..".", channel)
				-- Mage
				elseif spellID == 118 or spellID == 61305 or spellID == 28272 or spellID == 61721 or spellID == 61780 or spellID == 28271 then -- Polymorph
					SendChatMessage(GetSpellLink(spellID).." on "..destName..".", channel)
				-- Paladin
				elseif spellID == 10326 or spellID == 54428 or spellID == 853 then -- Turn Evil, Divine Plea, Hammer of Justice
					SendChatMessage(GetSpellLink(spellID).." on "..destName..".", channel)
				-- Priest
				elseif spellID == 9484 or spellID == 605 then -- Shackle Undead, Mind Control
					SendChatMessage(GetSpellLink(spellID).." on "..destName..".", channel)
				-- Rogue
				elseif spellID == 6770 or spellID == 2094 or spellID == 51722 then -- Sap, Blind, Dismantle
					SendChatMessage(GetSpellLink(spellID).." on "..destName..".", channel)
				-- Shaman
				elseif spellID == 51514 or spellID == 76780 then -- Hex, Bind Elemental
					SendChatMessage(GetSpellLink(spellID).." on "..destName..".", channel)
				-- Warlock
				elseif spellID == 5484 or spellID == 710 or spellID == 5782 or spellID == 6358 then -- Howl of Terror, Banish, Fear, Seduction
					SendChatMessage(GetSpellLink(spellID).." on "..destName..".", channel)
				-- Warrior
				elseif spellID == 676 or spellID == 85388 or spellID == 12809 then -- Disarm, Throwdown, Concussion Blow
					SendChatMessage(GetSpellLink(spellID).." on "..destName..".", channel)
				end
			elseif eventType == "SPELL_CAST_SUCCESS" then -- Conjured items
				-- Shaman, Mage, Hunter
				if spellID == 32182 or spellID == 2825 or spellID == 80353 or spellID == 90355 then -- Bloodlust, Heroism, Timewarp, Ancient Hysteria
					SendChatMessage("Sorry, misclicked", channel)
				-- Warlock
				elseif spellID == 29893 or spellID == 698 or spellID == 43987 then -- Ritual of Souls, Ritual of Summoning, Ritual of Refreshment
					SendChatMessage(GetSpellLink(spellID)..", click it!", channel)
				end
			elseif eventType == "SPELL_AURA_REMOVED" and C.misc.ending == true then -- End of CCs
				--if spellID == 
					--SendChatMessage(GetSpellLink(spellID).." ended.", channel)
			elseif eventType == "SPELL_SUMMON" and C.misc.conjured == true then -- Totems
				-- Priest
				if spellID == 724 then -- Lightwell
					SendChatMessage(GetSpellLink(spellID).." up, click it!", channel)
				-- Shaman
				elseif spellID == 16190 or spellID == 98008 or spellID == 8143 then -- Mana Tide, Spirit Link, Tremor Totem
					SendChatMessage(GetSpellLink(spellID).." up.", channel)
				end
			elseif event == "UNIT_DESTROYED" then
				-- Shaman
				if spellID == 16190 or spellID == 98008 or spellID == 8143 then -- Mana Tide, Spirit Link, Tremor Totem
					SendChatMessage(GetSpellLink(spellID).." destroyed.", channel)
				end
			end
		end
	end
end

local yAnnounce = CreateFrame("Frame")
yAnnounce:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
yAnnounce:SetScript("OnEvent", Update)