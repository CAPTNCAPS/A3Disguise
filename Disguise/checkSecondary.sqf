/*
*	Author: DasCapschen
*/

//https://community.bistudio.com/wiki/Global_Mobilization_Characters
// gm_ge_* => West Germany
// gm_gc_* => East Germany

_pGun = secondaryWeapon player;
_search = [];

_gunsWest = ["gm_pzf44", "gm_pzf84"];
_gunsEast = ["gm_rpg7"];

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