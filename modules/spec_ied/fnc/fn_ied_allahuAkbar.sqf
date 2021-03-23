
/* ----------------------------------------------------------------------------
Function: btc_fnc_ied_allahu_akbar

Description:
    Play song and trigger suicider bomb if suicider is alive and awake.

Parameters:
    _trigger - Trigger attached to the suicider. [Object]

Returns:

Examples:
    (begin example)
        [trigger] call btc_fnc_ied_allahu_akbar;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_trigger", objNull, [objNull]]
];

private _suicider = _trigger getVariable "suicider";

if (alive _suicider && [_suicider] call ace_common_fnc_isAwake) then {
    playSound3d [getMissionPath "z\speclib\addons\units_takistani\sounds\allahu_akbar.ogg", _suicider, false, getPosASL _suicider, 5, random [0.9, 1, 1.2], 100];
};

[{
    params ["_suicider"];

    [_suicider, KPLIB_preset_sideF, 10, selectRandom [0, 1, 2], false] call ace_zeus_fnc_moduleSuicideBomber;
}, [_suicider], 1.4] call CBA_fnc_waitAndExecute;
