function get_sets() 
	-- Commands in game
	-- /gs c changeTP  switches between the list of modes in tpModes, equips the gear and sets it to current aftercast set
	-- /gs c "setName" quips the gear set and sets it to current aftercast set
	-- /gs c deploy puts autodeploy on, when you engage it will cast deploy
	-- /gs c automaneuver turns on automaneuver, when maneuvers wear it recasts them
	--/ in my init file (windower/scripts/init.txt) f9 is bound to sent /gs c changeTP 
	
	
	include('cdhelper.lua')
	
	modeSets["tpMode"].setModes = {"Default"} -- These are the sets that will cycle Modes, just make sure the set matches the name here ex: sets.TP.Name will equip if "Name" is in this list
	modeSets["dtMode"].setModes = {"Default", "Magic", "Full",} --sets.DT.Mode
	modeSets["wsMode"].setModes = {"Default"}  --sets.WS.Mode
	modeSets["idleMode"].setModes = {"Default", "Refresh", "DT"}
	modeSets["elementalMode"].setModes = {"Default", "Burst", "Acc"}
	modeSets["darknessMode"].setModes = {"Default", "Burst", "Acc"}
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------Base sets-------------------------------------------------------------------------------
--these can be overridden in job lua


	sets.base = { main="Queller Rod", ammo="Homiliary", head="Gende. Caubeen +1", body="Ebers Bliaud", hands="Inyan. Dastanas +1", legs="Ebers Pantaloons",
    feet="Vanya Clogs", neck="Incanter's Torque", waist="Porous Rope", left_ear="Nourish. Earring +1", right_ear="Glorious Earring", left_ring="Defending Ring",right_ring="Lebeche Ring",
    back="Alaunus's Cape",}

	
	-- --- precast--------------------------------
	sets.precast = {}
	sets.precast.Magic = {ammo="Homiliary", head="Vanya Hood", body="Inyanga Jubbah +1", hands="Gende. Gages +1", neck="Voltsurge Torque", waist="Witful Belt", 
	                     left_ring="Prolix Ring", right_ring="Lebeche Ring", back="Swith Cape",ear1="Loquac. Earring", legs="Gyve Trousers"}
	sets.precast.TP ={}			
	sets.precast.WS = {}
	sets.precast.JA = {}
	sets.precast.Darkness = nil
	sets.precast.Ninjitsu = nil
	----------------------------------------------------------------Midcast------------------------------------------------------------------------------------------
	---------------- mid cast sets, over write these 
	sets.midcast = {}
	sets.midcast.Darkness = nil
	sets.midcast.Ninjitsu = nil

	--------------blue-------------------------
	sets.Blue = {}
	sets.Blue.Magic = {}
	sets.Blue.Physical = {}
	sets.Blue.Debuff = {}
	sets.Blue.Buff = {}
	sets.Blue.Cure = {}
	
   ----------------------------------------------------------------AFTERCAST----------------------------------------------------------------------------------------	
	
	  
  
	----------------------------------------------------------------MAGIC--------------------------------------------------------------------------------------------
	sets.midcast.Magic = {}	
	
		----------------------------------------------------------------elemental---------------------------------------------------------------------------------------------
	--changes sets.midcast.Elemental to this set based on mode
	sets.Elemental = set_combine(sets.base,{})
	sets.precast.Elemental = set_combine(sets.precast.Magic,{})
	sets.midcast.Elemental = sets.Elemental
	sets.Elemental.Default = sets.Elemental
	sets.Elemental.Burst = nil
	sets.Elemental.Acc = nil

		----------------------------------------------------------------Darkness---------------------------------------------------------------------------------------------
	--changes sets.midcast.Darkness to this set based on mode
	sets.Darkness = {}
	sets.precast.Darkness = nil
	sets.midcast.Darkness = sets.Darkness
	sets.Darkness.Default = sets.Darkness
	sets.Darkness.Burst = nil
	sets.Darkness.Acc = nil
