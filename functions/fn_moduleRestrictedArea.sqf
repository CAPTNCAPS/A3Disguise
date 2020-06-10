/* AUTHOR: DasCapschen
 * makes synced triggers a Rank-Restricted area.
 */

params["_logic", "_units", "_activated"];

_units = synchronizedObjects _logic; //originally passed _units DOESN'T CONTAIN TRIGGERS

_rank = _logic getVariable "Rank";

{
    _x setVariable["rank", _rank];
    _x setTriggerActivation [ "ANYPLAYER", "PRESENT", true ];
    
    //trigger, fnc_forEach_enteringUnit, fnc_forEach_leavingUnit, call or spawn?
    [
        _x,
        { _x setVariable["inRestrictedArea", true]; _x setVariable["areaRank", _trigger getVariable "rank"]; },
        { _x setVariable["inRestrictedArea", false]; },
        false
    ] call CAPS_fnc_triggerListChanged;
}forEach _units;
