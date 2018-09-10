/*
    KPLIB_fnc_build_camera_ticker_start

    File: fn_build_camera_ticker_start.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-01
    Last Update: 2018-09-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Build camera per frame ticker, limits camera area

    Parameter(s):
    NONE

    Returns:
    NUMBER - PFH Handle
*/
params [
    ["_position", nil, [[]]],
    ["_radius", nil, [0]],
    ["_camera", nil, [objNull]]
];

private _handle = [{
    params ["_args", "_handle"];
    _args params ["_position", "_radius","_camera"];

    if(_camera isEqualTo objNull) exitWith {
        systemChat "Camera does not exist, stopping area limiter.";
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _currentCamPos = (getPos _camera);

    // Check if camera is in FOB area
    private _inArea = _currentCamPos inArea [_position, _radius + 5, _radius + 5, 0, false];
    // If not force it back
    if (!_inArea) then {
        // Get the direction towards the center
        private _dir = _currentCamPos getDir _position;
        // The more outside the area the faster the camera will be pulled back in
        private _step = ((_currentCamPos distance2D _position) - _radius - 5) / 10;
        // Get new position
        private _newPos = (_camera getPos [_step, _dir]);
        _newPos set [2, _currentCamPos select 2]; // use old Z
        // Move camera back towards the center
        _camera setPos _newPos;
    };

}, 0, [_position, _radius, _camera]] call CBA_fnc_addPerFrameHandler;

_handle
