local T, C, L = unpack(select(2, ...))

C["media"] = {
	-- fonts (ENGLISH, SPANISH)
	["font"] = [=[Interface\Addons\Tukui\medias\fonts\normal_font.ttf]=], -- general font of tukui
	["uffont"] = [[Interface\AddOns\Tukui\medias\fonts\uf_font.ttf]], -- general font of unitframes
	["dmgfont"] = [[Interface\AddOns\Tukui\medias\fonts\combat_font.ttf]], -- general font of dmg / sct
	
	-- fonts (DEUTSCH)
	["de_font"] = [=[Interface\Addons\Tukui\medias\fonts\normal_font.ttf]=], -- general font of tukui
	["de_uffont"] = [[Interface\AddOns\Tukui\medias\fonts\uf_font.ttf]], -- general font of unitframes
	["de_dmgfont"] = [[Interface\AddOns\Tukui\medias\fonts\combat_font.ttf]], -- general font of dmg / sct
	
	-- fonts (FRENCH)
	["fr_font"] = [=[Interface\Addons\Tukui\medias\fonts\normal_font.ttf]=], -- general font of tukui
	["fr_uffont"] = [[Interface\AddOns\Tukui\medias\fonts\uf_font.ttf]], -- general font of unitframes
	["fr_dmgfont"] = [=[Interface\AddOns\Tukui\medias\fonts\combat_font.ttf]=], -- general font of dmg / sct
	
	-- fonts (RUSSIAN)
	["ru_font"] = [=[Interface\Addons\Tukui\medias\fonts\normal_font.ttf]=], -- general font of tukui
	["ru_uffont"] = [[Fonts\ARIALN.TTF]], -- general font of unitframes
	["ru_dmgfont"] = [[Fonts\ARIALN.TTF]], -- general font of dmg / sct
	
	-- fonts (TAIWAN ONLY)
	["tw_font"] = [=[Fonts\bLEI00D.ttf]=], -- general font of tukui
	["tw_uffont"] = [[Fonts\bLEI00D.ttf]], -- general font of unitframes
	["tw_dmgfont"] = [[Fonts\bLEI00D.ttf]], -- general font of dmg / sct
	
	-- fonts (KOREAN ONLY)
	["kr_font"] = [=[Fonts\2002.TTF]=], -- general font of tukui
	["kr_uffont"] = [[Fonts\2002.TTF]], -- general font of unitframes
	["kr_dmgfont"] = [[Fonts\2002.TTF]], -- general font of dmg / sct
	
	-- textures
	["normTex"] = [[Interface\AddOns\Tukui\medias\textures\normTex]], -- texture used for tukui powerbar/altbar/castbar/etc
	["hpTex"] = [[Interface\AddOns\Tukui\medias\textures\hpTex]], -- texture used for tukui healthbar
	["glowTex"] = [[Interface\AddOns\Tukui\medias\textures\glowTex]], -- the glow text around some frame.
	["bubbleTex"] = [[Interface\AddOns\Tukui\medias\textures\bubbleTex]], -- unitframes combo points
	["copyicon"] = [[Interface\AddOns\Tukui\medias\textures\copy]], -- copy icon
	["blank"] = [[Interface\AddOns\Tukui\medias\textures\blank]], -- the main texture for all borders/panels
	
	["bordercolor"] = {.34,.31,.32}, -- border color of tukui panels
	["backdropcolor"] = {.1,.1,.1}, -- background color of tukui panels
	
	["tbordercolor"] = {.05,.05,.05}, -- border color of tukui panels
	["tbackdropcolor"] = {.09,.09,.09}, -- background color of tukui panels
	
	["pbordercolor"] = {.05,.05,.05}, -- border color of tukui panels
	["pbackdropcolor"] = {.15,.15,.15}, -- background color of tukui panels
	
	["altbordercolor"] = {.3,.3,.3}, -- alternative border color, mainly for unitframes text panels.
	["tncolor"] = {1,.98,.80,1}, -- text color for normal colored theme
	
	["healthcolor"] = {.2,.2,.2,1}, -- health color for unicolor theme
	["althealthcolor"] = {.3,.3,.3,1}, -- health color for raid frames
	["unihealthcolor"] = {.05,.05,.05,1},
	
	["healthdeficit"] = {.24,0,.01,1}, -- health deficit color for unicolor theme
	
	["interruptable"] = {.80,.14,.14,1}, -- castbar color of interruptable spells
	["castbarnorm"] = {.49,.61,.75,1}, -- color of player castbar if classcolor == false and target castbar
	--["interruptable"] = {.85,.1,.1,.75}, -- castbar color of interruptable spells
	--["castbarnorm"] = {.31,.45,.63,.5}, -- color of player castbar if classcolor == false and target castbar
	
	-- classtimer
	["ctbackdropcolor"] = {0,0,0,.85},
	["playerbar"] = {.33,.59,.33},
	["targetbar"] = {.33,.59,.33},
	["targetdebuff"] = {.54,.10,.10},
	["trinketbar"] = {.54,.10,.10},
	
	["buttonhover"] = [[Interface\AddOns\Tukui\medias\textures\button_hover]],
	
	-- sound
	["whisper"] = [[Interface\AddOns\Tukui\medias\sounds\whisper.mp3]],
	["warning"] = [[Interface\AddOns\Tukui\medias\sounds\warning.mp3]],
}