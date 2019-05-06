/*
*	Author: DasCapschen
*/

_rankList = [ "PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL" ];
_unitFOV = 120;

while {true} do
{
	_wrongGear = (player getVariable "wrongGearCount");
    
	//idea: run this array check less often than the rest?
	
    //find enemies near player, but not player
    _temp = (player nearEntities ["Man", 50]) - [player];
    _enemies = [];
	{ 
		if( (side _x) == (side player) ) then 
		{ 
			_epos = position _x;
			_ppos = position player;
			
			//if player is in enemies vision cone
			if( [_epos, direction _x, _unitFOV, _ppos] call BIS_fnc_inAngleSector ) then 
			{
				//if there is NOT something between player and enemy (line of sight)
				//TODO: this doesn't really work that well. and I feel as if it makes it slow.
				//if( ! lineIntersects[eyePos _x, _ppos, _x, player] ) then 
				//{
					_enemies = _enemies + [_x]; 
				//};
			};
		}; 
	} forEach _temp;
    

    if( count _enemies > 0 ) then 
    {
		hint "warning, enemies nearby!";
		if( (player getVariable "actingIllegal") ) then 
		{
			hint "Cover Blown!";
			player addRating -5000;
		};
		
		if( (player getVariable "inRestrictedArea") ) then 
		{
			//find out the needed and player rank (stored as strings, unfortunately)
			_playerRank = 0;
			_neededRank = 0;
			for "_i" from 0 to (count _rankList)-1 do 
			{
				if( (rank player) == (_rankList select _i) ) then 
				{
					_playerRank = _i;
				};
				if( (player getVariable "areaRank") == (_rankList select _i) ) then 
				{
					_neededRank = _i;
				};
			};
			
			if( _playerRank < _neededRank ) then 
			{
				hint "you shouldn't be here!"; 
				player setVariable ["suspiciousness", (player getVariable "suspiciousness") + 5 ];
			};
		};
		
		if (_wrongGear > 0) then
        {
			hint "getting suspicious"; 
            player setVariable ["suspiciousness", (player getVariable "suspiciousness") + _wrongGear ];
        }
        else 
        {
            if ((player getVariable "suspiciousness") > 0) then 
            {
                player setVariable ["suspiciousness", (player getVariable "suspiciousness") - 1 ];
            }
        };

        if ((player getVariable "Suspiciousness") > 100) then 
        {
            hint "Cover Blown!"; 
            player addRating -5000;
        };
    };
	
	sleep 1;
};
