	include('skillup.lua')
	
	----------------------------------------------------Commands---------------------------------------------------------------------------------------------------
	--------------booleans--------------------------------
	-----------When used these will switch on if they're off, and off if they're on
	
	---- //gs c deploy 
	-- makes it so automaton will automatically deploy when you engage
	---- //gs c automaneuver 
	-- makes it so manuevers will be used as they wear off
	---- //gs c cap
	-- equips capacity back, you have to set the back in the self_command function under cap
	
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
	
	
	
	
	
	---------------------------------------------------------Sets for blu spells----------------------------------------------
	blueMagic = S{} --spells that will equip sets.Blue.Magic[nukeMode]
	bluePhysical = S{} -- spells that will equip sets.Blue.Physical
	blueDebuff = S{} -- spells that will equip sets.Blue.Debuff
	blueBuff = S{} -- spells that will equip sets.Blue.Buff
	blueCure = S{}-- spells that will equip sets.Blue.Cure
	-----------------------------------------------------------------------------------------------------------------------------
	
	----------------------------------------------------------------Modes--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	--To create a mode you have to do the following:
	--Put the catagory in the following set. The format should be an identifying prefix, followed by "Mode" as the suffix. Ex: for changing tp "tp" is the prefix, Mode is the suffix, so you'd put tpMode. 
	-- you will also need to create a num variable which should be set to 1, this should be the prefix followed by Num. ex: tpMode's num variable will be tpNum = 1. 
	-- next you will need to set the modes set for that catagory. this should be entereed as the prefix followed by "Modes" and be set to the empty set {}. Ex: tpModes = {} 
	-- finally you'll need to set the modes to a value, this has to match a set in the jobs LUA, and should be redefined there. It is a good idea to create holder value that is set to "Default", incase it isn't made. Ex: tpMode = "Default"
	
	
	----------------------------------------------------------List of catagories-----------------------------------------------------------
	--prefix + mode
	--ex "tpMode"
	modes = S{"tpMode", "petMode", "dtMode", "wsMode", "nukeMode", "idleMode"} 
	
	
	
	
	---------------------------------------------------------ModeNum Variables--------------------------------------------------------------
	---Global Variables to keep trade of set number, should be set to 1
	-- prefix + Num
	-- ex tpNum = 1
	tpNum = 1 --nums to keep track of which of the set to use
	petNum= 1
	idleNum=1
	dtNum =1
	wsNum = 1
	nukeNum = 1
	---------------------------------------------Mode Lists-----------------------------------------------------------------------------------
	--they are a list of modes which that particular catagory can have
	--prefix + Modes
	-- ex tpModes = {}
	tpModes = {} --sets of modes
	dtModes = {}
	petModes = {}
	idleModes = {}
	wsModes = {}
	nukeModes = {}
	tpMode= {}
	
	------------------------------------------------------Mode variables
	--vars to hold name of the current set
	-- pre+Mode
	-- ex idleMode = "Default"

	idleMode= "Default"
	petMode= "Default"
	dtMode = "Default"
	wsMode = "Default"
	nukeMode = "Default"
	tpMode = "Default"
	
----------------------------------------------------------------------------------------------Booleans----------------------------------------------------------------------------------------------------------------------------------------------
	--These are booleans 
	
	booleans = S{"magicburst", "deploy", "automaneuver", "rune", "autoWS"} --booleans
	deploy = false
	automaneuver = false
	magicburst = false
	rune = false;
	autoWS = false;
	cap = false;
	petWS = false;
--------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------Base sets-------------------------------------------------------------------------------
--these should be overridden in job lua
	sets.TP = {} 
	sets.precast = {}
	sets.precast.Magic = {}
	sets.precast.TP ={}			
	sets.precast.WS = {}
	sets.precast = {}
	sets.precast.JA = {}
	sets.midcast = {}
	sets.midcast.Magic = {}		
	sets.DT = {}
    sets.DT.Default = {}  
	sets.DT.Magic  = {}
	sets.aftercast = {}	
    sets.aftercast.TP = {}    
    sets.aftercast.Idle = {}
	sets.Idle = {}
	sets.Idle.DT = {}
	sets.Idle.Default = {}
	sets.Blue = {}
	sets.Blue.Magic = {}
	sets.Blue.Physical = {}
	sets.Blue.Debuff = {}
	sets.Blue.Buff = {}
	sets.Blue.Cure = {}
	sets.Nuke = {}
	sets.Nuke.Default = {}
	
	sets.WS = {}
