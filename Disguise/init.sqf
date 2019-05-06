/*
*	Author: DasCapschen
*/

// initialise all units, (silentkill, eventHandlers, ...)
0 = [] execVM "Disguise\initUnits.sqf";

// add whistle and throwStone player actions
player addAction ["Whistle", "Disguise\whistle.sqf"];
player addAction ["Throw Stone", "Disguise\throwStone.sqf"];

player setVariable ["Suspiciousness", 0];
player setVariable ["wrongGearCount", 0];

// periodically check gear of player
0 = [] execVM "Disguise\checkGear.sqf";

// periodically check suspiciousness of player
0 = [] execVM "Disguise\suspiciousness.sqf";
