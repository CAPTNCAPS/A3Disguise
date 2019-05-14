//Addon
class CfgPatches
{
    class CAPS_Disguise
    {
        author = "DasCapschen";
        name = "Disguise";
        //list of module names (same as CfgVehicles!)
        units[] = {
            CAPS_ModuleDisguise,
            CAPS_ModuleRestrictedArea,
            CAPS_ModuleAuthorizedArea,
            CAPS_Passport_Base,
            CAPS_Passport_East,
            CAPS_Passport_West
        };
        requiredVersion = 1.0;
        requiredAddons[] = { "A3_Modules_F" };
    };
};

//register the one sound we have here
class CfgSounds
{
    sounds[] = { CAPS_whistle };

    class CAPS_whistle 
    {
        name = "Whistle";
        sound[] = { "\CAPS_Disguise\Sounds\whistle.ogg", db+12, 1.0, 50 };
        titles[] = { 0, "" };
    };
};

//Modules
#include "cfgFunctions.hpp"
#include "cfgVehicles.hpp"

//Passport Object
//#include "cfgWeapons.hpp"

//GUI
#include "RscTitles.hpp"