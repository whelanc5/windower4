function get_sets() 
	-- Commands in game
	-- /gs c changeTP  switches between the list of modes in tpModes, equips the gear and sets it to current aftercast set
	-- /gs c "setName" quips the gear set and sets it to current aftercast set
	-- /gs c deploy puts autodeploy on, when you engage it will cast deploy
	-- /gs c automaneuver turns on automaneuver, when maneuvers wear it recasts them
	--/ in my init file (windower/scripts/init.txt) f9 is bound to sent /gs c changeTP 
	
	

	
	include('cdhelper.lua')
-------------------------------------------modes---------------------------------------------------------------------------------
-- These are the sets that will cycle Modes, just make sure the set matches the name here ex: sets.TP.Name will equip if "Name" is in this list
-- remove modes by deleting the string, make sure not to leave an extra comma
-- All modes should have a "Default" entry
	modeSets["tpMode"].setModes = {"Default", "Acc", "Haste", "Pet", "DT", "Custom"} -- These are the sets that will cycle Modes, just make sure the set matches the name here ex: sets.TP.Name will equip if "Name" is in this list
	modeSets["dtMode"].setModes = {"Default", "Magic", "Full", "Custom"} --sets.DT.Mode
	modeSets["wsMode"].setModes = {"Default", "Acc"}  --sets.WS.Mode
	modeSets["idleMode"].setModes = {"Default", "Pet", "DT", "Custom"}
	modesets["darknessMode"].setModes = {"Default", "Burst", "Acc"}
	modesets["elementalMode"].setModes = {"Default", "Burst", "Acc"}
	
	
	----------------------------------------------------------------------Base sets---------------------------------------------------------------------------------
	-- i use this to use sets_combine to make other sets.
	sets.base = {} -- Base set. Can use this as a base for other sets


	----------------------------------------------------------------Precast------------------------------------------------------------------------------------------
	sets.precast = {}
	sets.precast.TP ={}			
	sets.precast.JA = {}
	sets.precast.Magic = {} -- base precast set for magic
	------------- precast for specific skills
	sets.precast.Elemental = nil 
	sets.precast.Enhancing = nil
	sets.precast.Healing = nil
	sets.precast.Darkness = nil
	sets.precast.Geomancy = nil
	sets.precast.Ninjitsu = nil
	----------------------------------------------------------------Midcast------------------------------------------------------------------------------------------
	---------------- mid cast sets, over write these 
	sets.midcast = {}
	sets.midcast.Elemental = nil 
	sets.midcast.Enhancing = nil
	sets.midcast.Healing = nil
	sets.midcast.Darkness = nil
	sets.midcast.Geomancy = nil
	sets.midcast.Ninjitsu = nil
			----------------------------------------------------------------AFTERCAST----------------------------------------------------------------------------------------	
	sets.aftercast = {}	
	  
  
	----------------------------------------------------------------MAGIC--------------------------------------------------------------------------------------------
	sets.midcast.Magic = {}	
	
		----------------------------------------------------------------elemental---------------------------------------------------------------------------------------------
	--changes sets.midcast.Elemental to this set based on mode
	sets.Elemental = {}
	sets.precast.Elemental = nil
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
	sets.precast.Healing = nil
	sets.midcast.Healing = nil


----------------------------------------------------------------Geomancy---------------------------------------------------------------------------------------------
	sets.precast.Geomancy = nil
	sets.midcast.Geomancy = nil

----------------------------------------------------------------enhancing---------------------------------------------------------------------------------------------
	sets.precast.Enhancing = nil
	sets.midcast.Enhancing = nil
	
----------------------------------------------------------------BLUE---------------------------------------------------------------------------------------------
	sets.Blue = {}
	sets.Blue.Magic = {}
	sets.Blue.Physical = {}
	sets.Blue.Debuff = {}
	sets.Blue.Buff = {}
	sets.Blue.Cure = {}

	----------------------------------------------------------------JA-----------------------------------------------------------------------------------------------
	-- put sets.precast.JA['Spell Name'] = {set} to equip before using a ja
	-- ex: sets.precast.JA['Tactical Switch'] = {feet="Cirque Scarpe +2"}	
	sets.precast.Waltz = {} -- sets for curing waltz
	sets.precast.maneuver = {} -- sets for manuevers

	----------------------------------------------------------------TP-----------------------------------------------------------------------------------------------
	sets.TP = set_combine(sets.base,{})	 -- base set for TP gear
	sets.TP.Current = sets.TP -- don't change this
	sets.aftercast.TP = sets.TP -- don't change this
	sets.TP.Custom = sets.TP -- don't change this
	sets.TP.Default = sets.TP -- don't change this
    sets.TP.Acc = set_combine(sets.TP,{})	
	sets.TP.Haste = set_combine(sets.TP,{})	
    sets.TP.DT=  set_combine(sets.TP,{})
	sets.TP.Pet= set_combine(sets.TP,{})	
	
	----------------------------------------------------------------DT-----------------------------------------------------------------------------------------------
	sets.DT = set_combine(sets.base,{})
    sets.DT.Default = sets.DT -- don't change this
	sets.DT.Custom = sets.DT -- don't change this
	sets.DT.Magic  = set_combine(sets.DT,{})
	sets.DT.Full = set_combine(sets.DT,{})
	
	----------------------------------------------------------------IDLE---------------------------------------------------------------------------------------------
	sets.Idle = set_combine(sets.base,{}) -- base set for idle
	sets.aftercast.Idle = sets.Idle -- don't change this
	sets.Idle.Current = sets.Idle -- don't change this
	sets.Idle.Default = sets.Idle -- don't change this
	sets.Idle.Custom = sets.Idle -- don't change this
	sets.Idle.DT = set_combine(sets.Idle,{})


	----------------------------------------------------------------WS-----------------------------------------------------------------------------------------------
	
	sets.WS = set_combine(sets.base,{})--base set for weaponskill that isn't named
	sets.precast.WS = sets.WS -- -- don't change this 
	sets.WS.Default = sets.WS -- don't change this

	sets.WS.Acc = set_combine(sets.WS,{})
	
	
  
	----sets.WS['Shijin Spiral'] = {ring1 = "Rajas Ring", Neck="Light Gorget" }

	

	----------------------------------------------------------------PET----------------------------------------------------------------------------------------------
	sets.Pet = set_combine(sets.base,{}) -- baseset for pet
	sets.Pet.Custom  = sets.Pet -- don't change this
	sets.Pet.Default = sets.Pet -- don't change this
	sets.Pet.Tank = set_combine(sets.Pet,{})
	sets.Pet.DD = set_combine(sets.Pet,{})
	sets.Pet.Hybrid = set_combine(sets.Pet,{})
	
	sets.midcast.Pet = {}	
	sets.midcast.Pet.Cure = { }
	sets.midcast.Pet['Elemental Magic'] = {}
	sets.midcast.Pet.WeaponSkill = set_combine(sets.TP.DD, {})
	----------------------------------------------------macro book--------------------------------------------------
	--set the book and set to your jobs macro set
	send_command('input /macro book 1;wait .1;input /macro set 9')
end


