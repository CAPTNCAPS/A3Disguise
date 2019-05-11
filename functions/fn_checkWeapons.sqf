/*
 * Author: DasCapschen
 */ 

_unit = _this select 0;
 
//allowed guns per side
_gunsBlue = (_this select 1 select 0);
_gunsRed = (_this select 1 select 1);
_gunsGreen = (_this select 1 select 2);
 
_primary = primaryWeapon _unit;
_launcher = secondaryWeapon _unit;
_handgun = handgunWeapon _unit;
 
_search = [];
switch( side _unit ) do 
{
	case west: { _search = _gunsBlue };
	case east: { _search = _gunsRed };
	case resistance: { _search = _gunsGreen };
};

_searchingPrimary = (_primary != "");
_searchingLauncher = (_launcher != "");
_searchingHandgun = (_handgun != "");

{
	if( _searchingPrimary && { [_x, _primary] call BIS_fnc_inString } ) then 
	{
		_searchingPrimary = false;
	};
    if( _searchingLauncher && { [_x, _launcher] call BIS_fnc_inString } ) then 
	{
        _searchingLauncher = false;
	};
    if( _searchingHandgun && { [_x, _handgun] call BIS_fnc_inString } ) then
	{
        _searchingHandgun = false;
	};
} forEach _search;

//primary wasn't found in allowed weapons
if( _searchingPrimary ) then 
{
    _unit setVariable ["wrongGearCount", (_unit getVariable "wrongGearCount")+1];
};
if( _searchingHandgun ) then
{
    _unit setVariable ["wrongGearCount", (_unit getVariable "wrongGearCount")+1];
};
if( _searchingLauncher ) then
{
    _unit setVariable ["wrongGearCount", (_unit getVariable "wrongGearCount")+1];
};
