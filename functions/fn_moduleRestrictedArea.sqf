/* AUTHOR: DasCapschen
 * 
 */

params["_logic", "_units", "_activated"];

_rank = _logic getVariable "rank";

{
    _x setTriggerActivation [ "ANYPLAYER", "PRESENT", true ];
    _x setTriggerStatements[
        "this",
        "{ _x setVariable ["inRestrictedArea", true]; _x setVariable ["areaRank", _rank]; } forEach thisList;",
        "{ _x setVariable ["inRestrictedArea", false]; }forEach thisList;"
    ];
}forEach _units;
