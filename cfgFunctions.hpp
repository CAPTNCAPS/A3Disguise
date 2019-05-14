class CfgFunctions
{
    class CAPS
    {
        class Disguise
        {
            file = "\CAPS_Disguise\functions";
            //modules
            class moduleDisguise{};
            class moduleRestrictedArea{};
            class moduleAuthorizedArea{};
            class moduleGivePass{};
            
            //actions
            class doThrow{};
            class doWhistle{};
            class stealUniform{};
            class silentkill {};
            
            //inits
            class initializeDisguise{};
            
            //main loops
            class startEnemyCheck{};
            class startGearCheck{};
            
            //main helpers
            class checkWeapons{};
            class checkClothing{};
            
            //objects
            class initPassportObject{};
            
            //author: Heeeere's Johnny from BIForums (can add function with no TAG?)
            class triggerListChanged{};
        };
    };
};
