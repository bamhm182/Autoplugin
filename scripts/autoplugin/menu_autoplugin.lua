local credits_callback = function ()
	credits()
end

local translate_callback = function ()
	translate()
end

function menu_autoplugin()
	local menutext = {
		{ text = LANGUAGE["MENU_TRANSLATE"],	desc = LANGUAGE["MENU_TRANSLATE_DESC"],	funct = translate_callback },
		{ text = LANGUAGE["MENU_CREDITS"],		desc = LANGUAGE["MENU_CREDITS_DESC"],	funct = credits_callback }
	}
	local scroll = newScroll(menutext, #menutext)

	local x_scrext = 20
	while true do
		buttons.read()

		if back then back:blit(0,0) end

		screen.print(480,20,LANGUAGE["MENU_TITLE"],1.3,color.green,0x0,__ACENTER)

		local y = 160
		for i=scroll.ini, scroll.lim do
			if i == scroll.sel then draw.offsetgradrect(0,y-10,960,32,color.shine:a(55),color.shine:a(105),0x0,0x0,21) end
			screen.print(480,y,menutext[i].text,1.2,color.white, 0x0, __ACENTER)
			y+=38
		end

		if screen.textwidth(menutext[scroll.sel].desc) > 935 then
			x_scrext = screen.print(x_scrext, 520, menutext[scroll.sel].desc,1,color.white,color.orange,__SLEFT,935)
		else
			screen.print(480, 520, menutext[scroll.sel].desc,1,color.white,color.orange,__ACENTER)
		end

		screen.flip()

		--Controls
		if buttons.up or buttons.analogly < -60 then
			if scroll:up() then x_scrext = 20 end
		end
		if buttons.down or buttons.analogly > 60 then
			if scroll:down() then x_scrext = 20 end
		end

		if buttons[cancel] then break end
		if buttons[accept] then menutext[scroll.sel].funct() end

	end

end