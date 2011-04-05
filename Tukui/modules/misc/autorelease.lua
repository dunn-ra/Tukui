local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales
-- credits elvui
if C["misc"].pvpautorelease ~= true then return end

local autoreleasepvp = CreateFrame("frame")
	autoreleasepvp:RegisterEvent("PLAYER_DEAD")
	autoreleasepvp:SetScript("OnEvent", function(self, event)
	local soulstone = GetSpellInfo(20707)
	if ((T.myclass ~= "SHAMAN") and not (soulstone and UnitBuff("player", soulstone))) and MiniMapBattlefieldFrame.status == "active" then
		RepopMe()
	end
end)