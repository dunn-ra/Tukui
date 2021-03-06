﻿if GetLocale() == "deDE" then

	-- update needed msg
	TukuiL.option_update = "Du musst dein Tukui ConfigUI Addon aktualisieren wegen den letzten Änderungen von Tukui, bitte besuche www.tukui.org"
	
	-- general
	TukuiL.option_general = "Allgemeines"
	TukuiL.option_general_uiscale = "Automatische UI Skalierung"
	TukuiL.option_general_override = "Nutze Layout für hohe auf niedriger Auflösung"
	TukuiL.option_general_multisample = "Multisample Schutz (Saubere 1px Ränder)"
	TukuiL.option_general_customuiscale = "Interface Skalierung (falls automatische Skalierung deaktiviert ist)"
 
	-- nameplate
	TukuiL.option_nameplates = "Namensplaketten"
	TukuiL.option_nameplates_enable = "Aktiviere Namensplaketten"
	TukuiL.option_nameplates_enhancethreat = "Aktiviere Bedrohungsanzeige, ändert sich automatisch je nach deiner Rolle"
	TukuiL.option_nameplates_showhealth = "Zeige Leben auf den Namensplaketten"
 	TukuiL.option_nameplates_combat = "Zeige gegnerische Namensplaketten nur im Kampf"
 	TukuiL.option_nameplates_goodcolor = "Gute Bedrohungsfarbe, variiert abhängig davon ob du Tank oer DPS/Heiler bist"
	TukuiL.option_nameplates_badcolor = "Schlechte Bedrohungsfarbe, variiert abhängig davon ob du Tank oer DPS/Heiler bist"
	TukuiL.option_nameplates_transitioncolor = "Bedrohung verlieren/erhalten Farbe"
 
	-- merchant
	TukuiL.option_merchant = "Händler"
	TukuiL.option_merchant_autosell = "Automatisch graue Items verkaufen"
	TukuiL.option_merchant_autorepair = "Automatisch reparieren"
	TukuiL.option_merchant_sellmisc = "Automatischer Verkauf einiger vordefinierter (nicht grauer) Gegenstände"
 
	-- bags
	TukuiL.option_bags = "Taschen"
	TukuiL.option_bags_enable = "Aktiviere All-in-one Tasche"
 
	-- datatext
	TukuiL.option_datatext = "Infotext"
	TukuiL.option_datatext_24h = "Aktiviere 24-Stunden-Zeitanzeige"
	TukuiL.option_datatext_localtime = "Zeige Ortszeit, anstelle von Serverzeit"
	TukuiL.option_datatext_bg = "Aktiviere Schlachtfeld Anzeige"
	TukuiL.option_datatext_hps = "Heilung pro Sekunde Position"
	TukuiL.option_datatext_guild = "Gilde Position"
	TukuiL.option_datatext_arp = "Rüstungsdurchschlag Position"
	TukuiL.option_datatext_mem = "Speichernutzung Position"
	TukuiL.option_datatext_bags = "Taschen Position"
	TukuiL.option_datatext_fontsize = "Schriftgröße des Textes"
	TukuiL.option_datatext_fps_ms = "Latenz und FPS Position"
	TukuiL.option_datatext_armor = "Rüstung Position"
	TukuiL.option_datatext_avd = "Vermeidung Position"
	TukuiL.option_datatext_power = "Zaubermacht/Angriffskraft Position"
	TukuiL.option_datatext_haste = "Tempowertung Position"
	TukuiL.option_datatext_friend = "Freunde Position"
	TukuiL.option_datatext_time = "Zeit Position"
	TukuiL.option_datatext_gold = "Gold Position"
	TukuiL.option_datatext_dps = "Schaden pro Sekunde Position"
	TukuiL.option_datatext_crit = "Crit in % Position"
	TukuiL.option_datatext_dur = "Haltbarkeit Position"
	TukuiL.option_datatext_currency = "Abzeichen Position (0 wenn deaktiviert)"
	TukuiL.option_datatext_micromenu = "Micro Menu Position (0 wenn deaktiviert)"
	TukuiL.option_datatext_hit = "Trefferwertung Position (0 wenn deaktiviert)"
	TukuiL.option_datatext_mastery = "Meisterschaft Position (0 wenn deaktiviert)"
 
	-- unit frames
	TukuiL.option_unitframes = "Unitframes"
	TukuiL.option_unitframes_combatfeedback = "Kampfmeldungen auf Spieler und Ziel"
	TukuiL.option_unitframes_runebar = "Aktiviere Runenleiste für Todesritter"
	TukuiL.option_unitframes_auratimer = "Aktiviere Dauer auf Stärkungs- und Schwächungszaubern"
	TukuiL.option_unitframes_totembar = "Aktiviere Totemleiste für Schamanen"
	TukuiL.option_unitframes_totalhpmp = "Zeige gesamtes Leben/Mana an"
	TukuiL.option_unitframes_playerparty = "Zeige sich selbst in der Gruppe"
	TukuiL.option_unitframes_aurawatch = "Aktiviere PvE Überwachung von Stärkungs- und Schwächungszaubern (nur Grid)"
	TukuiL.option_unitframes_castbar = "Aktiviere Zauberleiste"
	TukuiL.option_unitframes_targetaura = "Aktiviere Stärkungs- und Schwächungszauber auf dem Ziel"
	TukuiL.option_unitframes_saveperchar = "Positionen der Unitframes pro Charakter speichern"
	TukuiL.option_unitframes_playeraggro = "Aktiviere Bedrohungsanzeige"
	TukuiL.option_unitframes_smooth = "Aktiviere flüssigere Leistenänderungen"
	TukuiL.option_unitframes_portrait = "Zeige Portrait für Spieler und Ziel an"
	TukuiL.option_unitframes_enable = "Aktiviere Tukui Unitframes"
	TukuiL.option_unitframes_enemypower = "Zeige Mana nur bei Gegnern an"
	TukuiL.option_unitframes_gridonly = "Aktiviere Grid nur für das Heilerlayout"
	TukuiL.option_unitframes_healcomm = "Aktiviere HealComm"
	TukuiL.option_unitframes_focusdebuff = "Aktiviere Schwächungszauber auf Fokusziel"
	TukuiL.option_unitframes_raidaggro = "Aktiviere Bedrohungsanzeige des Schlachtzugs/Gruppe"
	TukuiL.option_unitframes_boss = "Aktiviere Boss-Unitframes"
	TukuiL.option_unitframes_enemyhostilitycolor = "Färbe Lebensbalken der Gegner nach Feindseligkeit"
	TukuiL.option_unitframes_hpvertical = "Lebensbalken bei Grid vertikal anzeigen"
	TukuiL.option_unitframes_symbol = "Zeige Symbole auf Schlachtzug- und Gruppenfenster"
	TukuiL.option_unitframes_threatbar = "Aktiviere Bedrohungsleiste"
	TukuiL.option_unitframes_enablerange = "Aktiviere Entfernungsanzeige für Schlachtzug/Gruppe"
	TukuiL.option_unitframes_focus = "Aktiviere Fokus Ziel"
	TukuiL.option_unitframes_latency = "Zeige Latenz auf der Zauberleiste" 
	TukuiL.option_unitframes_icon = "Zeige Icons auf der Zauberleiste"
	TukuiL.option_unitframes_playeraura = "Aktiviere alternativen Stärkungs-/Schwächungszauber-Modus für Spieler"
	TukuiL.option_unitframes_aurascale = "Textskalierung auf  Stärkungs-/Schwächungszaubern"
	TukuiL.option_unitframes_gridscale = "Gridskalierung"
	TukuiL.option_unitframes_manahigh = "Hohes Mana Indikator (für Jäger)"
	TukuiL.option_unitframes_manalow = "Wenig Mana Indikator (Für alle Mana Klassen)"
	TukuiL.option_unitframes_range = "Transparenz der Schlachtzug- und Gruppenfenster wenn außer Reichweite"
	TukuiL.option_unitframes_maintank = "Main Tank Anzeige aktivieren"
	TukuiL.option_unitframes_mainassist = "Main Assist Anzeige aktivieren"
	TukuiL.option_unitframes_unicolor = "Einheitliches Farbschema (graue Lebensbalken) aktivieren"
	TukuiL.option_unitframes_totdebuffs = "Ziel vom Ziel Schwächungszauber anzeigen (hohe Auflösung)"
	TukuiL.option_unitframes_classbar = "Klassen Leiste aktivieren"
	TukuiL.option_unitframes_weakenedsoulbar = "Aktiviere 'Geschwächte Seele' Anzeige (Priester)"
	TukuiL.option_unitframes_onlyselfdebuffs = "Zeigt nur deine debuffs auf dem Ziel an"
	TukuiL.option_unitframes_focus = "Aktiviere Fokus Ziel"
 
	-- loot
	TukuiL.option_loot = "Beute"
	TukuiL.option_loot_enableloot = "Aktiviere Beutefenster"
	TukuiL.option_loot_autogreed = "Aktiviere automatisch-Gier Würfeln für grüne Gegenstände (falls max. Level erreicht)"
	TukuiL.option_loot_enableroll = "Aktiviere Würfelfenster"
 
	-- map
	TukuiL.option_map = "Karte"
	TukuiL.option_map_enable = "Aktiviere Karte"
 
	-- invite
	TukuiL.option_invite = "Einladung"
	TukuiL.option_invite_autoinvite = "Einladungen von Freunden & Gildenmitgliedern automatisch annehmen"
 
	-- tooltip
	TukuiL.option_tooltip = "Tooltip"
	TukuiL.option_tooltip_enable = "Aktiviere Tooltip"
	TukuiL.option_tooltip_hidecombat = "Verstecke Tooltip in Kampf"
	TukuiL.option_tooltip_hidebutton = "Verstecke Tooltip auf Aktionsleisten"
	TukuiL.option_tooltip_hideuf = "Verstecke Tooltip auf Unitframes"
	TukuiL.option_tooltip_cursor = "Tooltip am Mauszeiger anzeigen"
	
	-- reminder
	TukuiL.option_reminder = "Aura Warnung"
	TukuiL.option_reminder_enable = "Aktiviere Aura Warnung für Spieler"
	TukuiL.option_reminder_sound = "Aktiviere Sound für Aura Warnung"
 
	-- error
	TukuiL.option_error = "Fehlermeldungen"
	TukuiL.option_error_hide = "Verstecke rote Meldungen in der Mitte des Bildschirms"
 
	-- action bar
	TukuiL.option_actionbar = "Aktionsleisten"
	TukuiL.option_actionbar_hidess = "Verstecke Gestaltenwandler- oder Totemleiste"
	TukuiL.option_actionbar_showgrid = "Rahmen auf Aktionsleisten immer anzeigen"
	TukuiL.option_actionbar_enable = "Aktiviere Tukui Aktionsleisten"
	TukuiL.option_actionbar_rb = "Aktiviere Mouseover für rechte Aktionsleisten"
	TukuiL.option_actionbar_hk = "Zeige Tastenbelegung auf den Buttons"
	TukuiL.option_actionbar_ssmo = "Gestaltenwandler- oder Totemleiste nur bei Mouseover anzeigen"
	TukuiL.option_actionbar_rbn = "Anzahl der Aktionsleisten unten (1 oder 2)"
	TukuiL.option_actionbar_rn = "Anzahl der Aktionsleisten rechts (1, 2 oder 3)"
	TukuiL.option_actionbar_buttonsize = "Größe der Aktionsleisten Buttons"
	TukuiL.option_actionbar_buttonspacing = "Abstand der Aktionsleisten Buttons"
	TukuiL.option_actionbar_petbuttonsize = "Größe der Pet/Gestaltenwandler Buttons"
	
	-- quest watch frame
	TukuiL.option_quest = "Quests"
	TukuiL.option_quest_movable = "Bewegbares Questbeobachtungsfenster"
 
	-- arena
	TukuiL.option_arena = "Arena"
	TukuiL.option_arena_st = "Aktiviere Tracker gegnerischer Zauber"
	TukuiL.option_arena_uf = "Aktiviere Tukui Arena Unitframes" 
	
	-- pvp
	TukuiL.option_pvp = "Pvp"
	TukuiL.option_pvp_ii = "Aktiviere Unterbrechungsicons"
 
	-- cooldowns
	TukuiL.option_cooldown = "Abklingzeiten"
	TukuiL.option_cooldown_enable = "Aktiviere Anzeige der Abklingzeit auf Buttons"
	TukuiL.option_cooldown_th = "Färbe Anzeige der Abklingzeiten ab Wert X rot"  
 
	-- chat
	TukuiL.option_chat = "Geselligkeit"
	TukuiL.option_chat_enable = "Aktiviere Tukui Chat"
	TukuiL.option_chat_whispersound = "Beim Empfang von Flüsternachrichten Ton abspielen"
	TukuiL.option_chat_background = "Aktiviere die Hintergrund Panelen der Chatfenster"
 
	 -- buff
	TukuiL.option_auras = "Auras"
	TukuiL.option_auras_player = "Enable Tukui Buff/Debuff Frames"

	-- buttons
	TukuiL.option_button_reset = "Zurücksetzen"
	TukuiL.option_button_load = "Anwenden"
	TukuiL.option_button_close = "Schließen"
	TukuiL.option_setsavedsetttings = "Einstellungen pro Charakter speichern"
	TukuiL.option_resetchar = "Bist du sicher, dass du die Einstellungen für diesen Charakter auf Standard zurücksetzen willst?"
	TukuiL.option_resetall = "Bist du sicher, dass du alle Einstellungen auf Standard zurücksetzen willst?"
	TukuiL.option_perchar = "Bist du sicher, dass du die Einstellung für 'Einstellungen pro Charakter' wechseln willst?"
	TukuiL.option_makeselection = "Sie müssen erst eine Auswahl treffen bevor Sie mit den Einstellungen fortfahren können."
		
	-- cyui
	-- unit frames
	TukuiL.option_unitframes_debuffnumber = "Number of debuffs to show on dps/heal raid layout"
	TukuiL.option_unitframes_dpsdebuff = "Enable tracking of debuffs on dps layout (alternate mode)"
	TukuiL.option_unitframes_pets = "Enable pet layout"
	TukuiL.option_unitframes_swing = "Enable swing bar"
	TukuiL.option_unitframes_cccastbar = "Enable classcolored castbars"
	TukuiL.option_unitframes_displayname = "Show player name on the unitframe"
	TukuiL.option_unitframes_enableraidframes = "Enable raid frames, keeping choosing layout"
	TukuiL.option_unitframes_fader = "Enable fading unitframes when ooc, resting, etc"
	TukuiL.option_unitframes_hpcolor = "Health color for unicolor theme"
	TukuiL.option_unitframes_hpcoloralt = "Health color for raid frames"
	TukuiL.option_unitframes_hpbg = "Health deficit color for unicolor theme"
	TukuiL.option_unitframes_hpbgc = "Health deficit color for class colored theme"
	TukuiL.option_unitframes_interruptable = "Castbar color of interruptable spells"
	TukuiL.option_unitframes_castbar = "Color of player castbar if classcolor == false and target castbar"
	--nameplates
	TukuiL.option_nameplates_simplehealth = "Health percentage on nameplates"
	-- general
	TukuiL.option_general_classcolor = "Enable full classcolor option (datatext, panels, castbars)"
	-- ufsizes
	TukuiL.option_ufsizes = "Unitframe size"
	TukuiL.option_ufsizes_playerheight = "Height of the hp bar. Power/mana bar will be 1/3 of it"
	TukuiL.option_ufsizes_playercastbar = "Player castbar width"
	TukuiL.option_ufsizes_targetcastbar = "Target castbar width"
	TukuiL.option_ufsizes_unitheight = "Height of the hp bar. Power/mana bar will be 1/3 of it"
	TukuiL.option_ufsizes_uffontsize = "Size of the unitframe fonts (hp and mana text)"
	-- datatext
	TukuiL.option_datatext_panelsize = "Size of the bottom panels"
	TukuiL.option_datatext_color = "Default datatext oolor"
	TukuiL.option_datatext_classcolor = "Classcolored datatext"
	TukuiL.option_datatext_specswitcher = "Talent switcher position (0 for disabled)"
	-- stexperience
	TukuiL.option_stexperience = "STExperience bar"
	TukuiL.option_stexperience_enable = "Enable STExperience bar"
	TukuiL.option_stexperience_barheight = "Height of the bar"
	TukuiL.option_stexperience_barwidth = "Width of the bar"
	TukuiL.option_stexperience_text = "Set to true to hide text"
	TukuiL.option_stexperience_mouseovertext = "Set to true to only show text on mouseover"
	--merchant
	TukuiL.option_merchant_restocker = "Auto reagent buyer"
	TukuiL.option_merchant_number = "Number of reagents to buy"
	-- misc
	TukuiL.option_misc = "Miscellaneous"
	TukuiL.option_misc_duelspam = "Removes duel chat spam"
	TukuiL.option_misc_interrupt = "Announces succesful interrupts to raid or party chat"
	-- classtimer
	TukuiL.option_classtimer = "Classtimer"
	TukuiL.option_classtimer_enable = "Enable classtimer"
	TukuiL.option_classtimer_classcolor = "Classcolored bars"
	TukuiL.option_classtimer_barheight = "Bar height"
	TukuiL.option_classtimer_barspacing = "Bar spacing"
	TukuiL.option_classtimer_direction = "Direction (tick to right, or viceversa)"
	TukuiL.option_classtimer_spark = "Marker on the end of the bar"
	TukuiL.option_classtimer_castseparator = "Marker to indicate clipping"
	TukuiL.option_classtimer_playerbar = "Player color"
	TukuiL.option_classtimer_targetbar = "Target color"
	TukuiL.option_classtimer_targetdebuff = "Target debuff color"
	TukuiL.option_classtimer_trinketbar = "Trinket color"
	-- chat
	TukuiL.option_chat_rightpanel = "Enable loot frame on right side (/resetui to apply)"
	TukuiL.option_chat_width = "Width of the chat frame (/resetui to apply)"
	TukuiL.option_chat_height = "Height of the chat frame (/resetui to apply)"
	TukuiL.option_chat_shadow = "Add a shadow offset to chat text"
	-- bags
	TukuiL.option_bags_slots = "Number of column bag slots to display"	
	TukuiL.option_bags_moveable = "Toggle moveable bags"
	-- tooltip
	TukuiL.option_tooltip_recount = "Parent tooltip to recount if visible"
	-- action bar
	TukuiL.option_actionbar_cubes = "Enable cubes to function as toggles for addons (ex: recount)"
end