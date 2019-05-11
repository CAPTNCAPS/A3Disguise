/*
    Author: DasCapschen
    like BIS_fnc_initIntelObject, but different
*/

//get param 1, default value "init", expect string
_mode = _this param [1, "init", [""]];

switch _mode do
{
    case "init": 
    {
        _object = _this param [0, objnull, [objnull]];
        _object addAction[ "Take", 
            { [_this, "action"] spawn CAPS_fnc_initPassportObject },
            nil, 1, true, true, "", "isplayer _this", 3
        ];
    };
    
    case "action":
    {
        _params = _this select 0;
        _target = _params select 0;     //passport
        _caller = _params select 1;     //player
        
        //get which document number, and authorize player for that
        _doc = "authDocument" + str(_target getVariable "authDocument");
        _caller setVariable [ _doc, true ];
        
        deleteVehicle _target; //remove the passport, it's been taken!
    };
};
