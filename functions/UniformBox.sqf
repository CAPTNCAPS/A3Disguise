/*
*	Author: CAPTNCAPS
*/

// 0 = [this] execVM "Disguise\UniformBox.sqf"; <- Init Field of Box

_box = _this select 0;
removeAllItems _box;
removeAllWeapons _box;
_box addAction ["Take NATO Uniform",{[(_this select 1)] call UniformNATO},nil,1,false,true,"","((_target distance _this) < 3)"];
_box addAction ["Take CSAT Uniform",{[(_this select 1)] call UniformCSAT},nil,1,false,true,"","((_target distance _this) < 3)"];
_box addAction ["Take AAF Uniform",{[(_this select 1)] call UniformAAF},nil,1,false,true,"","((_target distance _this) < 3)"];


UniformNATO={
_caller = _this select 0;
_caller forceAddUniform "U_B_CombatUniform_mcam";
[_caller] joinSilent grpNull;
_manN = "B_Soldier_F" createVehicle [0,0,0];
_groupN = group _manN;
sleep 0.1;
[_caller] joinSilent _groupN;	// DOES NOT WORK! 	DUNNO WHY!
sleep 0.1;
deleteVehicle _manN;
_caller addEventHandler ["Take", {0 = [(_this select 0)] execVM "Disguise\CheckGear.sqf";}];
0 = [_caller] execVM "Disguise\CheckGear.sqf";
};

UniformCSAT={
_caller = _this select 0;
_caller forceAddUniform "U_O_CombatUniform_ocamo";
[_caller] joinSilent grpNull;
_manC = "O_Soldier_F" createVehicle (position _caller);
_groupC = group _manC;
sleep 0.1;
[_caller] joinSilent _groupC;	// DOES NOT WORK!	DUNNO WHY!
sleep 0.1;
deleteVehicle _manC;
_caller addEventHandler ["Take", {0 = [(_this select 0)] execVM "Disguise\CheckGear.sqf";}];
0 = [_caller] execVM "Disguise\CheckGear.sqf";
};

UniformAAF={
_caller = _this select 0;
_caller forceAddUniform "U_I_CombatUniform";
[_caller] joinSilent grpNull;
_manA = "I_Soldier_F" createVehicle (position _caller);
_groupA = group _manA;
sleep 0.1;
[_caller] joinSilent _groupA;	// DOES NOT WORK!	DUNNO WHY!
sleep 0.1;
deleteVehicle _manA;
_caller addEventHandler ["Take", {0 = [(_this select 0)] execVM "Disguise\CheckGear.sqf";}];
0 = [_caller] execVM "Disguise\CheckGear.sqf";
};