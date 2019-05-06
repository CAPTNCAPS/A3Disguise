/*
*	Author: DasCapschen
*/

player say "whistle";

//because nearestObjects is sorted, nearEntities is not!
//nearestObjects[player, "Man", 50];
_enemies = (nearestObjects[player, ["Man"], 50]) - [player];
if( count _enemies > 0 ) then
{
    _enemy = _enemies select 0;
    _posE = position _enemy;
    _posP = position player;
    _enemy doMove _posP;
    sleep 25;
    _enemy setSpeedMode "LIMITED";
    _enemy doMove _posE;
    sleep 5;
    _enemy setSpeedMode "NORMAL";
}
