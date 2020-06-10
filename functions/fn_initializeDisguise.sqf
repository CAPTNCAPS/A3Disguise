/* AUTHOR: DasCapschen
 * Adds "Silent Kill", "Disguise", "Take pass" and "Hide Body" to ALL units.
 * Adds "Change Back" to synced units.
 * Makes AI DUMB!! (disable FSM, force SAFE, spotting skill = 0)
 */

_units = _this select 0;

//for all synced units
{
    _x addAction [
        "<t color='#ff4444'>Change back</t>", 
        {
            _unit = (_this select 3 select 0);
            removeUniform _unit; 
            _unit forceAddUniform (_unit getVariable "originalUniform"); 
            _unit removeAction (_this select 2);
            [_unit] joinSilent createGroup (_unit getVariable "originalSide");
            _unit setUnitRank (_unit getVariable "originalRank");
            _unit setVariable ["disguised", false];
        }, 
        [_x], 1, false, true, "", "(_this == _target) && (_this getVariable 'disguised')"
    ];
    
    _x setVariable ["suspiciousness", 0];
    _x setVariable ["disguised", false];
    _x setVariable ["actingIllegal", false];
    
    _x setVariable ["originalRank", rank _x];
    _x setVariable ["originalUniform", uniform _x];
    _x setVariable ["originalSide", side _x];
    
}forEach _units;

//for EVERY unit
{
    _x setBehaviour "SAFE";
    _x disableAI "FSM";
    _x setSkill ["spotDistance", 0];
    _x setSkill ["spotTime", 0];
    
    _silentkill = _x addAction ["<t color='#ff4444'>Silentkill</t>", 
        {
            [(_this select 0), (_this select 1)] spawn CAPS_fnc_silentkill;
        }, 
        nil, 1, false, true, "" ,
        "(_target != _this) && !(isNil{ _this getVariable 'disguised' })", 
        3
    ];
    
    _x setVariable ["silentkill_id", _silentkill];
    
    _x addEventHandler["Killed", {
        (_this select 0) removeAction ((_this select 0) getVariable "silentkill_id");
    
        (_this select 0) addAction ["<t color='#ffff44'>Disguise</t>", 
            {
                [(_this select 0),(_this select 1),(_this select 2)] spawn CAPS_fnc_stealUniform
            }, 
            nil, 1, false, true, "", "true", 3
        ];
        
        (_this select 0) addAction ["<t color='#ffff44'>HideBody</t>", 
            {
                hideBody (_this select 0)
            }, 
            nil, 1 ,false, true, "", "true", 3
        ];
        
        
        if( !isNil{(_this select 0) getVariable "authDocument"} ) then 
        {
            (_this select 0) addAction ["Take Pass", 
                { 
                    _doc = "authDocument" + str( (_this select 0) getVariable "authDocument" );
                    (_this select 1) setVariable [ _doc, true ];
                    (_this select 0) removeAction (_this select 2);
                }, 
                nil, 1, false, true, "", "true", 3
            ];
        };
    }];
} forEach (allUnits);
