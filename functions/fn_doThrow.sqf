/* AUTHOR: DasCapschen
 * Simulates throwing a small object to distract someone.
 */

_unit = _this select 0;

//script must run locally for screenToWorld
_distance = 50;
_pos = screenToWorld [0.5,0.5];

//TODO: run global
_unit playAction "ThrowGrenade";
sleep 1;
playSound3D ["A3\Sounds_F\weapons\Grenades\Grenade_Roll.wss", _unit, false, AGLToASL _pos, 1, 1, _distance];

_enemies = (_pos nearEntities ["Man", _distance]) - [_unit];
if ( count _enemies > 0 ) then
{
    (_enemies select 0) doMove _pos;
}