----------------------------------------------------------------healing---------------------------------------------------------------------------------------------
	sets.precast.Healing =  sets.precast.Magic
	sets.midcast.Healing = sets.precast.Magic
	
	------------------------------------------------------------------cure------------------------------------------------------------------------------------------------
	sets.precast.Cure = set_combine(sets.precast.Magic,{ main="Queller Rod", legs="Ebers Pantaloons", feet="Hygieia Clogs",left_ear="Mendi. Earring", right_ear="Nourish. Earring +1"})
	sets.midcast.Cure = set_combine(sets.base,{ring1="Sirona's Ring"})
	
----------------------------------------------------------------Curaga---------------------------------------------------------------------------------------------------------------------------------------
	sets.precast.Curaga = sets.precast.Cure
	sets.midcast.Curaga = sets.midcast.Cure 


----------------------------------------------------------------Geomancy---------------------------------------------------------------------------------------------
	sets.precast.Geomancy = nil
	sets.midcast.Geomancy = nil

----------------------------------------------------------------enhancing---------------------------------------------------------------------------------------------
	sets.precast.Enhancing =  set_combine(sets.precast.Magic,{waist="Siegel Sash"})
	sets.midcast.Enhancing =  { main="Beneficus", ammo="Homiliary", head="Ebers Cap", body="Ebers Bliaud", hands="Inyan. Dastanas +1", legs="Piety Pantaloons", feet="Ebers Duckbills",
    neck="Incanter's Torque", waist="Witful Belt", left_ear="Mendi. Earring", right_ear="Loquac. Earring",left_ring="Defending Ring", right_ring="Prolix Ring",back="Alaunus's Cape"}
		------------------aftercast----------------


	--------------------------------------------------WS-----------------------------------------------------------------------
	sets.base.WS = set_combine(sets.base,{ })	
	sets.WS = set_combine(sets.base.WS,{})
	sets.WS.Default = set_combine(sets.base.WS,{})
	sets.WS.Acc = set_combine(sets.base.WS,{})	
    sets.precast.WS = set_combine(sets.base.WS,{})
	

	
	-----------------------------------------------Tp---------------------------------------------------------------------------------------
    sets.TP = set_combine(sets.base,{})
	sets.TP.Current = sets.TP
	sets.TP.Default = set_combine(sets.TP,{})
    sets.TP.Acc = set_combine(sets.TP,{})	
	sets.TP.Haste = set_combine(sets.TP,{})	
    sets.TP.DT=  set_combine(sets.base,{back="Umbra Cape"})
	sets.TP.Pet= set_combine(sets.base,{})	
	sets.TP.Custom = set_combine(sets.TP,{})
	
	--------------------------------------------------------------------JA------------------------------------------------------------------
	sets.aftercast = { }	

	
	
	------------------------------------------DT-----------------------------------------------------------------------------------------------
	sets.DT = set_combine(sets.base,{head="Gende. Caubeen +1", body="Gende. Bilaut +1", hands="Gende. Gages +1", legs="Gende. Spats +1", feet="Gende. Galosh. +1",
    neck="Twilight Torque", waist="Fucho-no-Obi", left_ear="Static Earring",ring1="Dark Ring", ring2="Defending Ring", back="Umbra Cape"})
    sets.DT.Default = sets.DT
	sets.DT.Current = sets.DT
	sets.DT.Magic  = set_combine(sets.base,{})
	sets.DT.Full = sets.DT
	sets.DT.Custom = sets.DT
	----------------------------------------------------Idle------------------------------------------------------------------
	sets.Idle = set_combine(sets.DT,{ring1 ="Shneddick Ring", legs="Assid. Pants +1"})
	sets.Idle.Refresh=set_combine(sets.Idle,{})
	sets.Idle.Current = sets.Idle  ----Don't touch
	sets.Idle.DT = set_combine(sets.DT,{})
	sets.Idle.Default = sets.Idle
	sets.aftercast.Idle = sets.Idle
	
	----------------------------------------------Pet-------------------------------------------------------------------------
	
	
	send_command('input /macro book 1;wait .1;input /macro set 9')
end

