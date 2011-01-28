TukuiCF["general"] = {
	["autoscale"] = true,						-- mainly enabled for users that don't want to mess with the config file
	["uiscale"] = 0.71,							-- set your value (between 0.64 and 1) of your uiscale if autoscale is off
	["overridelowtohigh"] = false,				-- EXPERIMENTAL ONLY! override lower version to higher version on a lower reso.
	["multisampleprotect"] = true,				-- i don't recommend this because of shitty border but, voila!
	["classcolor"] = false,						-- enable full classcolor option (datatext, panels, castbars)
}

TukuiCF["unitframes"] = {						-- general options
	["enable"] = true,							-- do i really need to explain this?
	-- theme
	["classcolor"] = false,						-- enable classcolored panels (some folks like it :/ )
	["enemyhcolor"] = false,					-- enemy target (players) color by hostility, very useful for healer.
	["unitcastbar"] = true,						-- enable tukui castbar on unitframe
	["unicolor"] = true,						-- enable unicolor theme
	["playeraggro"] = false,					-- color player border to red if you have aggro on current target.
	-- castbar
	["classcolorcastbar"] = true,				-- class colored castbars
	["separatecastbar"] = true, 				-- enable castbars for player and target next to unitframes
	["cblatency"] = true,						-- enable castbar latency
	["cbicons"] = true,							-- enable icons on castbar
	["swing"] = false,							-- swing bar
	-- auras
	["auratimer"] = true,						-- enable timers on buffs/debuffs
	["auratextscale"] = 11,						-- the font size of buffs/debuffs timers on unitframes
	["playerauras"] = false,					-- enable auras
	["targetauras"] = true,						-- enable auras on target unit frame	
	-- UF options
	["targetpowerpvponly"] = true,				-- enable power text on pvp target only
	["totdebuffs"] = false,						-- enable tot debuffs
	["focusdebuffs"] = false,					-- enable focus debuffs
	["showfocustarget"] = true,					-- show focus target
	["showtotalhpmp"] = false,					-- change the display of info text on player and target with XXXX/Total.
	["percentage"] = false,						-- only show percentage for mana and health values
	["showsmooth"] = true,						-- enable smooth bar
	["showthreat"] = false,--NYI						-- enable the threat bar anchored to info left panel
	["charportrait"] = false,					-- do i really need to explain this?
	["maintank"] = true,						-- enable maintank
	["mainassist"] = false,						-- enable mainassist
	["combatfeedback"] = false,					-- enable combattext on player and target.	
	-- others
	["positionbychar"] = true,					-- save X, Y position with /uf (movable frame) per character instead of per account.
	["healcomm"] = true,						-- enable healprediction support.
	["highThreshold"] = 80,						-- hunter high threshold
	["lowThreshold"] = 25,						-- global low threshold, for low mana warning.
	["repbar"] = true,							-- reputation bar for low level chars
	-- raid layout
	["showrange"] = true,						-- show range opacity on raidframes
	["raidalphaoor"] = 0.5,						-- alpha of unitframes when unit is out of range
	["gridonly"] = true,						-- enable grid only mode for all healer mode raid layout.
	["showsymbols"] = true,						-- show symbol.
	["aggro"] = true,							-- show aggro on all raids layouts
	["raidunitdebuffwatch"] = true,				-- track important spell to watch in pve for grid mode.
	["gridhealthvertical"] = true,				-- enable vertical grow on health bar for grid mode.
	["showplayerinparty"] = true,				-- show my player frame in party
	["gridscale"] = 1,							-- set the healing grid scaling
	-- boss frames
	["showboss"] = true,						-- enable boss unit frames for PVELOL encounters.
	-- priest only plugin
	["ws_show_time"] = false,					-- show time on weakened soul bar
	["ws_show_player"] = false,					-- show weakened soul bar on player unit
	["ws_show_target"] = false,					-- show weakened soul bar on target unit	
	-- death knight only plugin
	["runebar"] = true,							-- enable tukui runebar plugin
	-- paladin and warlock plugin
	["powerbar"] = true,						-- enable tukui holypower/soulshard plugin
	-- shaman only plugin
	["totemtimer"] = true,						-- enable tukui totem timer plugin
	-- rogue and druid plugin
	["combobar"] = true,						-- enable tukui combo bar plugin
}

