/* AUTHOR: DasCapschen
 * Checks if the units clothing is legal for its side ONCE.
 * Called from loop in fn_startGearCheck.sqf
 */ 

_unit = _this select 0;
 
//allowed clothes per side
_clothBlue = (_this select 1 select 0);
_clothRed = (_this select 1 select 1);
_clothGreen = (_this select 1 select 2);
 
_helm = headgear _unit;
_vest = vest _unit;
_backpack = backpack _unit;
 
_search = [];
switch( side _unit ) do 
{
    case west: { _search = _clothBlue };
    case east: { _search = _clothRed };
    case resistance: { _search = _clothGreen };
};

_searchingHelm = (_helm != "");
_searchingVest = (_vest != "");
_searchingBackpack = (_backpack != "");

{
    if( _searchingHelm && { [_x, _helm] call BIS_fnc_inString } ) then 
    {
        _searchingHelm = false;
    };
    if( _searchingVest && { [_x, _vest] call BIS_fnc_inString } ) then 
    {
        _searchingVest = false;
    };
    if( _searchingBackpack && { [_x, _backpack] call BIS_fnc_inString } ) then
    {
        _searchingBackpack = false;
    };
} forEach _search; 

if( _searchingHelm ) then
{
    _unit setVariable ["wrongGearCount", (_unit getVariable "wrongGearCount")+1];
};
if( _searchingVest ) then
{
    _unit setVariable ["wrongGearCount", (_unit getVariable "wrongGearCount")+1];
};
if( _searchingBackpack ) then
{
    _unit setVariable ["wrongGearCount", (_unit getVariable "wrongGearCount")+1];
};
