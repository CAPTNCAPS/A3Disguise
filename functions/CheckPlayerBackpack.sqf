/*
*	Author: CAPTNCAPS
*/


forbiddenPacksWest = ["B_AssaultPack_dgtl","B_AssaultPack_ocamo","B_TacticalPack_ocamo","B_FieldPack_khk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr","B_FieldPack_blk","B_Carryall_ocamo","B_Carryall_oucamo","B_FieldPack_ocamo_Medic","B_FieldPack_cbr_LAT","B_FieldPack_cbr_Repair","B_Carryall_ocamo_Exp"];
forbiddenPacksEast = ["B_AssaultPack_dgtl","B_AssaultPack_rgr","B_AssaultPack_rgr_LAT","B_AssaultPack_rgr_Medic","B_AssaultPack_rgr_Repair","B_Kitbag_rgr_Exp","B_AssaultPack_mcamo","B_Kitbag_rgr","B_Kitbag_mcamo","B_Kitbag_sgg","B_Kitbag_cbr","B_TacticalPack_rgr","B_TacticalPack_mcamo","B_Carryall_mcamo","B_Bergen_mcamo"];
forbiddenPacksGuer = ["B_AssaultPack_ocamo","B_TacticalPack_ocamo","B_FieldPack_khk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr","B_FieldPack_blk","B_Carryall_ocamo","B_Carryall_oucamo","B_FieldPack_ocamo_Medic","B_FieldPack_cbr_LAT","B_FieldPack_cbr_Repair","B_Carryall_ocamo_Exp","B_AssaultPack_rgr","B_AssaultPack_rgr_LAT","B_AssaultPack_rgr_Medic","B_AssaultPack_rgr_Repair","B_Kitbag_rgr_Exp","B_AssaultPack_mcamo","B_Kitbag_rgr","B_Kitbag_mcamo","B_Kitbag_sgg","B_Kitbag_cbr","B_TacticalPack_rgr","B_TacticalPack_mcamo","B_Carryall_mcamo","B_Bergen_mcamo"];
usingForbiddenBackpackEast = false;
usingForbiddenBackpackWest = false;
usingForbiddenBackpackGuer = false;

_caller = _this select 0;

//actual Check Function
CheckIllegalBackpacks ={
_caller = _this select 0;
_pBP = backpack _caller;
if (_pBP == "") then { 
			if ((_caller getVariable "Suspiciousness") > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")-0.001];	
			};
} else {

if (_pBP in forbiddenPacksEast) then {usingForbiddenBackpackEast = true;};
if (_pBP in forbiddenPacksWest) then {usingForbiddenBackpackWest = true;};
if (_pBP in forbiddenPacksGuer) then {usingForbiddenBackpackGuer = true;};

	if ((side _caller) == west) then {	//if player has disguised as WEST, dissallow EAST&GUER weapons
		if(usingForbiddenBackpackWest) then {
			if (count (_caller nearEntities ["SoldierWB",30]) > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")+1];
				hint "getting suspicious";
			};
			0 = [_caller] execVM "Disguise\checkSuspicious.sqf";
			[_caller] call CheckIllegalBackpacks;
		} 
		else {	
			if ((_caller getVariable "Suspiciousness") > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")-0.001];	
			};
		};
	};
	
	if ((side _caller) == east) then {	//if _caller has disguised as EAST, dissallow WEST&GUER Backpacks
		if(usingForbiddenBackpackEast) then {
			if (count (_caller nearEntities ["SoldierEB",30]) > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")+1];
				hint "getting suspicious";
			};
			0 = [_caller] execVM "Disguise\checkSuspicious.sqf";
			[_caller] call CheckIllegalBackpacks;
		} 
		else {
			if ((_caller getVariable "Suspiciousness") > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")-0.001];	
			};
		};
	};
	
	if ((side _caller) == resistance) then {	//if _caller has disguised as GUER, dissallow EAST&WEST Backpacks
		if(usingForbiddenBackpackGuer) then {
			if (count (_caller nearEntities ["SoldierGB",30]) > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")+1];
				hint "getting suspicious";
			};
			0 = [_caller] execVM "Disguise\checkSuspicious.sqf";
			[_caller] call CheckIllegalBackpacks;
		} 
		else {
			if ((_caller getVariable "Suspiciousness") > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")-0.001];	
			};				
		};
	};
};
};

[_caller] call CheckIllegalBackpacks;