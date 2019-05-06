/*
*	Author: DasCapschen
*/

//setup vars
_enemy = _this select 0;
_uniform = uniform _enemy;
_rank = rank _enemy;
_side = side group _enemy; //dead side = CIV ; "use `side group unit` to get underlying side"

//remove "disguise" action!
_enemy removeAction (_this select 2);

player setVariable ["actingIllegal", true];

player switchMove "Acts_TreatingWounded_In"; //doesn't work (neither switchMove, playMove, playMoveNow)
sleep 3;
player switchMove "acts_CrouchingWatchingRifle02";	
sleep 4;
removeUniform player;
player switchMove "";
player playMove "AinvPknlMstpSnonWnonDr_medic5"; //playMove important!! switchMove breaks!
sleep 12;
removeUniform _enemy;
sleep 1;
player switchMove "acts_CrouchingWatchingRifle02";	
sleep 4;
player forceAddUniform _uniform;
player switchMove "Acts_TreatingWounded_Out"; //doesn't work (neither switchMove, playMove, playMoveNow)
sleep 2;
player switchMove "";

player setUnitRank _rank; //get enemies rank

player setVariable ["disguised", true];
player setVariable ["actingIllegal", false];

//change group (switch sides)
[player] joinSilent createGroup _side;
