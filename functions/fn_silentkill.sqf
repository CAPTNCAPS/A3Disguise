/*
*	Author: DasCapschen
*/


_enemy = _this select 0;
_caller = _this select 1;
_dist = _caller distance _enemy;

//remove the silentkill action 
_enemy removeAction (_this select 2);

_caller setVariable ["actingIllegal", true];

_caller switchMove "acts_CrouchingFiringLeftRifle02";
sleep 1.1;
_enemy setDamage 1; 
sleep 1.5;
_caller switchMove "AmovPknlMstpSlowWrflDnon_AmovPercMstpSlowWrflDnon";

_caller setVariable ["actingIllegal", false]; 
