function get_sets() 
	-- Commands in game
	-- /gs c changeTP  switches between the list of modes in tpModes, equips the gear and sets it to current aftercast set
	-- /gs c "setName" quips the gear set and sets it to current aftercast set
	-- /gs c deploy puts autodeploy on, when you engage it will cast deploy
	-- /gs c automaneuver turns on automaneuver, when maneuvers wear it recasts them
	--/ in my init file (windower/scripts/init.txt) f9 is bound to sent /gs c changeTP 
	
	
	include('cdhelper.lua')

	tpModes = { "Acc", "Haste", "Pet", "Default", "Custom"} -- These are the sets that will cycle Modes, just make sure the set matches the name here ex: sets.TP.Name will equip if "Name" is in this list
	dtModes = {"Default", "Magic", "Full", "Custom"} --sets.DT.Mode
	wsModes = {"Default", "Acc"}  --sets.WS.Mode
	idleModes = {"Default", "Pet", "DT", "Custom"}
	petModes = {"Default","Tank", "DD", "Hybrid", "Custom"}
	sets.base = {} -- Base set. Can use this as a base for other sets
	nukeModes ={"Default", "mAcc"}
	
	--- precast------------------
	sets.precast = {}
	sets.precast.Magic = {}
	sets.precast.TP ={}			
	sets.precast.WS = {}
	sets.precast.JA = {}
	sets.precast.Magic = {}
	--------------midcast-----------------------
	sets.midcast = {}
	sets.midcast.Magic = {}		
	--------------------------------------------------WS-----------------------------------------------------------------------
	sets.base.WS = set_combine(sets.base,{})	
	sets.WS = set_combine(sets.base.WS,{})
	sets.WS.Default = set_combine(sets.base.WS,{})
	sets.WS.Acc = set_combine(sets.base.WS,{ })	
    sets.precast.WS = set_combine(sets.base.WS,{})
	
	sets.WS['Shijin Spiral'] = {ring1 = "Rajas Ring", Neck="Light Gorget" }
	sets.WS['Shijin Spiral'].Acc = set_combine(sets.WS['Shijin Spiral'], {})
		
	
	sets.WS['Victory Smite'] = set_combine(sets.WS[wsMode],{})
	sets.WS['Victory Smite'].Acc = set_combine(sets.WS['Victory Smite'], {})
	



	-----------------------------------------------Tp---------------------------------------------------------------------------------------
    sets.TP = set_combine(sets.base,{})	
	sets.TP.Default = set_combine(sets.TP,{})
    sets.TP.Acc = set_combine(sets.TP,{ })	
	sets.TP.Haste = set_combine(sets.TP,{})	
    sets.TP.DT=  set_combine(sets.base,{})
	sets.TP.Pet= set_combine(sets.base,{})	
	sets.TP.Custom = set_combine(sets.TP,{})
	
	--------------------------------------------------------------------JA------------------------------------------------------------------
    sets.precast.JA['Tactical Switch'] = {feet="Cirque Scarpe +2"}	

	
	
	------------------------------------------DT-----------------------------------------------------------------------------------------------
	sets.DT = set_combine(sets.base,{})
    sets.DT.Default = set_combine(sets.DT,{})
	sets.DT.Magic  = set_combine(sets.DT,{})
	sets.DT.Full = sets.DT
	sets.DT.Custom = sets.DT
	
	------------------------------------------------------After Cast---------------------------------------------
    sets.aftercast.TP = sets.TP    
    sets.aftercast.Idle = set_combine(sets.TP.DT,{})
	
	----------------------------------------------------Idle------------------------------------------------------------------
	sets.Idle.DT = set_combine(sets.DT,{})
	sets.Idle.Default = set_combine(sets.DT,{})
	sets.Idle.Pet = set_combine(sets.DT,{})
	sets.Idle.Custom = set_combine(sets.DT,{})
	
	
	----------------------------------------------Pet-------------------------------------------------------------------------
	sets.midcast.Pet = {}	
	sets.midcast.Pet.Cure = { }
	sets.midcast.Pet['Elemental Magic'] = {}
	sets.midcast.Pet.WeaponSkill = set_combine(sets.TP.DD, {})
	sets.base.Pet = {}
	sets.base.Pet.DD = {}
	sets.Pet = set_combine(sets.base,{})	
	sets.Pet.Default = set_combine(sets.base,{})
	sets.Pet.Tank = {}
	sets.Pet.Custom = {}
	sets.Pet.DD = {}
	sets.Pet.Hybrid = {}
		----------------------------------------------Nuke-------------------------------------------------------------------------
	sets.midcast.Elemental = {}
	sets.Nuke.Default = {}
	sets.Nuke.Custom = {}
	sets.Nuke.Acc = {}
	sets.Nuke.Burst = {}
	sets.midcast.burst = {}
	send_command('input /macro book 1;wait .1;input /macro set 9')
end

