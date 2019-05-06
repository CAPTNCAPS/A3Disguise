/*
*	Author: DasCapschen
*/

{
	_x setBehaviour "SAFE";
	_x disableAI "FSM";
	_x setSkill ["spotDistance", 0];
	_x setSkill ["spotTime", 0];
	
	// !alive _x => don't put action on self
	_x addAction ["Silentkill", {[(_this select 0), (_this select 1)] execVM "Disguise\silentkill.sqf"},nil,1,false,true,"","(_target != _this)", 3];
	
	_x addEventHandler["Killed", {
		//who addAction [name, {[target, caller] execVM script}, args, priority, showWindow, hideOnUse, shortcut, condition, radius]
		(_this select 0) addAction ["Disguise", {[(_this select 0),(_this select 1)] execVM "Disguise\stealUniform.sqf"}, nil, 1, false, true, "", "true", 3];
		
		//who addAction [name, {hideBody (target)}, args, priority, showWindow, hideOnUse, shortcut, condition, radius]
		(_this select 0) addAction ["HideBody", {hideBody (_this select 0)}, nil, 1 ,false, true, "", "true", 3];
	}];
} forEach allUnits;
