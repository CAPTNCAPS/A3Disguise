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

            class StealUniform
            {
                property = "CAPS_ModuleDisguise_StealUniform";
                displayName = "Steal Uniform";
                tooltip = "Should synced units be allowed to steal ANY other units uniforms?";
                
                control = "Checkbox";
                typeName = "BOOL";
                defaultValue = "true";
            };
            
            class Whistle
            {
                property = "CAPS_ModuleDisguise_Whistle";
                displayName = "Whistle";
                tooltip = "Should synced units be allowed to whistle to attract enemy AI to their position?";
                
                control = "Checkbox";
                typeName = "BOOL";
                defaultValue = "true";
            };
            
            class ThrowStone
            {
                property = "CAPS_ModuleDisguise_Throw";
                displayName = "Throw Stones";
                tooltip = "Should synced units be allowed to throw stones to attract enemy AI to the position of the impact?";
                
                control = "Checkbox";
                typeName = "BOOL";
                defaultValue = "true";
            };
            
            class Authorization
            {
                property = "CAPS_ModuleDisguise_Auth";
                displayName = "Authorization";
                tooltip = "Enable this if you use the authorizedArea module.";
                
                control = "Checkbox";
                typeName = "BOOL";
                defaultValue = "true";
            };
            
            class RankRestrictions
            {
                property = "CAPS_ModuleDisguise_Rank";
                displayName = "Restrictions";
                tooltip = "Enable this if you use the restrictedArea module.";
                
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
            class Rank
            {
                property = "CAPS_ModuleRestricted_Rank";
                displayName = "Rank";
                tooltip = "Which rank is required to be in this area?";
                
                control = "Rank";
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
		
            class DocumentNumber
            {
                property = "CAPS_ModuleAuthorized_DocumentNumber";
                displayName = "Document Number";
                tooltip = "Which document is required to authorize the player for this area?";
                
                control = "EditShort";
                typeName = "NUMBER";
                defaultValue = "1";
                validate = "number";
            };
		
            class AreaNumber
            {
                property = "CAPS_ModuleAuthorized_AreaNumber";
                displayName = "Area Number";
                tooltip = "The area number for this area. Must be unique. Used for internal scripting. If multiple triggers are synced to this module, then they all define 1 Area.";
                
                control = "EditShort";
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
