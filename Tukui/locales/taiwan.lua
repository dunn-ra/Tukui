local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

if T.client == "zhTW" then

	L.chat_BATTLEGROUND_GET = "[B]"
	L.chat_BATTLEGROUND_LEADER_GET = "[B]"
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
	
	L.chat_general = "綜合"
	L.chat_trade = "交易"
	L.chat_defense = "本地防務"
	L.chat_recrutment = "公會招募"
	L.chat_lfg = "尋求組隊"
	
	L.disband = "正在解散隊伍?"

	L.datatext_download = "下載: "
	L.datatext_bandwidth = "寬頻: "
	L.datatext_guild = "公會"
	L.datatext_noguild = "沒有公會"
	L.datatext_bags = "背包: "
	L.datatext_friends = "好友"
	L.datatext_online = "線上: "
	L.datatext_armor = "耐久度"
	L.datatext_earned = "賺取:"
	L.datatext_spent = "花費:"
	L.datatext_deficit = "赤字:"
	L.datatext_profit = "利潤:"
	L.datatext_timeto = "時間直到"
	L.datatext_friendlist = "好友名單:"
	L.datatext_playersp = "法傷"
	L.datatext_playerap = "強度"
	L.datatext_playerhaste = "加速"
	L.datatext_dps = "dps"
	L.datatext_hps = "hps"
	L.datatext_playerarp = "護甲穿透"
	L.datatext_session = "本次概況: "
	L.datatext_character = "角色: "
	L.datatext_server = "伺服器: "
	L.datatext_totalgold = "總額: "
	L.datatext_savedraid = "已有進度的團隊副本"
	L.datatext_currency = "兌換通貨:"
	L.datatext_fps = " fps & "
	L.datatext_ms = " ms"
	L.datatext_playercrit = "% 致命"
	L.datatext_playerheal = " 治療"
	L.datatext_avoidancebreakdown = "免傷分析"
	L.datatext_lvl = "等級"
	L.datatext_boss = "首領"
	L.datatext_miss = "未擊中"
	L.datatext_dodge = "閃躲"
	L.datatext_block = "格檔"
	L.datatext_parry = "招架"
	L.datatext_playeravd = "免傷: "
	L.datatext_servertime = "伺服器時間: "
	L.datatext_localtime = "本地時間: "
	L.datatext_mitigation = "等級緩和: "
	L.datatext_healing = "治療: "
	L.datatext_damage = "傷害: "
	L.datatext_honor = "榮譽: "
	L.datatext_killingblows = "擊殺 : "
	L.datatext_ttstatsfor = "狀態 "
	L.datatext_ttkillingblows = "擊殺:"
	L.datatext_tthonorkills = "榮譽擊殺:"
	L.datatext_ttdeaths = "死亡:"
	L.datatext_tthonorgain = "獲得榮譽:"
	L.datatext_ttdmgdone = "傷害輸出:"
	L.datatext_tthealdone = "治療輸出:"
	L.datatext_basesassaulted = "基地突襲:"
	L.datatext_basesdefended = "基地防禦:"
	L.datatext_towersassaulted = "哨塔突襲:"
	L.datatext_towersdefended = "哨塔防禦:"
	L.datatext_flagscaptured = "佔領旗幟:"
	L.datatext_flagsreturned = "交還旗幟:"
	L.datatext_graveyardsassaulted = "墓地突襲:"
	L.datatext_graveyardsdefended = "墓地防守:"
	L.datatext_demolishersdestroyed = "石毀車摧毀:"
	L.datatext_gatesdestroyed = "大門摧毀:"
	L.datatext_totalmemusage = "總共記憶體使用:"
	L.datatext_control = "控制方:"
 
	L.Slots = {
		[1] = {1, "頭部", 1000},
		[2] = {3, "肩部", 1000},
		[3] = {5, "胸部", 1000},
		[4] = {6, "腰部", 1000},
		[5] = {9, "手腕", 1000},
		[6] = {10, "手", 1000},
		[7] = {7, "腿部", 1000},
		[8] = {8, "腳", 1000},
		[9] = {16, "主手", 1000},
		[10] = {17, "副手", 1000},
		[11] = {18, "遠程", 1000}
	}
 
	L.popup_disableui = "Tukui並不支援此解析度, 你想要停用Tukui嗎? (若果您想要嘗試其他解析度, 請按取消)"
	L.popup_install = "這個角色首次使用Tukui V13, 您必需先重載介面以完成設定"
	L.popup_reset = "警告! 此動作會重置任何設定至Tukui預設值. 您是否依然決定這樣做?"
	L.popup_2raidactive = "2個團隊框架正在運行, 請選擇以下其中一個."
	L.popup_install_yes = "當然是! (建議!)"
	L.popup_install_no = "不用了, 救命這UI真差"
	L.popup_reset_yes = "當然啦, 預設就是美!"
	L.popup_reset_no = "不囉, 我會不爬文發貼問!"
 
	L.merchant_repairnomoney = "您沒有足夠的金錢來修理!"
	L.merchant_repaircost = "您的裝備已修理, 花費了"
	L.merchant_trashsell = "您背包內的粗糙物品已被自動賣出, 您賺取了"
 
	L.goldabbrev = "|cffffd700g|r"
	L.silverabbrev = "|cffc7c7cfs|r"
	L.copperabbrev = "|cffeda55fc|r"
 
	L.error_noerror = "沒有錯誤"
 
	L.unitframes_ouf_offline = "離線"
	L.unitframes_ouf_dead = "死亡"
	L.unitframes_ouf_ghost = "鬼魂"
	L.unitframes_ouf_lowmana = "法力過低"
	L.unitframes_ouf_threattext = "當前目標的仇恨:"
	L.unitframes_ouf_offlinedps = "離線"
	L.unitframes_ouf_deaddps = "|cffff0000[死亡]|r"
	L.unitframes_ouf_ghostheal = "鬼魂"
	L.unitframes_ouf_deadheal = "死亡"
	L.unitframes_ouf_gohawk = "切換為雄鷹守護"
	L.unitframes_ouf_goviper = "切換為蝮蛇守護"
	L.unitframes_disconnected = "斷線"
	L.unitframes_ouf_wrathspell = "憤怒"
	L.unitframes_ouf_starfirespell = "星火術"
 
	L.tooltip_count = "數量"
 
	L.bags_noslots = "不能再購買更多的背包欄位!"
	L.bags_costs = "花費: %.2f 金"
	L.bags_buyslots = "輸入 /bags purchase yes 以購買銀行背包欄位"
	L.bags_openbank = "您需要先造訪您的銀行"
	L.bags_sort = "將背包或銀行內的物品分類及排序"
	L.bags_stack = "將背包或銀行內的不完整的物品堆疊重新堆疊"
	L.bags_buybankslot = "購買銀行背包欄位. (需要造訪銀行)"
	L.bags_search = "搜尋"
	L.bags_sortmenu = "分類及排序"
	L.bags_sortspecial = "分類及排序特殊物品"
	L.bags_stackmenu = "堆疊"
	L.bags_stackspecial = "堆疊特殊物品"
	L.bags_showbags = "顯示背包"
	L.bags_sortingbags = "分類及排序完成"
	L.bags_nothingsort= "不需要分類"
	L.bags_bids = "使用背包: "
	L.bags_stackend = "重新堆疊完成"
	L.bags_rightclick_search = "點擊右鍵以搜尋物品."
 
	L.chat_invalidtarget = "無效的目標"
 
	L.mount_wintergrasp = "冬握湖"
 
	L.core_autoinv_enable = "啟用自動邀請: invite"
	L.core_autoinv_enable_c = "自動邀請功能已啟用: "
	L.core_autoinv_disable = "自動邀請功能已關閉"
	L.core_wf_unlock = "解鎖任務追蹤"
	L.core_wf_lock = "鎖定任務追蹤"
	L.core_welcome1 = "歡迎使用 |cffC495DDTukui|r "
	L.core_welcome2 = "輸入 |cff00FFFF/uihelp|r 以獲得更多資訊"
 
	L.core_uihelp1 = "|cff00ff00通用指令|r"
	L.core_uihelp2 = "|cffFF0000/moveui|r - 解鎖並移動任何您看得見的框架及UI元素."
	L.core_uihelp3 = "|cffFF0000/rl|r - 重新載入UI."
	L.core_uihelp4 = "|cffFF0000/gm|r - 傳送回報單給GM或開啟幫助介面."
	L.core_uihelp5 = "|cffFF0000/frame|r - 偵測滑鼠位置下的框架名稱. (對lua編輯者非常有幫助!)"
	L.core_uihelp6 = "|cffFF0000/heal|r - 啟用Heal介面."
	L.core_uihelp7 = "|cffFF0000/dps|r - 啟用Dps/Tank介面."
	L.core_uihelp8 = "|cffFF0000/bags|r - 排序背包, 購買銀行背包位置或堆疊物品."
	L.core_uihelp9 = "|cffFF0000/resetui|r - 重置Tukui到預設設置."
	L.core_uihelp10 = "|cffFF0000/rd|r - 解散團隊."
	L.core_uihelp11 = "|cffFF0000/ainv|r - 啟用密語自動邀請, 您可以設定輸入`/ainv myword`以設置您的密語關鍵字."
	L.core_uihelp12 = "|cffFF0000/tukuidbm|r - DBM skinner options."
	L.core_uihelp13 = "|cffFF0000/wipeactbars|r - Useful for a respec, removes all spells from your actionbars."
	L.core_uihelp14 = "|cffFF0000/hb|r - Easy keybinding, just mouseover your spell/actionbar and press a key."
	L.core_uihelp15 = "|cffFF0000/config|r - Ingame configuration menu."
	L.core_uihelp100 = "(想看更多? 向上拉吧! ...)"
 
	L.symbol_CLEAR = "清除"
	L.symbol_SKULL = "頭顱"
	L.symbol_CROSS = "十字"
	L.symbol_SQUARE = "方形"
	L.symbol_MOON = "月亮"
	L.symbol_TRIANGLE = "三角"
	L.symbol_DIAMOND = "鑽石"
	L.symbol_CIRCLE = "圈圈"
	L.symbol_STAR = "星星"
 
	L.bind_combat = "您不能在戰鬥中設定快捷鍵"
	L.bind_saved = "所有快捷鍵修改已儲存"
	L.bind_discard = "這次的快捷鍵修改已重設為上一次修改"
	L.bind_instruct = "將滑鼠指向動作列上以綁定快捷鍵, 您可以按ESC或以右鍵點擊快捷列上任何一格以清除該位置的設定"
	L.bind_save = "儲存"
	L.bind_discardbind = "放棄"
 
	L.hunter_unhappy = "你的寵物感到不高興!"
	L.hunter_content = "你的寵物感到滿足!"
	L.hunter_happy = "你的寵物感到高興!"
	
	L.move_tooltip = "移動指示資訊"
	L.move_minimap = "移動小地圖"
	L.move_watchframe = "移動任務追蹤框架"
	L.move_gmframe = "移動GM回報單及幫助介面"
	L.move_buffs = "移動玩家Buff介面"
	L.move_debuffs = "移動玩家Debuff介面"
	L.move_shapeshift = "移動變形或圖騰列"
	L.move_achievements = "移動成就介面"
	L.move_roll = "移動Roll戰利品的介面"
	L.move_vehicle = "移動載具坐位介面"
	
	-- tuto/install
	L.install_header_1 = "歡迎"
	L.install_header_2 = "1. 基本要素"
	L.install_header_3 = "2. 單位框架"
	L.install_header_4 = "3. 特點"
	L.install_header_5 = "4. 您應該知道的事!"
	L.install_header_6 = "5. 指令"
	L.install_header_7 = "6. 完成"
	L.install_header_8 = "1. 必要的設定"
	L.install_header_9 = "2. 社交"
	L.install_header_10= "3. 框架"
	L.install_header_11= "4. 成功!"

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
	
	L.install_button_tutorial = "指南"
	L.install_button_install = "安裝"
	L.install_button_next = "下一步"
	L.install_button_skip = "略過"
	L.install_button_continue = "繼續"
	L.install_button_finish = "完成"
	L.install_button_close = "關閉"
end