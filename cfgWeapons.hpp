class CfgWeapons
{
    class CBA_MiscItem;
    class CBA_MiscItem_ItemInfo;

    //TODO: need to override Take action somehow, research!
    //or just add an event handler?
    class CAPS_Passport_Base : CBA_MiscItem
	{
		author = "DasCapschen";
		scope = 0;	//don't show this ingame!
		//model = "\CAPS_Disguise\models\passport.p3d";
		displayName = "Passport";
        descriptionShort = "It's a passport.";
        descriptionUse = "Use it to authorize yourself.";
		model = "\a3\Weapons_F\Ammo\mag_watch.p3d";
        picture = "\A3\Weapons_F\Data\UI\gear_item_watch_ca.paa";
        class ItemInfo : CBA_MiscItem_ItemInfo
		{
			mass = 1;
		};
	};

	class CAPS_Passport_East : CAPS_Passport_Base
	{
		scope = 2; //show ingame with icon
		displayName="Passport (East)";
		//picture = "\CAPS_Disguise\images\icon_pass_east.paa";
	};

	class CAPS_Passport_West : CAPS_Passport_Base
	{
		scope = 2; //show ingame with icon
		displayName="Passport (West)";
		//picture = "\CAPS_Disguise\images\icon_pass_west.paa";
	};
};
