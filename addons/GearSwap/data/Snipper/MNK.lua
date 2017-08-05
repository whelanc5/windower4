function get_sets()   

-- Commands in game
	-- /gs c changeTP  switches between the list of modes in tpModes, equips the gear and sets it to current aftercast set
	-- /gs c "setName" quips the gear set and sets it to current aftercast set   
	--/ in my init file (windower/scripts/init.txt) f9 is bound to sent /gs c changeTP 	
    include('cdhelper.lua')
	sets.TP = {} 
	sets.precast = {}
	sets.precast.Magic = {}
	sets.precast.TP ={}
	sets.precast.TP ={}
	sets.precast.JA = {}
	sets.aftercast = {}
	sets.midcast = {}
	sets.midcast.Magic = {}
	sets.DT = {}
	sets.Idle = {}
	sets.Idle.Normal = set_combine(sets.TP.DT,{})
	sets.precast = {}
	
	sets.base = {head="Hizamaru Somen",neck="Shifting Necklace +1",
        ear1="Bladeborn Earring",ear2="Steelflash Earring",body="Hizamaru Haramaki",hands="Hizamaru Kote +1",
        ring1="Rajas Ring",ring2="Epona's Ring", back="Visucius's Mantle",waist="Hurch'lan Sash",legs="Hiza. Hizayoroi",
        feet="Herculean boots"}
	
    sets.precast.WS = set_combine(sets.base,{ring1 = "Spiral Ring", waist = "Windbuffet Belt"})
	
	sets.WS['Shijin Spiral'] = set_combine({ring1 = "Rajas Ring"})
    
    sets.TP =  set_combine(sets.base,{})
		
    sets.TP.Acc = set_combine(sets.TP,{})
	
	sets.TP.Haste = set_combine(sets.TP,{waist="Windbuffet Belt"})
	
	sets.TP.DT =  set_combine(sets.TP,{neck="Twilight Torque", ring1="Dark Ring", ring2="Dark Ring" , waist = "Black Belt"})
    
        
    sets.precast.JA = {}
    
    
    sets.aftercast = {}
    sets.aftercast.TP = sets.TP
    
    sets.aftercast.Idle = set_combine(sets.TP.DT,{feet="Hermes' Sandals"}) 
    send_command('input /macro book 3;wait .1;input /macro set 1')
end

