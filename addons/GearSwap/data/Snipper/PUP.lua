function get_sets() 
	-- Commands in game
	-- /gs c changeTP  switches between the list of modes in tpModes, equips the gear and sets it to current aftercast set
	-- /gs c "setName" quips the gear set and sets it to current aftercast set
	-- /gs c deploy puts autodeploy on, when you engage it will cast deploy
	-- /gs c automaneuver turns on automaneuver, when maneuvers wear it recasts them
	--/ in my init file (windower/scripts/init.txt) f9 is bound to sent /gs c changeTP 
	
	
	include('cdhelper.lua')
    sets.precast = {}
	
	
	sets.precast.JA = {}
	
	
	
	deploy = false
	automaneuver = false
	tpModes = { "Acc", "Haste", "Pet", "Default", "Custom"} -- These are the sets that will cycle Modes, just make sure the set matches the name here ex: sets.TP.Name will equip if "Name" is in this list
	dtModes = {"Default", "Magic", "Full", "Custom"} --sets.DT.Mode
	wsModes = {"Default", "Acc"}  --sets.WS.Mode
	idleModes = {"Default", "Pet", "DT", "Custom"}
	petModes = {"Default","Tank", "DD", "Hybrid", "Custom"}
	sets.base = {head="Hizamaru Somen +1",neck="Lissome Necklace",
        ear1="Bladeborn Earring",ear2="Steelflash Earring",body="Tali'ah Manteel",hands="Herculean Gloves",
        ring1="Rajas Ring",ring2="Epona's Ring", back="Visucius's Mantle",waist="Moonbow Belt",legs= hercLegsTA,
        feet= hercFeetTA}
	--------------------------------------------------WS-----------------------------------------------------------------------
	sets.base.WS = set_combine(sets.base,{ hands="Ryuo Tekko"})	
	sets.WS = set_combine(sets.base.WS,{ring1 = "Spiral Ring", neck="Shifting Necklace +1"})
	sets.WS.Default = set_combine(sets.base.WS,{ring1 = "Spiral Ring"})
	sets.WS.Acc = set_combine(sets.base.WS,{ waist = "Hurch'lan Sash", neck="Shifting Necklace +1", legs = hercLegsCrit})	
    sets.precast.WS = set_combine(sets.base.WS,{ring1 = "Spiral Ring"})
	
	sets.WS['Shijin Spiral'] = {ring1 = "Rajas Ring", Neck="Light Gorget" }
	sets.WS['Shijin Spiral'].Acc = set_combine(sets.WS['Shijin Spiral'], {neck="Shifting Necklace +1"})
		
	
	sets.WS['Victory Smite'] = set_combine(sets.WS[wsMode],{ring1 = "Rajas Ring", Neck="Light Gorget", legs= hercLegsCrit, feet = hercFeetCrit})
	sets.WS['Victory Smite'].Acc = set_combine(sets.WS['Victory Smite'], {neck="Shifting Necklace +1"})
	
	sets.WS['Stringing Pummel'] = {ring1 = "Spiral Ring", Neck="Soil Gorget", legs= hercLegsCrit, feet = hercFeetCrit}
	sets.WS['Stringing Pummel'].Acc = set_combine(sets.WS['Stringing Pummel'], {neck="Shifting Necklace +1"})


	-----------------------------------------------Tp---------------------------------------------------------------------------------------
    sets.TP = set_combine(sets.base,{})	
	sets.TP.Default = set_combine(sets.TP,{})
    sets.TP.Acc = set_combine(sets.TP,{  legs = hercLegsCrit, hands = "Ryuo Tekko", neck="Shifting Necklace +1"})	
	sets.TP.Haste = set_combine(sets.TP,{})	
    sets.TP.DT=  set_combine(sets.base,{neck="Twilight Torque", ring1="Dark Ring", ring2="Dark Ring" , back="Cheviot Cape"})
	sets.TP.Pet= set_combine(sets.base,{ring1="Thurandaut Ring"})	
	sets.TP.Custom = set_combine(sets.TP,{})
	
	--------------------------------------------------------------------JA------------------------------------------------------------------
    sets.precast.JA['Tactical Switch'] = {feet="Cirque Scarpe +2"}	
    sets.precast.JA['Repair'] = {feet="Foire Babouches +1", ammo="Automat. Oil +3", ear1 ="Guignol Earring"}	
	sets.precast.JA['Maintenance'] = {ammo="Automat. Oil +1"}
	sets.precast.JA['Overdrive'] = {body = "Pitre Tobe +1"}
	sets.precast.maneuver = {body="Cirque Farsetto +2", hands="Foire Dastanas +1", neck="Buffoon's Collar", back="Visucius's Mantle"}
	
	
	------------------------------------------DT-----------------------------------------------------------------------------------------------
	sets.DT = set_combine(sets.base,{neck="Twilight Torque", ring1="Dark Ring", ring2="Dark Ring", back="Cheviot Cape", head = "Naga Somen", hands = "Naga Tekko", waist = "Moonbow Belt"})
    sets.DT.Default = set_combine(sets.base,{neck="Twilight Torque", ring1="Dark Ring", ring2="Dark Ring" , back="Cheviot Cape"})
	sets.DT.Magic  = set_combine(sets.base,{neck="Twilight Torque", ring1="Dark Ring", ring2="Dark Ring", head = "Naga Somen" , hands = "Naga Tekko"})
	sets.DT.Full = sets.DT
	sets.DT.Custom = sets.DT
	
	------------------------------------------------------After Cast---------------------------------------------
    sets.aftercast.TP = sets.TP    
    sets.aftercast.Idle = set_combine(sets.TP.DT,{feet="Hermes' Sandals", body = "Hizamaru Haramaki"})
	
	----------------------------------------------------Idle------------------------------------------------------------------
	sets.Idle.DT = set_combine(sets.DT,{feet="Hermes' Sandals"})
	sets.Idle.Default = set_combine(sets.DT,{feet="Hermes' Sandals", body = "Hizamaru Haramaki"})
	sets.Idle.Pet = set_combine(sets.DT,{ring1="Thurandaut Ring"})
	sets.Idle.Custom = set_combine(sets.DT,{feet="Hermes' Sandals"})
	
	
	----------------------------------------------Pet-------------------------------------------------------------------------
	sets.midcast.Pet = {}	
	sets.midcast.Pet.Cure = { }
	sets.midcast.Pet['Elemental Magic'] = {hands = "Naga Tekko", head ="Rawhide Mask", Ear1 = "Burana Earring", Feet = "Cirque Scarpe +2"}
	sets.midcast.Pet.WeaponSkill = set_combine(sets.TP.DD, {head= "Cirque Cappello +2",  hands = "Cirque Guanti +2", ear2 = "Burana Earring", body="Pitre Tobe +1", ring1="Thurandaut Ring", ear1="Domes. Earring", feet = "Naga Kyahan", legs = "Taeon Tights"})
	sets.base.Pet = {}
	sets.base.Pet.DD = {head = "Tali'ah Turban", hands = "Foire Dastanas +1", back="Visucius's Mantle", body="Pitre Tobe +1", ring1="Thurandaut Ring", waist ="Hurch'lan Sash", ear1="Domes. Earring", ear2="Burana Earring", feet = "Naga Kyahan", legs = "Tali'ah Seraweels"}
	sets.Pet = set_combine(sets.base,{ring1="Thurandaut Ring", waist ="Hurch'lan Sash"  })	
	sets.Pet.Default = set_combine(sets.base,{ring1="Thurandaut Ring"})	
	sets.Pet.DD = set_combine(sets.Pet, sets.base.Pet.DD)
	sets.Pet.Hybrid = set_combine(sets.Pet,{ body="Pitre Tobe +1"})
	sets.Pet.DT = set_combine(sets.Pet,{neck="Twilight Torque", ring2="Dark Ring"})
	sets.Pet.Tank= set_combine(sets.Pet,{ear1="Handler's Earring +1", ear2="Handler's Earring", feet = "Rao Sune-Ate", legs = "Tali'ah Seraweels", hands = "Rao Kote"})  	
	sets.Pet.Idle = set_combine(sets.DT,sets.Pet.Tank)
	sets.Pet.Idle.DD = set_combine(sets.DT, sets.base.Pet.DD)	
	sets.Pet.Idle.Tank = set_combine(sets.DT, sets.Pet.Tank)
	sets.Pet.Idle.Default = set_combine(sets.DT, sets.Pet.Tank)
	sets.Pet.Custom = sets.Pet
	
	
	send_command('input /macro book 1;wait .1;input /macro set 9')
end

