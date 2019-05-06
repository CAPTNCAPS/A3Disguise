/*
*	Author: DasCapschen
*/

player setVariable ["inRestrictedArea", true];
player setVariable ["areaRank", (_this select 0)];

hint format ["you're in a restricted area of rank %1, your rank is %2", (_this select 0), (rank player)];