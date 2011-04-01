local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

-- Character class
if T.myclass == "PRIEST" then
	-- C["unitframes"].enable = false
end

-- Character name
if T.myname == "Cyrosh" then
	-- C["unitframes"].enable = false
end

-- Character level
if T.level < 85 then
	-- C["unitframes"].enable = false
end