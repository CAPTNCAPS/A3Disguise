/* AUTHOR: DasCapschen
 * 
 */

params["_logic", "_units", "_activated"];

_document = _logic getVariable "authDocument";

{
    if( _x isKindOf "Man" ) then
    {
        _x addAction [
            "Show Pass",
            {}
        ];
    }
    else
    {
        _x setTriggerActivation ["ANYPLAYER", "PRESENT", true];
        _x setTriggerStatements [
            "this",
            "",
            ""
        ];
    }
} forEach _units;
