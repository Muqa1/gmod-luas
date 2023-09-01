hook.Add("HUDPaint", "ESP", function() -- https://imgur.com/6ZxGNm5
    for _, p in pairs(player.GetAll()) do
		if (p:Alive()) and p ~= LocalPlayer() then
			local feetpos = p:GetPos() 
            local headpos = feetpos + Vector(0,0,75)
            feetpos = feetpos:ToScreen() 
            headpos = headpos:ToScreen()
            if headpos ~= nil and feetpos ~= nil then
                local height = math.abs(headpos.y - feetpos.y)
                local width = height * 0.6
                local x = math.floor(headpos.x - width * 0.5)
                local y = math.floor(headpos.y)
                local w = math.floor(width)
                local h = math.floor(height)
                local width, height = surface.GetTextSize(p:Name())
			    surface.SetTextColor( 255, 255, 255, 232) 	
			    surface.SetTextPos(math.floor(x + w / 2 - (width / 2)), y - height )
			    surface.SetFont( "Default" ) 
			    surface.DrawText( p:Name() ) -- name
                surface.SetDrawColor( 255,255,255,255 )
                surface.DrawOutlinedRect( x, y, w, h, 1 ) -- box
                local health = p:Health() -- healthboar
                local maxHealth = p:GetMaxHealth()
                local healthBarSize = math.floor(h * (health / maxHealth))
                surface.SetDrawColor( 0,255,0,255 )
                surface.DrawRect(x - 6, y, 3, h )
                surface.SetDrawColor( 0,0,0,255 )
                surface.DrawRect(x - 6, y, 3, h - healthBarSize )
            end
		end 
	end
end)
