/* AUTHOR: DasCapschen
 * logic for stealing a uniform.
 */

//setup vars
_enemy = _this select 0;
_caller = _this select 1;
_uniform = uniform _enemy;
_rank = rank _enemy;
_side = side group _enemy; //dead side = CIV ; "use `side group unit` to get underlying side"

//remove "disguise" action!
_enemy removeAction (_this select 2);

_caller setVariable ["actingIllegal", true];

_caller switchMove "Acts_TreatingWounded_In"; //doesn't work (neither switchMove, playMove, playMoveNow)
sleep 3;
_caller switchMove "acts_CrouchingWatchingRifle02";	
sleep 4;
removeUniform _caller;
_caller switchMove "";
_caller playMove "AinvPknlMstpSnonWnonDr_medic5"; //playMove important!! switchMove breaks!
sleep 12;
removeUniform _enemy;
sleep 1;
_caller switchMove "acts_CrouchingWatchingRifle02";	
sleep 4;
_caller forceAddUniform _uniform;
_caller switchMove "Acts_TreatingWounded_Out"; //doesn't work (neither switchMove, playMove, playMoveNow)
sleep 2;
_caller switchMove "";

_caller setUnitRank _rank; //get enemies rank

_caller setVariable ["disguised", true];
_caller setVariable ["actingIllegal", false];

//change group (switch sides)
[_caller] joinSilent createGroup _side;
 
