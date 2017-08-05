function get_sets()                
   include('cdhelper.lua')
   
	idleModes = {"Normal", "DT", "Refresh"}
   
	sets.TP = {} 
	sets.precast = {}
	sets.precast.Magic = {}
	sets.precast.TP ={}
	sets.precast.TP ={}
	sets.precast.JA = {}
	sets.aftercast = {}
	sets.midcast = {}
	sets.midcast.Magic = {}
	sets.DT = {}
	
	tpModes = { "Acc"}
	dtModes = {""}
	petModes = {"Pet", "PetDD", "PetTank","Hybrid"}
	idleModes = { "DT"}
	
	
	
	
	
	sets.midcast = {}
	sets.midcast.Magic = {}
	sets.midcast.Healing = {}
    sets.midcast.Elemental = {ear1 = "Brutal Earring"}
	sets.precast.Magic = {}
	sets.precast.Magic.Healing  = {ring1 = "Rajas Ring"}
	sets.precast.WS = {}

    sets.precast.JA = {} 
    sets.aftercast = {}
    sets.aftercast.TP = sets.TP
    
    sets.aftercast.Idle = set_combine(sets.TP.DT,{})
	
	sets.Idle = {}
	sets.Idle.Refresh = set_combine(sets.TP.DT,{})
	sets.Idle.DT = set_combine(sets.TP.DT,{})
	sets.Idle.Normal = set_combine(sets.TP.DT,{})
    send_command('input /macro book 10;wait .1;input /macro set 1')
end

