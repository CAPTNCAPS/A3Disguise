/* AUTHOR: DasCapschen
 * 
 */

params["_logic", "_units", "_activated"];

//attributes saved in logic under their classname
_areaNo = _logic getVariable "AreaNumber";     //unique!
_document = _logic getVariable "DocumentNumber"; //not unique

_units = synchronizedObjects _logic; //originally passed _units DOESN'T CONTAIN TRIGGERS

{        
    if( _x isKindOf "Man" ) then //synced AI
    {
        _x addAction [
            "Show Pass",
            { 
                _caller = _this select 1;
                _doc = "authDocument" + str(_this select 3 select 0);
                if ( !isNil{_caller getVariable _doc} && {_caller getVariable _doc} ) then 
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
    else //synced Triggers
    {
        _x setVariable ["areaNumber", _areaNo];
        _x setTriggerActivation ["ANYPLAYER", "PRESENT", true];
        
        [
            _x,
            { 
                _num = "authFor"+str(_trigger getVariable "areaNumber");
                if (isNil{_x getVariable _num} || {!(_x getVariable _num)}) then 
                {
                    _x setVariable ["illegalInArea", true];
                };
            },
            {
                _x setVariable["illegalInArea", false];
            },
            false
        ] call CAPS_fnc_triggerListChanged;
    };
} forEach _units;
