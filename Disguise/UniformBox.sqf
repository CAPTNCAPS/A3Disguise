/*
*	Author: DasCapschen
*/

// 0 = [this] execVM "Disguise\UniformBox.sqf"; <- Init Field of Box

_box = _this select 0;
removeAllItems _box;
removeAllWeapons _box;
_box addAction ["Take West Uniform",{[(_this select 1)] call UniformWEST},nil,1,false,true,"","((_target distance _this) < 3)"];
_box addAction ["Take East Uniform",{[(_this select 1)] call UniformEAST},nil,1,false,true,"","((_target distance _this) < 3)"];

UniformWEST = {
	_caller = _this select 0;
	_caller forceAddUniform "gm_ge_army_uniform_soldier_80_ols";
	[_caller] joinSilent createGroup west;
};

UniformEAST = {
	_caller = _this select 0;
	_caller forceAddUniform "gm_gc_army_uniform_soldier_80_str";
	[_caller] joinSilent createGroup east;
};