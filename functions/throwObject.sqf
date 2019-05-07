distractThrow={
	_caller = _this select 0;
	_pos = getPos cursorTarget;
	_enemy = _pos nearEntities ["Man",50];
	_caller playAction "ThrowGrenade";
	sleep 3;
	playSound3D ["a3\sounds_f\weapons\Grenades\Grenade_Roll.wss", player,false,_pos,1,1,0];
	_enemy doMove _pos;
};

{
	_x addAction ["Throw Stone", {[(_this select 1)] call distractThrow},nil,1,false,true,"","((_target distance _this) < 0.01)"];
}forEach allUnits;