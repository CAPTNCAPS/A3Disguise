/*
*	Author: DasCapschen
*/

_search = "";

switch( side player ) do 
{
	case west: {_search = "gm_gc";};
	case east: {_search = "gm_ge";};
};

if( [_search, (headgear player)] call BIS_fnc_inString ) then 
{
	player setVariable ["wrongGearCount", (player getVariable "wrongGearCount")+1];
};
if( [_search, (vest player)] call BIS_fnc_inString ) then 
{
	player setVariable ["wrongGearCount", (player getVariable "wrongGearCount")+1];
};
if( [_search, (backpack player)] call BIS_fnc_inString ) then 
{
	player setVariable ["wrongGearCount", (player getVariable "wrongGearCount")+1];
};
