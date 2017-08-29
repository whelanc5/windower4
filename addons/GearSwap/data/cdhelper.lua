
	include('augments.lua')
	----------------------------------------------------Commands---------------------------------------------------------------------------------------------------
	--------------booleans--------------------------------
	-----------When used these will switch on if they're off, and off if they're on
	
	---- //gs c deploy 
	-- makes it so automaton will automatically deploy when you engage
	---- //gs c automaneuver 
	-- makes it so manuevers will be used as they wear off
	---- //gs c cap
	-- equips capacity back, you have to set the back in the self_command function under cap
	-- //gs c magicburst
	-- sets elemental set to magicburst set
	--//gs c petWS
	-- equips petWS set, will be switched out of after a cast
	--//gs c autocast
	-- sets magic to cast automatically accordding to the spells in automagic
	--//gs c rest
	-- toggles rest during auto cast off or on, starts on
	
	--------------EquipSets---------------------------------------
	--these will equip the current mode of a set
	--called by calling the name of the set 
	-- currently defined are: equipTP, equipDT, equipIdle, equipPet, equipPet/Nuke, equip
	--------------Mode switches-----------------------------------
	---These will cylce through the modes if they're configured correctly
	-- already configured are tp, pet, nuke, dt, and idle sets.
	-- calling the prefix followed by "Mode" will change the current mode, ex //gs c dtMode will cycle through the dtModes
	-- 
	----------------------------------------------------Hot Keys----------------------------------------------------------
	--These hotkeys are only set with my windower init file 
	
	--f9 is bound to equip current tpset
	--Crtl f9 is bound to change tp modes
	-- alt f9 sets up a custom tp mode, which will be equiped under customTP
	
	--f10 is bound to equip current  dtset
	--Crtl f10 is bound to change tp modes
	--alt f10 sets WS mode
	
	--f11 is bound to equip current Idleset
	--Crtl f11 is bound to change idle modes
	
	
	--f12 is bound to equip current Pet set when on pup, nuking set when on anything else
	--Crtl f12 is bound to change pet mode when on pup, and nuking set on anything else
	----------------------------------------------------------------------------------------------------
	--------------------------------------------------------Set for stuff--------------------------------------------------------------------------------
    petWeaponskills = S{"Slapstick", "Knockout", 
    "Chimera Ripper", "String Clipper",  "Cannibal Blade", "Bone Crusher", "String Shredder",
    "Arcuballista", "Daze", "Armor Piercer", "Armor Shatterer"}
	
	   rolls = {
        ["Corsair's Roll"]   = {"lucky=5, unlucky=9, bonus=Experience Points"},
        ["Ninja Roll"]       = {"lucky=4, unlucky=8, bonus=Evasion"},
        ["Hunter's Roll"]    = {"lucky=4, unlucky=8, bonus=Accuracy"},
        ["Chaos Roll"]       = {"lucky=4, unlucky=8, bonus=Attack"},
        ["Magus's Roll"]     = {"lucky=2, unlucky=6, bonus=Magic Defense"},
        ["Healer's Roll"]    = {"lucky=3, unlucky=7, bonus=Cure Potency Received"},
        ["Puppet Roll"]      = {"lucky=4, unlucky=8, bonus=Pet Magic Accuracy/Attack"},
        ["Choral Roll"]      = {"lucky=2, unlucky=6, bonus=Spell Interruption Rate"},
        ["Monk's Roll"]      = {"lucky=3, unlucky=7, bonus=Subtle Blow"},
        ["Beast Roll"]       = {"lucky=4, unlucky=8, bonus=Pet Attack"},
        ["Samurai Roll"]     = {"lucky=2, unlucky=6, bonus=Store TP"},
        ["Evoker's Roll"]    = {"lucky=5, unlucky=9, bonus=Refresh"},
        ["Rogue's Roll"]     = {"lucky=5, unlucky=9, bonus=Critical Hit Rate"},
        ["Warlock's Roll"]   = {"lucky=4, unlucky=8, bonus=Magic Accuracy"},
        ["Fighter's Roll"]   = {"lucky=5, unlucky=9, bonus=Double Attack Rate"},
        ["Drachen Roll"]     = {"lucky=3, unlucky=7, bonus=Pet Accuracy"},
        ["Gallant's Roll"]   = {"lucky=3, unlucky=7, bonus=Defense"},
        ["Wizard's Roll"]    = {"lucky=5, unlucky=9, bonus=Magic Attack"},
        ["Dancer's Roll"]    = {"lucky=3, unlucky=7, bonus=Regen"},
        ["Scholar's Roll"]   = {"lucky=2, unlucky=6, bonus=Conserve MP"},
        ["Bolter's Roll"]    = {"lucky=3, unlucky=9, bonus=Movement Speed"},
        ["Caster's Roll"]    = {"lucky=2, unlucky=7, bonus=Fast Cast"},
        ["Courser's Roll"]   = {"lucky=3, unlucky=9, bonus=Snapshot"},
        ["Blitzer's Roll"]   = {"lucky=4, unlucky=9, bonus=Attack Delay"},
        ["Tactician's Roll"] = {"lucky=5, unlucky=8, bonus=Regain"},
        ["Allies's Roll"]    = {"lucky=3, unlucky=10, bonus=Skillchain Damage"},
        ["Miser's Roll"]     = {"lucky=5, unlucky=7, bonus=Save TP"},
        ["Companion's Roll"] = {"lucky=2, unlucky=10, bonus=Pet Regain and Regen"},
        ["Avenger's Roll"]   = {"lucky=4, unlucky=8, bonus=Counter Rate"},
    }
	
	magicSkills = {
        ["Elemental Magic"]   	= "Elemental",
        ["Healing Magic"]    	= "Healing",
        ["Enfeebling Magic"]    = "Enfeebling",
        ["Geomancy"]       		= "Geomancy",
        ["Singing Skill"]       = "Song",
        ["Blue Magic"]    		= "Blue",
        ["Dark Magic"]     		= "Dark",
        ["Enhancing Magic"]     = "Enhancing",
        ["Ninjutsu"]       		= "Ninjutsu",
        ["Summoning Magic"]     = "Summoning",
        ["Divine Magic"]      	= "Divine"
    
    }
	
	sets.obi = {
		Fire = {waist="Karin Obi"},
		Earth = {waist="Dorin Obi"},
		Water = {waist="Suirin Obi"},
		Wind = {waist="Furin Obi"},
		Ice = {waist="Hyorin Obi"},
		Lightning = {waist="Rairin Obi"},
		Light = {waist="Korin Obi"},
		Dark = {waist="Anrin Obi"},
    }
	storms = {
		Fire = "Firestorm",
		Earth = "Sandstorm",
		Water = "Rainstorm",
		Wind = "Windstorm",
		Ice = "Hailstorm",
		Lightning = "Thunderstorm",
		Dark = "Voidstorm",
		Light = "Aurorastorm"
	}
		runes = S{"Tellus", "Flabra"}
	
	---------------------------------------------------------Sets for blu spells----------------------------------------------
	blueMagic = S{} --spells that will equip sets.Blue.Magic[nukeMode]
	bluePhysical = S{} -- spells that will equip sets.Blue.Physical
	blueDebuff = S{} -- spells that will equip sets.Blue.Debuff
	blueBuff = S{} -- spells that will equip sets.Blue.Buff
	blueCure = S{}-- spells that will equip sets.Blue.Cure
	-----------------------------------------------------------------------------------------------------------------------------
	
	----------------------------------------------------------------Modes--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	--To create a mode you have to do the following:
	
	
	
	----------------------------------------------------------List of catagories-----------------------------------------------------------

	modeSets = {
		["tpMode"] =	 	{num = 1, suffix = "TP", 			tpType = 1, idleType = 0, midcastType = 0, precastType = 0, setModes = tpModes},
		["dtMode"] = 		{num = 1, suffix = "DT", 			tpType = 1,	idleType = 1, midcastType = 0, precastType = 0, setModes = dtModes},
		["petMode"] = 		{num = 1, suffix = "Pet",			tpType = 1, idleType = 1, midcastType = 0, precastType = 0, setModes = petModes},
		["wsMode"] = 		{num = 1, suffix = "WS", 			tpType = 0, idleType = 0, midcastType = 0, precastType = 1, setModes = wsModes}, 
		["elementalMode"]= 	{num = 1, suffix = "Elemental",	 	tpType = 0, idleType = 0, midcastType = 0, precastType = 1,	setModes = elementalModes},
		["idleMode"] = 		{num = 1, suffix = "Idle", 			tpType = 0, idleType = 1, midcastType = 0, precastType = 0, setModes = idleModes},
		["rangeMode"] = 	{num = 1, suffix = "Range", 		tpType = 0, idleType = 0, midcastType = 1, precastType = 1, setModes = rangeModes},
		["darknessMode"]= 	{num = 1, suffix = "Darkness",	 	tpType = 0, idleType = 0, midcastType = 0, precastType = 1,	setModes = darknessModes}}, 
		{"num", "suffix", "tpType","idleType", "midcastType", "precastType", "setModes"}
	
	--- list of commands for equiping a set
	equipSets = {
		["equipTP"] =	 		"tpMode",
		["equipDT"] = 			"dtMode",
		["equipPet"] = 			"petMode",
		["equipIdle"] = 		"idleMode",
		["equipRange"] = 		"rangeMode",
		["equipElemental"] = 	"elementalMode",
	}
	

