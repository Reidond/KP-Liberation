private [ "_dialog", "_backpack", "_backpackcontents" ];

if ( isNil "KPLIB_last_halo_jump" ) then { KPLIB_last_halo_jump = -6000; };

if ( KPLIB_param_halo > 1 && ( KPLIB_last_halo_jump + ( KPLIB_param_halo * 60 ) ) >= time ) exitWith {
    hint format [ localize "STR_HALO_DENIED_COOLDOWN", ceil ( ( ( KPLIB_last_halo_jump + ( KPLIB_param_halo * 60 ) ) - time ) / 60 ) ];
};

_dialog = createDialog "liberation_halo";
dojump = 0;
halo_position = getpos player;

_backpackcontents = [];

[ "halo_map_event", "onMapSingleClick", { halo_position = _pos } ] call BIS_fnc_addStackedEventHandler;

"spawn_marker" setMarkerTextLocal (localize "STR_HALO_PARAM");

waitUntil { dialog };
while { dialog && alive player && dojump == 0 } do {
    if (KPLIB_param_haloMode == 0) then {
        "spawn_marker" setMarkerPosLocal halo_position;
    };

    if (KPLIB_param_haloMode in [1,2,3]) then {
        SPEC_halo_restrict_allowed = [halo_position, "spawn_marker"] call SPEC_fnc_halo_restrict_isAllowed;
    };

    sleep 0.1;
};

if ( dialog ) then {
    closeDialog 0;
    sleep 0.1;
};

"spawn_marker" setMarkerPosLocal markers_reset;
"spawn_marker" setMarkerTextLocal "";

[ "halo_map_event", "onMapSingleClick" ] call BIS_fnc_removeStackedEventHandler;

if ( dojump > 0 && {(KPLIB_param_haloMode in [1,2,3]) && {SPEC_halo_restrict_allowed}} ) then {
    KPLIB_last_halo_jump = time;
    halo_position = halo_position getPos [random 250, random 360];
    halo_position = [ halo_position select 0, halo_position select 1, KPLIB_height_halo + (random 200) ];
    halojumping = true;
    sleep 0.1;
    cutRsc ["fasttravel", "PLAIN", 1];
    playSound "parasound";
    sleep 2;
    _backpack = backpack player;
    if ( _backpack != "" && _backpack != KPLIB_b_haloParachute ) then {
        _backpackcontents = backpackItems player;
        removeBackpack player;
        sleep 0.1;
    };
    player addBackpack KPLIB_b_haloParachute;

    player setpos halo_position;

    sleep 4;
    halojumping = false;
    waitUntil { !alive player || isTouchingGround player };
    if ( _backpack != "" && _backpack != KPLIB_b_haloParachute ) then {
        sleep 2;
        player addBackpack _backpack;
        clearAllItemsFromBackpack player;
        { player addItemToBackpack _x } foreach _backpackcontents;
    };
};
