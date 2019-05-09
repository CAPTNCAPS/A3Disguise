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
    
    class CAPS_ModuleBase : Module_F
    {
        scope = 0;
        category = "Stealth";
        is3DEN = 0; //run init function inside Eden?
        
        isGlobal = 1; //0 server, 1 global, 2 persistent global
        isTriggerActivated = 0; //wait for all synced triggers to active
        isDisposable = 1; //disable after activating once
    };

    class CAPS_ModuleDisguise : CAPS_ModuleBase
    {
        scope = 2; //show in editor
        displayName = "Disguise";
        icon = "";

        //function triggered
        function = "CAPS_fnc_moduleDisguise";
        functionPriority = 1; //lower is higher

        //menu to show when placed down by Zeus
        curatorInfoType = "";

        //3den Editor Attributes!
        class Attributes : AttributesBase
        {
            //arguments shared by specific modules
            class Units : Units
            {
                //sync playable units here!
                property = "CAPS_ModuleDisguise_Units";
            };

            class StealUniform : Checkbox
            {
                property = "CAPS_ModuleDisguise_StealUniform";
                displayName = "Steal Uniform";
                tooltip = "Should synced units be allowed to steal ANY other units uniforms?";
                typeName = "BOOL";
                defaultValue = "true";
            };
            
            class Whistle : Checkbox
            {
                property = "CAPS_ModuleDisguise_Whistle";
                displayName = "Whistle";
                tooltip = "Should synced units be allowed to whistle to attract enemy AI to their position?";
                typeName = "BOOL";
                defaultValue = "true";
            };
            
            class ThrowStone : Checkbox
            {
                property = "CAPS_ModuleDisguise_Throw";
                displayName = "Throw Stones";
                tooltip = "Should synced units be allowed to throw stones to attract enemy AI to the position of the impact?";
                typeName = "BOOL";
                defaultValue = "true";
            };
            
            class Authorization : Checkbox
            {
                property = "CAPS_ModuleDisguise_Auth";
                displayName = "Authorization";
                tooltip = "Enable this if you use the authorizedArea module.";
                typeName = "BOOL";
                defaultValue = "true";
            };
            
            class RankRestrictions : Checkbox
            {
                property = "CAPS_ModuleDisguise_Rank";
                displayName = "Restrictions";
                tooltip = "Enable this if you use the restrictedArea module.";
                typeName = "BOOL";
                defaultValue = "true";
            };
            
            class CheckGear : Combo
            {
                property = "CAPS_ModuleDisguise_CheckGear";
                displayName = "Check Gear";
                tooltip = "Should AI become suspicious if player is using wrong gear?";
                typeName = "NUMBER";
                defaultValue = "3";
                class Values 
                {
                    class None { name = "None"; value = 0; };
                    class Weap { name = "Weapons only"; value = 1; };
                    class Gear { name = "Clothes only"; value = 2; };
                    class Both { name = "Weapons and Clothes"; value = 3; };
                };
            };

            //should be last
            class ModuleDescription : ModuleDescription {};
        };

        class ModuleDescription : ModuleDescription
        {
            description = "Short Description";
            sync[] = {}; //synced entities

        };
    }; //end ModuleDisguise

    class CAPS_ModuleRestrictedArea : CAPS_ModuleBase
    {
        scope = 2;
        dispalyName = "Restricted Area";
        icon = "";
        
        function = "CAPS_fnc_moduleRestrictedArea";
        functionPriority = 1;
        
        curatorInfoType = "";
        
        class Attributes : AttributesBase
        {
            class Units : Units
            {
                property = "CAPS_ModuleRestrictedArea_Units";
            };
            
            //I hope rank works here ; exists in Cfg3den ; but not on wiki
            class Rank : Rank
            {
                property = "CAPS_ModuleRestricted_Rank";
                displayName = "Rank";
                tooltip = "Which rank is required to be in this area?";
                typeName = "STRING";
                defaultValue = """private"""; //expression
            };
            
            class ModuleDescription : ModuleDescription {};
        };
        
        class ModuleDescription : ModuleDescription
        {
            description = "Short Description";
            sync[] = {}; //synced entities
            
        };
    };

    class CAPS_ModuleAuthorizedArea : CAPS_ModuleBase
    {
        scope = 2;
        displayName = "Authorized Area";
        icon = "";
        
        function = "CAPS_fnc_moduleAuthorizedArea";
        functionPriority = 1; 
        
        curatorInfoType = "";
        
        class Attributes : AttributesBase
        {
            class Units : Units
            {
                property = "CAPS_ModuleAuthorizedArea_Units";
            };
		
	    class Document : EditShort
	    {
	        property = "CAPS_ModuleAuthorized_Document";
		displayName = "Document Number";
		tooltip = "";
		typeName = "NUMBER";
		defaultValue = "1";
		validate = "number";
		unique = 0;
	    };
		
	    class AreaNumber : EditShort
	    {
	        property = "CAPS_ModuleAuthorized_AreaNumber";
		displayName = "Area Number";
		tooltip = "";
		typeName = "NUMBER";
		defaultValue = "1";
		unique = 1;
		validate = "number";
	    };
		
            class ModuleDescription : ModuleDescription {};
        };
        
        class ModuleDescription : ModuleDescription
        {
            description = "Short Description";
            sync[] = {}; //synced entities
            
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
