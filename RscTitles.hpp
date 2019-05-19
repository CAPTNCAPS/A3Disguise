/* BASE CLASSES */
/* exported from GUI editor */

class RscPicture;
//class IGUIBack;

class RscTitles
{
	class CAPS_DisguiseUI
	{
		idd = 1337;
        onLoad = "_this spawn CAPS_fnc_disguiseUI;";
		duration = 999999; //as used by ACE mod
		class controls
		{
			////////////////////////////////////////////////////////
			// GUI EDITOR OUTPUT START (by DasCapschen, v1.063, #Codowu)
			////////////////////////////////////////////////////////

			/*
			class IGUIBack_2200: IGUIBack
			{
				idc = 2200;
				x = 0.958906 * safezoneW + safezoneX;
				y = 0.324 * safezoneH + safezoneY;
				w = 0.04125 * safezoneW;
				h = 0.19 * safezoneH;
			};
			*/
			class RscPicture_1200: RscPicture
			{
				idc = 1200;
				text = "\CAPS_Disguise\images\disguise.paa";
				colorText[] = {1, 1, 1, 1}; //change to yellow / red on suspiciousness
				x = 0.964063 * safezoneW + safezoneX;
				y = 0.324 * safezoneH + safezoneY;
				w = 0.033 * safezoneW;
				h = 0.0586669 * safezoneH;
			};
			class RscPicture_1201: RscPicture
			{
				idc = 1201;
				text = "\CAPS_Disguise\images\rank.paa";
				colorText[] = {1, 1, 1, 1}; //turn red when rank too low
				x = 0.964063 * safezoneW + safezoneX;
				y = 0.39 * safezoneH + safezoneY;
				w = 0.033 * safezoneW;
				h = 0.0586669 * safezoneH;
			};
			class RscPicture_1202: RscPicture
			{
				idc = 1202;
				text = "\CAPS_Disguise\images\auth.paa";
				colorText[] = {1, 1, 1, 1}; //turn red when not authorized
				x = 0.964063 * safezoneW + safezoneX;
				y = 0.456 * safezoneH + safezoneY;
				w = 0.033 * safezoneW;
				h = 0.0586669 * safezoneH;
			};
			////////////////////////////////////////////////////////
			// GUI EDITOR OUTPUT END
			////////////////////////////////////////////////////////

		};
	};
};
