local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

-- automatically accept ress
if C["misc"].ress == true then
	function RESS_ACCEPT(self, event, arg1)
		AcceptResurrect()
		StaticPopup_Hide("RESURRECT_NO_TIMER")
	end
	--frame:RegisterEvent("RESS_ACCEPT")
end
		