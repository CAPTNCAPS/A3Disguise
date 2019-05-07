/*
*	Author: CAPTNCAPS
*/


forbiddenPistolsWest = ["hgun_acpc2_f","hgun_rook40_f"]; 
forbiddenPistolsEast = ["hgun_acpc2_f","hgun_p07_f"];
forbiddenPistolsGuer = ["hgun_rook40_f","hgun_p07_f"];
usingForbiddenPistolEast = false;
usingForbiddenPistolWest = false;
usingForbiddenPistolGuer = false;

_caller = _this select 0;

//actual Check Function
CheckIllegalPistols ={
_caller = _this select 0;
_pWeap = handgunWeapon _caller;
if (_pWeap == "") then {
			if ((_caller getVariable "Suspiciousness") > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")-0.001];	
			};
} else {
_pWeap = _pWeap call BIS_fnc_weaponComponents;
_Weap = _pWeap select 0;
if (_Weap in forbiddenPistolsEast) then {usingForbiddenPistolEast = true;};
if (_Weap in forbiddenPistolsWest) then {usingForbiddenPistolWest = true;};
if (_Weap in forbiddenPistolsGuer) then {usingForbiddenPistolGuer = true;};

	if ((side _caller) == west) then {	//if _caller has disguised as WEST, dissallow EAST&GUER weapons
		if(usingForbiddenPistolWest) then {
			if (count (_caller nearEntities ["SoldierWB",30]) > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")+1];
				hint "getting suspicious";
			};
			0 = [_caller] execVM "Disguise\checkSuspicious.sqf";
			[_caller] call CheckIllegalPistols;
		} 
		else {
			if ((_caller getVariable "Suspiciousness") > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")-0.001];	
			};
		};
	};
	
	if ((side _caller) == east) then {	//if _caller has disguised as EAST, dissallow WEST&GUER weapons
		if(usingForbiddenPistolEast) then {
			if (count (_caller nearEntities ["SoldierEB",30]) > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")+1];
				hint "getting suspicious";
			};
			0 = [_caller] execVM "Disguise\checkSuspicious.sqf";
			[_caller] call CheckIllegalPistols;
		} 
		else {
			if ((_caller getVariable "Suspiciousness") > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")-0.001];	
			};
		};
	};
	
	if ((side _caller) == resistance) then {	//if _caller has disguised as GUER, dissallow EAST&WEST weapons
		if(usingForbiddenPistolGuer) then {
			if (count (_caller nearEntities ["SoldierGB",30]) > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")+1];
			};
			0 = [_caller] execVM "Disguise\checkSuspicious.sqf";
			[_caller] call CheckIllegalPistols;
		} 
		else {
			if ((_caller getVariable "Suspiciousness") > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")-0.001];	
			};				
		};
	};
};
};

[_caller] call CheckIllegalPistols;