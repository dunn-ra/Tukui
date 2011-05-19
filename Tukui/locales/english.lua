-- localization for enUS and enGB
local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

L.chat_BATTLEGROUND_GET = "[BG]"
L.chat_BATTLEGROUND_LEADER_GET = "[BG]"
L.chat_BN_WHISPER_GET = "From"
L.chat_GUILD_GET = "[G]"
L.chat_OFFICER_GET = "[O]"
L.chat_PARTY_GET = "[P]"
L.chat_PARTY_GUIDE_GET = "[P]"
L.chat_PARTY_LEADER_GET = "[P]"
L.chat_RAID_GET = "[R]"
L.chat_RAID_LEADER_GET = "[R]"
L.chat_RAID_WARNING_GET = "[W]"
L.chat_WHISPER_GET = "From"
L.chat_FLAG_AFK = "[AFK]"
L.chat_FLAG_DND = "[DND]"
L.chat_FLAG_GM = "[GM]"
L.chat_ERR_FRIEND_ONLINE_SS = "is now |cff298F00online|r"
L.chat_ERR_FRIEND_OFFLINE_S = "is now |cffff0000offline|r"

L.chat_general = "General"
L.chat_trade = "Trade"
L.chat_defense = "LocalDefense"
L.chat_recrutment = "GuildRecruitment"
L.chat_lfg = "LookingForGroup"

L.disband = "Disbanding group?"

L.datatext_download = "Download: "
L.datatext_bandwidth = "Bandwidth: "
L.datatext_guild = "Guild"
L.datatext_noguild = "No Guild"
L.datatext_bags = "Bags: "
L.datatext_friends = "Friends"
L.datatext_online = "Online: "
L.datatext_armor = "Armor"
L.datatext_earned = "Earned:"
L.datatext_spent = "Spent:"
L.datatext_deficit = "Deficit:"
L.datatext_profit = "Profit:"
L.datatext_timeto = "Time to"
L.datatext_friendlist = "Friends list:"
L.datatext_playersp = "SP"
L.datatext_playerap = "AP"
L.datatext_playerhaste = "Haste"
L.datatext_dps = "DPS"
L.datatext_hps = "HPS"
L.datatext_playerarp = "ArP"
L.datatext_session = "Session: "
L.datatext_character = "Character: "
L.datatext_server = "Server: "
L.datatext_totalgold = "Total: "
L.datatext_savedraid = "Saved Raid(s)"
L.datatext_currency = "Currency:"
L.datatext_fps = " fps & "
L.datatext_ms = " ms"
L.datatext_playercrit = " Crit"
L.datatext_playerheal = " Heal"
L.datatext_avoidancebreakdown = "Avoidance Breakdown"
L.datatext_lvl = "lvl"
L.datatext_boss = "Boss"
L.datatext_miss = "Miss"
L.datatext_dodge = "Dodge"
L.datatext_block = "Block"
L.datatext_parry = "Parry"
L.datatext_playeravd = "Avd: "
L.datatext_servertime = "Server Time: "
L.datatext_localtime = "Local Time: "
L.datatext_mitigation = "Mitigation By Level: "
L.datatext_healing = "Heal: "
L.datatext_damage = "Dmg: "
L.datatext_honor = "Honor: "
L.datatext_killingblows = "KB: "
L.datatext_ttstatsfor = "Stats for "
L.datatext_ttkillingblows = "Killing Blows:"
L.datatext_tthonorkills = "Honorable Kills:"
L.datatext_ttdeaths = "Deaths:"
L.datatext_tthonorgain = "Honor Gained:"
L.datatext_ttdmgdone = "Damage Done:"
L.datatext_tthealdone = "Healing Done:"
L.datatext_basesassaulted = "Bases Assaulted:"
L.datatext_basesdefended = "Bases Defended:"
L.datatext_towersassaulted = "Towers Assaulted:"
L.datatext_towersdefended = "Towers Defended:"
L.datatext_flagscaptured = "Flags Captured:"
L.datatext_flagsreturned = "Flags Returned:"
L.datatext_graveyardsassaulted = "Graveyards Assaulted:"
L.datatext_graveyardsdefended = "Graveyards Defended:"
L.datatext_demolishersdestroyed = "Demolishers Destroyed:"
L.datatext_gatesdestroyed = "Gates Destroyed:"
L.datatext_totalmemusage = "Total Memory Usage:"
L.datatext_control = "Controlled by:"

L.Slots = {
	[1] = {1, "Head", 1000},
	[2] = {3, "Shoulder", 1000},
	[3] = {5, "Chest", 1000},
	[4] = {6, "Waist", 1000},
	[5] = {9, "Wrist", 1000},
	[6] = {10, "Hands", 1000},
	[7] = {7, "Legs", 1000},
	[8] = {8, "Feet", 1000},
	[9] = {16, "Main Hand", 1000},
	[10] = {17, "Off Hand", 1000},
	[11] = {18, "Ranged", 1000}
}

