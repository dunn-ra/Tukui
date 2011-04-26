local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

if T.client == "frFR" then

	L.chat_BATTLEGROUND_GET = "[BG]"
	L.chat_BATTLEGROUND_LEADER_GET = "[BG]"
	L.chat_BN_WHISPER_GET = "De"
	L.chat_GUILD_GET = "[G]"
	L.chat_OFFICER_GET = "[O]"
	L.chat_PARTY_GET = "[G]"
	L.chat_PARTY_GUIDE_GET = "[G]"
	L.chat_PARTY_LEADER_GET = "[G]"
	L.chat_RAID_GET = "[R]"
	L.chat_RAID_LEADER_GET = "[R]"
	L.chat_RAID_WARNING_GET = "[W]"
	L.chat_WHISPER_GET = "De"
	L.chat_FLAG_AFK = "[ABS]"
	L.chat_FLAG_DND = "[NPD]"
	L.chat_FLAG_GM = "[MJ]"
	L.chat_ERR_FRIEND_ONLINE_SS = "s'est |cff298F00connecté|r"
	L.chat_ERR_FRIEND_OFFLINE_S = "s'est |cffff0000déconnecté|r"
	
	L.chat_general = "Général"
	L.chat_trade = "Commerce"
	L.chat_defense = "DéfenseLocale"
	L.chat_recrutment = "RecrutementDeGuilde"
	L.chat_lfg = "RechercheDeGroupe"

	L.disband = "Dissoudre le groupe"

	L.datatext_download = "Téléchargement : "
	L.datatext_bandwidth = "Bande passante : "
	L.datatext_guild = "Guilde"
	L.datatext_noguild = "Pas de Guilde"
	L.datatext_bags = "Sacs : "
	L.datatext_friends = "Amis"
	L.datatext_online = "En ligne : "
	L.datatext_armor = "Armure"
	L.datatext_earned = "Gagné : "
	L.datatext_spent = "Dépensé : "
	L.datatext_deficit = "Déficit : "
	L.datatext_profit = "Profit : "
	L.datatext_timeto = "Temps restant"
	L.datatext_friendlist = "Liste d'amis : "
	L.datatext_playersp = "sp"
	L.datatext_playerap = "ap"
	L.datatext_playerhaste = "hâte"
	L.datatext_dps = "dps"
	L.datatext_hps = "hps"
	L.datatext_playerarp = "arp"
	L.datatext_session = "Session : "
	L.datatext_character = "Personnage : "
	L.datatext_server = "Serveur : "
	L.datatext_totalgold = "Total : "
	L.datatext_savedraid = "Raid(s) enregistré(s)"
	L.datatext_currency = "Monnaie : "
	L.datatext_fps = " fps & "
	L.datatext_ms = " ms"
	L.datatext_playercrit = " crit"
	L.datatext_playerheal = " heal"
	L.datatext_avoidancebreakdown = "Évitement"
	L.datatext_lvl = "lvl"
	L.datatext_boss = "boss"
	L.datatext_miss = "Coup raté"
	L.datatext_dodge = "Esquive"
	L.datatext_block = "Bloquer"
	L.datatext_parry = "Parade"
	L.datatext_playeravd = "avd : "
	L.datatext_servertime = "Heure Serveur : "
	L.datatext_localtime = "Heure Locale : "
	L.datatext_mitigation = "Mitigation par Level : "
	L.datatext_healing = "Soins : "
	L.datatext_damage = "Dégâts : "
	L.datatext_honor = "Honneur : "
	L.datatext_killingblows = "Coups fatals : "
	L.datatext_ttstatsfor = "Statistiques pour "
	L.datatext_ttkillingblows = "Coups fatals : "
	L.datatext_tthonorkills = "Victoires honorables : "
	L.datatext_ttdeaths = "Morts : "
	L.datatext_tthonorgain = "Points d'honneur gagnés : "
	L.datatext_ttdmgdone = "Dégâts effectués : "
	L.datatext_tthealdone = "Soins prodigués : "
	L.datatext_basesassaulted = "Bases Attaquées : "
	L.datatext_basesdefended = "Bases Défendues : "
	L.datatext_towersassaulted = "Tours Attaquées : "
	L.datatext_towersdefended = "Tours Défendues : "
	L.datatext_flagscaptured = "Drapeaux Capturés : "
	L.datatext_flagsreturned = "Drapeaux Récupérés : "
	L.datatext_graveyardsassaulted = "Cimetières Attaqués : "
	L.datatext_graveyardsdefended = "Cimetières Défendus : "
	L.datatext_demolishersdestroyed = "Démolisseurs Détruits : "
	L.datatext_gatesdestroyed = "Portes Détruites : "
	L.datatext_totalmemusage = "Utilisation Totale de la Mémoire : "
	L.datatext_control = "Controlé par : "

	L.Slots = {
	  [1] = {1, "Tête", 1000},
	  [2] = {3, "Épaule", 1000},
	  [3] = {5, "Plastron", 1000},
	  [4] = {6, "Ceinture", 1000},
	  [5] = {9, "Poignets", 1000},
	  [6] = {10, "Mains", 1000},
	  [7] = {7, "Jambes", 1000},
	  [8] = {8, "Bottes", 1000},
	  [9] = {16, "Main droite", 1000},
	  [10] = {17, "Main gauche", 1000},
	  [11] = {18, "À Distance", 1000}
	}

	L.popup_disableui = "Tukui ne fonctionne pas avec cette résolution, voulez-vous désactiver Tukui? (Annuler si vous souhaitez essayer une autre résolution)"
	L.popup_install = "Première fois sur Tukui V13 avec ce personnage. Vous devez recharger l'interface utilisateur afin de configurer les barres d'action, les variables et les cadres de Chat."
	L.popup_2raidactive = "2 modèles de raid sont activés, merci d'en choisir un."
	L.popup_reset = "Attention ! Vous allez charger les paramètres par défaut de Tukui. Voulez-vous poursuivre ?"
	L.popup_install_yes = "Yeah! (recommended!)"
	L.popup_install_no = "No, it sux so hard"
	L.popup_reset_yes = "Yeah baby!"
	L.popup_reset_no = "No, else I'll QQ forums!"

	L.merchant_repairnomoney = "Vous n'avez pas assez d'argent pour réparer !"
	L.merchant_repaircost = "Tous les objets ont été réparés pour"
	L.merchant_trashsell = "Les objets gris ont été vendus et vous avez gagné"
	

	L.goldabbrev = "|cffffd700o|r"
	L.silverabbrev = "|cffc7c7cfa|r"
	L.copperabbrev = "|cffeda55fc|r"

	L.error_noerror = "pas d'erreur pour le moment."

	L.unitframes_ouf_offline = "Hors ligne"
	L.unitframes_ouf_dead = "Mort"
	L.unitframes_ouf_ghost = "Fantome"
	L.unitframes_ouf_lowmana = "MANA FAIBLE"
	L.unitframes_ouf_threattext = "Menace sur la cible actuelle: "
	L.unitframes_ouf_offlinedps = "Hors ligne"
	L.unitframes_ouf_deaddps = "|cffff0000[MORT]|r"
	L.unitframes_ouf_ghostheal = "FANTOME"
	L.unitframes_ouf_deadheal = "MORT"
	L.unitframes_ouf_gohawk = "GO FAUCON"
	L.unitframes_ouf_goviper = "GO VIPÈRE"
	L.unitframes_disconnected = "Déco"
	L.unitframes_ouf_wrathspell = "Colère"
	L.unitframes_ouf_starfirespell = "Feu stellaire"

	L.tooltip_count = "Total"

	L.bags_noslots = "Vous ne pouvez pas acheter plus de place !"
	L.bags_costs = "Prix : %.2f or"
	L.bags_buyslots = "Achetez un nouvel emplacement avec /bags"
	L.bags_openbank = "Vous devez d'abord ouvrir votre banque."
	L.bags_sort = "Trier vos sacs, ou votre banque si elle est ouverte."
	L.bags_stack = "Empiler vos objets dans votre sac, ou en banque si elle est ouverte."
	L.bags_buybankslot = "Acheter une place à la banque. (nécessite d'avoir votre banque ouverte)"
	L.bags_search = "Recherche"
	L.bags_sortmenu = "Trier"
	L.bags_sortspecial = "Tri personnalisé"
	L.bags_stackmenu = "Empiler"
	L.bags_stackspecial = "Empilage personnalisé"
	L.bags_showbags = "Montrer les sacs"
	L.bags_sortingbags = "Tri terminé."
	L.bags_nothingsort= "Rien à trier."
	L.bags_bids = "Emplacements utilisés : "
	L.bags_stackend = "Empilage terminé."
	L.bags_rightclick_search = "Clic-droit pour rechercher."

	L.chat_invalidtarget = "Cible non valide"

	L.mount_wintergrasp = "Joug-d'hiver"

	L.core_autoinv_enable = "Invitation automatique : invite"
	L.core_autoinv_enable_c = "Invitation automatique activée "
	L.core_autoinv_disable = "Invitation automatique désactivée"
	L.core_wf_unlock = "Fenêtre de suivi des quêtes déverrouillée"
	L.core_wf_lock = "Fenêtre de suivi des quêtes verrouillée"
	L.core_welcome1 = "Bienvenue sur |cffC495DDTukui|r, version "
	L.core_welcome2 = "Tapez |cff00FFFF/uihelp|r pour plus de détails ou visitez www.tukui.org"

	L.core_uihelp1 = "|cff00ff00Commandes générales|r"
	L.core_uihelp2 = "|cffFF0000/moveui|r - Débloque et bouge les éléments affichés à l'écran."
	L.core_uihelp3 = "|cffFF0000/rl|r - Recharge votre interface utilisateur."
	L.core_uihelp4 = "|cffFF0000/gm|r - Envoi un ticket ou consulte l'aide en jeu."
	L.core_uihelp5 = "|cffFF0000/frame|r - Detecte l'élément de l'interface désigné par le pointeur de la souris. (Vraiment pratique pour éditer un fichier .lua)"
	L.core_uihelp6 = "|cffFF0000/heal|r - Active le schéma de raid soigneur."
	L.core_uihelp7 = "|cffFF0000/dps|r - Active le schéma de raid dps/tank."
	L.core_uihelp8 = "|cffFF0000/bags|r - Pour trier, acheter un emplacement à la banque ou empiler les objets dans vos sacs."
	L.core_uihelp9 = "|cffFF0000/resetui|r - Relance Tukui par défaut."
	L.core_uihelp10 = "|cffFF0000/rd|r - Dissout le raid."
	L.core_uihelp11 = "|cffFF0000/ainv|r - Active l'auto-invitation via mot clef par message privé. Vous pouvez définir votre mot clef en saisissant la commande `/ainv votremot`"
	L.core_uihelp12 = "|cffFF0000/tukuidbm|r - DBM skinner options."
	L.core_uihelp13 = "|cffFF0000/wipeactbars|r - Useful for a respec, removes all spells from your actionbars."
	L.core_uihelp14 = "|cffFF0000/hb|r - Easy keybinding, just mouseover your spell/actionbar and press a key."
	L.core_uihelp15 = "|cffFF0000/config|r - Ingame configuration menu."
	L.core_uihelp100 = "(Faites défiler le texte vers le haut pour plus de commandes...)"
	
	L.symbol_CLEAR = "Aucun"
	L.symbol_SKULL = "Crâne"
	L.symbol_CROSS = "Croix"
	L.symbol_SQUARE = "Carré"
	L.symbol_MOON = "Lune"
	L.symbol_TRIANGLE = "Triangle"
	L.symbol_DIAMOND = "Losange"
	L.symbol_CIRCLE = "Cercle"
	L.symbol_STAR = "Etoile"
	
	L.bind_combat = "Vous ne pouvez pas assigner une touche en combat."
	L.bind_saved = "Vos assignations de touches ont été sauvegardées."
	L.bind_discard = "Vos nouvelles assignations de touches n'ont pas été sauvegardées."
	L.bind_instruct = "Passez votre souris sur la barre d'action pour assigner une touche. Appuyez sur la touche ECHAP ou faites un clic droit pour effacer le bouton d'action en cours."
	L.bind_save = "Sauvegarder les assignations."
	L.bind_discardbind = "Annuler les assignations."
	
	L.hunter_unhappy = "Votre familier n'est pas heureux !"
	L.hunter_content = "Votre familier est heureux !"
	L.hunter_happy = "Votre familier est très heureux !"

	L.move_tooltip = "Bouger l'infobulle"
	L.move_minimap = "Bouger la Minimap"
	L.move_watchframe = "Bouger la fenêtre d'Objectifs"
	L.move_gmframe = "Bouger le Ticket MJ"
	L.move_buffs = "Bouger les améliorations du joueur"
	L.move_debuffs = "Bouger les afflictions du joueur"
	L.move_shapeshift = "Bouger la barre de formes/totems"
	L.move_achievements = "Bouger la fenêtre des Hauts-Faits"
	L.move_roll = "Bouger la fenêtre d'attribution du butin"
	L.move_vehicle = "Bouger le schéma du véhicule"
	
	-------------------------------------------------
	-- INSTALLATION
	-------------------------------------------------

	-- headers
	L.install_header_1 = "Bienvenue"
	L.install_header_2 = "1. Principal"
	L.install_header_3 = "2. Unitframes"
	L.install_header_4 = "3. Caractéristiques"
	L.install_header_5 = "4. Ce que vous devez savoir !"
	L.install_header_6 = "5. Commandes"
	L.install_header_7 = "6. Terminé"
	L.install_header_8 = "1. Options Principales"
	L.install_header_9 = "2. Social"
	L.install_header_10= "3. Cadres"
	L.install_header_11= "4. Succès !"

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

	L.install_button_tutorial = "Tutoriel"
	L.install_button_install = "Installation"
	L.install_button_next = "Suivant"
	L.install_button_skip = "Passer"
	L.install_button_continue = "Continuer"
	L.install_button_finish = "Terminer"
	L.install_button_close = "Fermer"
end