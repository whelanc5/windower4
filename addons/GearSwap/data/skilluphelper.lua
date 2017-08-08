function wait(seconds)
	local start = os.time()
	repeat until os.time() > start + seconds
end

function enhanceSkillUp()
	if skillup == true then
		if player.main_job == "WHM" then
			send_command('wait 1;input /ma Shellra <me>')
			wait(5)
			send_command('wait 1;input /p 123')
			wait(5)
			send_command('wait 1;input //gs c enhanceSkillUp')
		end
	end
end