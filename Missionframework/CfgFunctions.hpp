class KPLIB {
    class functions {
        file = "functions";

        class addActionsFob             {};
        class addActionsPlayer          {};
        class addObjectInit             {};
        class addRopeAttachEh           {};
        class allowCrewInImmobile       {};
        class checkClass                {};
        class checkCrateValue           {};
        class checkGear                 {};
        class checkWeaponCargo          {};
        class cleanOpforVehicle         {};
        class clearCargo                {};
        class crAddAceAction            {};
        class crateFromStorage          {};
        class crateToStorage            {};
        class crawlAllItems             {};
        class createClearance           {};
        class createClearanceConfirm    {};
        class createCrate               {};
        class createManagedUnit         {};
        class crGetMulti                {};
        class crGlobalMsg               {};
        class doSave                    {};
        class fillStorage               {};
        class forceBluforCrew           {};
        class getAdaptiveVehicle        {};
        class getBluforRatio            {};
        class getCommander              {};
        class getCrateHeight            {};
        class getFobName                {};
        class getFobResources           {};
        class getGroupType              {};
        class getLessLoadedHC           {};
        class getLoadout                {};
        class getLocalCap               {};
        class getLocationName           {};
        class getMilitaryId             {};
        class getMobileRespawns         {};
        class getNearbyPlayers          {};
        class getNearestBluforObjective {};
        class getNearestFob             {};
        class getNearestSector          {};
        class getNearestTower           {};
        class getNearestViVTransport    {};
        class getOpforCap               {};
        class getOpforFactor            {};
        class getOpforSpawnPoint        {};
        class getPlayerCount            {};
        class getResistanceTier         {};
        class getSaveableParam          {};
        class getSaveData               {};
        class getSectorOwnership        {};
        class getSectorRange            {};
        class getSquadComp              {};
        class getStoragePositions       {};
        class getUnitPositionId         {};
        class getUnitsCount             {};
        class getWeaponComponents       {};
        class handlePlacedZeusObject    {};
        class hasPermission             {};
        class initSectors               {};
        class isCapitalActive           {};
        class isClassUAV                {};
        class isRadio                   {};
        class log                       {};
        class potatoScan                {};
        class protectObject             {};
        class secondsToTimer            {};
        class setDiscordState           {};
        class setFobMass                {};
        class setLoadableViV            {};
        class setLoadout                {};
        class setVehicleCaptured        {};
        class setVehicleSeized          {};
        class sortStorage               {};
        class spawnBuildingSquad        {};
        class spawnCivilians            {};
        class spawnGuerillaGroup        {};
        class spawnMilitaryPostSquad    {};
        class spawnMilitiaCrew          {};
        class spawnRegularSquad         {};
        class spawnVehicle              {};
        class swapInventory             {};
    };
    class functions_curator {
        file = "functions\curator";

        class initCuratorHandlers       {
            postInit = 1;
        };
        class requestZeus               {};
    };
    class functions_ui {
        file = "functions\ui";

        class overlayUpdateResources    {};
    };
    class functions_simplex_support_services {
        file = "functions\simplex_support_services";

        class sss_registerSupport {};
    };
    #include "scripts\client\CfgFunctions.hpp"
    #include "scripts\server\CfgFunctions.hpp"
};

class SPEC {
    #include "SPEC\arsenal_02\functions.hpp"
    #include "SPEC\rabbit_support\functions.hpp"
    #include "SPEC\other_missions\functions.hpp"
    #include "SPEC\radio_chatter\functions.hpp"
    #include "SPEC\jammer\functions.hpp"
    #include "SPEC\halo_restrict\functions.hpp"
    #include "SPEC\ambient_music\functions.hpp"
};
