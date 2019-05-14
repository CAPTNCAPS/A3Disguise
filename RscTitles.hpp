/* BASE CLASSES */
/* exported from GUI editor */

class RscPicture
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 0;
	idc = -1;
	style = 48;
	colorBackground[] = 
	{
		0,
		0,
		0,
		0
	};
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	font = "TahomaB";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
	tooltipColorText[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorBox[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorShade[] = 
	{
		0,
		0,
		0,
		0.65
	};
};

class IGUIBack
{
	type = 0;
	idc = 124;
	style = 128;
	text = "";
	colorText[] = 
	{
		0,
		0,
		0,
		0
	};
	font = "RobotoCondensed";
	sizeEx = 0;
	shadow = 0;
	x = 0.1;
	y = 0.1;
	w = 0.1;
	h = 0.1;
	colorbackground[] = 
	{
		"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])",
		"(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])",
		"(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])",
		"(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"
	};
};

class RscTitles
{
	class CAPS_DisguiseUI
	{
		idd = 1337;
		duration = 999999; //as used by ACE mod
		class controls
		{
			////////////////////////////////////////////////////////
			// GUI EDITOR OUTPUT START (by DasCapschen, v1.063, #Codowu)
			////////////////////////////////////////////////////////

			class IGUIBack_2200: IGUIBack
			{
				idc = 2200;
				x = 0.958906 * safezoneW + safezoneX;
				y = 0.324 * safezoneH + safezoneY;
				w = 0.04125 * safezoneW;
				h = 0.19 * safezoneH;
			};
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