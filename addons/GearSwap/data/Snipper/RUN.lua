function get_sets() 
	-- Commands in game
	-- /gs c changeTP  switches between the list of modes in tpModes, equips the gear and sets it to current aftercast set
	-- /gs c "setName" quips the gear set and sets it to current aftercast set
	-- /gs c deploy puts autodeploy on, when you engage it will cast deploy
	-- /gs c automaneuver turns on automaneuver, when maneuvers wear it recasts them
	--/ in my init file (windower/scripts/init.txt) f9 is bound to sent /gs c changeTP 
	currWS = 'Resolution'
	
	include('cdhelper.lua')



----------------------------------------------------------------------Base sets-------------------------------------------------------------------------------

	
	modeSets["tpMode"].setModes = {"Default","Tank", "DT","Acc","Custom"} -- These are the sets that will cycle Modes, just make sure the set matches the name here ex: sets.TP.Name will equip if "Name" is in this list
	modeSets["dtMode"].setModes = {"Default", "Magic", "Full", "Custom"} --sets.DT.Mode
	modeSets["wsMode"].setModes = {"Default", "Acc"}  --sets.WS.Mode
	modeSets["idleMode"].setModes = {"Default","Custom"}
	modeSets["tankMode"].setModes = {"Default","DT"}
	-- --- precast--------------------------------
	sets.precast = {}
	sets.precast.Magic = {}
	sets.precast.TP ={}			
	sets.precast.WS = {}
	sets.precast.JA = {}
	sets.precast.Magic = {}
	--------------midcast----------------------
	sets.midcast = {}
	------------------aftercast----------------
	sets.aftercast = {}	
	--------------blue-------------------------
	sets.Blue = {}
	sets.Blue.Magic = {}
	sets.Blue.Physical = {}
	sets.Blue.Debuff = {}
	sets.Blue.Buff = {}
	sets.Blue.Cure = {}


	sets.base = {head="Skormoth Mask",neck="Lissome Necklace",
        ear1="Bladeborn Earring",ear2="Steelflash Earring",body="Rawhide Vest",hands="Herculean Gloves",
        ring1="Rajas Ring",ring2="Epona's Ring", back="Ogma's Cape", waist ="Ioskeha Belt",legs="Meg. Chausses +2",
        feet= hercFeetTA}
	--------------------------------------------------WS-----------------------------------------------------------------------
	sets.WS = set_combine(sets.base,{body="Meg. Cuirie +1", hands="Meg. Gloves +1",body="Meg. Cuirie +1", legs = hercLegsSTR, ring2 = "Apate Ring", head="Meghanada Visor +1"})
	sets.WS.Default = set_combine(sets.WS,{})
	sets.WS.Acc = set_combine(sets.WS,{ })	
    sets.precast.WS = sets.WS -- don't change
	sets.WS['Resolution'] = set_combine(sets.WS, {neck = "Soil Gorget", waist = "Soil Belt"})




	
	--------------------------------------------------------------------JA------------------------------------------------------------------

	
	
	------------------------------------------DT-----------------------------------------------------------------------------------------------
	sets.DT = set_combine(sets.base,{back="Moonbeam Cape", neck="Twilight Torque",body="Futhark Coat +1", ring1="Dark Ring", ring2="Dark Ring", head="Meghanada Visor +1", hands="Meg. Gloves +1", waist = "Flume Belt"})
    sets.DT.Default = set_combine(sets.DT,{})
	sets.DT.Magic  = set_combine(sets.DT,{ back="Moonbeam Cape"})
	sets.DT.Full = sets.DT
	sets.DT.Custom = sets.DT
	
	------------------------------------------------------After Cast---------------------------------------------
    
  
	
	----------------------------------------------------Idle------------------------------------------------------------------
	sets.Idle = set_combine(sets.DT,{feet="Hermes' Sandals"})
	sets.Idle.Current = sets.Idle
	sets.Idle.DT = set_combine(sets.DT,{})
	sets.Idle.Default = sets.Idle 
	sets.Idle.Custom = sets.Idle
	sets.aftercast.Idle = sets.Idle
	
	
	
	sets.Tank =  set_combine(sets.base,{body="Meg. Cuirie +1", neck="Twilight Torque", back="Ogma's Cape", waist = "Flume Belt",  head="Meghanada Visor +1"})
	sets.Tank.DT =  set_combine(sets.DT,{})
	sets.Tank.Default = sets.Tank
	sets.Tank.Custom = sets.Tank
		-----------------------------------------------Tp---------------------------------------------------------------------------------------
    sets.TP = set_combine(sets.base,{})
	sets.aftercast.TP = sets.TP  
	sets.TP.Current = sets.TP
	sets.TP.Default = set_combine(sets.TP,{})
    sets.TP.Acc = set_combine(sets.TP,{body="Meg. Cuirie +1", hands="Meg. Gloves +1",body="Meg. Cuirie +1"})	
	sets.TP.Haste = set_combine(sets.TP,{})	
    sets.TP.DT =  set_combine(sets.DT,{back="Ogma's Cape"})
	sets.TP.Tank =  set_combine(sets.DT,{back="Ogma's Cape"})

	sets.TP.Custom = set_combine(sets.TP,{})
	
	send_command('input /macro book 9;wait .1;input /macro set 1')
end

