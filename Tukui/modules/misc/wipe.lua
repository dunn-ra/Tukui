local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

-- to remove all the spells from actionbars, gogo respec!
SlashCmdList["WIPEACTBAR"] = function() StaticPopup_Show("WIPEAACTIONBARS") end
SLASH_WIPEACTBAR1 = '/wipeactbar'

StaticPopupDialogs["WIPEAACTIONBARS"] = {
	text = "This will erase all your spells from the actionbars, are you sure you want to continue?",
	button1 = "Yes",
	button2 = "No",
    OnAccept = function() wipeactbars() end,
    timeout = 0,
    whileDead = 1,
}

function wipeactbars()
	for i = 1, 120 do
		PickupAction(i)
		ClearCursor()
	end
end