----------------------------------------------------------------------Variables for augmented gear-----------------------------------------------------------------------------------------
	hercLegsTA = { name="Herculean Trousers", augments={'Attack+22','"Triple Atk."+3','DEX+10','Accuracy+15',}}
	hercLegsCrit = {name="Herculean Trousers", augments={'Accuracy+26','Crit.hit rate+4','AGI+5','Attack+1',}}
	hercFeetCrit = { name="Herculean Boots", augments={'Accuracy+23','Crit.hit rate+5','INT+6','Attack+9',}}
	hercFeetTA = { name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','INT+3','Attack+13',}}
	
	
	--------------------------------------------------------Set for pet WS--------------------------------------------------------------------------------
    petWeaponskills = S{"Slapstick", "Knockout", 
    "Chimera Ripper", "String Clipper",  "Cannibal Blade", "Bone Crusher", "String Shredder",
    "Arcuballista", "Daze", "Armor Piercer", "Armor Shatterer"}
	
----------------------------------------------------------------------------------------------------------------------------------------------------------------
	runes = S{"Tellus", "Flabra"}






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
	elseif spell.action_type == 'Magic' then		
		if spell.skill == 'Healing Magic' and equip(sets.precast.Magic.Healing) ~= nil then
			equip(sets.precast.Magic.Healing)			
		else		
			equip(sets.precast.Magic)
		end				
	elseif sets.precast.JA[spell.english] then
        equip(sets.precast.JA[spell.english])
    
    elseif spell.type=="WeaponSkill" then   
		equip(sets.precast.WS)
		if sets.WS[spell.english] then
			equip(sets.WS[spell.english]) 
			if sets.WS[spell.english][wsMode] ~= nil then
				equip(sets.WS[spell.english][wsMode]) 
			end
			
		end	
    elseif string.find(spell.english,'Maneuver')  then
		equip(sets.precast.maneuver)
	elseif string.find(spell.english,'Waltz')  then
		equip(sets.precast.Waltz)
    end
	
   end
-----------------------------------------------------------------------------Buff Change function--------------------------------------
-- looks for buff changes
-- automaneuver is set to true, it will put maneuvers back up when they wear
-- if runes it set to true, it will put up any runes that of within the runes set as they wear off
function buff_change(name, gain)
	if not gain and automaneuver and string.find(name,'Maneuver') then --maneuver auto put back up if automaneuver is true
			add_to_chat(122,name)
			send_command(name)		
	
	end
	if not gain and rune and  runes:contains(name) then
		add_to_chat(122,name)
		send_command(name)
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
  }


function midcast(spell)
	if sets.midcast[spell.english] then
        equip(sets.midcast[spell.english])	
	elseif  spell.action_type == 'Magic' then
		if spell.skill == 'Healing Magic' and sets.midcast.Healing ~= nil then
			equip(sets.midcast.Healing)				
		elseif spell.skill == 'Elemental Magic' then
			if magicburst then
				equip(sets.midcast.burst)
			else			
				equip(sets.midcast.Elemental)
			end
			storm = storms[spell.element]
			if spell.element == world.weather_element or spell.element == world.day_element or buffactive[storm]  then
				equip(sets.obi[spell.element])
			end
		elseif spell.skill == "Blue Magic" then			
			if bluePhysical:contains(spell.english) then
				equip(sets.Blue.Physical)
			elseif blueDebuff:contains(spell.english) then
				equip(sets.Blue.Debuff)
			elseif blueBuff:contains(spell.english) then
				equip(sets.Blue.Buff)
			elseif blueBuff:contains(spell.english) then
				equip(sets.Blue.Cure)
			elseif blueMagic:contains(spell.english) then
				equip(sets.Blue.Magic[nukeMode])
				add_to_chat(nukeMode)
			else equip(sets.Blue)
			end
		end	
	end
end


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


function modeChange(command, str) --for changing different modes -- command is the mode's variable name, and str is the suffix of the name ie tpMode, "tp"
	local modesVar = _G[command .. "s"]
	local modesNum = _G[str .. "Num"]
	if modes:contains(command) and #modesVar ~= 0 then	
		if modesNum == #modesVar then
			modesNum = 1 
		else
			modesNum = modesNum + 1	
		end
			_G[str .. "Mode"]= modesVar[modesNum]
			_G[str .. "Num"] = modesNum			
			add_to_chat(122, _G[str .. "Mode"] .. str)
		
	end
