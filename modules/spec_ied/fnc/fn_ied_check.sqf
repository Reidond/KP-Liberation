
/* ----------------------------------------------------------------------------
Function: btc_fnc_ied_check

Description:
    Contantly check if player is around by calling btc_fnc_ied_checkLoop. If yes, trigger the explosion.

Parameters:
    _city - City where IED has been created. [Object]

Returns:

Examples:
    (begin example)
        [_city, _ieds] call btc_fnc_ied_check;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_city", objNull, [objNull]]
];

private _array = _city getVariable ["ieds", []];
if (_array isEqualTo []) exitWith {};

private _ieds = _array apply {_x call SPEC_fnc_ied_create};

if (KPLIB_param_debug) then {
    [format ["START CITY ID %1", _city getVariable "id"]] call SPEC_fnc_core_debugLog;
};
if (KPLIB_param_debug) then {
    [format ["START CITY ID %1", _city getVariable "id"]] call SPEC_fnc_core_debugLog;
};

private _ieds_check = _ieds select {!((_x select 2) isEqualTo objNull)};

[_city, _ieds, _ieds_check] call SPEC_fnc_ied_checkLoop;