----------------------------------------------------------------------------------------------Booleans----------------------------------------------------------------------------------------------------------------------------------------------
	--These are booleans 
	
	booleans = S{"magicburst", "deploy", "automaneuver", "rune", "rest", "autoRoll"} --booleans
	deploy = false
	automaneuver = false
	magicburst = false
	rune = false
	cap = false
	petWS = false
	rest = true
	autocast = false 
	firstAuto = true
	autoRoll = false


	
	
	
	
----------------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------Buff Change function--------------------------------------
-- looks for buff changes
-- automaneuver is set to true, it will put maneuvers back up when they wear
-- if runes it set to true, it will put up any runes that of within the runes set as they wear off
function buff_change(name, gain)
	if not gain and automaneuver and string.find(name,'Maneuver') then --maneuver auto put back up if automaneuver is true
			add_to_chat(122,name)
			send_command(name)		
	
	end
	if not gain and autoRoll and string.find(name,'Roll') then --roll auto put back up if autoRoll is true
			add_to_chat(122,name)
			send_command(name)		
	
	end
	if not gain and rune and  runes:contains(name) then
		add_to_chat(122,name)
		send_command(name)
	end
end
--------------------------------------------------------------------autoRange function for automatic range attacks---------------------------------------------------------------
	autoRA = false
	function autoRange()
	send_command('input /ra  <t>')
		if (autoRA == true) then
			send_command('wait 5 ;input //gs c autoRange')
		end
	end

