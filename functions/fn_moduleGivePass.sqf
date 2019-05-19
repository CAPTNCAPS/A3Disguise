/*
 * Author: CAPTNCAPS
 */


params["_logic", "_units", "_activated"];

_number = _logic getVariable "DocumentNumber";

{
	_x setVariable ["authDocument", _number];
} forEach _units;