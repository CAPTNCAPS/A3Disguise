/* AUTHOR: DasCapschen
 * Main Loop for checking clothes and weapons of a unit
 */
 

_gear = _this select 1;

if( _gear == 0 ) exitWith {};

_unit = _this select 0;
_weapons = _this select 2;
_clothes = _this select 3;

while { alive _unit } do
{
    _unit setVariable ["wrongGearCount", 0];

    switch ( _gear ) do
    {
        case 1: { [_unit, _weapons] call CAPS_fnc_checkWeapons; };
        case 2: { [_unit, _clothes] call CAPS_fnc_checkClothing; };
        case 3: {
            [_unit, _weapons] call CAPS_fnc_checkWeapons;
            [_unit, _clothes] call CAPS_fnc_checkClothing;
        };
    };
    
    sleep 5;
};
