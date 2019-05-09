/* AUTHOR: DasCapschen
 * 
 */

params["_logic", "_units", "_activated"];

_areaNo = _logic getVariable "areaNumber";     //unique!
_document = _logic getVariable "authDocument"; //not unique

{
    if( _x isKindOf "Man" ) then
    {
        _x addAction [
            "Show Pass",
            { 
                _doc = "authDocument" + str(_this select 3 select 0);
                if ( _caller getVariable _doc ) then 
                {
                    _area = "authFor" + str(_this select 3 select 1);
                    _caller setVariable [ _area, true ];
                }
                else
                {
                    hint "you don't have the correct documents";
                };
            },
            [_document, _areaNo], 1, false, true, "", "_this getVariable ""auth""", 3
        ];
    }
    else
    {
        _x setTriggerActivation ["ANYPLAYER", "PRESENT", true];
        _x setTriggerStatements [
            "this",
            "{ _x setVariable ["inAuthorizedArea", true]; }forEach thisList;",
            "{ _x setVariable ["inAuthorizedArea", false]; }forEach thisList;"
        ];
    }
} forEach _units;
