/*
*	Author: CAPTNCAPS
*/

whistle={
	_caller = _this select 0;
	_nearEnemy = nearestObjects [_caller, ["SoldierWB","SoldierEB","SoldierGB"], 50];
	_enemy = _nearEnemy select 1;
	_posE = position _enemy;
	_posP = position _caller;
	[_caller, "whistle"] call CBA_fnc_globalSay3d;
	_enemy doMove _posP;
	sleep 25;
	_enemy setSpeedMode "LIMITED";
	_enemy doMove _posE;
	sleep 5;
	_enemy setSpeedMode "NORMAL";
};

{
	_x addAction ["Whistle", {[(_this select 1)] call whistle},nil,1,false,true,"","((_target distance _this) < 0.01)"];
}forEach allUnits;