function get_sets() 
	-- Commands in game
	-- /gs c changeTP  switches between the list of modes in tpModes, equips the gear and sets it to current aftercast set
	-- /gs c "setName" quips the gear set and sets it to current aftercast set
	-- /gs c deploy puts autodeploy on, when you engage it will cast deploy
	-- /gs c automaneuver turns on automaneuver, when maneuvers wear it recasts them
	--/ in my init file (windower/scripts/init.txt) f9 is bound to sent /gs c changeTP 
	
	
	include('cdhelper.lua')
	
	modeSets["tpMode"].setModes = {"Default", "Acc", "Haste", "DT"} -- These are the sets that will cycle Modes, just make sure the set matches the name here ex: sets.TP.Name will equip if "Name" is in this list
	modeSets["dtMode"].setModes = {"Default", "Magic", "Full", "Custom"} --sets.DT.Mode
	modeSets["wsMode"].setModes = {"Default", "Acc"}  --sets.WS.Mode
	modeSets["idleMode"].setModes = {"Default", "Pet", "DT", "Custom"}
	modeSets["petMode"].setModes = {"Default","Tank", "DD", "Hybrid", "Custom"}
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------Base sets-------------------------------------------------------------------------------
--these can be overridden in job lua

	
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
	------------Nuke-------------------------
	sets.Nuke = {}


	sets.base = {head="Herculean Helm",neck="Lissome Necklace",
        ear1="Bladeborn Earring",ear2="Steelflash Earring",body="Rawhide Vest",hands="Herculean Gloves",
        ring1="Rajas Ring",ring2="Epona's Ring", back="Canny Cape",waist="Windbuffet Belt",legs= hercLegsTA,
        feet="Herculean Boots"}
	--------------------------------------------------WS-----------------------------------------------------------------------
	sets.base.WS = set_combine(sets.base,{ })	
	sets.WS = set_combine(sets.base.WS,{ring1 = "Spiral Ring", neck="Shifting Necklace +1"})
	sets.WS.Default = set_combine(sets.base.WS,{ring1 = "Spiral Ring"})
	sets.WS.Acc = set_combine(sets.base.WS,{ waist = "Hurch'lan Sash", neck="Shifting Necklace +1", legs = hercLegsCrit})	
    sets.precast.WS = set_combine(sets.base.WS,{ring1 = "Spiral Ring"})
	
	sets.WS['Chant du Cygne'] = {ring1 = "Rajas Ring", Neck="Light Gorget", waist="Light Belt", feet="Thereoid Greaves", body ="Jhakri Robe +1", hands="Adhemar Wristbands" }
	
	-----------------------------------------------Tp---------------------------------------------------------------------------------------
    sets.TP = set_combine(sets.base,{})
	sets.TP.Current = sets.TP
	sets.TP.Default = set_combine(sets.TP,{})
    sets.TP.Acc = set_combine(sets.TP,{neck="Shifting Necklace +1"})	
	sets.TP.Haste = set_combine(sets.TP,{})	
    sets.TP.DT=  set_combine(sets.base,{neck="Twilight Torque", ring1="Dark Ring", ring2="Defending Ring" , waist= "Flume Belt"})
	sets.TP.Pet= set_combine(sets.base,{})	
	sets.TP.Custom = set_combine(sets.TP,{})
	
	--------------------------------------------------------------------JA------------------------------------------------------------------

	
	
	------------------------------------------DT-----------------------------------------------------------------------------------------------
	sets.DT = set_combine(sets.base,{neck="Twilight Torque", ring1="Dark Ring", ring2="Defending Ring", back="Umbra Cape", waist="Flume Belt"})
    sets.DT.Default = set_combine(sets.base,{neck="Twilight Torque", ring1="Dark Ring", ring2="Defending Ring" , back="Umbra Cape"})
	sets.DT.Magic  = set_combine(sets.base,{neck="Twilight Torque", ring1="Dark Ring", ring2="Dark Ring"})
	sets.DT.Full = sets.DT
	sets.DT.Custom = sets.DT
	
	------------------------------------------------------After Cast---------------------------------------------
    sets.aftercast.TP = sets.TP    
    sets.aftercast.Idle = set_combine(sets.TP.DT,{ring1 = "Shneddick Ring", body ="Jhakri Robe +1", head ="Rawhide Mask" })
	
	----------------------------------------------------Idle------------------------------------------------------------------
	sets.Idle = set_combine(sets.DT,{ring1 ="Shneddick Ring", body ="Jhakri Robe +1", ring2 ="Defending Ring", neck ="Twilight Torque"})
	sets.Idle.Current = sets.Idle
	sets.Idle.DT = set_combine(sets.DT,{})
	sets.Idle.Default = set_combine(sets.DT,{ring1 ="Shneddick Ring", ring2 ="Defending Ring", neck ="Twilight Torque"})
	sets.Idle.Custom = set_combine(sets.DT,{})
	
	
	----------------------------------------------Pet-------------------------------------------------------------------------
	
	
	send_command('input /macro book 1;wait .1;input /macro set 9')
end