TukuiCF["arena"] = {
	["unitframes"] = true,						-- enable tukz arena unitframes (requirement : tukui unitframes enabled)
}

TukuiCF["pvp"] = {
	["interrupt"] = true,						-- enable interrupt icons (interruptbar alternative)
}

TukuiCF["actionbar"] = {
	["enable"] = true,							-- enable tukz action bars
	["hotkey"] = true,							-- enable hotkey display because it was a lot requested
	["hideshapeshift"] = true,					-- hide shapeshift or totembar because it was a lot requested.
	["bottomrows"] = 2,							-- numbers of row you want to show at the bottom (select between 1 and 2 only)
	["rightbars"] = 0,							-- numbers of right bar you want (max 2 if "bottomrows" = 2)
	["showgrid"] = true,						-- show grid on empty button
	["cubes"] = true,							-- enable cubes to function as toggles for addons (ex: recount)
	["translucid"] = true,						-- enable translucid panels
}

TukuiCF["classtimer"] = {
	["enable"] = true,							-- enable classtimer
	["classcolor"] = false, --NYI						-- classcolored bars
	["layout"] = 3,								-- 1 - above player frame; 2 - above player frame with spacing; 3 - with trinkets; 4 - above player and target frames
	["bgalpha"] = 0.8,							-- background alpha (0 to 1)
	["iconposition"] = 2,						-- Show icons outside of frame (0 left,	1 right, 2 outside, 4 hide)
	["spark"] = true,							-- Show spark
	["separator"] = true,						-- Show cast separator
	["textmargin"] = 5,							-- Sets distance between right edge of bar and name and left edge of bar and time left
	["permanentaura"] = 0,						-- 0 for filled, 1 for empty
	["direction"] = true,						-- sort direction: 	false - ascending, true - descending
	["treshold"] = 1,							-- Timer tenths threshold - range from 1 to 60
}	

TukuiCF["nameplate"] = {
	["enable"] = true,							-- enable nice skinned nameplates that fit into tukui
}

TukuiCF["bags"] = {
	["enable"] = true,							-- enable an all in one bag mod that fit tukui perfectly
	["moveable"] = true,						-- enable moveable bags!
	["slot"] = 12,								-- number of column slots on the bags
}

TukuiCF["map"] = {
	["enable"] = true,							-- reskin the map to fit tukui
}

TukuiCF["loot"] = {
	["lootframe"] = true,						-- reskin the loot frame to fit tukui
	["rolllootframe"] = true,					-- reskin the roll frame to fit tukui
	["autogreed"] = true,						-- auto-dez or auto-greed item at max level, auto-greed Frozen orb and chaos orbs
}

TukuiCF["cooldown"] = {
	["enable"] = true,							-- do i really need to explain this?
	["treshold"] = 1,							-- show decimal under X seconds and text turn red
}

