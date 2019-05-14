/* AUTHOR: DasCapschen
 * 
 */

params["_logic", "_units", "_activated"];

/* those are module parameters, they DO have a valid value! */

_steal = _logic getVariable "StealUniform";
_whistle = _logic getVariable "Whistle";
_throw = _logic getVariable "ThrowStone";
_auth = _logic getVariable "Authorization";
_restricted = _logic getVariable "RankRestrictions";
_gear = _logic getVariable "CheckGear";

_gearWeapons = [];
_gearWeapons pushBack ( _logic getVariable "BLUEWeapons" );
_gearWeapons pushBack ( _logic getVariable "REDWeapons" );
_gearWeapons pushBack ( _logic getVariable "GREENWeapons" );

_gearClothing = [];
_gearClothing pushBack ( _logic getVariable "BLUEClothing" );
_gearClothing pushBack ( _logic getVariable "REDClothing" );
_gearClothing pushBack ( _logic getVariable "GREENClothing" );

//enabling  a function adds that function to an array
//all those functions in the array will be executed in the main loop!
//main loop runs for all synced units!! (so don't sync many!)

if ( _steal ) then 
{
    // add "stealUniform" action to ALL units.
    // allow synced units to do this action
    // uses a forEach loop, requires spawn
    [_units] spawn CAPS_fnc_initializeDisguise;
};

//initialisation
{
    if ( _whistle ) then 
    {
        //add "whistle" action to all synced units
        _x addAction [
        "<t color='#4444ff'>Whistle</t>",
            { [(_this select 0)] spawn CAPS_fnc_doWhistle; },
            nil, 1, false, true, "", "_this == _target"
        ]; 
    };
    
    if ( _throw ) then
    {
        //add "throw" action to all synced units
        _x addAction [
        "<t color='#4444ff'>Throw Stone</t>",
            { [(_this select 0)] spawn CAPS_fnc_doThrow; },
            nil, 1, false, true, "", "_this == _target"
        ]; 
    };
    
    if ( _auth ) then
    {
        //enable checking if synced units enter authorized areas
        _x setVariable ["enableAuth", true];
        _x setVariable ["illegalInArea", false];
    };
    
    if( _restricted ) then
    {
        //enable checking if synced units enter restricted areas
        _x setVariable["enableRestricted", true];
        _x setVariable["areaRank", "private"];
        _x setVariable["inRestrictedArea", false];
    };
    
    //start gear checking loop
    [_x, _gear, _gearWeapons, _gearClothing] spawn CAPS_fnc_startGearCheck;
    
    //start the main loop
    [_x] spawn CAPS_fnc_startEnemyCheck;

    //start the UI
    [_x] spawn CAPS_fnc_disguiseUI;
    
} forEach _units;
