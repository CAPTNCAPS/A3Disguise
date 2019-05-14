//actual modules. 1 class per module.
class CfgVehicles
{
    class Items_base_F;
    
    //should act like "intel" files, etc
    class CAPS_Passport_Base : Items_base_F
    {
        author = "DasCapschen";
        scope = 0;
        //picture = "\CAPS_Disguise\images\passport.paa";
        editorCategory = "EdCat_Things";
        editorSubcategory = "EdSubcat_Intel";

        //as in Land_File1_F
        faction = "Default";
        simulation = "thingX";
        vehicleClass = "Small_items";
        
        class EventHandlers
        {
            init = "_this call CAPS_fnc_initPassportObject;";
        };
        
        class Attributes //3DEN Editor Attributes
        {
            class authDocument
            {
                property = "CAPS_Passport_authDocument";
                
                displayName = "Document Number";
                tooltip = "Allows access to all ""authorizedAreas"" with the same document number.";
                
                control = "EditShort"; //what input field to show in Eden
                
                //what "script" to run to save this attribute to the object
                expression = "_this setVariable ['%s', _value];";
                defaultValue = "0";
                
                unique = 0; //more than one object can have the same value
                validate = "number"; //input has to be a number
                //condition = "1"; //optional
                typeName = "NUMBER"; //save this value as a number!
            };
        };
    };
    
    class CAPS_Passport_East : CAPS_Passport_Base
    {
        displayName = "Passport (East)";
        scope = 2;
        scopeCurator = 2;
        model = "\CAPS_Disguise\models\passport_east.p3d";
        
        /*
        class TransportItems
        {
            class CAPS_Passport_East
            {
                name = "CAPS_Passport_East";
                count = 1;
            };
        };
        */
    };
    
    class CAPS_Passport_West : CAPS_Passport_Base
    {
        displayName = "Passport (West)";
        scope = 2;
        scopeCurator = 2;
        model = "\CAPS_Disguise\models\passport_west.p3d";
        
        /*
        class TransportItems
        {
            class CAPS_Passport_West
            {
                name = "CAPS_Passport_West";
                count = 1;
            };
        };
        */
    };
    
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
    
    class CAPS_ModuleBase : Module_F
    {
        scope = 0;
        author = "DasCapschen";
        category = "CAPS_Stealth";
        is3DEN = 0; //run init function inside Eden?
        
        scopeCurator = 0; //don't show in Zeus
        curatorInfoType = ""; //menu to show when placed down by Zeus
        
        isGlobal = 1; //0 server, 1 global, 2 persistent global
        isTriggerActivated = 0; //wait for all synced triggers to active
        isDisposable = 0; //disable after activating once
    };

    class CAPS_ModuleGivePass : CAPS_ModuleBase
    {
        scope = 2;
        displayName = "Give Document";

        function = "CAPS_fnc_giveDocument";
        functionPriority = 1;

        class Attributes : AttributesBase
        {
            //arguments shared by specific modules
            class Units : Units
            {
                //sync playable units here!
                property = "CAPS_ModuleDisguise_Units";
            };

            class DocumentNumber
            {
                property = "CAPS_ModuleGivePass_DocumentNumber";
                displayName = "Document Number";
                tooltip = "Which document? Use Numbers > 0";
                
                expression = "_this setVariable ['%s', _value];";
                
                control = "EditShort";
                typeName = "NUMBER";
                defaultValue = "0";
                validate = "number";
            };

            class ModuleDescription : ModuleDescription {};
        };

        class ModuleDescription : ModuleDescription
        {
            description[] = {
                "Gives all synced units the document with document number given in attributes.",
                "Adds an action for players to pick up the document."
            };
            //synced entities
            sync[] = { "AnyBrain" };
        };
    };

    class CAPS_ModuleDisguise : CAPS_ModuleBase
    {
        scope = 2; //show in editor
        displayName = "Disguise";
        //icon = "";

