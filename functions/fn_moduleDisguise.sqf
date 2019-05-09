/* AUTHOR: DasCapschen
 * 
 */

params["_logic", "_units", "_activated"];

/* those are module parameters, they DO have a valid value! */

_steal = _logic getVariable "stealUniform";
_whistle = _logic getVariable "whistle";
_throw = _logic getVariable "throw";
_auth = _logic getVariable "auth";
_restricted = _logic getVaraible "restricted";
_gear = _logic getVariable "checkGear";

//enabling  a function adds that function to an array
//all those functions in the array will be executed in the main loop!
//main loop runs for all synced units!! (so don't sync many!)

if ( _steal ) then 
{
    // add "stealUniform" action to ALL units.
    // allow synced units to do this action
    [_units] call CAPS_fnc_initializeDisguise;
};

//initialisation
{
    if ( _whistle ) then 
    {
        //add "whistle" action to all synced units
        [_x, "whistle"] call CAPS_fnc_addAction;
    };
    
    if ( _throw ) then
    {
        //add "throw" action to all synced units
        [_x, "throw"] call CAPS_fnc_addAction;
    };
    
    if ( _auth ) then
    {
        //enable checking if synced units enter authorized areas
        [_x] call CAPS_fnc_enableAuth;
    };
    
    if( _restricted ) then
    {
        //enable checking if synced units enter restricted areas
        [_x] call CAPS_fnc_enableRestricted;
    };
    
    //enable gear checking loop
    [_x, _gear] call CAPS_fnc_enableGearCheck;
    
    //actually start the main loop
    //!spawn! must run scheduled!
    0 = [_x] spawn CAPS_fnc_startMainLoop;
    
} forEach _units;
