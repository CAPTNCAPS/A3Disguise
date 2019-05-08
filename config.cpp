//Addon
class CfgPatches
{
    class CAPS_Disguise
    {
        //list of module names (same as CfgVehicles!)
        units[] = {
            CAPS_ModuleDisguise,
            CAPS_ModuleRestrictedArea,
            CAPS_ModuleAuthorizedArea
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

#include "cfgVehicles.hpp"

#include "cfgFunctions.hpp"