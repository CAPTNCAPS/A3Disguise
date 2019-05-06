/*
*	Author: DasCapschen
*/

while {true} do
{
	_wrongGear = (player getVariable "wrongGearCount");

    _search = "";
    switch( side player ) do
    {
        case west: { _search = "SoldierWB"; };
        case east: { _search = "SoldierEB"; };
    };
    
    //find enemies near player, but not player
    _enemies = player nearEntities [_search, 50];
    _enemies = _enemies - [player];
    
    if( count _enemies > 0 ) then 
    {
        if (_wrongGear > 0) then
        {
            player setVariable ["Suspiciousness", (player getVariable "Suspiciousness") + _wrongGear ];
        }
        else 
        {
            if ((player getVariable "Suspiciousness") > 0) then 
            {
                player setVariable ["Suspiciousness", (player getVariable "Suspiciousness") - 1 ];
            }
        };

        if ((player getVariable "Suspiciousness") > 100) then 
        {
            hint "Cover Blown!"; 
            player addRating -5000;
            exit;
        };
    }
	
	sleep 1;
};
