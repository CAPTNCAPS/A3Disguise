/*
*	Author: DasCapschen
*/

{
	_x setBehaviour "SAFE";
	_x disableAI "FSM";
	_x setSkill ["spotDistance", 0];
	_x setSkill ["spotTime", 0];
	
	_silentkill = _x addAction ["<t color='#ff4444'>Silentkill</t>", {[(_this select 0), (_this select 1)] execVM "Disguise\silentkill.sqf"},nil,1,false,true,"","(_target != _this)", 3];
	
	_x setVariable ["silentkill_id", _silentkill];
	
	_x addEventHandler["Killed", {
		(_this select 0) removeAction ((_this select 0) getVariable "silentkill_id");
	
		//who addAction [name, {[target, caller] execVM script}, args, priority, showWindow, hideOnUse, shortcut, condition, radius]
		(_this select 0) addAction ["<t color='#ffff44'>Disguise</t>", {[(_this select 0),(_this select 1),(_this select 2)] execVM "Disguise\stealUniform.sqf"}, nil, 1, false, true, "", "true", 3];
		
		//who addAction [name, {hideBody (target)}, args, priority, showWindow, hideOnUse, shortcut, condition, radius]
		(_this select 0) addAction ["<t color='#ffff44'>HideBody</t>", {hideBody (_this select 0)}, nil, 1 ,false, true, "", "true", 3];
	}];
} forEach allUnits;