------------------------------------------------------------------------Precast Function---------------------------------------------------------------------------------------------------------------
-- if a sets.precast["spell name"] exists it will equip that.
-- if magic it will equip sets.precast.magic
-- if healing it will equip sets.precast.Magic.Healing if it exists
-- if a job ability, it will equip sets.precast.JA["spell name"] if it exists
-- if weapon skill it will equip sets.precast.WS
-- if sets.WS["WS name"] exists it will equip that
-- if sets.WS["WS name"]."Ws mode" exists it will equip that
-- if sets.precast.maneuver is set it will equip that set when any maneuver is used
-- if sets.precast.Waltz is set, it will equip that set when any maneuver is used
function precast(spell)	
	if sets.precast[spell.english] then	
        equip(sets.precast[spell.english])
	elseif sets.precast.JA[spell.english] then	
		equip(sets.precast.JA[spell.english])
	elseif spell.action_type == 'Magic' then	
		local currSkill = magicSkills[spell.skill]
		if  sets.precast[currSkill] then
			equip(sets.precast[currSkill])
		else
			equip(sets.precast.Magic)
		end				   
    elseif spell.type=="WeaponSkill" then   
		if sets.WS[spell.english] then
			equip(sets.WS[spell.english]) 
			if sets.WS[spell.english][wsMode] ~= nil then
				equip(sets.WS[spell.english][wsMode]) 
			end
		else 
			equip(sets.precast.WS)
		end	
    elseif string.find(spell.english,'Maneuver')  then
		equip(sets.precast.maneuver)
	elseif rolls[spell.english] ~= nil  then
		equip(sets.precast.Roll)
		add_to_chat(122,rolls[spell.english][1])
	elseif string.find(spell.english,'Waltz')  then
		equip(sets.precast.Waltz)	
	elseif spell.action_type == "Ranged Attack" then
		if sets.precast.Ranged ~= nil then
			equip(sets.precast.Ranged)
		end
    end
	
   end

