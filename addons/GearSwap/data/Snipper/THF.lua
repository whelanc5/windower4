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
	tpModes = { "Acc", "TH",  "Default", "Custom"} 
	dtModes = {"Default", "Magic", "Full", "Custom"} --sets.DT.Mode
	wsModes = {"Default", "Acc"}  --sets.WS.Mode
	idleModes = {"Default", "DT", "TH", "Custom"}
	petModes = {"Default","Tank", "DD", "Hybrid", "Custom"}
	nukeModes ={"Default"}
	
	
	
	----------------------------------------------------------------------Base sets---------------------------------------------------------------------------------
	-- i use this to use sets_combine to make other sets.
	sets.base = {
    head={ name="Herculean Helm"},
    body={ name="Rawhide Vest", augments={'HP+49','"Subtle Blow"+6','"Triple Atk."+2',}},
    hands={ name="Herculean Gloves", augments={'Accuracy+16','"Triple Atk."+3','DEX+1',}},
    legs={ name="Herculean Trousers", augments={'Attack+22','"Triple Atk."+3','DEX+10','Accuracy+15',}},
    feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','INT+3','Attack+13',}},
    neck="Lissome Necklace",
    waist="Anguinus Belt",
    left_ear="Bladeborn Earring",
    right_ear="Steelflash Earring",
    left_ring="Rajas Ring",
    right_ring="Epona's Ring",
    back={ name="Canny Cape", augments={'DEX+2','AGI+4','"Dual Wield"+2',}},
}-- Base set. Can use this as a base for other sets


	----------------------------------------------------------------Precast------------------------------------------------------------------------------------------
	sets.precast = {}
	sets.precast.Magic = {}
	sets.precast.TP ={}			
	sets.precast.JA = {}
	sets.precast.Magic = {}

	----------------------------------------------------------------Midcast------------------------------------------------------------------------------------------
	sets.midcast = {}
			----------------------------------------------------------------AFTERCAST----------------------------------------------------------------------------------------	
	sets.aftercast = {}	
	  
  
	----------------------------------------------------------------MAGIC--------------------------------------------------------------------------------------------
	sets.midcast.Magic = {}	
	sets.midcast.Elemental = {}	
	sets.midcast.Healing = nil --set to a set if going to be used
	sets.precast.Magic.Healing = nil --set to a set if going to be used
	----------------------------------------------------------------NUKE---------------------------------------------------------------------------------------------
	--changes sets.midcast.Elemental to this set based on mode
	sets.Nuke = {}
	sets.Nuke.Default = {} -- don't change this
	sets.Nuke.Custom = {} -- don't change this
	sets.Nuke.Acc = {}
	sets.Nuke.Burst = {}
	sets.midcast.Burst = {}
	----------------------------------------------------------------JA-----------------------------------------------------------------------------------------------
	-- put sets.precast.JA['Spell Name'] = {set} to equip before using a ja
	-- ex: sets.precast.JA['Tactical Switch'] = {feet="Cirque Scarpe +2"}	
	sets.precast.Waltz = {} -- sets for curing waltz
	sets.precast.maneuver = {} -- sets for manuevers

	----------------------------------------------------------------TP-----------------------------------------------------------------------------------------------
	sets.TP = set_combine(sets.base,{} ) 
	sets.TP.Current = sets.TP -- don't change this
	sets.aftercast.TP = sets.TP -- don't change this			
    sets.TP.Acc = set_combine(sets.TP,{neck="Shifting Necklace +1" ,waist="Anguinus Belt"})	 
    sets.TP.Haste = set_combine(sets.TP,{waist="Windbuffet Belt"})	
	sets.TP.TH = set_combine(sets.TP,{hands="Plun. Armlets +1",feet="Skulk. Poulaines" })	
	sets.TP.DT= set_combine(sets.TP,{neck="Twilight Torque", ring1="Dark Ring", ring2="Dark Ring" })
	sets.TP.Custom = set_combine(sets.TP,{})	
	
	----------------------------------------------------------------DT-----------------------------------------------------------------------------------------------
	sets.DT = set_combine(sets.base,{head="Meghanada Visor +1",  body="Meg. Cuirie +1",  feet="Meg. Jam. +1", hands="Meg. Gloves +1", legs="Meg. Chausses +1", })
    sets.DT.Default = sets.DT -- don't change this
	sets.DT.Custom = sets.DT -- don't change this
	sets.DT.Magic  = set_combine(sets.DT,{})
	sets.DT.Full = set_combine(sets.DT,{})
	
	----------------------------------------------------------------IDLE---------------------------------------------------------------------------------------------
	sets.Idle = set_combine(sets.DT,{feet = "Trotter Boots"})
	sets.aftercast.Idle = sets.Idle
	sets.Idle.Current = sets.Idle
	sets.Idle.DT = set_combine(sets.Idle,{})
	sets.Idle.Default = sets.Idle
	sets.Idle.TH = set_combine(sets.Idle, {hands="Plun. Armlets +1",feet="Skulk. Poulaines" })
	sets.Idle.Custom = sets.Idle

	----------------------------------------------------------------BLUE---------------------------------------------------------------------------------------------
	sets.Blue = {}
	sets.Blue.Magic = {}
	sets.Blue.Physical = {}
	sets.Blue.Debuff = {}
	sets.Blue.Buff = {}
	sets.Blue.Cure = {}

	----------------------------------------------------------------WS-----------------------------------------------------------------------------------------------
	sets.precast.WS = {} -- -- don't change this 
	sets.WS = set_combine(sets.base,{})--base set for weaponskill that isn't named
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
	send_command('input /macro book 2;wait .1;input /macro set 10')
end


