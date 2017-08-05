function get_sets()  

-- Commands in game, puts the /gs c command in a macro in game
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
	
	
	tpModes = {"Acc", 'Haste',"DT", "th"}
	
    sets.precast = {}       	
	
	sets.base = {head="Taeon Chapeau",neck="Lissome Necklace",
        ear1="Bladeborn Earring" ,ear2="Steelflash Earring",body="Rawhide Vest",hands="Taeon Gloves",
        ring1="Rajas Ring",ring2="Epona's Ring", back="Canny Cape",waist="Anguinus Belt",legs=hercLegsTA,
        feet= hercFeetTA}   
	
    sets.TP =  set_combine(sets.base,{} )
		
    sets.TP.Acc = set_combine(sets.TP,{neck="Shifting Necklace +1" ,waist="Anguinus Belt"})
	 
    sets.TP.Haste = set_combine(sets.TP,{waist="Windbuffet Belt"})
	
	sets.TP.DT = set_combine(sets.TP,{neck="Twilight Torque"})
	
	sets.TP.th = set_combine(sets.TP,{hands="Plun. Armlets +1",feet="Skulk. Poulaines" })
	
	sets.TP.DT=  set_combine(sets.TP,{neck="Twilight Torque", ring1="Dark Ring", ring2="Dark Ring" })
	sets.precast.WS = set_combine(sets.base,{waist = "Windbuffet Belt"})
	
    sets.precast.JA = {} 
    sets.aftercast = {}
    sets.aftercast.TP = sets.TP
    
    sets.aftercast.Idle = set_combine(sets.TP.DT,{feet = "Trotter Boots"})
    send_command('input /macro book 2;wait .1;input /macro set 1')
end