L.popup_disableui = "|cffB0171FCyUI|r is not compatible with this resolution, hit 'OK' to continue or 'Cancel' to try another resolution"
L.popup_install = "First time running |cffB0171FCyUI|r with this Character. You must reload your UI to set Action Bars, Variables and Chat Frames."
L.popup_reset = "Warning! This will reset everything to default. Do you want to proceed?"
L.popup_2raidactive = "2 raid layouts are active, please select a layout."
L.popup_install_yes = "Yeah! (recommended!)"
L.popup_install_no = "No, it sux so hard"
L.popup_reset_yes = "Yeah baby!"
L.popup_reset_no = "No, or else I'll QQ in the forums!"

L.merchant_repairnomoney = "Not enough money to repair!"
L.merchant_repaircost = "Items repaired for"
L.merchant_trashsell = "Vendor trash earned"

L.goldabbrev = "|cffffd700g|r"
L.silverabbrev = "|cffc7c7cfs|r"
L.copperabbrev = "|cffeda55fc|r"

L.error_noerror = "No errors yet"

L.unitframes_ouf_offline = "Offline"
L.unitframes_ouf_dead = "Dead"
L.unitframes_ouf_ghost = "Ghost"
L.unitframes_ouf_lowmana = "LOW MANA"
L.unitframes_ouf_threattext = "Threat on current target:"
L.unitframes_ouf_offlinedps = "Offline"
L.unitframes_ouf_deaddps = "|cffff0000DEAD|r"
L.unitframes_ouf_ghostheal = "GHOST"
L.unitframes_ouf_deadheal = "DEAD"
L.unitframes_ouf_gohawk = "GO HAWK"
L.unitframes_ouf_goviper = "GO VIPER"
L.unitframes_disconnected = "D/C"
L.unitframes_ouf_wrathspell = "Wrath"
L.unitframes_ouf_starfirespell = "Starfire"

L.tooltip_count = "Count"

L.bags_noslots = "can't buy anymore slots!"
L.bags_costs = "Cost: %.2f gold"
L.bags_buyslots = "Buy new slot with /bags purchase yes"
L.bags_openbank = "Bank must be opened first."
L.bags_sort = "sort your bags or your bank, if open."
L.bags_stack = "fill up partial stacks in your bags or bank, if open."
L.bags_buybankslot = "buy bank slot. (need to have bank open)"
L.bags_search = "Search"
L.bags_sortmenu = "Sort"
L.bags_sortspecial = "Sort Special"
L.bags_stackmenu = "Stack"
L.bags_stackspecial = "Stack Special"
L.bags_showbags = "Show Bags"
L.bags_sortingbags = "Sorting finished."
L.bags_nothingsort= "Nothing to sort."
L.bags_bids = "Using bags: "
L.bags_stackend = "Restacking finished."
L.bags_rightclick_search = "Right-click to search."

L.chat_invalidtarget = "Invalid Target"

L.mount_wintergrasp = "Wintergrasp"

L.core_autoinv_enable = "Autoinvite ON: invite"
L.core_autoinv_enable_c = "Autoinvite ON: "
L.core_autoinv_disable = "Autoinvite OFF"
L.core_wf_unlock = "WatchFrame unlock"
L.core_wf_lock = "WatchFrame lock"

L.core_welcome1 = "|cffB0171FCyUI|r "
L.core_welcome2 = " loaded! |cffB0171FTukui|r edit - www.tukui.org"
L.core_welcome3 = "Type |cffFF6347/uihelp|r for more info or |cffFF6347/config|r for extra configuration"

L.core_uihelp1 = "|cff00ff00General Slash Commands|r"
L.core_uihelp2 = "|cffFF0000/moveui|r - Unlock and move elements around the screen."
L.core_uihelp3 = "|cffFF0000/rl|r - Reloads your User Interface."
L.core_uihelp4 = "|cffFF0000/gm|r - Send GM tickets or shows WoW in-game help."
L.core_uihelp5 = "|cffFF0000/frame|r - Detect the frame name your mouse is currently on. (very useful for lua editors)"
L.core_uihelp6 = "|cffFF0000/heal|r - Enable healing raid layout."
L.core_uihelp7 = "|cffFF0000/dps|r - Enable Dps/Tank raid layout."
L.core_uihelp8 = "|cffFF0000/bags|r - For sorting, buying bank slot, or stacking items in your bags."
L.core_uihelp9 = "|cffFF0000/resetui|r - Reset Tukui to default."
L.core_uihelp10 = "|cffFF0000/rd|r - Disband raid."
L.core_uihelp11 = "|cffFF0000/ainv|r - Enable autoinvite via keyword on whisper. You can set your own keyword by typing `/ainv myword`"
L.core_uihelp12 = "|cffFF0000/tukuidbm|r - DBM skinner options."
L.core_uihelp13 = "|cffFF0000/wipeactbars|r - Useful for a respec, removes all spells from your actionbars."
L.core_uihelp14 = "|cffFF0000/hb|r - Easy keybinding, just mouseover your spell/actionbar and press a key."
L.core_uihelp15 = "|cffFF0000/config|r - Ingame configuration menu."
L.core_uihelp100 = "(Scroll up for more commands ...)"

