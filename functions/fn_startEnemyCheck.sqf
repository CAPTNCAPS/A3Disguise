/*
*	Author: DasCapschen
*/

_unit = _this select 0;

_rankList = [ "PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL" ];
_unitFOV = 150;

while {true} do
{
	_wrongGear = (_unit getVariable "wrongGearCount");
    
	//idea: run this array check less often than the rest?
	
    //find enemies near _unit, but not _unit
    _temp = (_unit nearEntities ["Man", 50]) - [_unit];
    _enemies = [];
	{ 
		//finds all enemies of same side, who look at _unit and have sightline
		//apparently lineIntersects does not catch all terrain objects, so have to use both.
		// a && b => checks both
		// a && {b} => lazy evaluation!
		if( (side _x) == (side _unit)
			&& {[position _x, direction _x, _unitFOV, position _unit] call BIS_fnc_inAngleSector}
			//&& {! lineIntersects[eyePos _x, aimPos _unit, _x, _unit]}
			//&& {! terrainIntersectASL[eyePos _x, aimPos _unit]} ) then 
			&& {[objNull, "VIEW"] checkVisibility [eyepos _x, aimPos _unit] > 0.8} ) then
		{ 		
			_enemies pushBack _x; 
		}; 
	} forEach _temp;
    

    if( count _enemies > 0 ) then 
    {
		hint "warning, enemies nearby!";
        
        //if currently stealing uniform / killing / ...
		if( (_unit getVariable "actingIllegal") ) then 
		{
			hint "Cover Blown!";
			_unit addRating -5000;
		};
		
        //if in restricted area
		if( (_unit getVariable "inRestrictedArea") ) then 
		{
			//find out the needed and _unit rank (stored as strings, unfortunately)
			_playerRank = 0;
			_neededRank = 0;
			for "_i" from 0 to (count _rankList)-1 do 
			{
				if( (rank _unit) == (_rankList select _i) ) then 
				{
					_playerRank = _i;
				};
				if( (_unit getVariable "areaRank") == (_rankList select _i) ) then 
				{
					_neededRank = _i;
				};
			};
			
			if( _playerRank < _neededRank ) then 
			{
				hint "Rank too low!"; 
				_unit setVariable ["suspiciousness", (_unit getVariable "suspiciousness") + 5 ];
			};
		};
        
        //in in authorized area without authorization
        if( _unit getVariable "illegalInArea" ) then
        {
            hint "You're not authorized to be here!"; 
            _unit setVariable ["suspiciousness", (_unit getVariable "suspiciousness") + 15 ];
        };
		
        //if wearing wrong gear
		if (_wrongGear > 0) then
        {
			hint "getting suspicious"; 
            _unit setVariable ["suspiciousness", (_unit getVariable "suspiciousness") + _wrongGear ];
        }
        else 
        {
            if ((_unit getVariable "suspiciousness") > 0) then 
            {
                _unit setVariable ["suspiciousness", (_unit getVariable "suspiciousness") - 1 ];
            }
        };

        //too suspicious D:
        if ((_unit getVariable "Suspiciousness") > 100) then 
        {
            hint "Cover Blown!"; 
            _unit addRating -5000;
        };
    };
	
	sleep 1;
};
