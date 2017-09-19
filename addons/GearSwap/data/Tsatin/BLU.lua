function get_sets() 
	-- Commands in game
	-- /gs c changeTP  switches between the list of modes in tpModes, equips the gear and sets it to current aftercast set
	-- /gs c "setName" quips the gear set and sets it to current aftercast set
	-- /gs c deploy puts autodeploy on, when you engage it will cast deploy
	-- /gs c automaneuver turns on automaneuver, when maneuvers wear it recasts them
	--/ in my init file (windower/scripts/init.txt) f9 is bound to sent /gs c changeTP 
	
	
	include('cdhelper.lua')
	
	modeSets["tpMode"].setModes = {"Default", "Acc", "Haste", "DT", "Nuke"} -- These are the sets that will cycle Modes, just make sure the set matches the name here ex: sets.TP.Name will equip if "Name" is in this list
	modeSets["dtMode"].setModes = {"Default", "Magic", "Full", "Custom"} --sets.DT.Mode
	modeSets["wsMode"].setModes = {"Default", "Acc"}  --sets.WS.Mode
	modeSets["idleMode"].setModes = {"Default", "Pet", "DT", "Custom"}
	modeSets["petMode"].setModes = {"Default","Tank", "DD", "Hybrid", "Custom"}
	
	blueMagic = S{"Searing Tempest", "Subduction", "Blinding Fulgor", "Anvil Lightning", "Spectral Floe", "Tenebral Crush", "Silent Storm", "Scouring Spate", "Entomb" } --spells that will equip sets.Blue.Magic[nukeMode]
	bluePhysical = S{"Sudden Lunge" } -- spells that will equip sets.Blue.Physical
	blueDebuff = S{"Dream Flower", "Blank Gaze", "Sheep Song", "Nat."} -- spells that will equip sets.Blue.Debuff
	blueBuff = S{"Erratic Flutter", "Occultation", "Barrier Tusk", "Nat. Meditation" } -- spells that will equip sets.Blue.Buff
	blueCure = S{"White Wind", "Magic Fruit"}-- spells that will equip sets.Blue.Cure
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------Base sets-------------------------------------------------------------------------------
--these can be overridden in job lua

	
	-- --- precast--------------------------------
	sets.precast = {}
	sets.precast.Magic = {}
	sets.precast.TP ={}			
	sets.precast.WS = {}
	sets.precast.JA = {}
	sets.precast.Magic = {head="Herculean Helm", body="Luhlaza Jubbah +1",legs="Psycloth Lappas",
                         feet="Amalric Nails", waist="Witful Belt", left_ear="Loquac. Earring", right_ring="Prolix Ring", back="Swith Cape"}
	--------------midcast----------------------
	sets.midcast = {}
	------------------aftercast----------------
	sets.aftercast = {}	
	--------------blue-------------------------
	sets.Blue = {}
	sets.Blue.Magic = {head="Jhakri Coronal +1", body="Jhakri Robe +1", ammo = "Ghastly Tathlum +1",
                       hands="Jhakri Cuffs +1", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1", neck="Sanctity Necklace", waist="Porous Rope", ear1 ="Friomisi Earring",
					   left_ring="Shiva Ring", right_ring="Acumen Ring",  back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}, ear2= "Novio Earring"}
	sets.Blue.Physical = {}
	sets.Blue.Debuff = set_combine(sets.Blue.Magic,{neck="Incanter's Torque", ear1="Psystorm Earring", ear2="Lifestorm Earring", })
	sets.Blue.Buff = {neck="Incanter's Torque"}
	sets.Blue.Cure = set_combine(sets.Blue.Magic,{legs="Gyve Trousers", ring1= "Lebeche Ring",ear1="Mendi. Earring", back="Solemnity Cape",hands="Telchine Gloves"})
	------------Nuke-------------------------
	sets.Nuke = {}


	sets.base = {head="Herculean Helm",neck="Lissome Necklace",
        ear1="Bladeborn Earring",ear2="Steelflash Earring",body="Rawhide Vest",hands="Herculean Gloves",
        ring1="Rajas Ring",ring2="Epona's Ring", back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},waist="Windbuffet Belt",legs= hercLegsTA,
        feet="Herculean Boots", ammo ="Ginsen"}
		
	sets.Blue.Physical = sets.base
	--------------------------------------------------WS-----------------------------------------------------------------------
	sets.base.WS = set_combine(sets.base,{head="Adhemar Bonnet", ammo="Jukukik Feather", Neck="Light Gorget", waist="Fotia Belt", feet="Thereoid Greaves", body ="Jhakri Robe +1", hands="Adhemar Wristbands",
                                          legs= hercLegsWS, ring1="Begrudging Ring", ring2="Epona's Ring",  back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}})	
	sets.WS = set_combine(sets.base.WS,{})
	sets.WS.Default = set_combine(sets.base.WS,{})
	sets.WS.Acc = set_combine(sets.base.WS,{ waist = "Hurch'lan Sash", neck="Shifting Necklace +1", legs = hercLegsCrit})	
    sets.precast.WS = set_combine(sets.base.WS,{})
	
	sets.WS['Chant du Cygne'] = sets.base.WS
	
	-----------------------------------------------Tp---------------------------------------------------------------------------------------
    sets.TP = set_combine(sets.base,{})
	sets.TP.Current = sets.TP
	sets.TP.Default = set_combine(sets.TP,{})
    sets.TP.Acc = set_combine(sets.TP,{neck="Shifting Necklace +1", waist="Hurch'lan Sash"})	
	sets.TP.Haste = set_combine(sets.TP,{})	
    sets.TP.DT=  set_combine(sets.base,{neck="Twilight Torque", ring1="Dark Ring", ring2="Defending Ring" , back="Umbra Cape", waist= "Flume Belt"})
	sets.TP.Nuke= set_combine(sets.TP.DT,{body="Jhakri Robe +1",head="Rawhide Mask", waist="Fucho-no-Obi"})
	sets.TP.Custom = set_combine(sets.TP,{})
	
	--------------------------------------------------------------------JA------------------------------------------------------------------

	
	
	------------------------------------------DT-----------------------------------------------------------------------------------------------
	sets.DT = set_combine(sets.base,{neck="Twilight Torque", ring1="Dark Ring", ring2="Defending Ring", back="Umbra Cape", waist="Flume Belt"})
    sets.DT.Default = set_combine(sets.base,{neck="Twilight Torque", ring1="Dark Ring", ring2="Defending Ring" , back="Umbra Cape"})
	sets.DT.Magic  = set_combine(sets.base,{neck="Twilight Torque", ring1="Dark Ring", ring2="Dark Ring", head = "Naga Somen" , hands = "Naga Tekko"})
	sets.DT.Full = sets.DT
	sets.DT.Custom = sets.DT
	
	------------------------------------------------------After Cast---------------------------------------------
    sets.aftercast.TP = sets.TP    
    sets.aftercast.Idle = set_combine(sets.TP.DT,{ring1 = "Shneddick Ring", body ="Jhakri Robe +1", head ="Rawhide Mask" })
	
	----------------------------------------------------Idle------------------------------------------------------------------
	sets.Idle = set_combine(sets.DT,{ring1 ="Shneddick Ring", body ="Jhakri Robe +1", head ="Rawhide Mask", ring2 ="Defending Ring", neck ="Twilight Torque", back ="Umbra Cape"})
	sets.Idle.Current = sets.Idle
	sets.Idle.DT = set_combine(sets.DT,{})
	sets.Idle.Default = set_combine(sets.DT,{ring1 ="Shneddick Ring", body ="Jhakri Robe +1", head ="Rawhide Mask", ring2 ="Defending Ring", neck ="Twilight Torque", back ="Umbra Cape"})
	sets.Idle.Custom = set_combine(sets.DT,{})
	
	
	----------------------------------------------Pet-------------------------------------------------------------------------
	
	
	send_command('input /macro book 1;wait .1;input /macro set 1')
end

