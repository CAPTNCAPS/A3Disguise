/*
*	Author: CAPTNCAPS
*/

_enemy = _this select 0;
_caller = _this select 1;
_uniform = uniform _enemy;
_group = group _enemy;
_caller switchMove "";
_caller switchMove "Acts_TreatingWounded_In";	
sleep 3;
_caller switchMove "";
_caller switchMove "acts_CrouchingWatchingRifle02";	
sleep 4;
removeUniform _caller;
_caller switchMove "";
_caller playMove "AinvPknlMstpSnonWnonDr_medic5";	
sleep 12;
removeUniform _enemy;
sleep 1;
_caller switchMove "";
_caller switchMove "acts_CrouchingWatchingRifle02";	
sleep 4;
_caller forceAddUniform _uniform;
_caller switchMove "Acts_TreatingWounded_Out";
sleep 2;
[_caller] joinSilent grpNull;
[_caller] joinSilent _group;
_caller addEventHandler ["Take", {0 = [(_this select 0)] execVM "Disguise\CheckGear.sqf";}];
0 = [_caller] execVM "Disguise\CheckGear.sqf";

