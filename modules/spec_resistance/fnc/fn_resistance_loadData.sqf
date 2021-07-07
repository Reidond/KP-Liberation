/*
    KPLIB_fnc_example_loadData

    File: fn_example_loadData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-02
    Last Update: 2019-04-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Loads data which is bound to this module from the given save data or initializes needed data for a new campaign.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (KPLIB_param_debug) then {["Example module loading...", "SAVE"] call KPLIB_fnc_common_log;};

private _moduleData = ["spec_resistance"] call KPLIB_fnc_init_getSaveData;

// Check if there is a new campaign
if (_moduleData isEqualTo []) then {
    if (KPLIB_param_debug) then {["Example module data empty, creating new data...", "SAVE"] call KPLIB_fnc_common_log;};
    // Nothing to do here
    SPEC_civRep = 0;
    publicVariable "SPEC_civRep";

    // Set correct resistance standing
    [{!isNil "SPEC_civRep"}, {
        [nil, false] call SPEC_fnc_resistance_changeCR;
    }, []] call CBA_fnc_waitUntilAndExecute;

    SPEC_guerillaStrength = 0;
    publicVariable "SPEC_guerillaStrength";
} else {
    // Otherwise start applying the saved data
    if (KPLIB_param_debug) then {["Example module data found, applying data...", "SAVE"] call KPLIB_fnc_common_log;};

    SPEC_civRep = _moduleData select 0;
    publicVariable "SPEC_civRep";

    // Set correct resistance standing
    [{!isNil "SPEC_civRep"}, {
        [nil, false] call SPEC_fnc_resistance_changeCR;
    }, []] call CBA_fnc_waitUntilAndExecute;

    SPEC_guerillaStrength = _moduleData select 1;
    publicVariable "SPEC_guerillaStrength";
};

true