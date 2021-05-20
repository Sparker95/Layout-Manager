#include "LM\public.hpp"

if (!isNil {layout}) then {
[layout] call LM_fnc_clearLayout;
};

// Margins
private _marginx = 0.005;
private _marginy = _marginx * safezonew / safezoneh;

// Main layout container

layout = [1, 3] call LM_fnc_createGridLayout;

[layout, 0, SIZE_ABS(0.08)] call LM_fnc_setRowSize;

[layout, 2, SIZE_ABS(0.08)] call LM_fnc_setRowSize;


// Top bar

private _topBar = [3, 1] call LM_fnc_createGridLayout;

[_topBar, 0, SIZE_ABS(0.2)] call LM_fnc_setColSize;
[_topBar, 2, SIZE_ABS(0.2)] call LM_fnc_setColSize;

{
    [_topBar, _forEachIndex, 0, [_x] call LM_fnc_createButton] call LM_fnc_setContent;
} forEach ["Fixed size", "Relative size", "Fixed size"];

[layout, 0, 0, _topBar] call LM_fnc_setContent;

// Bottom bar

private _bottomBar = [5, 1] call LM_fnc_createGridLayout;

{
    [_bottomBar, _forEachIndex, 0, [_x] call LM_fnc_createButton] call LM_fnc_setContent;
} forEach ["Relative size: ->", "Clips", "Messenger", "Friends", "Groups"];

[layout, 0, 2, _bottomBar] call LM_fnc_setContent;

// Middle panel

private _midPanel = [2, 1] call LM_fnc_createGridLayout;

[_midPanel, 0, SIZE_ABS(0.15)] call LM_fnc_setColSize;

[layout, 0, 1, _midPanel] call LM_fnc_setContent;

// Left panel

private _leftPanel = [1, 7] call LM_fnc_createGridLayout;

for "_i" from 0 to 6 do {
    private _button = [format ["Button %1", _i+1]] call LM_fnc_createButton;
    [_leftPanel, 0, _i, _button] call LM_fnc_setContent;
    [_leftPanel, 0, _i, _marginx, 2*_marginy*_i/6] call LM_fnc_setContentMargins;
};

[_midPanel, 0, 0, _leftPanel] call LM_fnc_setContent;

// Right panel

private _rightPanel = [3, 3] call LM_fnc_createGridLayout;

[_rightPanel, SIZE_ABS(0.17), SIZE_ABS(0.1)] call LM_fnc_setAllContentSize;

    [_rightPanel, 0, 0, ["Top Left"] call LM_fnc_createButton] call LM_fnc_setContent;
    [_rightPanel, 0, 0, SNAP_LEFT, SNAP_TOP] call LM_fnc_setContentPos;

    [_rightPanel, 1, 0, ["Top Center"] call LM_fnc_createButton] call LM_fnc_setContent;
    [_rightPanel, 1, 0, SNAP_CENTER, SNAP_TOP] call LM_fnc_setContentPos;

    [_rightPanel, 2, 0, ["Top Right"] call LM_fnc_createButton] call LM_fnc_setContent;
    [_rightPanel, 2, 0, SNAP_RIGHT, SNAP_TOP] call LM_fnc_setContentPos;

    [_rightPanel, 0, 1, ["Center Left"] call LM_fnc_createButton] call LM_fnc_setContent;
    [_rightPanel, 0, 1, SNAP_LEFT, SNAP_CENTER] call LM_fnc_setContentPos;

    [_rightPanel, 1, 1, ["Snapping options:"] call LM_fnc_createButton] call LM_fnc_setContent;
    [_rightPanel, 1, 1, SNAP_CENTER, SNAP_CENTER] call LM_fnc_setContentPos;

    [_rightPanel, 2, 1, ["Center Right"] call LM_fnc_createButton] call LM_fnc_setContent;
    [_rightPanel, 2, 1, SNAP_RIGHT, SNAP_CENTER] call LM_fnc_setContentPos;

    [_rightPanel, 0, 2, ["Bottom Left"] call LM_fnc_createButton] call LM_fnc_setContent;
    [_rightPanel, 0, 2, SNAP_LEFT, SNAP_BOTTOM] call LM_fnc_setContentPos;

    [_rightPanel, 1, 2, ["Bottom Center"] call LM_fnc_createButton] call LM_fnc_setContent;
    [_rightPanel, 1, 2, SNAP_CENTER, SNAP_BOTTOM] call LM_fnc_setContentPos;

    [_rightPanel, 2, 2, ["Bottom Right"] call LM_fnc_createButton] call LM_fnc_setContent;
    [_rightPanel, 2, 2, SNAP_RIGHT, SNAP_BOTTOM] call LM_fnc_setContentPos;

[_midPanel, 1, 0, _rightPanel] call LM_fnc_setContent;

//[layout, 0, 0, SIZE_REL(1), SIZE_REL(2)] call LM_fnc_setContentSize;

//[layout, 0, 0, SNAP_MIN, SNAP_MAX] call LM_fnc_setContentPos;

/*
[layout, 0, 0, 0.01, 0.01] call LM_fnc_setContentMargins;

[layout, 0, 0, ["Hello"] call LM_fnc_createButton] call LM_fnc_setContent;

[layout, SIZE_REL(1), SIZE_REL(1)] call LM_fnc_setAllContentSize;

[layout, 0.02, 0.02] call LM_fnc_setAllContentMargins;
*/

// Set margins for inner most layouts
{
    [_x, _marginx, _marginy] call LM_fnc_setAllContentMargins;
} forEach [_topBar, _bottomBar];

// Resize the TOP LEVEL layout
// It will resize its children
[layout, [0, 0, 1, 1]] call LM_fnc_setPosAndSize;
[layout] call LM_fnc_commit;

//if (true) exitWith {};


// Draw grids
private _drawCells = false;
[layout, false] call LM_fnc_drawGrid;
[_topBar, _drawCells] call LM_fnc_drawGrid;
[_midPanel, false] call LM_fnc_drawGrid;
[_leftPanel, _drawCells] call LM_fnc_drawGrid;
[_bottomBar, _drawCells] call LM_fnc_drawGrid;
[_rightPanel, _drawCells] call LM_fnc_drawGrid;


allLayouts = [layout, _topBar, _midPanel, _leftPanel, _bottomBar, _rightPanel];

/*
// Animation
gAnimAlpha = 0;
onEachFrame {

    private _width = 1 + 0.34*(cos gAnimAlpha);
    private _height = 1 + 0.3*(sin gAnimAlpha);

    [layout, [0, 0, _width, _height]] call LM_fnc_setPosAndSize;
    {
        [_x, false] call LM_fnc_drawGrid;
    } forEach allLayouts;

    gAnimAlpha = gAnimAlpha + 70*diag_deltaTime;
    if (gAnimAlpha > 360) then { gAnimAlpha = gAnimAlpha - 360; };
};
*/