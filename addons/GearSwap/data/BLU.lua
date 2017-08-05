function get_sets() 
	-- Commands in game
	-- /gs c changeTP  switches between the list of modes in tpModes, equips the gear and sets it to current aftercast set
	-- /gs c "setName" quips the gear set and sets it to current aftercast set
	-- /gs c deploy puts autodeploy on, when you engage it will cast deploy
	-- /gs c automaneuver turns on automaneuver, when maneuvers wear it recasts them
	--/ in my init file (windower/scripts/init.txt) f9 is bound to sent /gs c changeTP 
	
	
	include('cdhelper.lua')
    sets.precast = {}
	petModes = {"Default","DD","Tank"}
	
	
	sets.Blue.Magic.Default = {ring1 = "Rajas Ring"}
	
	deploy = false
	automaneuver = false
	tpModes = { "Acc", "Haste", "Pet", "Default"} -- These are the sets that will cycle Modes, just make sure the set matches the name here ex: sets.TP.Name will equip if "Name" is in this list
	dtModes = {"Default", "Magic"} --sets.DT.Mode
	wsModes = {"Default", "Acc"}  --sets.WS.Mode
	idleModes = {}
	sets.base = {}
	
	sets.WS = {}
	sets.WS.Default = {}
	sets.WS.Acc = {}
	
    sets.precast.WS = {}
	sets.TP = set_combine(sets.base,{})
	
	sets.TP.Default = {}
    sets.TP.Acc = {}
	sets.TP.Haste = {}
    sets.TP.DT=  {}
	
	sets.DT = {}
    sets.DT.Default = {}
	sets.DT.Magic  = {}
	
    sets.aftercast.TP = sets.TP    
    sets.aftercast.Idle = {}
	
	sets.Idle.DT = {}
	sets.Idle.Default = {}
	send_command('input /macro book 1;wait .1;input /macro set 9')
end