------------------------------------------------------------------------Pet mid cast-----------------------------------------------------------
-- doesn't work for Ws
-- will equip pet magic sets if they exists
-- sets.midcast.Pet['Elemental Magic']
function pet_midcast(spell)
	if petWeaponskills:contains(spell.english) then   --petWeaponskills equip 
	-- equip(sets.midcast.Pet.WeaponSkill) 
	elseif spell.skill == 'Elemental Magic' then
		equip(sets.midcast.Pet['Elemental Magic'])
	end
  
end
---------------------------------------------------------------------Pet aftercast-----------------------------------------------------------------
--puts current tp/idle set on after a pet cast
-- if petWS bool is on it turns it off
function pet_aftercast(spell)   --put tp gear back on after pet
	if player.status =='Engaged' then
		
		equip(sets.aftercast.TP)
    else
        equip(sets.aftercast.Idle)
    end
	petWS = false
  end


---------------------------------------------------------------------aftercast-----------------------------------------------------------------
--puts current tp/idle set on after a  cast
function aftercast(spell)
    if player.status =='Engaged' then
        equip(sets.aftercast.TP)
    else
        equip(sets.aftercast.Idle)
    end
	if  spell.type=="WeaponSkill" then
		petWS = false
		
	end
end



-----------------------------------------------midcast----------------------------------------------------------------------------------------------
--mid cast sets---------------
-- sets.midcast[spell.english]
-- sets.midcast.Elemental
-- sets.midcast.Elemental.Burst
-- sets.midcast.Ranged
-- sets.midcast.Healing
-- sets.Blue.Magic
-- sets.Blue.Physical
-- sets.Blue.Debuff
-- sets.Blue.Buff
-- sets.Blue.Cure
-- sets.Blue.

function midcast(spell)
	if sets.midcast[spell.english] then
        equip(sets.midcast[spell.english])	
	elseif  spell.action_type == 'Magic' then
		local currSkill = magicSkills[spell.skill]
		if sets.midcast[currSkill] then
			equip(sets.midcast[currSkill])
		else
			equip(sets.midcast.Magic)
		end	
		local burst = "Burst"
		if magicburst and sets[currSkill][burst] then
			equip(sets[currSkill][burst])
		end
		if spell.skill == "Blue Magic" then	
			equip(sets.Blue.Magic)
			if bluePhysical:contains(spell.english) then
				equip(sets.Blue.Physical)
			elseif blueDebuff:contains(spell.english) then
				equip(sets.Blue.Debuff)
			elseif blueBuff:contains(spell.english) then
				equip(sets.Blue.Buff)
			elseif blueCure:contains(spell.english) then
				equip(sets.Blue.Cure)
			elseif blueMagic:contains(spell.english) and sets.Blue.Magic[elementalMode] then
					equip(sets.Blue.Magic[elementaMode])
			end	
			
		end
		local storm = storms[spell.element]
			if spell.element == world.weather_element or spell.element == world.day_element or buffactive[storm]  then
				equip(sets.obi[spell.element])
		end	
	elseif spell.action_type == "Ranged Attack" and sets.midcast.Ranged ~= nil then
			equip(sets.midcast.Ranged)		
	end
