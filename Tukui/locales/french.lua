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

	L.disband = "Dissoudre le groupe?"

	L.datatext_download = "Téléchargement: "
	L.datatext_bandwidth = "Bande passante: "
	L.datatext_guild = "Guilde"
	L.datatext_noguild = "Pas de Guilde"
	L.datatext_bags = "Sacs: "
	L.datatext_friends = "Amis"
	L.datatext_online = "En ligne: "
	L.datatext_armor = "Armure"
	L.datatext_earned = "Gagné: "
	L.datatext_spent = "Dépensé: "
	L.datatext_deficit = "Déficit: "
	L.datatext_profit = "Profit: "
	L.datatext_timeto = "Temps restant"
	L.datatext_friendlist = "Liste d'amis: "
	L.datatext_playersp = "sp"
	L.datatext_playerap = "ap"
	L.datatext_playerhaste = "hâte"
	L.datatext_dps = "dps"
	L.datatext_hps = "hps"
	L.datatext_playerarp = "arp"
	L.datatext_session = "Session: "
	L.datatext_character = "Personnage: "
	L.datatext_server = "Serveur: "
	L.datatext_totalgold = "Total: "
	L.datatext_savedraid = "Raid(s) enregistré(s)"
	L.datatext_currency = "Monnaie: "
	L.datatext_fps = " fps & "
	L.datatext_ms = " ms"
	L.datatext_playercrit = " crit"
	L.datatext_playerheal = " heal"
	L.datatext_avoidancebreakdown = "évitement"
	L.datatext_lvl = "lvl"
	L.datatext_boss = "boss"
	L.datatext_miss = "Coup raté"
	L.datatext_dodge = "Esquive"
	L.datatext_block = "Bloquer"
	L.datatext_parry = "Parade"
	L.datatext_playeravd = "avd: "
	L.datatext_servertime = "Heure Serveur: "
	L.datatext_localtime = "Heure Locale: "
	L.datatext_mitigation = "Mitigation par Level: "
	L.datatext_healing = "Soins: "
	L.datatext_damage = "Dégâts: "
	L.datatext_honor = "Honneur: "
	L.datatext_killingblows = "Coups fatals: "
	L.datatext_ttstatsfor = "Statistiques pour "
	L.datatext_ttkillingblows = "Coups fatals: "
	L.datatext_tthonorkills = "Victoires honorables: "
	L.datatext_ttdeaths = "Morts: "
	L.datatext_tthonorgain = "Points d'honneur gagnés: "
	L.datatext_ttdmgdone = "Dégâts effectués: "
	L.datatext_tthealdone = "Soins prodigués: "
	L.datatext_basesassaulted = "Bases Attaquées: "
	L.datatext_basesdefended = "Bases Défendues: "
	L.datatext_towersassaulted = "Tours Attaquées: "
	L.datatext_towersdefended = "Tours Défendues: "
	L.datatext_flagscaptured = "Drapeaux Capturés: "
	L.datatext_flagsreturned = "Drapeaux Récupérés: "
	L.datatext_graveyardsassaulted = "Cimetières Attaqués: "
	L.datatext_graveyardsdefended = "Cimetières Défendus: "
	L.datatext_demolishersdestroyed = "Démolisseurs Détruits: "
	L.datatext_gatesdestroyed = "Portes Détruites: "
	L.datatext_totalmemusage = "Utilisation Totale de la Mémoire: "
	L.datatext_control = "Controlé par: "

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
	 [11] = {18, "À Distance", 1000}
	}

	L.popup_disableui = "Tukui ne fonctionne pas avec cette résolution, voulez-vous désactiver Tukui? (Annuler si vous souhaitez essayer une autre résolution)"
	L.popup_install = "Première fois sur Tukui V13 avec ce personnage. Vous devez recharger l'interface utilisateur afin de configurer les barres d'action, les variables et les cadres de Chat."
	L.popup_2raidactive = "2 modèles de raid sont activés, merci d'en choisir un."
	L.popup_reset = "Attention! Vous allez charger les paramètres par défaut de Tukui. Voulez-vous poursuivre?"
	L.popup_install_yes = "Yeah! (recommended!)"
	L.popup_install_no = "No, it sux so hard"
	L.popup_reset_yes = "Yeah baby!"
	L.popup_reset_no = "No, else I'll QQ forums!"

	L.merchant_repairnomoney = "Vous n'avez pas assez d'argent pour réparer!"
	L.merchant_repaircost = "Tous les objets ont été réparés pour"
	L.merchant_trashsell = "Les objets gris ont été vendus et vous avez gagné"
	

	L.goldabbrev = "|cffffd700o|r"
	L.silverabbrev = "|cffc7c7cfa|r"
	L.copperabbrev = "|cffeda55fc|r"

	L.error_noerror = "Pas d'erreur pour le moment."

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
	L.bags_costs = "Prix: %.2f or"
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
	L.bags_bids = "Emplacements utilisés: "
	L.bags_stackend = "Empilage terminé."
	L.bags_rightclick_search = "Clic-droit pour rechercher."

	L.chat_invalidtarget = "Cible non valide"

	L.mount_wintergrasp = "Joug-d'hiver"

	L.core_autoinv_enable = "Invitation automatique: invite"
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
	
	L.hunter_unhappy = "Votre familier n'est pas heureux!"
	L.hunter_content = "Votre familier est heureux!"
	L.hunter_happy = "Votre familier est très heureux!"

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
	L.install_header_5 = "4. Ce que vous devez savoir!"
	L.install_header_6 = "5. Commandes"
	L.install_header_7 = "6. Terminé"
	L.install_header_8 = "1. Options Principales"
	L.install_header_9 = "2. Social"
	L.install_header_10= "3. Cadres"
	L.install_header_11= "4. Succès!"
	
	L.install_init_line_1 = "Merci pour choisir |cffB0171FCyUI|r, un edit de Tukui!"
	L.install_init_line_2 = "Dans les démarches suivantes vous avez le procédé d'installation, à chaque démarche vous pouvez décider ce que vous voulez installer ou bien sauter les paramètres présentées."
	L.install_init_line_3 = "Vous avez aussi la possibilité d'avoir un petit tutoriel avec certaines particularités de Tukui."
	L.install_init_line_4 = "Appuie sur le bouton 'Tutoriel' pour lire le guide ou bien appuie sur 'Installation' pour sauter ce pas."

	-- tutorial 1
	L.tutorial_step_1_line_1 = "Ceci c'est un tutorial simple qui va vous montrer les particularités dans |cffB0171FCyUI|r."
	L.tutorial_step_1_line_2 = "D'abord, les choses qui vous faut savoir avant de jouer avec cette UI."
	L.tutorial_step_1_line_3 = "Ce programme c'est presque spécifique pour chaque personnage. Pendant que quelques réglages sont appliqués dans la compte, il faut exécuter le script d'installation pour chaque personnage. Le script s'exécute dans chaque personnage après la première connexion. Vous pouvez aussi accéder au menu de configuration dans le jeu, il faut seulement écrire |cffFF6347/config|r."
	L.tutorial_step_1_line_4 = ""

	-- tutorial 2
	L.tutorial_step_2_line_1 = "Dans Tukui ill-y-a toujours incorporé une version de oUF (oUFTukui) crée par Haste. Ça tâte tous les unit frames dans l'écran, les Buffs et Debuffs, et les éléments spécifiques de chaque classe."
	L.tutorial_step_2_line_2 = "Vous pouvez visiter WoWInterface.com pour avoir plus information sur oUF et comment les utilisér."
	L.tutorial_step_2_line_3 = "Selon vôtre fonction, vous pouvez choisir entre une frame de Healer (avec plus grandes frames et plus information, par exemple vous Hots et les Debuffs du target, cette frame s'applique seulement par écrire |cffFF6347/heal|r. Ill-y-a aussi une frame plus simple pour les Tanks et Dps et pour l'appliqué il faut écrire |cffFF6347/dps|r."
	L.tutorial_step_2_line_4 = "Pour facilement changer la position de l'unit frame il faut utiliser |cffFF6347/moveui|r."

	-- tutorial 3
	L.tutorial_step_3_line_1 = "Tukui et |cffB0171FCyUI|r sont simplement modifications de la interface Officiel. Presque tous les traits de la UI dédit sont disponibles dans |cffB0171FCyUI|r. Extras sont aussi disponibles, comme par exemple: automatiquement les items gris, la réparation automatique de vôtre armure, un système personnalisé de votre sac, extra information sur le personnage."
	L.tutorial_step_3_line_2 = "Tukui est créé autour de l'idée que tout le monde aime avoir tous les addons disponibles même quand il's n'ont pas besoin d'eaux. La grande customisation de l'UI c'est aussi pourquoi elle est une de les plus populaires interfaces. Depuis de 2009 millions de personnes utilise Tukui comme base pour customisation (un peu comme |cffB0171FCyUI|r, une modification de le moteur Tukui) ainsi que utilisateurs plus évoluées que ne se fient pas en addons spécifiques pour s'amuser dans le jeu. N'oublie pas de voir autres éditions das le website de Tukui!"
	L.tutorial_step_3_line_3 = "Visités www.tukui.org pour extra AddOns, ou bien télécharge eux dans www.WoWInterface.com et modifiez vôtre expérience de jeu!"
	L.tutorial_step_3_line_4 = ""

	-- tutorial 4
	L.tutorial_step_4_line_1 = "Si vous passez le souris sur la droite de vôtre écran vous pouvez customiser instantanément extra action bars, le même avec les action bars en bas. Les unitframes s'ajuste toutes seules."
	L.tutorial_step_4_line_2 = "Dans le coin gauche du chat frame vous avez la fonction de copier le chat, il faut seulement passer le souris sur À§a et cliquer pour copier le texte."
	L.tutorial_step_4_line_3 = "Passer le souris sur les différents datapannels et clique avec le bouton droite et gauche. Ill-y-a beaucoup d'information additionnel sur vous, vôtre guild, amis et la personnage!"
	L.tutorial_step_4_line_4 = "Si vous cliquez dans le bouton [X] du sac frame Ill-y-a un drop menu avec fonctions additionnels. Un bouton d'achat est aussi disponible quand vous avez ouvert les slots du banc. Les drop menus sont disponibles aussi si vous cliquez dans le minimap, avec eux vous pouvez accédé plus facilement aux tabs informatifs et la particularité du tracking."

	-- tutorial 5
	L.tutorial_step_5_line_1 = "Beaucoup de slash commandes sont disponibles:"
	L.tutorial_step_5_line_2 = "|cffFF6347/moveui|r pour bouger les frames dans l'écran; |cffFF6347/disable|r [addon] ou |cffFF6347/enable|r [addon] pour facilement basculer addons; |cffFF6347/rc|r pour commencer un readycheck; |cffFF6347/rd|r pour quitter un party ou raid;"
	L.tutorial_step_5_line_3 = "|cffFF6347/wipeactbar|r pour effacer toutes les spells dans les bars; |cffFF6347/ainv|r [mot clé] pour inviter automatiquement personnes qui vous whisper le mot (invite) ou |cffFF6347/ainv|r off pour désactiver; |cffFF6347/tt|r pour whisper vôtre cible; |cffFF6347/gm|r ouvres le menu d'aide."
	L.tutorial_step_5_line_4 = "|cffFF6347/config|r montres le menu de configuration. |cffFF6347/install|r, |cffFF6347/resetui|r ou |cffFF6347/tutorial|r charge ce installateur. |cffFF6347/frame|r indiques le nom et le anchor du frame qui le souris à choisis."

	-- tutorial 6
	L.tutorial_step_6_line_1 = "Et c'est fait!"
	L.tutorial_step_6_line_2 = "Si vous avez besoin de voir le toturiel encore, seulement écris |cffFF6347/tutorial|r"
	L.tutorial_step_6_line_3 = "Vous pouvez maintenant procéder à l'installation de l'UI si vous n'avez déjà  fait, ou faire du reset aux sélections par défaut."
	L.tutorial_step_6_line_4 = ""

	-- install step 1
	L.install_step_1_line_1 = "Ceci sont les pas qui vont appliquer les fonctions coeur de l'UI."
	L.install_step_1_line_2 = "Ceci sont les |cffff0000recommendations|r pour tous les utilisateurs, à moins que vous voulez seulement appliquer options spécifiques."
	L.install_step_1_line_3 = "Clique 'Suivant' pour appliquer les variables basics (recommandées)."
	L.install_step_1_line_4 = "Ou clique 'Passer' si vous voulez continuer avec vôtre définitions."

	-- install step 2
	L.install_step_2_line_0 = "Une autre addon de chat est trouvé. On va ignorer ce pas. S'il vous plait appuie 'Passer' pour continuer l'installation."
	L.install_step_2_line_1 = "Le deuxième pas c'est préparé le frame du chat."
	L.install_step_2_line_2 = "C'est recommandé si vous êtes un nouveau utilisateur, mais, utilisateurs précédents de |cffB0171FCyUI|r peut faire 'Passer' dans ce pas."
	L.install_step_2_line_3 = "T'inquiète pas ce la font du chat c'est très grande ou petite, après le reload elle devient normal."
	L.install_step_2_line_4 = "Clique 'Continuer' pour appliquer les réglages ou skip pour quitter ce pas."

	-- install step 3
	L.install_step_3_line_1 = "Le dernier pas c'est appliquer la position originelle des frames."
	L.install_step_3_line_2 = "Ça c'est |cffff0000recommandable|r pour chaque nouveau utilisateur."
	L.install_step_3_line_3 = ""
	L.install_step_3_line_4 = "Appuyiez sour 'Continuer' pour appliquer les réglages ou 'Passer' pour quitter ce pas."

	-- install step 4
	L.install_step_4_line_1 = "Installation c'est complete."
	L.install_step_4_line_2 = "S'il vous plait appuyiez Finish pour faire reload à l'UI."
	L.install_step_4_line_3 = "Amusez-vous bien avec |cffB0171FCyUI|r!"
	L.install_step_4_line_4 = "Visites www.tukui.org pour feedback, aide ou plus information sur ce projet!"

	
	L.install_button_tutorial = "Tutoriel"
	L.install_button_install = "Installation"
	L.install_button_next = "Suivant"
	L.install_button_skip = "Passer"
	L.install_button_continue = "Continuer"
	L.install_button_finish = "Terminer"
	L.install_button_close = "Fermer"
end