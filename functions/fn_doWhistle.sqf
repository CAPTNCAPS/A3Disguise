/*
*	Author: DasCapschen
*/

_unit = _this select 0;

_unit say "CAPS_whistle";

_enemies = (nearestObjects[_unit, ["Man"], 50]) - [_unit];
if( count _enemies > 0 ) then
{
    _enemy = _enemies select 0;
    _posE = position _enemy;
    _posP = position _unit;
    _enemy doMove _posP;
    sleep 25;
    _enemy setSpeedMode "LIMITED";
    _enemy doMove _posE;
    sleep 5;
    _enemy setSpeedMode "NORMAL";
}
 