end

-----------------------------------------------------------status change-------------------------------------------------------------

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
        equip(sets.aftercast.Idle)
    elseif new == 'Engaged' then
        equip(sets.aftercast.TP)
		if deploy == true then                          --deploys if deploy boolean is true
			send_command('@input /ja deploy <t>')
		end
    end
end

function booleanChange(bool) ------------------------------------------------------------------------- changes booleans---------------------------------------------
	if bool == false then 
			return true					
	else 
		return false			
	end
end

------------------------------------------------------------------------------change modes-------------------------------------------------------------------------

-- changes number of mode passed in and calls equip_Sets to change that set
function modeChange(currMode)
	local currNum = 0
	
	if currMode.num == #currMode.setModes then
			currMode.num = 1 
		else
			currMode.num = currMode.num + 1	
	end
	equip_Sets(currMode ,0)
end
----------------------------------------------------------------equipSets------------------------------------------------

--changes the mode to match the current mode number
function equip_Sets(currMode, num)
  	current = currMode.setModes[currMode.num]
	if currMode.tpType == 1 then
		sets.TP.Current = sets.TP[current]
		sets.aftercast.TP = sets.TP.Current
		add_to_chat(122, "TP = " .. current .. " " .. currMode.suffix)
	end
		if player.status =='Engaged' or num == 1 or currMode.suffix == "TP" then
			equip(sets.TP.Current) 
		end
	if currMode.idleType == 1 then
		if  #currMode.setModes == 0 or sets[currMode.suffix][current] == nil then
			sets.aftercast.Idle= sets[currMode.suffix]
			add_to_chat(122, "Idle = Default" .. currMode.suffix)
		else 
			sets.aftercast.Idle = sets[currMode.suffix][current]
			add_to_chat(122,  "Idle = " .. current .. " " .. currMode.suffix )
		end
			if player.status =='Idle' then
				equip(sets.aftercast.Idle) 
			end
	end
	if currMode.precastType == 1 then
		if  #currMode.setModes == 0 or sets[currMode.suffix][current] == nil then
			add_to_chat(122, currMode.suffix .." Precast = " .. currMode.suffix .. " Default"  )
		else					
			sets.precast[currMode.suffix] = sets[currMode.suffix][current]
			add_to_chat(122, currMode.suffix .." Precast = " .. current )
		end
		
	end
	if currMode.midcastType == 1 then -- canges midcast set
		if  #currMode.setModes == 0 or sets[currMode.suffix][current] == nil then
			add_to_chat(122, currMode.suffix " Midcast = " .. currMode.suffix .. " Default" )
		else					
			sets.midcast[currMode.suffix] = sets[currMode.suffix][current]
			add_to_chat(122, currMode.suffix .." Midcast = " .. current  )
		end
		
	end
end
----------------------------------------------------------------custom sets------------------------------------------------------------------------------------------
function customSet()
	 return {head= player.equipment.head, neck= player.equipment.neck,
        ear1=player.equipment.left_ear ,ear2=player.equipment.right_ear,body=player.equipment.body,hands=player.equipment.hands,
        ring1=player.equipment.left_ring,ring2=player.equipment.right_ring, back=player.equipment.back,waist=player.equipment.waist,legs=player.equipment.legs,
        feet= player.equipment.feet}
		--add_to_chat(122, set)
end
	