L.symbol_CLEAR = "Clear"
L.symbol_SKULL = "Skull"
L.symbol_CROSS = "Cross"
L.symbol_SQUARE = "Square"
L.symbol_MOON = "Moon"
L.symbol_TRIANGLE = "Triangle"
L.symbol_DIAMOND = "Diamond"
L.symbol_CIRCLE = "Circle"
L.symbol_STAR = "Star"

L.bind_combat = "You can't bind keys in combat."
L.bind_saved = "All keybindings have been saved."
L.bind_discard = "All newly set keybindings have been discarded."
L.bind_instruct = "Hover your mouse over any actionbutton to bind it. Press the escape key or right click to clear the current actionbuttons keybinding."
L.bind_save = "Save bindings"
L.bind_discardbind = "Discard bindings"

L.hunter_unhappy = "Your pet is unhappy!"
L.hunter_content = "Your pet is content!"
L.hunter_happy = "Your pet is happy!"

L.move_tooltip = "Move Tooltip"
L.move_minimap = "Move Minimap"
L.move_watchframe = "Move Quests"
L.move_gmframe = "Move Ticket"
L.move_buffs = "Move Player Buffs"
L.move_debuffs = "Move Player Debuffs"
L.move_shapeshift = "Move Shapeshift/Totem"
L.move_achievements = "Move Achievements"
L.move_roll = "Move Loot Roll Frame"
L.move_vehicle = "Move Vehicle Seat"

L.core_raidutil = "Raid Utility"
L.core_raidutil_disbandgroup = "Disband Group"

-------------------------------------------------
-- INSTALLATION
-------------------------------------------------

-- headers
L.install_header_1 = "Welcome"
L.install_header_2 = "1. Essentials"
L.install_header_3 = "2. Unitframes"
L.install_header_4 = "3. Features"
L.install_header_5 = "4. Things you should know!"
L.install_header_6 = "5. Commands"
L.install_header_7 = "6. Finished"
L.install_header_8 = "1. Essential Settings"
L.install_header_9 = "2. Social"
L.install_header_10= "3. Frames"
L.install_header_11= "4. Success!"

-- install
L.install_init_line_1 = "Thank you for choosing |cffB0171F|cffB0171FCyUI|r|r, a Tukui edit!"
L.install_init_line_2 = "You will be guided through the installation process in a few simple steps. At each step, you can decide whether or not you want to apply or skip the presented settings."
L.install_init_line_3 = "You are also given the possibility to be shown a brief tutorial on some of the features of Tukui."
L.install_init_line_4 = "Press the 'Tutorial' button to read the guide, or press 'Install' to skip this step."

-- tutorial 1
L.tutorial_step_1_line_1 = "This quick tutorial will show you some of the features in |cffB0171FCyUI|r."
L.tutorial_step_1_line_2 = "First, the essentials that you should know before you can play with this UI."
L.tutorial_step_1_line_3 = "This installer is partially character-specific. While some of the settings that will be applied later on are account-wide, you need to run the install script for each new character running |cffB0171FCyUI|r. The script is run on every new character logging for the first time. You can also access the in game configuration menu by typing |cffFF6347/config|r."
L.tutorial_step_1_line_4 = ""

-- tutorial 2
L.tutorial_step_2_line_1 = "Tukui includes an embedded version of oUF (oUFTukui) created by Haste. This handles all of the unitframes on the screen, the buffs and debuffs, and the class-specific elements."
L.tutorial_step_2_line_2 = "You can visit WoWInterface.com for more information about oUF and how to use it."
L.tutorial_step_2_line_3 = "Depending on your role, you can either display a healer friendly raid frame, with bigger frames and also more information, such as your HoTs and the target's debuffs. You can enable it by typing |cffFF6347/heal|r. Also, a more simple, striped version is available, targeted at tanks and dpsers; to enable it, type |cffFF6347/dps|r. Of course, personal preference plays a part in choosing the right raid frames for you."
L.tutorial_step_2_line_4 = "To easily change the unitframe position, just type |cffFF6347/moveui|r."

