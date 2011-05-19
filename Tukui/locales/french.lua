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
	L.chat_ERR_FRIEND_ONLINE_SS = "s'est |cff298F00connect�|r"
	L.chat_ERR_FRIEND_OFFLINE_S = "s'est |cffff0000d�connect�|r"
	
	L.chat_general = "G�n�ral"
	L.chat_trade = "Commerce"
	L.chat_defense = "D�fenseLocale"
	L.chat_recrutment = "RecrutementDeGuilde"
	L.chat_lfg = "RechercheDeGroupe"

	L.disband = "Dissoudre le groupe?"

	L.datatext_download = "T�l�chargement: "
	L.datatext_bandwidth = "Bande passante: "
	L.datatext_guild = "Guilde"
	L.datatext_noguild = "Pas de Guilde"
	L.datatext_bags = "Sacs: "
	L.datatext_friends = "Amis"
	L.datatext_online = "En ligne: "
	L.datatext_armor = "Armure"
	L.datatext_earned = "Gagn�: "
	L.datatext_spent = "D�pens�: "
	L.datatext_deficit = "D�ficit: "
	L.datatext_profit = "Profit: "
	L.datatext_timeto = "Temps restant"
	L.datatext_friendlist = "Liste d'amis: "
	L.datatext_playersp = "sp"
	L.datatext_playerap = "ap"
	L.datatext_playerhaste = "h�te"
	L.datatext_dps = "dps"
	L.datatext_hps = "hps"
	L.datatext_playerarp = "arp"
	L.datatext_session = "Session: "
	L.datatext_character = "Personnage: "
	L.datatext_server = "Serveur: "
	L.datatext_totalgold = "Total: "
	L.datatext_savedraid = "Raid(s) enregistr�(s)"
	L.datatext_currency = "Monnaie: "
	L.datatext_fps = " fps & "
	L.datatext_ms = " ms"
	L.datatext_playercrit = " crit"
	L.datatext_playerheal = " heal"
	L.datatext_avoidancebreakdown = "�vitement"
	L.datatext_lvl = "lvl"
	L.datatext_boss = "boss"
	L.datatext_miss = "Coup rat�"
	L.datatext_dodge = "Esquive"
	L.datatext_block = "Bloquer"
	L.datatext_parry = "Parade"
	L.datatext_playeravd = "avd: "
	L.datatext_servertime = "Heure Serveur: "
	L.datatext_localtime = "Heure Locale: "
	L.datatext_mitigation = "Mitigation par Level: "
	L.datatext_healing = "Soins: "
	L.datatext_damage = "D�g�ts: "
	L.datatext_honor = "Honneur: "
	L.datatext_killingblows = "Coups fatals: "
	L.datatext_ttstatsfor = "Statistiques pour "
	L.datatext_ttkillingblows = "Coups fatals: "
	L.datatext_tthonorkills = "Victoires honorables: "
	L.datatext_ttdeaths = "Morts: "
	L.datatext_tthonorgain = "Points d'honneur gagn�s: "
	L.datatext_ttdmgdone = "D�g�ts effectu�s: "
	L.datatext_tthealdone = "Soins prodigu�s: "
	L.datatext_basesassaulted = "Bases Attaqu�es: "
	L.datatext_basesdefended = "Bases D�fendues: "
	L.datatext_towersassaulted = "Tours Attaqu�es: "
	L.datatext_towersdefended = "Tours D�fendues: "
	L.datatext_flagscaptured = "Drapeaux Captur�s: "
	L.datatext_flagsreturned = "Drapeaux R�cup�r�s: "
	L.datatext_graveyardsassaulted = "Cimeti�res Attaqu�s: "
	L.datatext_graveyardsdefended = "Cimeti�res D�fendus: "
	L.datatext_demolishersdestroyed = "D�molisseurs D�truits: "
	L.datatext_gatesdestroyed = "Portes D�truites: "
	L.datatext_totalmemusage = "Utilisation Totale de la M�moire: "
	L.datatext_control = "Control� par: "

	L.Slots = {
	 [1] = {1, "T�te", 1000},
	 [2] = {3, "�paule", 1000},
	 [3] = {5, "Plastron", 1000},
	 [4] = {6, "Ceinture", 1000},
	 [5] = {9, "Poignets", 1000},
	 [6] = {10, "Mains", 1000},
	 [7] = {7, "Jambes", 1000},
	 [8] = {8, "Bottes", 1000},
	 [9] = {16, "Main droite", 1000},
	 [10] = {17, "Main gauche", 1000},
	 [11] = {18, "��Distance", 1000}
	}

	L.popup_disableui = "Tukui ne fonctionne pas avec cette r�solution, voulez-vous d�sactiver Tukui? (Annuler si vous souhaitez essayer une autre r�solution)"
	L.popup_install = "Premi�re fois sur Tukui V13 avec ce personnage. Vous devez recharger l'interface utilisateur afin de configurer les barres d'action, les variables et les cadres de Chat."
	L.popup_2raidactive = "2 mod�les de raid sont activ�s, merci d'en choisir un."
	L.popup_reset = "Attention! Vous allez charger les param�tres par d�faut de Tukui. Voulez-vous poursuivre?"
	L.popup_install_yes = "Yeah! (recommended!)"
	L.popup_install_no = "No, it sux so hard"
	L.popup_reset_yes = "Yeah baby!"
	L.popup_reset_no = "No, else I'll QQ forums!"

	L.merchant_repairnomoney = "Vous n'avez pas assez d'argent pour r�parer!"
	L.merchant_repaircost = "Tous les objets ont �t� r�par�s pour"
	L.merchant_trashsell = "Les objets gris ont �t� vendus et vous avez gagn�"
	

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
	L.unitframes_ouf_goviper = "GO VIP�RE"
	L.unitframes_disconnected = "D�co"
	L.unitframes_ouf_wrathspell = "Col�re"
	L.unitframes_ouf_starfirespell = "Feu stellaire"

	L.tooltip_count = "Total"

	L.bags_noslots = "Vous ne pouvez pas acheter plus de place !"
	L.bags_costs = "Prix: %.2f or"
	L.bags_buyslots = "Achetez un nouvel emplacement avec /bags"
	L.bags_openbank = "Vous devez d'abord ouvrir votre banque."
	L.bags_sort = "Trier vos sacs, ou votre banque si elle est ouverte."
	L.bags_stack = "Empiler vos objets dans votre sac, ou en banque si elle est ouverte."
	L.bags_buybankslot = "Acheter une place � la banque. (n�cessite d'avoir votre banque ouverte)"
	L.bags_search = "Recherche"
	L.bags_sortmenu = "Trier"
	L.bags_sortspecial = "Tri personnalis�"
	L.bags_stackmenu = "Empiler"
	L.bags_stackspecial = "Empilage personnalis�"
	L.bags_showbags = "Montrer les sacs"
	L.bags_sortingbags = "Tri termin�."
	L.bags_nothingsort= "Rien � trier."
	L.bags_bids = "Emplacements utilis�s: "
	L.bags_stackend = "Empilage termin�."
	L.bags_rightclick_search = "Clic-droit pour rechercher."

	L.chat_invalidtarget = "Cible non valide"

	L.mount_wintergrasp = "Joug-d'hiver"

	L.core_autoinv_enable = "Invitation automatique: invite"
	L.core_autoinv_enable_c = "Invitation automatique activ�e "
	L.core_autoinv_disable = "Invitation automatique d�sactiv�e"
	L.core_wf_unlock = "Fen�tre de suivi des qu�tes d�verrouill�e"
	L.core_wf_lock = "Fen�tre de suivi des qu�tes verrouill�e"
	L.core_welcome1 = "Bienvenue sur |cffC495DDTukui|r, version "
	L.core_welcome2 = "Tapez |cff00FFFF/uihelp|r pour plus de d�tails ou visitez www.tukui.org"

	L.core_uihelp1 = "|cff00ff00Commandes g�n�rales|r"
	L.core_uihelp2 = "|cffFF0000/moveui|r - D�bloque et bouge les �l�ments affich�s � l'�cran."
	L.core_uihelp3 = "|cffFF0000/rl|r - Recharge votre interface utilisateur."
	L.core_uihelp4 = "|cffFF0000/gm|r - Envoi un ticket ou consulte l'aide en jeu."
	L.core_uihelp5 = "|cffFF0000/frame|r - Detecte l'�l�ment de l'interface d�sign� par le pointeur de la souris. (Vraiment pratique pour �diter un fichier .lua)"
	L.core_uihelp6 = "|cffFF0000/heal|r - Active le sch�ma de raid soigneur."
	L.core_uihelp7 = "|cffFF0000/dps|r - Active le sch�ma de raid dps/tank."
	L.core_uihelp8 = "|cffFF0000/bags|r - Pour trier, acheter un emplacement � la banque ou empiler les objets dans vos sacs."
	L.core_uihelp9 = "|cffFF0000/resetui|r - Relance Tukui par d�faut."
	L.core_uihelp10 = "|cffFF0000/rd|r - Dissout le raid."
	L.core_uihelp11 = "|cffFF0000/ainv|r - Active l'auto-invitation via mot clef par message priv�. Vous pouvez d�finir votre mot clef en saisissant la commande `/ainv votremot`"
	L.core_uihelp12 = "|cffFF0000/tukuidbm|r - DBM skinner options."
	L.core_uihelp13 = "|cffFF0000/wipeactbars|r - Useful for a respec, removes all spells from your actionbars."
	L.core_uihelp14 = "|cffFF0000/hb|r - Easy keybinding, just mouseover your spell/actionbar and press a key."
	L.core_uihelp15 = "|cffFF0000/config|r - Ingame configuration menu."
	L.core_uihelp100 = "(Faites d�filer le texte vers le haut pour plus de commandes...)"
	
	L.symbol_CLEAR = "Aucun"
	L.symbol_SKULL = "Cr�ne"
	L.symbol_CROSS = "Croix"
	L.symbol_SQUARE = "Carr�"
	L.symbol_MOON = "Lune"
	L.symbol_TRIANGLE = "Triangle"
	L.symbol_DIAMOND = "Losange"
	L.symbol_CIRCLE = "Cercle"
	L.symbol_STAR = "Etoile"
	
	L.bind_combat = "Vous ne pouvez pas assigner une touche en combat."
	L.bind_saved = "Vos assignations de touches ont �t� sauvegard�es."
	L.bind_discard = "Vos nouvelles assignations de touches n'ont pas �t� sauvegard�es."
	L.bind_instruct = "Passez votre souris sur la barre d'action pour assigner une touche. Appuyez sur la touche ECHAP ou faites un clic droit pour effacer le bouton d'action en cours."
	L.bind_save = "Sauvegarder les assignations."
	L.bind_discardbind = "Annuler les assignations."
	
	L.hunter_unhappy = "Votre familier n'est pas heureux!"
	L.hunter_content = "Votre familier est heureux!"
	L.hunter_happy = "Votre familier est tr�s heureux!"

	L.move_tooltip = "Bouger l'infobulle"
	L.move_minimap = "Bouger la Minimap"
	L.move_watchframe = "Bouger la fen�tre d'Objectifs"
	L.move_gmframe = "Bouger le Ticket MJ"
	L.move_buffs = "Bouger les am�liorations du joueur"
	L.move_debuffs = "Bouger les afflictions du joueur"
	L.move_shapeshift = "Bouger la barre de formes/totems"
	L.move_achievements = "Bouger la fen�tre des Hauts-Faits"
	L.move_roll = "Bouger la fen�tre d'attribution du butin"
	L.move_vehicle = "Bouger le sch�ma du v�hicule"
	
	-------------------------------------------------
	-- INSTALLATION
	-------------------------------------------------

	-- headers
	L.install_header_1 = "Bienvenue"
	L.install_header_2 = "1. Principal"
	L.install_header_3 = "2. Unitframes"
	L.install_header_4 = "3. Caract�ristiques"
	L.install_header_5 = "4. Ce que vous devez savoir!"
	L.install_header_6 = "5. Commandes"
	L.install_header_7 = "6. Termin�"
	L.install_header_8 = "1. Options Principales"
	L.install_header_9 = "2. Social"
	L.install_header_10= "3. Cadres"
	L.install_header_11= "4. Succ�s!"
	
	L.install_init_line_1 = "Merci pour choisir |cffB0171FCyUI|r, un edit de Tukui!"
	L.install_init_line_2 = "Dans les d�marches suivantes vous avez le proc�d� d'installation, � chaque d�marche vous pouvez d�cider ce que vous voulez installer ou bien sauter les param�tres pr�sent�es."
	L.install_init_line_3 = "Vous avez aussi la possibilit� d'avoir un petit tutoriel avec certaines particularit�s de Tukui."
	L.install_init_line_4 = "Appuie sur le bouton 'Tutoriel' pour lire le guide ou bien appuie sur 'Installation' pour sauter ce pas."

	-- tutorial 1
	L.tutorial_step_1_line_1 = "Ceci c'est un tutorial simple qui va vous montrer les particularit�s dans |cffB0171FCyUI|r."
	L.tutorial_step_1_line_2 = "D'abord, les choses qui vous faut savoir avant de jouer avec cette UI."
	L.tutorial_step_1_line_3 = "Ce programme c'est presque sp�cifique pour chaque personnage. Pendant que quelques r�glages sont appliqu�s dans la compte, il faut ex�cuter le script d'installation pour chaque personnage. Le script s'ex�cute dans chaque personnage apr�s la premi�re connexion. Vous pouvez aussi acc�der au menu de configuration dans le jeu, il faut seulement �crire |cffFF6347/config|r."
	L.tutorial_step_1_line_4 = ""

	-- tutorial 2
	L.tutorial_step_2_line_1 = "Dans Tukui ill-y-a toujours incorpor� une version de oUF (oUFTukui) cr�e par Haste. �a t�te tous les unit frames dans l'�cran, les Buffs et Debuffs, et les �l�ments sp�cifiques de chaque classe."
	L.tutorial_step_2_line_2 = "Vous pouvez visiter WoWInterface.com pour avoir plus information sur oUF et comment les utilis�r."
	L.tutorial_step_2_line_3 = "Selon v�tre fonction, vous pouvez choisir entre une frame de Healer (avec plus grandes frames et plus information, par exemple vous Hots et les Debuffs du target, cette frame s'applique seulement par �crire |cffFF6347/heal|r. Ill-y-a aussi une frame plus simple pour les Tanks et Dps et pour l'appliqu� il faut �crire |cffFF6347/dps|r."
	L.tutorial_step_2_line_4 = "Pour facilement changer la position de l'unit frame il faut utiliser |cffFF6347/moveui|r."

	-- tutorial 3
	L.tutorial_step_3_line_1 = "Tukui et |cffB0171FCyUI|r sont simplement modifications de la interface Officiel. Presque tous les traits de la UI d�dit sont disponibles dans |cffB0171FCyUI|r. Extras sont aussi disponibles, comme par exemple: automatiquement les items gris, la r�paration automatique de v�tre armure, un syst�me personnalis� de votre sac, extra information sur le personnage."
	L.tutorial_step_3_line_2 = "Tukui est cr�� autour de l'id�e que tout le monde aime avoir tous les addons disponibles m�me quand il's n'ont pas besoin d'eaux. La grande customisation de l'UI c'est aussi pourquoi elle est une de les plus populaires interfaces. Depuis de 2009 millions de personnes utilise Tukui comme base pour customisation (un peu comme |cffB0171FCyUI|r, une modification de le moteur Tukui) ainsi que utilisateurs plus �volu�es que ne se fient pas en addons sp�cifiques pour s'amuser dans le jeu. N'oublie pas de voir autres �ditions das le website de Tukui!"
	L.tutorial_step_3_line_3 = "Visit�s www.tukui.org pour extra AddOns, ou bien t�l�charge eux dans www.WoWInterface.com et modifiez v�tre exp�rience de jeu!"
	L.tutorial_step_3_line_4 = ""

	-- tutorial 4
	L.tutorial_step_4_line_1 = "Si vous passez le souris sur la droite de v�tre �cran vous pouvez customiser instantan�ment extra action bars, le m�me avec les action bars en bas. Les unitframes s'ajuste toutes seules."
	L.tutorial_step_4_line_2 = "Dans le coin gauche du chat frame vous avez la fonction de copier le chat, il faut seulement passer le souris sur ��a et cliquer pour copier le texte."
	L.tutorial_step_4_line_3 = "Passer le souris sur les diff�rents datapannels et clique avec le bouton droite et gauche. Ill-y-a beaucoup d'information additionnel sur vous, v�tre guild, amis et la personnage!"
	L.tutorial_step_4_line_4 = "Si vous cliquez dans le bouton [X] du sac frame Ill-y-a un drop menu avec fonctions additionnels. Un bouton d'achat est aussi disponible quand vous avez ouvert les slots du banc. Les drop menus sont disponibles aussi si vous cliquez dans le minimap, avec eux vous pouvez acc�d� plus facilement aux tabs informatifs et la particularit� du tracking."

	-- tutorial 5
	L.tutorial_step_5_line_1 = "Beaucoup de slash commandes sont disponibles:"
	L.tutorial_step_5_line_2 = "|cffFF6347/moveui|r pour bouger les frames dans l'�cran; |cffFF6347/disable|r [addon] ou |cffFF6347/enable|r [addon] pour facilement basculer addons; |cffFF6347/rc|r pour commencer un readycheck; |cffFF6347/rd|r pour quitter un party ou raid;"
	L.tutorial_step_5_line_3 = "|cffFF6347/wipeactbar|r pour effacer toutes les spells dans les bars; |cffFF6347/ainv|r [mot cl�] pour inviter automatiquement personnes qui vous whisper le mot (invite) ou |cffFF6347/ainv|r off pour d�sactiver; |cffFF6347/tt|r pour whisper v�tre cible; |cffFF6347/gm|r ouvres le menu d'aide."
	L.tutorial_step_5_line_4 = "|cffFF6347/config|r montres le menu de configuration. |cffFF6347/install|r, |cffFF6347/resetui|r ou |cffFF6347/tutorial|r charge ce installateur. |cffFF6347/frame|r indiques le nom et le anchor du frame qui le souris � choisis."

	-- tutorial 6
	L.tutorial_step_6_line_1 = "Et c'est fait!"
	L.tutorial_step_6_line_2 = "Si vous avez besoin de voir le toturiel encore, seulement �cris |cffFF6347/tutorial|r"
	L.tutorial_step_6_line_3 = "Vous pouvez maintenant proc�der � l'installation de l'UI si vous n'avez d�j� fait, ou faire du reset aux s�lections par d�faut."
	L.tutorial_step_6_line_4 = ""

	-- install step 1
	L.install_step_1_line_1 = "Ceci sont les pas qui vont appliquer les fonctions coeur de l'UI."
	L.install_step_1_line_2 = "Ceci sont les |cffff0000recommendations|r pour tous les utilisateurs, � moins que vous voulez seulement appliquer options sp�cifiques."
	L.install_step_1_line_3 = "Clique 'Suivant' pour appliquer les variables basics (recommand�es)."
	L.install_step_1_line_4 = "Ou clique 'Passer' si vous voulez continuer avec v�tre d�finitions."

	-- install step 2
	L.install_step_2_line_0 = "Une autre addon de chat est trouv�. On va ignorer ce pas. S'il vous plait appuie 'Passer' pour continuer l'installation."
	L.install_step_2_line_1 = "Le deuxi�me pas c'est pr�par� le frame du chat."
	L.install_step_2_line_2 = "C'est recommand� si vous �tes un nouveau utilisateur, mais, utilisateurs pr�c�dents de |cffB0171FCyUI|r peut faire 'Passer' dans ce pas."
	L.install_step_2_line_3 = "T'inqui�te pas ce la font du chat c'est tr�s grande ou petite, apr�s le reload elle devient normal."
	L.install_step_2_line_4 = "Clique 'Continuer' pour appliquer les r�glages ou skip pour quitter ce pas."

	-- install step 3
	L.install_step_3_line_1 = "Le dernier pas c'est appliquer la position originelle des frames."
	L.install_step_3_line_2 = "�a c'est |cffff0000recommandable|r pour chaque nouveau utilisateur."
	L.install_step_3_line_3 = ""
	L.install_step_3_line_4 = "Appuyiez sour 'Continuer' pour appliquer les r�glages ou 'Passer' pour quitter ce pas."

	-- install step 4
	L.install_step_4_line_1 = "Installation c'est complete."
	L.install_step_4_line_2 = "S'il vous plait appuyiez Finish pour faire reload � l'UI."
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