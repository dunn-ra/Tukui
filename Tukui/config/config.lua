local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

C["general"] = {
	["autoscale"] = true,                               -- mainly enabled for users that don't want to mess with the config file
	["uiscale"] = 0.71,                                 -- set your value (between 0.64 and 1) of your uiscale if autoscale is off
	["overridelowtohigh"] = false,                      -- EXPERIMENTAL ONLY! override lower version to higher version on a lower reso.
	["multisampleprotect"] = true,                      -- i don't recommend this because of shitty border but, voila!
	["classcolor"] = false,								-- enable full classcolor option (datatext, panels, castbars)
}

C["ufsizes"] = {
	["unitheight"] = 18,								-- height of the hp bar. Power/mana bar will be 1/3 of it
	["playercastbar"] = 250,							-- player castbar
	["targetcastbar"] = 250,							-- target castbar
	["uffontsize"] = 11,								-- size of the unitframe fonts (hp and mana text)
}	

C["unitframes"] = {
	["enable"] = true,									-- do i really need to explain this?
	-- theme
	["enemyhcolor"] = false,							-- enemy target (players) color by hostility, very useful for healer.
	["unitcastbar"] = true,                             -- enable tukui castbar
	["unicolor"] = true,								-- enable classcolored frames
	["hpcolor"] = {.2,.2,.2,1},							-- health color for unicolor theme
	["hpcoloralt"] = {.3,.3,.3,1},						-- health color for raid frames
	["hpbg"] = {.24,0,.01,1},							-- health deficit color for unicolor theme
	["hpbgc"] = {.05,.05,.05,1},						-- health deficit color for class colored theme
	["playeraggro"] = false,							-- color player border to red if you have aggro on current target.
	["fader"] = true,									-- enable fading unitframes when ooc, resting, etc
	-- castbar
	["cccastbar"] = true,								-- enable classcolored castbars
	["cblatency"] = true,								-- enable castbar latency
	["cbicons"] = true,                                 -- enable icons on castbar
	["swing"] = false,									-- swing bar
	["interruptable"] = {.80,.14,.14,1},				-- castbar color of interruptable spells
	["castbar"] = {.49,.61,.75,1},						-- color of player castbar if classcolor == false and target castbar
	-- auras
	["auratimer"] = true,                               -- enable timers on buffs/debuffs
	["auratextscale"] = 11,                             -- the font size of buffs/debuffs timers on unitframes
	["playerauras"] = false,                            -- enable auras
	["targetauras"] = true,                             -- enable auras on target unit frame
	["onlyselfdebuffs"] = false,						-- display only our own debuffs applied on target
	-- UF options
	["lowThreshold"] = 25,                              -- global low threshold, for low mana warning.
	["targetpowerpvponly"] = false,                     -- enable power text on pvp target only
	["totdebuffs"] = false,	                           -- enable tot debuffs
	["showtotalhpmp"] = false,                          -- change the display of info text on player and target with XXXX/Total.
	["showsmooth"] = true,                              -- enable smooth bar
	["charportrait"] = false,							-- do i really need to explain this?
	["displayname"] = false,							-- player name
	["combatfeedback"] = true,                          -- enable combattext on player and target.
	["healcomm"] = true,								-- enable healprediction support.
	["showfocustarget"] = true,							-- show focus target
	["maintank"] = false,                               -- enable maintank
	["mainassist"] = false,                             -- enable mainassist
	-- raid layout (if one of them is enabled)
	["enableraidframes"] = true,						-- enable or disable raid frames
	["showrange"] = true,								-- show range opacity on raidframes
	["raidalphaoor"] = 0.3,								-- alpha of unitframes when unit is out of range
	["gridonly"] = true,								-- enable grid only mode for all healer mode raid layout.
	["dpsdebuff"] = true,								-- enable tracking of debuffs on dps layout (alternate mode)
	["debuffnumber"] = 5,								-- number of debuffs to show on dps/heal raid layout	
	["showsymbols"] = true,								-- show symbol.
	["aggro"] = true,									-- show aggro on all raids layouts
	["raidunitdebuffwatch"] = true,						-- track important spell to watch in pve for grid mode.
	["gridhealthvertical"] = true,						-- enable vertical grow on health bar for grid mode.
	["showplayerinparty"] = true,						-- show my player frame in party
	["gridscale"] = 1,									-- set the healing grid scaling
	["pets"] = false,									-- enable pet layout
	-- boss frames
	["showboss"] = true,								-- reskin the boss frame
	-- priest only plugin
	["weakenedsoulbar"] = false,						-- show weakened soul bar
	-- class bar
	["classbar"] = true,								-- enable tukui classbar over player unit
}

