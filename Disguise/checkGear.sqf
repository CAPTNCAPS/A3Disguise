/*
*	Author: DasCapschen
*/

while {true} do 
{
	player setVariable ["wrongGearCount", 0];

	execVM "Disguise\checkPrimary.sqf";
	execVM "Disguise\checkSecondary.sqf";
	execVM "Disguise\checkHandgun.sqf";

	execVM "Disguise\checkClothing.sqf";

	sleep 5;
};
