/*
*	Author: DasCapschen
*/

player say "whistle";

//because nearestObjects is sorted, nearEntities is not!
_enemies = nearestObjects[player, "Man", 50];
if( count _enemies > 1 ) then //entry 1 is player
{
    _enemy = _enemies select 1;
    _posE = position _enemy;
    _posP = position player;
    _enemy doMove _posP;
    sleep 25;
    _enemy setSpeedMode "LIMITED";
    _enemy doMove _posE;
    sleep 5;
    _enemy setSpeedMode "NORMAL";
}