TukuiCF["datatext"] = {							-- use 4 and 8 only on highres
	["classcolor"] = false,						-- enable classcolored datatext
	["minimapstats"] = false,					-- enable stats under minimap, stats are 9 and 10
	-- datatext options
	["fps_ms"] = 7,								-- show fps and ms on panels
	["mem"] = 6,								-- show total memory on panels
	["bags"] = 0,								-- show space used in bags on panels
	["gold"] = 3,								-- show your current gold on panels
	["wowtime"] = 8,							-- show time on panels
	["guild"] = 1,								-- show number on guildmate connected on panels
	["dur"] = 4,								-- show your equipment durability on panels.
	["friends"] = 2,							-- show number of friends connected.
	["dps_text"] = 0,							-- show a dps meter on panels
	["hps_text"] = 0,							-- show a heal meter on panels
	["power"] = 5,								-- show your attackpower/spellpower/healpower/rangedattackpower whatever stat is higher gets displayed
	["haste"] = 0,								-- show your haste rating on panels.
	["crit"] = 0,								-- show your crit rating on panels.
	["avd"] = 0,								-- show your current avoidance against the level of the mob your targeting
	["armor"] = 10,								-- show your armor value against the level mob you are currently targeting
	["curency"] = 9,							-- show your tracked currency on panels
	-- misc
	["battleground"] = false, --NYI					-- enable 3 stats in battleground only that replace stat1,stat2,stat3
	["time24"] = true,							-- set time to 24h format.
	["localtime"] = true,						-- set time to local time instead of server time.
	["fontsize"] = 11,							-- font size for panels.
}

TukuiCF["chat"] = {
	["enable"] = true,							-- blah
	["whispersound"] = true,					-- play a sound when receiving whisper
	["background"] = false,						-- chat background
	["panelwidth"] = 450,						-- controls the size of frame, adjust for your resolution (default suited for 1680*1050)
}

TukuiCF["tooltip"] = {
	["enable"] = true,							-- true to enable this mod, false to disable
	["hidecombat"] = false,						-- hide bottom-right tooltip when in combat
	["hidebuttons"] = false,					-- always hide action bar buttons tooltip.
	["hideuf"] = false,							-- hide tooltip on unitframes
	["cursor"] = false,							-- tooltip via cursor only
	-- addons
	["recountconfig"] = true,					-- set anchor on tooltip above recount window if visible
}

TukuiCF["merchant"] = {
	["sellgrays"] = true,						-- automaticly sell grays?
	["autorepair"] = true,						-- automaticly repair?
	["sellmisc"] = true,						-- sell defined items automatically
}

TukuiCF["error"] = {
	["enable"] = true,							-- true to enable this mod, false to disable
	filter = {									-- what messages to not hide
		["Inventory is full."] = true,
		["You do not have enough items."] = true,
		["Target not in line of sight."] = true,
		["Your pet is dead."] = true,
		["You must be behind your target."] = true,
	},
}

TukuiCF["invite"] = { 
	["autoaccept"] = true,						-- auto-accept invite from guildmate and friends.
}

TukuiCF["buffreminder"] = {
	["enable"] = true,							-- this is now the new innerfire warning script for all armor/aspect class.
	["sound"] = false,							-- enable warning sound notification for reminder.
}

TukuiCF["others"] = {
	["pvpautorelease"] = true,					-- enable auto-release in bg or wintergrasp. (not working for shaman, sorry)
	["raidutility"] = true,						-- toggle menu for raid leaders
	["markbar"] = true,							-- toggle menu with raid markers
}

----------------------------------------------------------------------------
-- Specific class configurations
-- Overrides general config. Class name needs to be on UPPERCASE
----------------------------------------------------------------------------
if TukuiDB.myclass == "HUNTER" then
	TukuiCF["unitframes"].swing = true
end

if TukuiDB.myclass == "ROGUE" then
	-- Options goes here. Example, TukuiCF["others"].pvpautorelease = false
end

----------------------------------------------------------------------------
-- Specific character configuration
-- Name is case sensitive
----------------------------------------------------------------------------
if TukuiDB.myname == "myname" then
	-- Options goes here. Example, TukuiCF["others"].pvpautorelease = false
end

----------------------------------------------------------------------------
-- Character level configuration
----------------------------------------------------------------------------
if UnitLevel("player") == 1 then
	TukuiCF["actionbar"].rightbars = 1
end

if UnitLevel("player") < 15 then
	TukuiCF["actionbar"].bottomrows = 1
end

if UnitLevel("player") < 85 then
	-- Options goes here. Example, TukuiCF["others"].pvpautorelease = false
end