C["skinning"] = {
	["blizzardreskin"] = true,							-- reskin all Blizzard frames
	["recount"] = true,
	["omen"] = true,
	["dbm"] = true,
}
	
C["classtimer"] = {
	["enable"] = true,									-- enable classtimer
	["classcolor"] = false,								-- classcolored bars
	["barheight"] = 15,									-- height of the bars
	["barspacing"] = 0,									-- spacing between bars of the same category
	["direction"] = true,								-- direction, true for left to right
	["spark"] = false,									-- marker on the end of the bar
	["castseparator"] = true,							-- marker to indicate clipping
	-- color
	["playerbar"] = {.33,.59,.33},
	["targetbar"] = {.33,.59,.33},
	["targetdebuff"] = {.54,.10,.10},
	["trinketbar"] = {1,.75,.14},
}

C["stexperience"] = {
	["enable"] = true,									-- enable stExperience bar
	["barheight"] = 16,									-- bar height
	["barwidth"] = 275,									-- bar width
	["text"] = true,									-- set to false to hide text
	["mouseovertext"] = false,							-- set to true to only show text on mouseover
}

C["arena"] = {
	["unitframes"] = true,								-- enable tukz arena unitframes (requirement : tukui unitframes enabled)
}

C["auras"] = {
	["player"] = true,									-- enable tukui buffs/debuffs
}

C["bars"] = {
	["threat"] = true,									-- enable threabar
}

C["actionbar"] = {
	["enable"] = true,									-- enable tukui action bars
	["hotkey"] = true,									-- enable hotkey display because it was a lot requested
	["hideshapeshift"] = false,							-- hide shapeshift or totembar because it was a lot requested.
	["cubes"] = true,									-- enable cubes to function as toggles for addons (ex: recount)
	["showgrid"] = true,								-- show grid on empty button
	["buttonsize"] = 24,                                -- normal buttons size
	["petbuttonsize"] = 22,                             -- pet & stance buttons size
	["buttonspacing"] = 4,                              -- buttons spacing
}

C["bags"] = {
	["enable"] = true,                                  -- enable an all in one bag mod that fit tukui perfectly
	["slots"] = 14,										-- number of column bag slots to display
	["moveable"] = true,								-- toggle moveable bags
}

C["loot"] = {
	["lootframe"] = true,                               -- reskin the loot frame to fit tukui
	["rolllootframe"] = true,                           -- reskin the roll frame to fit tukui
	["autogreed"] = true,                               -- auto-dez or auto-greed item at max level, auto-greed Frozen orb
}

C["cooldown"] = {
	["enable"] = true,                                  -- do i really need to explain this?
	["treshold"] = 1,                                   -- show decimal under X seconds and text turn red
}

