/*
*	Author: DasCapschen
*/

_distance = 50;
_pos = screenToWorld [0.5,0.5];

player playAction "ThrowGrenade";
sleep 1;
playSound3D ["A3\Sounds_F\weapons\Grenades\Grenade_Roll.wss", player, false, AGLToASL _pos, 1, 1, _distance];

_enemies = (_pos nearEntities ["Man", _distance]) - [player];
if ( count _enemies > 0 ) then //first entry is player
{
    (_enemies select 0) doMove _pos;
}
