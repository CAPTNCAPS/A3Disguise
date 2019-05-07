_caller = _this select 0;
if ((_caller getVariable "Suspiciousness") > 600) then {
	hint "Cover Blown!"; 
	_caller addRating -5000;
	exit;
};
sleep 1;