C["datatext"] = {
	["fps_ms"] = 7,										-- show fps and ms on panels
	["system"] = 6,										-- show total memory and others systems infos on panels
	["bags"] = 0,										-- show space used in bags on panels
	["gold"] = 3,										-- show your current gold on panels
	["guild"] = 1,										-- show number on guildmate connected on panels
	["dur"] = 4,										-- show your equipment durability on panels.
	["friends"] = 2,									-- show number of friends connected.
	["dps_text"] = 0,									-- show a dps meter on panels
	["hps_text"] = 0,									-- show a heal meter on panels
	["power"] = 9,										-- show your attackpower/spellpower/healpower/rangedattackpower whatever stat is higher gets displayed
	["haste"] = 0,										-- show your haste rating on panels.
	["crit"] = 0,										-- show your crit rating on panels.
	["avd"] = 0,										-- show your current avoidance against the level of the mob your targeting
	["armor"] = 0,										-- show your armor value against the level mob you are currently targeting
	["currency"] = 0,									-- show your tracked currency on panels
	["regen"] = 0,                                      -- show mana regeneration
	["hit"] = 8,										-- show your hit percentage
	["mastery"] = 0,									-- show mastery value
	["micromenu"] = 0,									-- micromenu!
	["specswitcher"] = 5,								-- talent switch the easy way!
	-- options
	["classcolor"] = false,								-- classcolored datatext
		["color"] = {1,.15,.15},							-- if classcolor = false
	["battleground"] = true,							-- enable 3 stats in battleground only that replace stat1,stat2,stat3.
	["time24"] = true,									-- set time to 24h format.
	["localtime"] = true,								-- set time to local time instead of server time.
	["fontsize"] = 10,									-- font size for panels.
	["panelsize"] = 17,									-- size of the bottom panels
}

C["chat"] = {
	["enable"] = true,                                  -- enable chat feature
	["whispersound"] = true,                            -- play a sound when receiving whisper
	["background"] = false,								-- chat background
	["rightpanel"] = false,								-- enable loot frame on right side (/resetui to apply)
	["width"] = 380,									-- width of the chat frame (/resetui to apply)
	["height"] = 130,									-- height of the chat frame (/resetui to apply)
	["shadow"] = false,									-- add a drop shadow to the chat text
	["embedright"] = false,								-- embed recount or omen in the right chat panel. only works with background
}

C["nameplate"] = {
	["enable"] = true,                                  -- enable nice skinned nameplates that fit into tukui
	["showhealth"] = false,				                -- show health text on nameplate
	["simplehealth"] = true,							-- health percentage on nameplate
	["enhancethreat"] = false,			                -- threat features based on if your a tank or not
	["hidelevel"] = true,								-- hides level if mob is the same level as the character
	["combat"] = false,					                -- only show enemy nameplates in-combat.
	["goodcolor"] = {75/255, 175/255, 76/255},			-- good threat color (tank shows this with threat, everyone else without)
	["badcolor"] = {0.78, 0.25, 0.25},					-- bad threat color (opposite of above)
	["transitioncolor"] = {218/255, 197/255, 92/255},	-- threat color when gaining threat
}

C["tooltip"] = {
	["enable"] = true,									-- true to enable this mod, false to disable
	["hidecombat"] = false,								-- hide bottom-right tooltip when in combat
	["hidebuttons"] = false,							-- always hide action bar buttons tooltip.
	["hideuf"] = false,									-- hide tooltip on unitframes
	["recount"] = true,									-- parent tooltip to recount if visible
	["cursor"] = false,									-- tooltip via cursor only
}

C["merchant"] = {
	["sellgrays"] = true,								-- automatically sell gray item
	["autorepair"] = true,								-- automatically repair gear
	["sellmisc"] = true,								-- sell defined items automatically
	["restocker"] = true,								-- auto reagent buyer
		["number"] = 60,								-- number of reagents to buy
}

C["error"] = {
	["enable"] = true,									-- true to enable this mod, false to disable
	filter = {											-- what messages to not hide
		[INVENTORY_FULL] = true,						-- inventory is full will not be hidden by default
	},
}

C["invite"] = { 
	["autoaccept"] = true,								-- auto-accept invite from guildmate and friends.
}

C["buffreminder"] = {
	["enable"] = true,									-- this is now the new innerfire warning script for all armor/aspect class.
	["sound"] = false,									-- enable warning sound notification for reminder.
}

C["misc"] = {
	["duelspam"] = true,								-- removes duel chat spam
	["interrupt"] = true,								-- announces interrupts and spellsteals to party or raid chat
	["announce"] = true,								-- announces crowd control abilities to party or raid chat
		["ending"] = false,								-- NYI announces when abilities end
		["conjured"] = true,							-- announce totems, conjured items, portals, soul well
}