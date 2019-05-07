//Addon
class CfgPatches
{
    class CAPS_Disguise
    {
        //list of module names (same as CfgVehicles!)
        units[] = {};
        requiredVersion = 1.0;
        requiredAddons[] = { "A3_Modules_F" };
    };
};

//register the one sound we have here
class CfgSounds
{
    //...
};

//actual modules. 1 class per module.
class CfgVehicles
{
    //base classes
    class Logic;
    class Module_F : Logic
    {
        class AttributesBase
        {
            class Default;
            class Edit;
            class Combo;
            class Checkbox;
            class CheckboxNumber;
            class ModuleDescription;
            class Units;
        };
        class ModuleDescription
        {
            class AnyBrain;
        };
    };

    class CAPS_ModuleDisguise : Module_F
    {
        scope = 2; //show in editor
        displayName = "Disguise";
        icon = "";
        category = "Modes";

        //function triggered
        function = "CAPS_fnc_moduleDisguise";
        functionPriority = 1; //lower is higher
        isGlobal = 1; //0 server, 1 global, 2 persistent global
        isTriggerActivated = 1; //wait for all synced triggers to active
        isDisposable = 1; //disable after activating once
        is3DEN = 0; //run init function inside Eden?

        //menu to show when placed down by Zeus
        curatorInfoType = "";

        //attributes (editor "attributes"!)
        class Attributes : AttributesBase
        {
            //arguments shared by specific modules
            class Units : Units
            {
                property = "CAPS_ModuleDisguise_Units";
            };

            //properties

            //should be last
            class ModuleDescription : ModuleDescription {};
        };

        class ModuleDescription : ModuleDescription
        {
            description = "Short Description";
            sync[] = {}; //synced entities

        };
    }; //end ModuleDisguise
}; //end cfgVehicles

class CfgFunctions
{
    class CAPS
    {
        class Modes
        {
            file = "CAPS_Disguise\functions";
            class moduleDisguise{};
        };
    };
};
