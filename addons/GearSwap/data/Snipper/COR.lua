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
    
    sets.aftercast.Idle = set_combine(sets.TP.DT,{})
    send_command('input /macro book 10;wait .1;input /macro set 1')
end

function precast(spell)
	if sets.precast.JA[spell.english] then
        equip(sets.precast.JA[spell.english])
      elseif sets.precast[spell.english] then
        equip(sets.precast[spell.english])
    elseif spell.type=="WeaponSkill" then
        equip(sets.precast.WS)
    elseif string.find(spell.english,'Waltz') then
        equip(sets.precast.Waltz)
    end
end

function midcast(spell)
end

function aftercast(spell)
    if player.status =='Engaged' then
        equip(sets.aftercast.TP)
    else
        equip(sets.aftercast.Idle)
    end
end

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
        equip(sets.aftercast.Idle)
    elseif new == 'Engaged' then
        equip(sets.aftercast.TP)
    end
end

function self_command(command)
	
	if sets.TP[command] then
		sets.aftercast.TP = sets.TP[command]
		equip(sets.TP[command])
		add_to_chat(122,command)
	end
end