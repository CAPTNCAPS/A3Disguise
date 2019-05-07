while {true} do {
	{
		if (isNil {_x getVariable "scriptAssigned"}) then {
		_x setVariable ["scriptAssigned", true];
		_x setBehaviour "SAFE";
		_x disableAI "FSM";
		_x setSkill ["spotDistance", 0];
		_x setSkill ["spotTime", 0];
		};
	}forEach allUnits;	
	
	{
		if (isNil {_x getVariable "Died"}) then {
			_x setVariable ["Died", true];
			hint format ["%1 died",_x];
			_x addAction ["Disguise", {[(_this select 0),(_this select 1)] execVM "Disguise\stealUniform.sqf"},nil,1,false,true,"","((_target distance _this) < 3)"];
			_x addAction ["HideBody", {hideBody (_this select 0)},nil,1,false,true,"","((_target distance _this) < 3)"];
		};
	}forEach allDead;
	
	sleep 2;
};