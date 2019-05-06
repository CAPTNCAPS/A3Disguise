/*
*	Author: DasCapschen
*/

//setup vars
_enemy = _this select 0;
_uniform = uniform _enemy;
_olduniform = uniform player;
_side = side _enemy;

//remove "disguise" action!
_enemy removeAction (_this select 2);

player addAction ["Change back", {removeUniform player; player forceAddUniform _olduniform; player removeAction _this select 2;}];

player playMove "Acts_TreatingWounded_In";
player playMove "acts_CrouchingWatchingRifle02";
removeUniform player;
player playMove "AinvPknlMstpSnonWnonDr_medic5";
removeUniform _enemy;
player playMove "acts_CrouchingWatchingRifle02";
player forceAddUniform _uniform;
player playMove "Acts_TreatingWounded_Out";

/*play animations and change uniforms
player switchMove "";
player switchMove "Acts_TreatingWounded_In"; //doesn't work
sleep 3;
player switchMove "";
player switchMove "acts_CrouchingWatchingRifle02";	
sleep 4;
removeUniform player;
player switchMove "";
player playMove "AinvPknlMstpSnonWnonDr_medic5";	
sleep 12;
removeUniform _enemy;
sleep 1;
player switchMove "";
player switchMove "acts_CrouchingWatchingRifle02";	
sleep 4;
player forceAddUniform _uniform;
player switchMove "Acts_TreatingWounded_Out";
sleep 2;
*/

//change group (switch sides)
[player] joinSilent createGroup _side;
