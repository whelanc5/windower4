function get_sets() 
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

    sets.TP = {head="Taeon Chapeau",neck="Shifting Necklace +1",
        ear1="Bladeborn Earring" ,ear2="Steelflash Earring",body="Taeon Tabard",hands="Taeon Gloves",
        ring1="Rajas Ring",ring2="Epona's Ring", back="Atheling Mantle",waist="Anguinus Belt",legs="Taeon Tights",
        feet="Taeon Boots"}   
		
    sets.TP.Acc = set_combine(sets.TP,{})
	 
    sets.TP.Haste = set_combine(sets.TP,{waist="Windbuffet Belt"})
	
	sets.precast.WS = {head="Taeon Chapeau",neck="Shifting Necklace +1",
        ear1="Bladeborn Earring" ,ear2="Steelflash Earring",body="Taeon Tabard",hands="Taeon Gloves",
        ring1="Rajas Ring",ring2="Epona's Ring", back="Atheling Mantle",waist="Anguinus Belt",legs="Taeon Tights",
        feet="Taeon Boots"}

    sets.precast.JA = {} 
    sets.aftercast = {}
    sets.aftercast.TP = sets.TP

	sets.precast.Ninjutsu = {head = "Herculean Helm"}
	sets.midcast.Ninjutsu = {head="Taeon Chapeau"}
	sets.Ninjutsu = {}
	sets.Ninjutsu.Burst = {body="Taeon Tabard"}
    
    sets.aftercast.Idle = set_combine(sets.TP.DT,{})
    send_command('input /macro book 10;wait .1;input /macro set 1')
end

