local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

--------------------------------------------------------------------
-- spec switcher -- credits to sortokk
--------------------------------------------------------------------
if C["datatext"].specswitcher and C["datatext"].specswitcher > 0 then
	local Stat = CreateFrame("Frame")
	Stat:EnableMouse(true)
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)

	local Text  = TukuiMiddlePanel:CreateFontString(nil, "OVERLAY")
	Text:SetFont(C.media.font, C["datatext"].fontsize)
	Text:SetShadowOffset(T.mult, -T.mult)
	T.PP(C["datatext"].specswitcher, Text)

	local int = 1

	local function Update(self, t)
	if not GetPrimaryTalentTree() then return end
		int = int - t
		if int < 0 then
			local tree1num = select(5,GetTalentTabInfo(1))
			local tree2num = select(5,GetTalentTabInfo(2))
			local tree3num = select(5,GetTalentTabInfo(3))
			local majorTree = GetPrimaryTalentTree()
			Text:SetText(select(2,GetTalentTabInfo(majorTree)).." "..T.DTc..tree1num.."/"..tree2num.."/"..tree3num..T.DTcr)
		end
	end

	local function OnEvent(self, event, ...)
		if event == "PLAYER_LOGIN" then
			self:UnregisterEvent("PLAYER_LOGIN")
		end

		local c = GetActiveTalentGroup(false,false)
		local group1tree1 = select(5,GetTalentTabInfo(1,false,false,1))
		local group1tree2 = select(5,GetTalentTabInfo(2,false,false,1))
		local group1tree3 = select(5,GetTalentTabInfo(3,false,false,1))
		local majorTree1 = GetPrimaryTalentTree(false,false,1)
		local hs = (GetNumTalentGroups() == 2 and GetPrimaryTalentTree(false,false,2))
		local group2tree1 = hs and select(5,GetTalentTabInfo(1,false,false,2))
		local group2tree2 = hs and select(5,GetTalentTabInfo(2,false,false,2))
		local group2tree3 = hs and select(5,GetTalentTabInfo(3,false,false,2))
		local majorTree2 = 0
		if hs then
			majorTree2 = GetPrimaryTalentTree(false,false,2)
		end

		-- Setup Talents Tooltip
		self:SetAllPoints(Text)

		self:SetScript("OnEnter", function(self)
			if not InCombatLockdown() then
				self.hovered = true
				GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, T.Scale(6));
				GameTooltip:ClearAllPoints()
				GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, T.mult)
				GameTooltip:ClearLines()

				if(hs) then
					GameTooltip:AddLine((c == 1 and "* " or "  ")..select(2,GetTalentTabInfo(majorTree1)).." "..group1tree1.."|r/"..group1tree2.."|r/"..group1tree3.."|r")
					GameTooltip:AddLine((c == 2 and "* " or "  ")..select(2,GetTalentTabInfo(majorTree2)).." "..group2tree1.."|r/"..group2tree2.."|r/"..group2tree3.."|r")
				else
					GameTooltip:AddLine(select(2,GetTalentTabInfo(majorTree1)).." "..group1tree1.."|r/"..group1tree2.."|r/"..group1tree3.."|r")
				end

				GameTooltip:Show()
			end

		end)
		self:SetScript("OnLeave", function() GameTooltip:Hide() end)
	end

	Stat:RegisterEvent("PLAYER_LOGIN")
	Stat:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
	Stat:SetScript("OnEvent", OnEvent)
	Stat:SetScript("OnUpdate", Update)
	Stat:SetScript("OnMouseDown", function()
		c = GetActiveTalentGroup(false,false)
		SetActiveTalentGroup(c == 1 and 2 or 1)
	end)
end