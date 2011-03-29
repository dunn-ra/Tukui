local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

if T.client == "ruRU" then
 
	L.chat_BATTLEGROUND_GET = "[ПБ]"
	L.chat_BATTLEGROUND_LEADER_GET = "[ПБ]"
	L.chat_BN_WHISPER_GET = "От"
	L.chat_GUILD_GET = "[Г]"
	L.chat_OFFICER_GET = "[О]"
	L.chat_PARTY_GET = "[Гр]"
	L.chat_PARTY_GUIDE_GET = "[Гр]"
	L.chat_PARTY_LEADER_GET = "[Гр]"
	L.chat_RAID_GET = "[Р]"
	L.chat_RAID_LEADER_GET = "[Р]"
	L.chat_RAID_WARNING_GET = "[Ш]"
	L.chat_WHISPER_GET = "От"
	L.chat_FLAG_AFK = "[АФК]"
	L.chat_FLAG_DND = "[ДНД]"
	L.chat_FLAG_GM = "[ГМ]"
	L.chat_ERR_FRIEND_ONLINE_SS = "|cff298F00входит|r"
	L.chat_ERR_FRIEND_OFFLINE_S = "|cffff0000выходит|r"
	
	L.chat_general = "Общий"
	L.chat_trade = "Торговля"
	L.chat_defense = "ОборонаЛокальный"
	L.chat_recrutment = "Гильдии"
	L.chat_lfg = "ПоискСпутников"
 
	L.disband = "Роспуск группы."

	L.datatext_download = "Загрузка: "
	L.datatext_bandwidth = "Скорость: "
	L.datatext_guild = "Гильдия"
	L.datatext_noguild = "Не в Гильдии"
	L.datatext_bags = "Сумки: "
	L.datatext_friends = "Друзья"
	L.datatext_online = "В игре: "
	L.datatext_armor = "Броня"
	L.datatext_earned = "Получено:"
	L.datatext_spent = "Потрачено:"
	L.datatext_deficit = "Убыток:"
	L.datatext_profit = "Прибыль:"
	L.datatext_timeto = "Времени до"
	L.datatext_friendlist = "Список друзей:"
	L.datatext_playersp = "sp"
	L.datatext_playerap = "ap"
	L.datatext_playerhaste = "haste"
	L.datatext_dps = "dps"
	L.datatext_hps = "hps"
	L.datatext_playerarp = "arp"
	L.datatext_session = "Сеанс: "
	L.datatext_character = "Персонаж: "
	L.datatext_server = "Сервер: "
	L.datatext_totalgold = "Всего: "
	L.datatext_savedraid = "Сохранения:"
	L.datatext_currency = "Валюта:"
	L.datatext_fps = " к/с & "
	L.datatext_ms = " мс"
	L.datatext_playercrit = " crit"
	L.datatext_playerheal = " heal"
	L.datatext_avoidancebreakdown = "Распределение"
	L.datatext_lvl = "ур"
	L.datatext_boss = "босс"
	L.datatext_miss = "Промах"
	L.datatext_dodge = "Уклонение"
	L.datatext_block = "Блок"
	L.datatext_parry = "Парирование"
	L.datatext_playeravd = "avd: "
	L.datatext_servertime = "Серверное время: "
	L.datatext_localtime = "Местное время: "
	L.datatext_mitigation = "Уменьшение по уровню: "
	L.datatext_healing = "Исцеление : "
	L.datatext_damage = "Урон : "
	L.datatext_honor = "Очки чести : "
	L.datatext_killingblows = "Смерт. удары : "
	L.datatext_ttstatsfor = "Статистика по "
	L.datatext_ttkillingblows = "Смерт. удары:"
	L.datatext_tthonorkills = "Почетные победы:"
	L.datatext_ttdeaths = "Смерти:"
	L.datatext_tthonorgain = "Получено чести:"
	L.datatext_ttdmgdone = "Нанесено урона:"
	L.datatext_tthealdone = "Исцелено урона:"
	L.datatext_basesassaulted = "Штурмы баз:"
	L.datatext_basesdefended = "Оборона баз:"
	L.datatext_towersassaulted = "Штурмы башен:"
	L.datatext_towersdefended = "Оборона башен:"
	L.datatext_flagscaptured = "Захваты флага:"
	L.datatext_flagsreturned = "Возвраты флага:"
	L.datatext_graveyardsassaulted = "Штурмы кладбищ:"
	L.datatext_graveyardsdefended = "Оборона кладбищ:"
	L.datatext_demolishersdestroyed = "Разрушителей уничтожено:"
	L.datatext_gatesdestroyed = "Врат разрушено:"
	L.datatext_totalmemusage = "Общее использование памяти:"
	L.datatext_control = "Под контролем:"
 
	L.Slots = {
	  [1] = {1, "Голова", 1000},
	  [2] = {3, "Плечо", 1000},
	  [3] = {5, "Грудь", 1000},
	  [4] = {6, "Пояс", 1000},
	  [5] = {9, "Запястья", 1000},
	  [6] = {10, "Кисти рук", 1000},
	  [7] = {7, "Ноги", 1000},
	  [8] = {8, "Ступни", 1000},
	  [9] = {16, "Правая рука", 1000},
	  [10] = {17, "Левая рука", 1000},
	  [11] = {18, "Оружие дальнего боя", 1000}
	}
 
	L.popup_disableui = "Tukui не работает на этом разрешении, хотите отключить Tukui? (Отмена если хотите попробовать другое разрешение)"
	L.popup_install = "Это первый запуск Tukui V13 для этого персонажа. Необходимо перезагрузить интерфейс для настройки Панелей, Переменных и Окон Чата."
	L.popup_2raidactive = "Обе рейдовые раскладки активны, пожалуйста, выберите одну."
	L.popup_reset = "Внимание! Это сбросит все настройки Tukui. Вы хотите продолжить?"
	L.popup_install_yes = "Да! (рекомендуется!)"
	L.popup_install_no = "Нет, это слишком сложно"
	L.popup_reset_yes = "О да, детка!"
	L.popup_reset_no = "Нет, я посмотрю на QQ форуме!"
 
	L.merchant_repairnomoney = "Не достаточно денег на починку"
	L.merchant_repaircost = "Предметы починены за"
	L.merchant_trashsell = "Серые предметы проданы и Вы получили"
 
	L.goldabbrev = "|cffffd700з|r"
	L.silverabbrev = "|cffc7c7cfс|r"
	L.copperabbrev = "|cffeda55fм|r"
 
	L.error_noerror = "Ошибок пока нет."
 
	L.unitframes_ouf_offline = "Оффлайн"
	L.unitframes_ouf_dead = "Труп"
	L.unitframes_ouf_ghost = "Призрак"
	L.unitframes_ouf_lowmana = "МАНА"
	L.unitframes_ouf_threattext = "Угроза на цели:"
	L.unitframes_ouf_offlinedps = "Оффлайн"
	L.unitframes_ouf_deaddps = "|cffff0000[Труп]|r"
	L.unitframes_ouf_ghostheal = "ПРИЗРАК"
	L.unitframes_ouf_deadheal = "ТРУП"
	L.unitframes_ouf_gohawk = "Дух Ястреба"
	L.unitframes_ouf_goviper = "Дух Гадюки"
	L.unitframes_disconnected = "дисконнект"
	L.unitframes_ouf_wrathspell = "Гнев"
	L.unitframes_ouf_starfirespell = "Звездный огонь"
 
	L.tooltip_count = "Кол-во"
 
	L.bags_noslots = "невозможно купить еще ячеек!"
	L.bags_costs = "Цена: %.2f золотых"
	L.bags_buyslots = "Купить новую ячейку коммандой /bags purchase yes"
	L.bags_openbank = "Сначала откройте банк."
	L.bags_sort = "Сортировать предметы в сумке или банке, если они открыты."
	L.bags_stack = "Заполнить неполные стопки в сумках или банке, если они открыты."
	L.bags_buybankslot = "купить банковскую ячейку. (банк должен быть открыт)"
	L.bags_search = "Поиск"
	L.bags_sortmenu = "Сортировать"
	L.bags_sortspecial = "Сортировать в спецсумках"
	L.bags_stackmenu = "Сложить"
	L.bags_stackspecial = "Сложить в спецсумках"
	L.bags_showbags = "Показать сумки"
	L.bags_sortingbags = "Сортировка завершена."
	L.bags_nothingsort= "Нечего сортировать."
	L.bags_bids = "Использование сумок: "
	L.bags_stackend = "Заполнение завершено."
	L.bags_rightclick_search = "ПКМ для поиска."
 
	L.chat_invalidtarget = "Неверная цель"
 
	L.mount_wintergrasp = "Озеро Ледяных Оков"
 
	L.core_autoinv_enable = "Автоприглашение ВКЛ: invite"
	L.core_autoinv_enable_c = "Автоприглашение ВКЛ: "
	L.core_autoinv_disable = "Автоприглашение ВЫКЛ"
	L.core_wf_unlock = "Окно отслеживания заданий разблокировано"
	L.core_wf_lock = "Окно отслеживания заданий закреплено"
	L.core_welcome1 = "Добро пожаловать в |cffC495DDTukui|r версии "
	L.core_welcome2 = "Напечатайте |cff00FFFF/uihelp|r для получения доп. информации"
 
	L.core_uihelp1 = "|cff00ff00основные команды|r"
	L.core_uihelp2 = "|cffFF0000/moveui|r - Разблокировать и передвинуть элементы интерфейса."
	L.core_uihelp3 = "|cffFF0000/rl|r - Перегрузить интерфейс."
	L.core_uihelp4 = "|cffFF0000/gm|r - Обратится за помощью к ГМ."
	L.core_uihelp5 = "|cffFF0000/frame|r - Показать имя окна под мышкой. (очень удобно для правки lua)"
	L.core_uihelp6 = "|cffFF0000/heal|r - Включить рейдовый интерфейс для хила."
	L.core_uihelp7 = "|cffFF0000/dps|r - Включить рейдовый интерфейс для ДПС/Танка."
	L.core_uihelp8 = "|cffFF0000/bags|r - Сортировка сумок, покупка слотов в банке."
	L.core_uihelp9 = "|cffFF0000/resetui|r - Сбросить Tukui к настройкам по умолчанию."
	L.core_uihelp10 = "|cffFF0000/rd|r - Распустить рейд."
	L.core_uihelp11 = "|cffFF0000/ainv|r - Включить автоинвайт по определенному слову в приват. Вы можете установить ваше слово коммандой `/ainv слово`"
	L.core_uihelp12 = "|cffFF0000/tukuidbm|r - DBM skinner options."
	L.core_uihelp13 = "|cffFF0000/wipeactbars|r - Useful for a respec, removes all spells from your actionbars."
	L.core_uihelp14 = "|cffFF0000/hb|r - Easy keybinding, just mouseover your spell/actionbar and press a key."
	L.core_uihelp15 = "|cffFF0000/config|r - Ingame configuration menu."
	L.core_uihelp100 = "(Прокрутите вверх, чтобы увидеть больше команд...)"
 
	L.symbol_CLEAR = "Очистить"
	L.symbol_SKULL = "Череп"
	L.symbol_CROSS = "Крест"
	L.symbol_SQUARE = "Квадрат"
	L.symbol_MOON = "Полумесяц"
	L.symbol_TRIANGLE = "Треугольник"
	L.symbol_DIAMOND = "Ромб"
	L.symbol_CIRCLE = "Круг"
	L.symbol_STAR = "Звезда"
 
	L.bind_combat = "Вы не можете назначать клавиши в бою."
	L.bind_saved = "Все назначения клавиш сохранены."
	L.bind_discard = "Все новые назначения клавиш были отменены."
	L.bind_instruct = "Наведите указатель мыши на кнопку действия, чтобы назначить клавишу. Нажмите клавишу ESC или правую кнопку мыши чтобы убрать назначение."
	L.bind_save = "Сохранить назначения"
	L.bind_discardbind = "Отменить назначения"
 
	L.hunter_unhappy = "Ваш питомец несчастлив!"
	L.hunter_content = "Ваш питомец доволен!"
	L.hunter_happy = "Ваш питомец счастлив!"
	
	L.move_tooltip = "Передвинуть подсказку"
	L.move_minimap = "Передвинуть миникарту"
	L.move_watchframe = "Передвинуть квесты"
	L.move_gmframe = "Передвинуть тикет"
	L.move_buffs = "Передвинуть баффы"
	L.move_debuffs = "Передвинуть дебаффы"
	L.move_shapeshift = "Передвинуть панель стоек/тотемов"
	L.move_achievements = "Передвинуть всплывающее окно достижений"
	L.move_roll = "Передвинуть окно розыгрыша добычи"
	L.move_vehicle = "Передвинуть фрейм транспорта"
end
