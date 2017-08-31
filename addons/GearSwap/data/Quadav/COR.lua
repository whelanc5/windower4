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
	modeSets["rangeMode"].setModes = {"Default"}
	
	
	
	----------------------------------------------------------------------Base sets---------------------------------------------------------------------------------
	-- i use this to use sets_combine to make other sets.
	sets.base ={
    ammo="Titanium Bullet",
    head={ name="Herculean Helm", augments={'"Triple Atk."+3','STR+2','Accuracy+8',}},
    body="Meg. Cuirie +1",
    hands={ name="Herculean Gloves", augments={'Attack+14','"Triple Atk."+4','Accuracy+15',}},
    legs="Meg. Chausses +1",
    feet={ name="Herculean Boots", augments={'"Triple Atk."+3','AGI+3','Accuracy+11',}},
    neck="Waylayer's Scarf +1",
    waist="Windbuffet Belt",
    left_ear="Pixie Earring",
    right_ear="Friomisi Earring",
    left_ring="Meghanada Ring",
    right_ring="Epona's Ring",
    back="Camulus's Mantle",
} -- Base set. Can use this as a base for other sets


	----------------------------------------------------------------Precast------------------------------------------------------------------------------------------
	sets.precast = {}
	sets.precast.Magic = {}
	sets.precast.TP ={}			
	sets.precast.JA = {}
	sets.precast.Magic = {}
	sets.precast.Roll = {left_ring="Barataria Ring"}

	----------------------------------------------------------------Midcast------------------------------------------------------------------------------------------
	sets.midcast = {}
			----------------------------------------------------------------AFTERCAST----------------------------------------------------------------------------------------	
	sets.aftercast = {}	
	  
  
	----------------------------------------------------------------MAGIC--------------------------------------------------------------------------------------------
	sets.midcast.Magic = {}	
	sets.midcast.Elemental = {}	
	sets.midcast.Healing = nil --set to a set if going to be used
	sets.precast.Magic.Healing = nil --set to a set if going to be used

	----------------------------------------------------------------JA-----------------------------------------------------------------------------------------------
	-- put sets.precast.JA['Spell Name'] = {set} to equip before using a ja
	-- ex: sets.precast.JA['Tactical Switch'] = {feet="Cirque Scarpe +2"}	
	sets.precast.Waltz = {} -- sets for curing waltz
	sets.precast.maneuver = {} -- sets for manuevers
	sets.precast.Quickdraw = {right_ear="Friomisi Earring",left_ear = "Hecate's Earring"}
	----------------------------------------------------------------TP-----------------------------------------------------------------------------------------------
	sets.TP = set_combine(sets.base,{ })	 -- base set for TP gear
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
	sets.Idle = set_combine(sets.base,{feet="Hermes' Sandals"}) -- base set for idle
	sets.aftercast.Idle = sets.Idle -- don't change this
	sets.Idle.Current = sets.Idle -- don't change this
	sets.Idle.Default = sets.Idle -- don't change this
	sets.Idle.Custom = sets.Idle -- don't change this
	sets.Idle.DT = set_combine(sets.Idle,{})

	----------------------------------------------------------------BLUE---------------------------------------------------------------------------------------------
	sets.Blue = {}
	sets.Blue.Magic = {}
	sets.Blue.Physical = {}
	sets.Blue.Debuff = {}
	sets.Blue.Buff = {}
	sets.Blue.Cure = {}

	----------------------------------------------------------------WS-----------------------------------------------------------------------------------------------
	
	sets.WS = set_combine(sets.base,{      ammo="Titanium Bullet",head="Meghanada Visor +1", body="Meg. Cuirie +1",hands="Meg. Gloves +1",legs="Meg. Chausses +1", feet="Meg. Jam. +1",
    neck="Waylayer's Scarf +1", waist="Windbuffet Belt", left_ear="Hecate's Earring", right_ear="Friomisi Earring", left_ring="Hajduk Ring", right_ring="Hajduk Ring", back="Camulus's Mantle",})--base set for weaponskill that isn't named
	sets.precast.WS = sets.WS -- -- don't change this 
	sets.WS.Default = sets.WS -- don't change this

	sets.WS.Acc = set_combine(sets.WS,{})
	sets.WS['Leaden Salute'] = set_combine(sets.WS, {left_ear="Hecate's Earring", right_ear="Friomisi Earring"})
	
  
	----sets.WS['Shijin Spiral'] = {ring1 = "Rajas Ring", Neck="Light Gorget" }

	

	----------------------------------------------------------------Range----------------------------------------------------------------------------------------------
	sets.Range = set_combine(sets.base,{  head="Meghanada Visor +1",  body="Meg. Cuirie +1",  hands="Meg. Gloves +1",  legs="Meg. Chausses +1",  feet="Meg. Jam. +1", left_ring="Hajduk Ring", right_ring="Hajduk Ring",	 back="Camulus's Mantle", neck = "Waylayer's Scarf +1", })
	sets.midcast.Range = set_combine(sets.Range,{})
	sets.precast.Range  = set_combine(sets.Range,{})
	----------------------------------------------------macro book--------------------------------------------------
	--set the book and set to your jobs macro set
	send_command('input /macro book 1;wait .1;input /macro set 9')
end


