/*
*	Author: DasCapschen
*/

// initialise all units, (silentkill, eventHandlers, ...)
0 = [] execVM "Disguise\initUnits.sqf";

// add whistle and throwStone player actions
player addAction ["<t color='#4444ff'>Whistle</t>", "Disguise\whistle.sqf"];
player addAction ["<t color='#4444ff'>Throw Stone</t>", "Disguise\throwStone.sqf"];

//allow player to change back if he's disguised
player addAction ["<t color='#ff4444'>Change back</t>", {
	removeUniform player; 
	player forceAddUniform (player getVariable "originalUniform"); 
	player removeAction (_this select 2);
	[player] joinSilent createGroup (player getVariable "originalSide");
	player setUnitRank (player getVariable "originalRank");
	player setVariable ["disguised", false];
}, nil, 1, false, true, "", 'player getVariable "disguised"'];

player setVariable ["suspiciousness", 0];
player setVariable ["wrongGearCount", 0];

player setVariable ["disguised", false];
player setVariable ["actingIllegal", false];

player setVariable ["inRestrictedArea", false];
player setVariable ["areaRank", "COLONEL"];

player setVariable ["originalRank", rank player];
player setVariable ["originalUniform", uniform player];
player setVariable ["originalSide", side player];

// periodically check gear of player
0 = [] execVM "Disguise\checkGear.sqf";

// periodically check suspiciousness of player
0 = [] execVM "Disguise\suspiciousness.sqf";
