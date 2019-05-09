class CfgWeapons
{
	class ItemCore;
	class InventoryItem_Base_F;

    //TODO: need to override Take action somehow, research!
	class CAPS_Passport_Base : ItemCore
	{
		author = "DasCapschen";
		scope = 0;	//don't show this ingame!
		model = "\CAPS_Disguise\models\passport.p3d";
		class ItemInfo : InventoryItem_Base_F
		{
			mass = 1;
		};
        
        class Attributes //3DEN Editor Attributes
        {
            class authDocument
            {
                displayName = "Document Number";
                tooltip = "Allows access to all \"authorizedAreas\" with the same document number.";
                
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
		scope = 2; //show ingame with icon
		displayName="Passport (East)";
		picture = "\CAPS_Disguise\images\icon_pass_east.paa";
		hiddenSelections[] = { "texture" };
		hiddenSelectionsTextures[] = { "\CAPS_Disguise\textures\passport_east.paa" };
	};

	class CAPS_Passport_West : CAPS_Passport_Base
	{
		scope = 2; //show ingame with icon
		displayName="Passport (West)";
		picture = "\CAPS_Disguise\images\icon_pass_west.paa";
		hiddenSelections[] = { "texture" };
		hiddenSelectionsTextures[] = { "\CAPS_Disguise\textures\passport_west.paa" };
	};
};