        //function triggered
        function = "CAPS_fnc_moduleDisguise";
        functionPriority = 1; //lower is higher

        //3den Editor Attributes!
        class Attributes : AttributesBase
        {
            //arguments shared by specific modules
            class Units : Units
            {
                //sync playable units here!
                property = "CAPS_ModuleDisguise_Units";
            };

            class StealUniform
            {
                property = "CAPS_ModuleDisguise_StealUniform";
                displayName = "Steal Uniform";
                tooltip = "Should synced units be allowed to steal ANY other units uniforms?";
                
                expression = "_this setVariable ['%s', _value];";
                
                control = "Checkbox";
                typeName = "BOOL";
                defaultValue = "true";
            };
            
            class Whistle
            {
                property = "CAPS_ModuleDisguise_Whistle";
                displayName = "Whistle";
                tooltip = "Should synced units be allowed to whistle to attract enemy AI to their position?";
                
                expression = "_this setVariable ['%s', _value];";
                
                control = "Checkbox";
                typeName = "BOOL";
                defaultValue = "true";
            };
            
            class ThrowStone
            {
                property = "CAPS_ModuleDisguise_Throw";
                displayName = "Throw Stones";
                tooltip = "Should synced units be allowed to throw stones to attract enemy AI to the position of the impact?";
                
                expression = "_this setVariable ['%s', _value];";
                
                control = "Checkbox";
                typeName = "BOOL";
                defaultValue = "true";
            };
            
            class Authorization
            {
                property = "CAPS_ModuleDisguise_Auth";
                displayName = "Authorization";
                tooltip = "Enable this if you use the authorizedArea module.";
                
                expression = "_this setVariable ['%s', _value];";
                
                control = "Checkbox";
                typeName = "BOOL";
                defaultValue = "true";
            };
            
            class RankRestrictions
            {
                property = "CAPS_ModuleDisguise_Rank";
                displayName = "Restrictions";
                tooltip = "Enable this if you use the restrictedArea module.";
                
                expression = "_this setVariable ['%s', _value];";
                
                control = "Checkbox";
                typeName = "BOOL";
                defaultValue = "true";
            };
            
            //in this case, inheriting is necessary, since Combo needs to be filled with values!
            class CheckGear : Combo
            {
                property = "CAPS_ModuleDisguise_CheckGear";
                displayName = "Check Gear";
                tooltip = "Should AI become suspicious if player is using wrong gear?";
                typeName = "NUMBER";
                defaultValue = "3";
                expression = "_this setVariable ['%s', _value];";
                class Values 
                {
                    class None { name = "None"; value = 0; };
                    class Weap { name = "Weapons only"; value = 1; };
                    class Gear { name = "Clothes only"; value = 2; };
                    class Both { name = "Weapons and Clothes"; value = 3; };
                };
            };
            
            class BLUEWeapons {
                displayName = "Allowed Weapons BLUFOR";
                property = "CAPS_ModuleDisguise_BlueWeapons";
                control = "EditArray";
                expression = "_this setVariable ['%s', _value];";
            };
            class BLUEClothing {
                displayName = "Allowed Clothing BLUFOR";
                property = "CAPS_ModuleDisguise_BlueClothes";
                control = "EditArray";
                expression = "_this setVariable ['%s', _value];";
            };
            
            class REDWeapons {
                displayName = "Allowed Weapons OPFOR";
                property = "CAPS_ModuleDisguise_RedWeapons";
                control = "EditArray";
                expression = "_this setVariable ['%s', _value];";
            };
            class REDClothing {
                displayName = "Allowed Clothing OPFOR";
                property = "CAPS_ModuleDisguise_RedClothes";
                control = "EditArray";
                expression = "_this setVariable ['%s', _value];";
            };
            
