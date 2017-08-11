--//gs c autocast is the command to start

DefensiveSpells = S{"Barfira", "Barwatera", "Baraera", "Barstonra" } -- put spells that you cast on yourself in here
OffensiveSpells = S{"Dia", "Fire", "Bind", "Bio" }	--put spells that you cast on enemies in here

--Spells need to be in autoCast and in either of Defensive or Offensive
autoCast = {"Barfira", "Barwatera", "Baraera", "Barstonra"} -- put spells you want to cast in here. They have to match the spell name in game. ex cure 3 must be spelled as "Cure III"

------------------------don't change anything below here


--Following is required in cdhelper.lua
	
	-- elseif command == "autocast" then
		-- if autocast == false then
			-- autocast = true;
			-- add_to_chat(122, command .. " on")
			-- send_command('wait 2 ;input //gs c autoMagicCast')
		-- else 
			-- autocast = false
			-- add_to_chat(122, command .. " off")
		-- end

	-- elseif command == "autoMagicCast" then
		-- autoMagicCast()


autoSpells= {} 
spellsNum = 1 


function findSpells()
	local MagicSpells = include('../../../res/spells.lua')
	add_to_chat(122, "Current Auto Spells")
	for i = 1,#autoCast do
		
		for j = 1, #MagicSpells do
			
			if MagicSpells[j].en == autoCast[i] then
			
				table.insert(autoSpells,MagicSpells[j])
				add_to_chat(122, MagicSpells[j].en)
				break
			end
		end
	end
end
findSpells()



function autoMagicCast()
--add_to_chat(122, autoSpells[spellsNum].en)
	local  wait = 2
	if player.mpp < 15  and rest then 
		--add_to_chat(122, player.mpp)
		send_command('input /heal on')	
	elseif player.status == "Resting" then
		--add_to_chat(122, player.mpp)	
		if player.mpp > 90 then
			send_command('input /heal off')
		end
	elseif autocast == true then
		if OffensiveSpells:contains(autoSpells[spellsNum].en) and player.in_combat then 
			send_command('input /ma "'.. autoSpells[spellsNum].en ..'" <t>')
			--add_to_chat(122,  autoSpells[spellsNum].en)
		wait = autoSpells[spellsNum].cast_time + 4
		elseif DefensiveSpells:contains(autoSpells[spellsNum].en) and (player.status ~= "Resting") then
			send_command('input /ma "'.. autoSpells[spellsNum].en ..'" <me>')
		--	add_to_chat(122,  autoSpells[spellsNum].en)
			wait = autoSpells[spellsNum].cast_time + 4
		end
		if spellsNum == #autoSpells then
			spellsNum = 1
		else
			spellsNum = spellsNum+1
		end
		
	end
	if (autocast == true) then
		send_command('wait "'.. wait .. '" ;input //gs c autoMagicCast')
	end
	
end

--OLD----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Use //gs c skillupD to skilling up magic on yourself and //gs c skillupO to enable offensive magic


-- skillupD = false
-- skillupO = false
--- requires skillup in  the self_command function in cdhelper
	-- elseif command == "skillupD" then
		-- if skillupD == false then
			-- skillupD = true;
			-- add_to_chat(122, command .. " on")
			-- send_command('wait 10 ;input //gs c skillUpMagic')
		-- else 
			-- skillupD = false
			-- add_to_chat(122, command .. " off")
		-- end
		-- elseif command == "skillupO" then
		-- if skillupO == false then
			-- skillupO = true;
			-- add_to_chat(122, command .. " on")
			-- send_command('wait 10 ;input //gs c skillupOffensive')
		-- else 
			-- skillupO = false
			-- add_to_chat(122, command .. " off")
		-- end
	-- elseif command == "skillUpMagic" then
		-- skillUpMagic()
	-- elseif command == "skillupOffensive" then
		-- skillupOffensive()

-- -- Add spells for offensive spells by adding the job name + OffensiveSpells. ex for blu spells do BLUOffensiveSpells = { "spell 1", "spell 2"}
-- -- Add spells for Defenesive spells by adding the job name + DefensiveSpells. ex for blu spells do BLUODefensiveSpells = { "spell 1", "spell 2"}
-- -- and a variable equal to one. ex BLUNum = 1
-- WHMDSpells = {"Barfira", "Barwatera", "Baraera", "Barstonra" }
	-- WHMNum = 1
-- BLMOffensiveSpells = {"Dia", "Fire II", "Stone II", "Aero II" }
	-- BLMNum = 1
-- BLMDefensiveSpells = {"Barfira", "Barwatera", "Baraera", "Barstonra" }
	-- BLMNum = 1
-- RDMOffensiveSpells = {"Dia", "Fire", "Bind", "Bio" }
	-- RDMNum = 1

-- function skillUpMagic()
-- --add_to_chat(122, player.status)
	-- if player.mpp < 15 and rest  then 
-- --		add_to_chat(122, player.mpp)
		-- send_command('input /heal on')
			
	-- elseif player.status == "Resting" then
-- --		add_to_chat(122, player.mpp)
		
		-- if player.mpp > 90 then
			-- send_command('input /heal off')
		-- end
	
	-- elseif (skillupD == true) and (player.status ~= "Resting") then
		-- local jobVar = player.main_job 	
		-- local spellNum = _G[jobVar .. "Num"]
		-- local spellsVar = _G[jobVar .. "DefensiveSpells"]
			-- send_command('input /ma "'.. spellsVar[spellNum] ..'" <me>')
			-- add_to_chat(122,  spellsVar[spellNum])
			-- if spellNum == #spellsVar then
				-- _G[jobVar .. "Num"] = 1
			-- else
				-- _G[jobVar .. "Num"] = spellNum+1
			-- end
	-- end
	-- if (skillupD == true) then
		-- send_command('wait 8 ;input //gs c skillUpMagic')
	-- end
-- end
	


-- function skillupOffensive()
-- --add_to_chat(122, player.status)
	-- if player.mpp < 15  and rest then 
		-- add_to_chat(122, player.mpp)
		-- send_command('input /heal on')
			
	-- elseif player.status == "Resting" then
-- --		add_to_chat(122, player.mpp)
		
		-- if player.mpp > 90 then
			-- send_command('input /heal off')
		-- end
	
	-- elseif (skillupO == true) and (player.in_combat) then
		-- local jobVar = player.main_job 	
		-- local spellNum = _G[jobVar .. "Num"]
		-- local spellsVar = _G[jobVar .. "OffensiveSpells"]
			-- send_command('input /ma "'.. spellsVar[spellNum] ..'" <t>')
			-- add_to_chat(122,  spellsVar[spellNum])
			-- if spellNum == #spellsVar then
				-- _G[jobVar .. "Num"] = 1
			-- else
				-- _G[jobVar .. "Num"] = spellNum+1
			-- end
		
	-- end
	-- if (skillupO == true) then
		-- send_command('wait 5 ;input //gs c skillupOffensive')
	-- end
	
-- end