/* AUTHOR: DasCapschen
 * 
 */
 

_gear = _this select 1;

if( _gear == 0 ) exitWith {};

_unit = _this select 0;
_weapons = _this select 2;
_clothes = _this select 3;

while { true } do
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