-- tutorial 3
L.tutorial_step_3_line_1 = "Tukui, and therefore |cffB0171FCyUI|r, is just a redesign of the default Blizzard interface. Almost every feature available on the default UI is also available through |cffB0171FCyUI|r. Extra features are available, such as auto selling grey items, auto repairing your gear, a custom made bag system, heads up information on your char."
L.tutorial_step_3_line_2 = "Tukui is built around the idea that not everyone likes having every addon available out there. The high customizability of the UI is also why it's one of the most popular interfaces around. Since 2009, thousands of user have been using Tukui, either as a base for a custom UI (much like |cffB0171FCyUI|r, which is a modification of the Tukui engine), as well as more advanced users, that don't like to rely on specific addons to enjoy their game time. Don't forget to take a look at the other Edited Packages available on the Tukui website!"
L.tutorial_step_3_line_3 = "Visit www.tukui.org for extra AddOns, or download them on www.WoWInterface.com and customize your game experience!"
L.tutorial_step_3_line_4 = ""

-- tutorial 4
L.tutorial_step_4_line_1 = "Mouseover the right side of your screen to be able to setup, on the fly, extra actionbars. You can do the same on the bottom actionbars! The unitframes will adjust accordingly, if necessary."
L.tutorial_step_4_line_2 = "On the left bottom side of the chat frame, you have a copy chat function. Just mouseover and click it, and you are able to copy the text."
L.tutorial_step_4_line_3 = "Mouseover, right and left click on the different datapanels. There are tons of additional information available to you, about your guild, friends, your character!"
L.tutorial_step_4_line_4 = "Clicking on the [X] button on the bag frame displays a drop menu, with additional features. A purchase button is also available when your bank slots are opened. Drop menus are also available by clicking on the minimap; use them to easier access informational tabs or the tracking feature."

-- tutorial 5
L.tutorial_step_5_line_1 = "Several slash commands are also available:"
L.tutorial_step_5_line_2 = "|cffFF6347/moveui|r to move the frames around your screen; |cffFF6347/disable|r [addon] or |cffFF6347/enable|r [addon] to easylly toggle addons; |cffFF6347/rc|r to initiate a ready check; |cffFF6347/rd|r to disband a party or raid;"
L.tutorial_step_5_line_3 = "|cffFF6347/wipeactbar|r to delete all spells from your actionbars; |cffFF6347/ainv|r [keyword] autoinvite people that whisper you that word or |cffFF6347/ainv|r off to disable it; |cffFF6347/tt|r to whisper your target; |cffFF6347/gm|r opens the Help menu."
L.tutorial_step_5_line_4 = "|cffFF6347/config|r toggles the configuration menu. |cffFF6347/install|r, |cffFF6347/resetui|r or |cffFF6347/tutorial|r loads this installer. |cffFF6347/frame|r prints the name and parent of the frame pointed by your mouse."

-- tutorial 6
L.tutorial_step_6_line_1 = "And that's it, you're done!"
L.tutorial_step_6_line_2 = "If you need to check the tutorial again, just type |cffFF6347/tutorial|r"
L.tutorial_step_6_line_3 = "Now you can procced installing the UI if you haven't done so yet, or if you need to reset it to the defaults."
L.tutorial_step_6_line_4 = ""

-- install step 1
L.install_step_1_line_1 = "These steps will apply the core settings to the UI."
L.install_step_1_line_2 = "These are |cffff0000recommended|r for all users, unless you only want specific options to be applied."
L.install_step_1_line_3 = "Click 'Continue' to apply the basic variables (recommended)."
L.install_step_1_line_4 = "Or click 'Skip' if you want to maintain your settings."

-- install step 2
L.install_step_2_line_0 = "Another chat addon is found. We will ignore this step. Please press skip to proced with the installation."
L.install_step_2_line_1 = "The second step is to prepare the chat frame."
L.install_step_2_line_2 = "Recommended if you're a new user, but former |cffB0171FCyUI|r users can skip this step."
L.install_step_2_line_3 = "Don't worry if the chat font appears too big or too small. After the reload it will rever back to normal size."
L.install_step_2_line_4 = "Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step."

-- install step 3
L.install_step_3_line_1 = "Last step it to apply the default frame positions."
L.install_step_3_line_2 = "It is |cffff0000recommended|r for every new user."
L.install_step_3_line_3 = ""
L.install_step_3_line_4 = "Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step."

-- install step 4
L.install_step_4_line_1 = "Installation is complete."
L.install_step_4_line_2 = "Please click the 'Finish' button to reload the UI."
L.install_step_4_line_3 = "Enjoy |cffB0171FCyUI|r!"
L.install_step_4_line_4 = "Visit www.tukui.org for feedback, help or more information regarding the project!"

-- buttons
L.install_button_tutorial = "Tutorial"
L.install_button_install = "Install"
L.install_button_next = "Next"
L.install_button_skip = "Skip"
L.install_button_continue = "Continue"
L.install_button_finish = "Finish"
L.install_button_close = "Close"