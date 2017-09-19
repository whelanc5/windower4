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
	modeSets["elementalMode"].setModes = {"Default", "Burst", "AF1Nuke", "AF1Burst"}
	modeSets["darknessMode"].setModes = {"Default", "Burst", "Acc"}
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------Base sets-------------------------------------------------------------------------------
--these can be overridden in job lua


	sets.base = {main= "Lathi", sub="Niobid Strap", ammo="Ghastly Tathlum +1",
    head=MerheadNuke, body="Jhakri Robe +1", hands="Amalric Gages", ring1="Shiva Ring", legs="Merlinic Shalwar",
    feet=MerfeetNuke, neck="Sanctity Necklace", waist="Refoccilation Stone",
    left_ear="Friomisi Earring", right_ear="Barkaro. Earring", ring2="Acumen Ring", back="Taranus's Cape"}

	
	-- --- precast--------------------------------
	sets.precast = {}
	sets.precast.Magic = {}
	sets.precast.TP ={}			
	sets.precast.WS = {}
	sets.precast.JA = {}
	sets.precast.Magic = {head="Merlinic Hood", legs="Psycloth Lappas", feet=MerfeetFC, neck="Voltsurge Torque", waist="Witful Belt", back="Swith Cape",
	                      ring2="Prolix Ring", ear1="Loquac. Earring",  body="Rosette Jaseran +1"}
	sets.precast.Enhancing = nil
	sets.precast.Healing = nil
	sets.precast.Darkness = nil
	sets.precast.Ninjitsu = nil
	----------------------------------------------------------------Midcast------------------------------------------------------------------------------------------
	---------------- mid cast sets, over write these 
	sets.midcast = {}
	sets.midcast.Enhancing = nil
	sets.midcast.Healing = nil
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
	sets.aftercast = {}	
	  
  
	----------------------------------------------------------------MAGIC--------------------------------------------------------------------------------------------
	sets.midcast.Magic = sets.base	
	
		----------------------------------------------------------------elemental---------------------------------------------------------------------------------------------
	--changes sets.midcast.Elemental to this set based on mode
	sets.Elemental = set_combine(sets.base,{head=MerheadNuke, ammo="Ghastly Tathlum", legs= "Merlinic Shalwar", neck="Saevus Pendant +1", feet=MerfeetNuke})
	sets.precast.Elemental = set_combine(sets.precast.Magic,{right_ear="Barkaro. Earring"})
	sets.midcast.Elemental = sets.Elemental
	sets.Elemental.Default = sets.Elemental
	sets.Elemental.Burst = set_combine(sets.base,{head=MerheadNuke, feet=MerfeetBurst, ring1="Mujin Band", neck ="Mizu. Kubikazari"})
	sets.Elemental.AF1Nuke = set_combine(sets.Elemental,{body="Spae. Coat +1"})
	sets.Elemental.AF1Burst = set_combine(sets.Elemental.Burst,{body="Spae. Coat +1"})
		----------------------------------------------------------------Darkness---------------------------------------------------------------------------------------------
	--changes sets.midcast.Darkness to this set based on mode
	sets.Darkness = {}
	sets.precast.Darkness = set_combine(sets.precast.Magic,{})
	sets.midcast.Darkness = set_combine(sets.Elemental,{waist="Fucho-no-Obi", ring1="Evanescence Ring", neck="Incanter's Torque",})
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
	
	------------------------------------------------------------Enfeebling--------------------------------------------------------------------------------------------
	sets.precast.Enfeebling = nil
	sets.midcast.Enfeebling = {set_combine(sets.base,{neck="Incanter's Torque", hands="Jhakri Cuffs +1", waist="Porous Rope", head="Jhakri Coronal +1",
                               feet= "Jhakri Pigaches +1"})}
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

	
	
	------------------------------------------DT-----------------------------------------------------------------------------------------------
	sets.DT = set_combine(sets.base,{head="Hagondes Hat +1",neck="Twilight Torque",body="Hagondes Coat +1",hands="Hagondes Cuffs +1",
                          ring1="Dark Ring",ring2="Defending Ring", back="Umbra Cape",waist="Fucho-no-Obi",feet="Hag. Sabots +1",legs="Hagondes Pants +1"})
    sets.DT.Default = sets.DT
	sets.DT.Current = sets.DT
	sets.DT.Magic  = set_combine(sets.base,{})
	sets.DT.Full = sets.DT
	sets.DT.Custom = sets.DT
	----------------------------------------------------Idle------------------------------------------------------------------
	sets.Idle = set_combine(sets.DT,{ring1 ="Shneddick Ring", legs="Assid. Pants +1", body="Jhakri Robe +1"})
	sets.Idle.Refresh=set_combine(sets.Idle,{})
	sets.Idle.Current = sets.Idle  ----Don't touch
	sets.Idle.DT = set_combine(sets.DT,{})
	sets.Idle.Default = sets.Idle
	sets.aftercast.Idle = sets.Idle
	
	----------------------------------------------Pet-------------------------------------------------------------------------
	
	
	send_command('input /macro book 1;wait .1;input /macro set 9')
end

