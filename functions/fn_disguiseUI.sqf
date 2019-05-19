/*
 * Author: DasCapschen
 * LOCALLY
 */

_display = _this select 0;
_disguiseCtrl = (_display displayCtrl 1200);
_rankCtrl = (_display displayCtrl 1201);
_authCtrl = (_display displayCtrl 1202);
_bg = (_display displayCtrl 2200);

if( (isNull _display) || { isNil{_disguiseCtrl} } || { isNil{_rankCtrl} } || { isNil{_authCtrl} } || { isNil{_bg} } ) exitWith
{
	false
};

while {true} do 
{
	_disguiseCtrl ctrlShow false;
	_rankCtrl ctrlShow false;
	_authCtrl ctrlShow false;

	if( (player getVariable "disguised") || {player getVariable "suspiciousness" > 0} ) then 
	{
		_suspiciousness = player getVariable "suspiciousness";

		_disguiseCtrl ctrlShow true;

		_white = [1,1,1];
		_yellow = [0.8, 0.8, 0.1];
		_red = [0.8, 0.1, 0.1];
		_color = _white;
		if( _suspiciousness <= 50 ) then 
		{
			_color = [ _white, _yellow, (_suspiciousness/50.0) ] call BIS_fnc_lerpVector;
		}
		else 
		{
			_color = [_yellow, _red, (_suspiciousness/100.0)] call BIS_fnc_lerpVector;
		};

		//add alpha values back
		_color pushBack 1;
		_white pushBack 1;
		_yellow pushBack 1;
		_red pushBack 1;

		_disguiseCtrl ctrlSetTextColor (_color);

		if( player getVariable "inRestrictedArea" ) then 
		{
			_rankCtrl ctrlShow true;
			_rankCtrl ctrlSetTextColor _white;
			if( player getVariable "seen" ) then { _rankCtrl ctrlSetTextColor _yellow; };
			if( player getVariable "illegalRestricted" ) then { _rankCtrl ctrlSetTextColor _red; };
		};

		if( player getVariable "inAuthorizedArea" ) then
		{
			_authCtrl ctrlShow true;
			_authCtrl ctrlSetTextColor _white;
			if( player getVariable "seen" ) then { _authCtrl ctrlSetTextColor _yellow; };
			if( player getVariable "illegalAuthorized" ) then { _authCtrl ctrlSetTextColor _red; };
		};
	};

	sleep 2;
};

true
