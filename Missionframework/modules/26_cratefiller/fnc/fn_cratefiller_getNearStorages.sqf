/*
    KPLIB_fnc_cratefiller_getNearStorages

    File: fn_cratefiller_getNearStorages.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-06
    Last Update: 2019-04-06
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Scans the fob for possible storages.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay 758026;
private _ctrlStorage = _dialog displayCtrl 75802;

// Clear the lists
lbClear _ctrlStorage;

// Get near objects and check for storage capacity
private ["_type", "_config", "_number", "_index", "_picture", "_storages"];

private _nearFOB = [player] call KPLIB_fnc_common_getPlayerFob;
{
    _type = typeOf _x;
    if (_type == "GroundWeaponHolder") exitWith {};
    _config = [_type] call KPLIB_fnc_cratefiller_getConfigPath;
    _number = getNumber (configfile >> _config >> _type >> "maximumLoad");
    if (_number > 0) then {
        _storages pushBack _x;
    };
} forEach (_nearFOB nearObjects KPLIB_param_fobRange);

// Fill the list
{
    _type = typeOf _x;
    _config = [_type] call KPLIB_fnc_cratefiller_getConfigPath;
    _index = _ctrlStorage lbAdd format ["%1m - %2", round (player distance2D _x), getText (configFile >> _config >> _type >> "displayName")];
    _picture = getText (configFile >> _config >> _type >> "picture");
    if (_picture isEqualTo "pictureThing") then {
        _ctrlStorage lbSetPicture [_index, "KPCF\img\icon_help.paa"];
    } else {
        _ctrlStorage lbSetPicture [_index, _picture];
    };
} forEach _storages;

true