end
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
	--elseif command == "c33" then
	--	self_command("equipTP")
	--elseif command == "c34" then
	--	self_command("Pet/Nuke")
	elseif command == "c4" then
		self_command("Pet/Nuke")
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
	---------------------------------------------------------------equip sets ---------------------------------------------------------------------------------------------------------------
	elseif command == "equipTP" then -- equip current tp
		equip(sets.TP[tpMode])
		add_to_chat(122,tpMode .. "tp")
		
	elseif  command == "equipDT" then -- equip current dt
		if player.status =='Engaged' then
			equip(sets.DT[dtMode])
		else
			equip(sets.DT[dtMode])
		end
		add_to_chat(122,dtMode .. "dt")
		
	elseif command == "equipIdle" then -- for changing idle mode
			equip(sets.Idle[idleMode])
			add_to_chat(122,idleMode .. "idle")
			
	elseif command == "Pet/Nuke" then ---- for changing Pet mode or Nuke mode
		if player.main_job == "PUP" then
			equip(sets.Pet[petMode])
			add_to_chat(122, petMode .. "pet")
		else 
			equip(sets.Nuke[nukeMode])
			add_to_chat(122, nukeMode .. "nuke")
		end
		--------------------------------------------------------------------------------Modes--------------------------------------------------------------------------------------------------------------
		elseif command == "dtMode" then		-- for changing dt modes
			if  #dtModes == 0 then
			equip(sets.DT)
			sets.aftercast.TP = sets.DT
			sets.Idle.DT = sets.DT
			add_to_chat(122, "DT")
		else
			modeChange("dtMode", "dt")
			sets.TP.DT = sets.DT[dtMode]
			equip(sets.TP.DT)
			sets.aftercast.TP = sets.DT[dtMode]
			sets.Idle.DT = sets.DT[dtMode]
		end
	elseif command == "nukeMode"  then		-- for changing nuke modes by hotkey, type gs c nukeMode
		if  #nukeModes == 0 then			
			add_to_chat(122, "nuke default")
		else
			modeChange("nukeMode", "nuke")
			sets.Midcast.Elemental = sets.Nuke[nukeMode]
		end
	elseif command == "petMode" then		-- for changing pet modes by hotkey, type gs c petMode
		if  #petModes == 0 then
			add_to_chat(122, "no pet modes")
		else
			modeChange("petMode", "pet")
			sets.TP.Pet = sets.Pet[petMode]
			equip(sets.TP.Pet)
			sets.aftercast.TP = sets.TP.Pet	
			if sets.Pet.Idle[petMode] ~= nil then
				sets.Idle.Pet = sets.Pet.Idle[petMode]
			else
				sets.Idle.Pet = sets.Pet[petMode]
			end
		end
	elseif command == "wsMode" then		-- for changing ws modes by hotkey, type gs c wsmode
		if  #wsModes == 0 then
			add_to_chat(122, "defaultWS")
		else
			modeChange("wsMode", "ws")		
			sets.precast.WS = sets.WS[wsMode]		
		end
	elseif command == "petWS"  then -- type gs c petWS to change to petws gear
		if petWS == false then
			if sets.midcast.Pet.WeaponSkill ~= nil then
				equip(sets.midcast.Pet.WeaponSkill)
				add_to_chat("PetWS Gear on")
				petWS = true
				end
		else
			equip(sets.aftercast.TP)
			petWS = false
		end
	elseif command == "tpMode" then -- for changing tp modes by hotkey, bound to ctrl-f9 in my init file
		modeChange("tpMode", "tp" )
		sets.aftercast.TP = sets.TP[tpMode]
		equip(sets.aftercast.TP)
	elseif  command == "idleMode" then		--key bind for changing idle modes bound to ctrl-f11
		if  #idleModes == 0 then
			equip(sets.aftercast.Idle)
			add_to_chat(122, "Idle")
		else
			modeChange("idleMode", "idle")
			sets.aftercast.Idle = sets.Idle[idleMode]
			equip(sets.Idle[idleMode])
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
	elseif command == "skillupD" then
		if skillupD == false then
			skillupD = true;
			add_to_chat(122, command .. " on")
			send_command('wait 10 ;input //gs c skillUpMagic')
		else 
			skillupD = false
			add_to_chat(122, command .. " off")
		end
		elseif command == "skillupO" then
		if skillupO == false then
			skillupO = true;
			add_to_chat(122, command .. " on")
			send_command('wait 10 ;input //gs c skillupOffensive')
		else 
			skillupO = false
			add_to_chat(122, command .. " off")
		end
	elseif command == "skillUpMagic" then
		skillUpMagic()
	elseif command == "skillupOffensive" then
		skillupOffensive()
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
	end
end

    

		
    
	
