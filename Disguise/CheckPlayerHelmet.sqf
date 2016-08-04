/*
*	Author: CAPTNCAPS
*/


forbiddenHelmetsEast = ["H_HelmetB","H_HelmetB_camo","H_HelmetB_paint","H_HelmetB_light","H_HelmetB_plain_mcamo","H_HelmetB_plain_blk","H_HelmetSpecB","H_HelmetSpecB_paint1","H_HelmetSpecB_paint2","H_HelmetSpecB_blk","H_Helmet_Kerry","H_HelmetB_grass","H_HelmetB_snakeskin","H_HelmetB_desert","H_HelmetB_black","H_HelmetB_sand","H_HelmetCrew_B","H_PilotHelmetFighter_B","H_PilotHelmetHeli_B","H_CrewHelmetHeli_B","H_MilCap_mcamo","H_HelmetB_light_grass","H_HelmetB_light_snakeskin","H_HelmetB_light_desert","H_HelmetB_light_black","H_HelmetB_light_sand","H_HelmetIA","H_HelmetIA_net","H_HelmetIA_camo","H_HelmetCrew_I","H_PilotHelmetFighter_I","H_PilotHelmetHeli_I","H_CrewHelmetHeli_I","H_MilCap_dgtl"];
forbiddenHelmetsWest = ["H_HelmetIA","H_HelmetIA_net","H_HelmetIA_camo","H_HelmetCrew_I","H_PilotHelmetFighter_I","H_PilotHelmetHeli_I","H_CrewHelmetHeli_I","H_MilCap_dgtl","H_HelmetCrew_O","H_PilotHelmetFighter_O","H_PilotHelmetHeli_O","H_CrewHelmetHeli_O","H_HelmetO_ocamo","H_HelmetLeaderO_ocamo","H_MilCap_ocamo","H_HelmetO_oucamo","H_HelmetLeaderO_oucamo","H_HelmetSpecO_ocamo","H_HelmetSpecO_blk"];
forbiddenHelmetsGuer = ["H_HelmetCrew_O","H_PilotHelmetFighter_O","H_PilotHelmetHeli_O","H_CrewHelmetHeli_O","H_HelmetO_ocamo","H_HelmetLeaderO_ocamo","H_MilCap_ocamo","H_HelmetO_oucamo","H_HelmetLeaderO_oucamo","H_HelmetSpecO_ocamo","H_HelmetSpecO_blk","H_HelmetB","H_HelmetB_camo","H_HelmetB_paint","H_HelmetB_light","H_HelmetB_plain_mcamo","H_HelmetB_plain_blk","H_HelmetSpecB","H_HelmetSpecB_paint1","H_HelmetSpecB_paint2","H_HelmetSpecB_blk","H_Helmet_Kerry","H_HelmetB_grass","H_HelmetB_snakeskin","H_HelmetB_desert","H_HelmetB_black","H_HelmetB_sand","H_HelmetCrew_B","H_PilotHelmetFighter_B","H_PilotHelmetHeli_B","H_CrewHelmetHeli_B","H_MilCap_mcamo","H_HelmetB_light_grass","H_HelmetB_light_snakeskin","H_HelmetB_light_desert","H_HelmetB_light_black","H_HelmetB_light_sand"];
usingForbiddenHelmEast = false;
usingForbiddenHelmWest = false;
usingForbiddenHelmGuer = false;

_caller = _this select 0;

//actual Check Function
CheckIllegalHelms ={
_caller = _this select 0;
_pHelm = headgear _caller;
if (_pHelm == "") then {
			if ((_caller getVariable "Suspiciousness") > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")-0.001];	
			};
} else {
if (_pHelm in forbiddenHelmetsEast) then {usingForbiddenHelmEast = true;};
if (_pHelm in forbiddenHelmetsWest) then {usingForbiddenHelmWest = true;};
if (_pHelm in forbiddenHelmetsGuer) then {usingForbiddenHelmGuer = true;};

	if ((side _caller) == west) then {	//if _caller has disguised as WEST, dissallow EAST&GUER Helms
		if(usingForbiddenHelmWest) then {
			if (count (_caller nearEntities ["SoldierWB",30]) > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")+1];
				hint "getting suspicious";
			};
			0 = [_caller] execVM "Disguise\checkSuspicious.sqf";
			[_caller] call CheckIllegalHelms;
		} 
		else {	
			if ((_caller getVariable "Suspiciousness") > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")-0.001];	
			};
		};
	};
	
	if ((side _caller) == east) then {	//if _caller has disguised as EAST, dissallow WEST&GUER Helms
		if(usingForbiddenHelmEast) then {
			if (count (_caller nearEntities ["SoldierEB",30]) > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")+1];
				hint "getting suspicious";
			};
			0 = [_caller] execVM "Disguise\checkSuspicious.sqf";
			[_caller] call CheckIllegalHelms;
		} 
		else {	
			if ((_caller getVariable "Suspiciousness") > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")-0.001];	
			};
		};
	};
	
	if ((side _caller) == resistance) then {	//if _caller has disguised as GUER, dissallow EAST&WEST Helms
		if(usingForbiddenHelmGuer) then {
			if (count (_caller nearEntities ["SoldierGB",30]) > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")+1];
				hint "getting suspicious";
			};
			0 = [_caller] execVM "Disguise\checkSuspicious.sqf";
			[_caller] call CheckIllegalHelms;
		} 
		else {	
			if ((_caller getVariable "Suspiciousness") > 0) then {
				_caller setVariable ["Suspiciousness", (_caller getVariable "Suspiciousness")-0.001];	
			};				
		};
	};
};
};

[_caller] call CheckIllegalHelms;