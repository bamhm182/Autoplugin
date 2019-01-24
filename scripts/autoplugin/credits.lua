function credits()
	local credits = {
		{ title = "Creator", members = {
			"theHeroGAC"
		}},
		{ title = "Developers", members = {
			"bamhm182 (BytePen)",
			"DavisDev",
			"Grzybojad",
			"ONElua",
			"theHeroGAC"
		}},
		{ title = "Translators", members = {
			"chronoss09 (French)",
			"d1l4y (Portuguese)",
			"GreekMans (Greek)",
			"gvaldebenit (Spanish)",
			"LimonChoms (Traditional Chinese)",
			"Omoinemie (Simplified Chinese)",
			"RY0M43CH1Z3N (Spanish)",
			"Schn1ek3 (German)",
			"theHeroGAC (Italian)",
			"Umineko1993 (Japanese)",
			"yexun1995 (Simplified Chinese)",
		}}
	}

	local scroll = newScroll(credits,#credits)

	while true do
		buttons.read()
		if back then back:blit(0,0) end
		screen.print(480,18,"Credits",1.2,color.white,0x0,__ACENTER)

		local y=75
		for i=scroll.ini,scroll.lim do
			screen.print(480,y,credits[i].title,1,color.white,0x0,__ACENTER)
			y+=50
			for j=1,#credits[i].members do
				screen.print(480,y,credits[i].members[j],1,color.white,0x0,__ACENTER)
				y+=30
			end
			y+=50
		end

		---- Draw Scroll Bar
		local ybar,hbar = 70, 355
		draw.fillrect(950,ybar-2,8,hbar,color.shine)
		if scroll.maxim >= limit then
			local pos_height = math.max(hbar/scroll.maxim, limit)
			--Bar Scroll
			draw.fillrect(950, ybar-2 + ((hbar-pos_height)/(scroll.maxim-1))*(scroll.sel-1), 8, pos_height, color.new(0,255,0))
		end

		if buttonskey then buttonskey:blitsprite(5, 473, scancel) end
		screen.print(30, 475, "Return", 1, color.white, color.black, __ALEFT)

		if buttons[cancel] then return end
	end

end