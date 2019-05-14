/*
 * Author: DasCapschen
 */

_unit = _this select 0;

cutRsc["CAPS_DisguiseUI", "PLAIN"];

_display = findDisplay 1337;
_disguiseCtrl = (_display displayCtrl 1200);
_rankCtrl = (_display displayCtrl 1201);
_authCtrl = (_display displayCtrl 1202);

if( isNil{_display} || { isNil{_disguiseCtrl} } || { isNil{_rankCtrl} } || { isNil{_authCtrl} } ) exitWith{false};

while {true} do 
{
	_disguiseCtrl ctrlShow false;
	_rankCtrl ctrlShow false;
	_authCtrl ctrlShow false;

	if( (_unit getVariable "disguised") || {_unit getVariable "suspiciousness" > 0} ) then 
	{
		_suspiciousness = _unit getVariable "suspiciousness";

		_disguiseCtrl ctrlShow true;

		_white = [1,1,1,1];
		_yellow = [0.8, 0.8, 0.1, 1];
		_red = [0.8, 0.1, 0.1, 1];
		_color = _white;
		if( _seen <= 50 ) then 
		{
			_color = [ _white, _yellow, (_suspiciousness/50.0) ] call BIS_fnc_lerpVector;
		}
		else 
		{
			_color = [_yellow, _red, (_suspiciousness/100.0)] call BIS_fnc_lerpVector;
		};

		_disguiseCtrl ctrlSetTextColor _color;

		if( _unit getVariable "inRestrictedArea" ) then 
		{
			_rankCtrl ctrlShow true;
			_rankCtrl ctrlSetTextColor _white;
			if( _unit getVariable "seen" ) then { _rankCtrl ctrlSetTextColor _yellow; };
			if( _unit getVariable "illegalRestricted" ) then { _rankCtrl ctrlSetTextColor _red; };
		};

		if( _unit getVariable "inAuthorizedArea" ) then
		{
			_authCtrl ctrlShow true;
			_authCtrl ctrlSetTextColor _white;
			if( _unit getVariable "seen" ) then { _authCtrl ctrlSetTextColor _yellow; };
			if( _unit getVariable "illegalAuthorized" ) then { _authCtrl ctrlSetTextColor _red; };
		};
	};

	sleep 2;
};

true