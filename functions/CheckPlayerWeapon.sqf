/*
*	Author: CAPTNCAPS
*/


forbiddenRiflesEast = ["arifle_mxc_f","arifle_mx_f","arifle_mx_gl_f","arifle_mx_sw_f","arifle_mxm_f","arifle_trg21_f","arifle_trg20_f","arifle_mk20_f","arifle_mk20c_f","arifle_mk20_gl_f","lmg_mk200_f","srifle_ebr_f"];
forbiddenRiflesWest = ["arifle_mk20_f","arifle_mk20c_f","arifle_mk20_gl_f","lmg_mk200_f","srifle_ebr_f","arifle_katiba_f","arifle_katiba_c_f","arifle_katiba_gl_f","lmg_zafir_f","srifle_dmr_01_f"];
forbiddenRiflesGuer = ["arifle_katiba_f","arifle_katiba_c_f","arifle_katiba_gl_f","lmg_zafir_f","srifle_dmr_01_f","arifle_mxc_f","arifle_mx_f","arifle_mx_gl_f","arifle_mx_sw_f","arifle_mxm_f","arifle_trg21_f","arifle_trg20_f"];
usingForbiddenWeaponEast = false;
usingForbiddenWeaponWest = false;
usingForbiddenWeaponGuer = false;

_caller = _this select 0;

//actual Check Function
CheckIllegalWeapons ={
_caller = _this select 0;
_pWeap = primaryWeapon _caller;
if (!(_pWeap == "")) then {
_pWeap = _pWeap call BIS_fnc_weaponComponents;
_Weap = _pWeap select 0;
if (_Weap in forbiddenRiflesEast) then {usingForbiddenWeaponEast = true;};
if (_Weap in forbiddenRiflesWest) then {usingForbiddenWeaponWest = true;};
if (_Weap in forbiddenRiflesGuer) then {usingForbiddenWeaponGuer = true;};

	if ((side _caller) == west) then {	//if _caller has disguised as WEST, dissallow EAST&GUER weapons
		if(usingForbiddenWeaponWest) then {
			if (count (_caller nearEntities ["SoldierWB",30]) > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")+1];
				hint "getting suspicious";
			};
			0 = [_caller] execVM "Disguise\checkSuspicious.sqf";
			[_caller] call CheckIllegalWeapons;
		} 
		else {	
			if ((_caller getVariable "Suspiciousness") > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")-0.001];	
			};
		};
	};
	
	if ((side _caller) == east) then {	//if _caller has disguised as EAST, dissallow WEST&GUER weapons
		if(usingForbiddenWeaponEast) then {
			if (count (_caller nearEntities ["SoldierEB",30]) > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")+1];
				hint "getting suspicious";
			};
			0 = [_caller] execVM "Disguise\checkSuspicious.sqf";
			[_caller] call CheckIllegalWeapons;
		} 
		else {
			if ((_caller getVariable "Suspiciousness") > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")-0.001];	
			};
		};
	};
	
	if ((side _caller) == resistance) then {	//if _caller has disguised as GUER, dissallow EAST&WEST weapons
		if(usingForbiddenWeaponGuer) then {
			if (count (_caller nearEntities ["SoldierGB",30]) > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")+1];
				hint "getting suspicious";
			};
			0 = [_caller] execVM "Disguise\checkSuspicious.sqf";
			[_caller] call CheckIllegalWeapons;
		} 
		else {	
			if ((_caller getVariable "Suspiciousness") > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")-0.001];	
			};				
		};
	};
};
};

[_caller] call CheckIllegalWeapons;