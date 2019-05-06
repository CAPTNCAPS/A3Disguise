/*
*	Author: DasCapschen
*/

//https://community.bistudio.com/wiki/Global_Mobilization_Characters
// gm_ge_* => West Germany
// gm_gc_* => East Germany

_pGun = primaryWeapon player;
_search = [];

_gunsWest = ["gm_g3a3", "gm_g3a4", "gm_mg3", "gm_mp2a1"];
_gunsEast = ["gm_hmgpkm", "gm_lmgrpk", "gm_mpiak", "gm_mpikm"];

switch( side player ) do 
{
	case west: {_search = _gunsEast};
	case east: {_search = _gunsWest};
};

{
	scopeName "search";
	if( [_x, _pGun] call BIS_fnc_inString ) then 
	{
		player setVariable ["wrongGearCount", (player getVariable "wrongGearCount")+1];
		breakOut "search";
	}
} forEach _search;