function self_command(command)
	if command == "c1" then --equip tp C1 -- f9
		self_command("equipTP") 
	elseif command == "c12" then --changeTP mode c12 - crtl f9
		self_command("tpMode")
	elseif command == "c13" then
		self_command("customTP")
	elseif command == "c14" then
		self_command("customPet")
	elseif command == "c2" then
		self_command("equipDT")
	elseif command == "c22" then
		self_command("dtMode")
	elseif command == "c23" then
		self_command("wsMode")
	--elseif command == "c24" then
	--	self_command("tpMode")
	elseif command == "c3" then
		self_command("equipIdle")
	elseif command == "c32" then
		self_command("idleMode")
	elseif command == "c33" then
		self_command("rangeMode")
	--elseif command == "c34" then
	--	self_command("Pet/Nuke")
	elseif command == "c4" then
		if player.main_job == "PUP" then
			self_command("equipPet")
		else
			self_command("equipElemental")
		end
	elseif command == "c42" then
		if player.main_job == "PUP" then
			self_command("petMode")
		else
			self_command("nukeMode")
		end
	--elseif command == "c43" then
	--	self_command("equipTP")
	--elseif command == "c44" then
	--	self_command("tpMode")
	--------------------------------------------------------------------------------Modes--------------------------------------------------------------------------------------------------------------

	elseif modeSets[command] ~= nil then 		
		if modeSets[command].setModes == nil then
			add_to_chat(122, "no modes set up for " .. modeSets[command].suffix)
		else
		--add_to_chat(122,  modeSets[command].num)
			modeChange(modeSets[command])
		end
	elseif command == "petWS"  then -- type gs c petWS to change to petws gear
		if petWS == false then
			if sets.midcast.Pet.WeaponSkill ~= nil then
				equip(sets.midcast.Pet.WeaponSkill)
				add_to_chat("PetWS Gear on")
				petWS = true
				end
		else
			equip(sets.TP.Current)
			petWS = false
		end
---------------------------------------------------------------equip sets ---------------------------------------------------------------------------------------------------------------
	elseif equipSets[command] ~= nil then
		if modeSets[equipSets[command]].setModes == nil then
			add_to_chat(122, "no modes set up for " .. modeSets[equipSets[command]].suffix)
		else
			equip_Sets(modeSets[equipSets[command]], 1)
		end
---------------------------------------------------------------------------------------------booleans--------------------------------------------------------------------------------------
	
	elseif booleans:contains(command) then		--turns booleans off or on, booleans must be in the commands section
		_G[command] = booleanChange(_G[command])
		if _G[command] == true then
			add_to_chat(122, command .. " on")
		else 
			add_to_chat(122, command .. " off")
		end
	elseif command == "cap" then
			if cap == false then
				equip({back = "Aptitude Mantle"})
				cap = true 
				disable("back")
				add_to_chat(122, command .. " on")
			else
				cap = false
				enable("back")
				add_to_chat(122, command .. " off")
			end
	elseif command == "autocast" then
	--	if firstAuto then
			include('autoMagic.lua')
	--	end
		firstAuto = false
		if autocast == false then
			autocast = true;
			add_to_chat(122, command .. " on")
			send_command('wait 2 ;input //gs c autoMagicCast')
		else 
			autocast = false
			add_to_chat(122, command .. " off")
		end
	
	elseif command == "autoMagicCast" then
		autoMagicCast()
	elseif command == "autoRA" then
		if autoRA == false then 
			autoRA = true
			add_to_chat(122, command .. " on")
			send_command('wait 2 ;input //gs c autoRange')
		else 
			autoRA = false
			add_to_chat(122, command .. " off")
		end
	elseif command == "autoRange" then
		autoRange()
----------------------------------------------------------------------------------------------custom sets----------------------------------------------------------------------------
	elseif command == "customTP"  then
		sets.TP.Custom =   customSet()	
		add_to_chat(122, "Custom TP Set")	
	elseif command == "customPet"  then
		sets.Pet.Custom =   customSet()	
		add_to_chat(122, "Custom Pet Set")
	elseif command == "customIdle"  then
		sets.Idle.Custom =   customSet()	
		add_to_chat(122, "Custom Idle Set")
	elseif command == "customDT"  then
		sets.DT.Custom =   customSet()	
		add_to_chat(122, "Custom DT Set")
	elseif command == "customNuke"  then
		sets.Nuke.Custom =   customSet()	
		add_to_chat(122, "Custom Nuke Set")
	end
end
    
	