            class GREENWeapons {
                displayName = "Allowed Weapons Independent";
                property = "CAPS_ModuleDisguise_GreenWeapons";
                control = "EditArray";
                expression = "_this setVariable ['%s', _value];";
            };
            class GREENClothing {
                displayName = "Allowed Clothing Independent";
                property = "CAPS_ModuleDisguise_GreenClothes";
                control = "EditArray";
                expression = "_this setVariable ['%s', _value];";
            };
            
            //should be last
            class ModuleDescription : ModuleDescription {};
        };

        class ModuleDescription : ModuleDescription
        {
            description[] = {
                "Enables disguise system, allowing players to change uniform to that of a dead enemy and switch sides and go undercover."
            };
            //synced entities
            sync[] = { "AnyPlayer" };
        };
    }; //end ModuleDisguise
    
    class CAPS_ModuleRestrictedArea : CAPS_ModuleBase
    {
        scope = 2;
        displayName = "Restricted Area";
        //icon = "";
        
        function = "CAPS_fnc_moduleRestrictedArea";
        functionPriority = 1;
        
        class Attributes : AttributesBase
        {
            class Units : Units
            {
                property = "CAPS_ModuleRestrictedArea_Units";
            };
            
            //I hope rank works here ; exists in Cfg3den ; but not on wiki
            class Rank
            {
                property = "CAPS_ModuleRestricted_Rank";
                displayName = "Rank";
                tooltip = "Which rank is required to be in this area?";
                
                expression = "_this setVariable ['%s', _value];";
                
                control = "Rank";
                typeName = "STRING";
                defaultValue = """private"""; //expression
            };
            
            class ModuleDescription : ModuleDescription {};
        };
        
        class ModuleDescription : ModuleDescription
        {
            description[] = {
                "Creates a restricted zone which requires the player to have at least the specified rank (or higher).",
                "Players who have a lower rank will slowly gain suspiciousness while in the area.",
                "If synced to multiple triggers, they create a single area!"
            };
            sync[] = {"EmptyDetector"}; //synced entities
            
        };
    };

    class CAPS_ModuleAuthorizedArea : CAPS_ModuleBase
    {
        scope = 2;
        displayName = "Authorized Area";
        //icon = "";
        
        function = "CAPS_fnc_moduleAuthorizedArea";
        functionPriority = 1; 
        
        class Attributes : AttributesBase
        {
            class Units : Units
            {
                property = "CAPS_ModuleAuthorizedArea_Units";
            };
		
            class DocumentNumber
            {
                property = "CAPS_ModuleAuthorized_DocumentNumber";
                displayName = "Document Number";
                tooltip = "Which document is required to authorize the player for this area? Use Numbers > 0";
                
                expression = "_this setVariable ['%s', _value];";
                
                control = "EditShort";
                typeName = "NUMBER";
                defaultValue = "0";
                validate = "number";
            };
		
            class AreaNumber
            {
                property = "CAPS_ModuleAuthorized_AreaNumber";
                displayName = "Area Number";
                tooltip = "The area number for this area. Must be unique. Used for internal scripting. If multiple triggers are synced to this module, then they all define 1 Area.";
                
                expression = "_this setVariable ['%s', _value];";
                
                control = "EditShort";
                typeName = "NUMBER";
                defaultValue = "0";
                unique = 1;
                validate = "number";
            };
		
            class ModuleDescription : ModuleDescription {};
        };
        
        class ModuleDescription : ModuleDescription
        {
            description[] = {
                "Creates an area the player must authorize for before entering.",
                "Synced triggers create the area (multiple triggers still count as 1 area!)",
                "Synced AIs are guards the player must show a pass with the correct document number to in order to get authorized.",
                "Unauthorized players will quickly gain suspiciousness."
            };
            sync[] = { "EmptyDetector", "AnyAI" }; //synced entities
        };
    };

}; //end cfgVehicles

class CfgFactionClasses
{
    class NO_CATEGORY;
    class CAPS_Stealth : NO_CATEGORY
    {
        displayName = "Stealth";
    };
};
