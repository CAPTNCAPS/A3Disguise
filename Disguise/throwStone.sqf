/*
*	Author: DasCapschen
*/

_distance = 50;
_pos = AGLToASL screenToWorld [0.5,0.5];

player playAction "ThrowGrenade";
sleep 1;
playSound3D ["A3\Sounds_F\weapons\Grenades\Grenade_Roll.wss", player, false, _pos, 1, 1, _distance];

_enemies = _pos nearEntities ["Man", _distance];
if ( count _enemies > 1 ) then //first entry is player
{
    (_enemies select 1) doMove _pos;
}
