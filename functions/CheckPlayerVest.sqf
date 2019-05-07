/*
*	Author: CAPTNCAPS
*/


forbiddenVestsEast = ["V_BandollierB_rgr","V_PlateCarrier1_rgr","V_PlateCarrier2_rgr","V_PlateCarriergl_rgr","V_PlateCarrierSpec_rgr","V_Chestrig_rgr","V_RebreatherB","V_PlateCarrier_Kerry","V_PlateCarrierL_CTRG","V_PlateCarrierH_CTRG","V_BandollierB_oli","V_TacVest_oli","V_PlateCarrierIA1_dgtl","V_PlateCarrierIA2_dgtl","V_PlateCarrierIAGL_dgtl","V_RebreatherIA","V_I_G_resistanceLeader_F"];
forbiddenVestsWest = ["V_BandollierB_oli","V_TacVest_oli","V_PlateCarrierIA1_dgtl","V_PlateCarrierIA2_dgtl","V_PlateCarrierIAGL_dgtl","V_RebreatherIA","V_I_G_resistanceLeader_F","V_Chestrig_khk","V_TacVest_brn","V_HarnessO_brn","V_HarnessOGL_brn","V_HarnessO_gry","V_HarnessOGL_gry","V_HarnessOSpec_brn","V_RebreatherIR"];
forbiddenVestsGuer = ["V_Chestrig_khk","V_TacVest_brn","V_HarnessO_brn","V_HarnessOGL_brn","V_HarnessO_gry","V_HarnessOGL_gry","V_HarnessOSpec_brn","V_RebreatherIR","V_BandollierB_rgr","V_PlateCarrier1_rgr","V_PlateCarrier2_rgr","V_PlateCarriergl_rgr","V_PlateCarrierSpec_rgr","V_Chestrig_rgr","V_RebreatherB","V_PlateCarrier_Kerry","V_PlateCarrierL_CTRG","V_PlateCarrierH_CTRG"];
usingForbiddenVestEast = false;
usingForbiddenVestWest = false;
usingForbiddenVestGuer = false;

_caller = _this select 0;

//actual Check Function
CheckIllegalVests ={
_caller = _this select 0;
_pVest = vest _caller;
if (_pVest == "") then {
			if ((_caller getVariable "Suspiciousness") > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")-0.001];	
			};
} else {
if (_pVest in forbiddenVestsEast) then {usingForbiddenVestEast = true;};
if (_pVest in forbiddenVestsWest) then {usingForbiddenVestWest = true;};
if (_pVest in forbiddenVestsGuer) then {usingForbiddenVestGuer = true;};

	if ((side _caller) == west) then {	//if _caller has disguised as WEST, dissallow EAST&GUER weapons
		if(usingForbiddenVestWest) then {
			if (count (_caller nearEntities ["SoldierWB",30]) > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")+1];
				hint "getting suspicious";
			};
			0 = [_caller] execVM "Disguise\checkSuspicious.sqf";
			[_caller] call CheckIllegalVests;
		} 
		else {	
			if ((_caller getVariable "Suspiciousness") > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")-0.001];	
			};
		};
	};
	
	if ((side _caller) == east) then {	//if _caller has disguised as EAST, dissallow WEST&GUER weapons
		if(usingForbiddenVestEast) then {
			if (count (_caller nearEntities ["SoldierEB",30]) > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")+1];
				hint "getting suspicious";
			};
			0 = [_caller] execVM "Disguise\checkSuspicious.sqf";
			[_caller] call CheckIllegalVests;
		} 
		else {	
			if ((_caller getVariable "Suspiciousness") > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")-0.001];	
			};
		};
	};
	
	if ((side _caller) == resistance) then {	//if _caller has disguised as GUER, dissallow EAST&WEST weapons
		if(usingForbiddenVestGuer) then {
			if (count (_caller nearEntities ["SoldierGB",30]) > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")+1];
				hint "getting suspicious";
			};
			0 = [_caller] execVM "Disguise\checkSuspicious.sqf";
			[_caller] call CheckIllegalVests;
		} 
		else {	
			if ((_caller getVariable "Suspiciousness") > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")-0.001];	
			};				
		};
	};
};
};

[_caller] call CheckIllegalVests;