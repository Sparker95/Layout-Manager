#include "..\LM\public.hpp"

// Delete old layout if it's still there
if (!isNil {layout}) then {
[layout] call LM_fnc_deleteLayout;
};

// Margins
private _marginx = 0.004;
private _marginy = _marginx * safezonew / safezoneh; // We scale these so that they look equal

// Some temporary functions
private _createControl = {
    params ["_text", "_display", "_className"];
    private _b = _display ctrlCreate [_className, -1];
    _b ctrlSetText _text;
    _b ctrlSetBackgroundColor [0, 0, 0, 0.9];
    _b;
};

// Create temp dialog
createDialog "RscDisplayEmpty"; // will have idd -1
private _dlg = finddisplay -1;

// !!! Create topmost layout
layout = [1, 3, _dlg, controlNull, true] call LM_fnc_createGridLayout;

// Set top and bottom row heights to fixed value
// Central row has automatic height by default
[layout, 0, SIZE_ABS(0.05)] call LM_fnc_setRowSize;
[layout, 2, SIZE_ABS(0.08)] call LM_fnc_setRowSize;

// ==== Top bar ====
// Create a control and assign it to the top bar cell
private _staticTop = ["Top bar text", _dlg, "RscText"] call _createControl;
[layout, 0, 0, _staticTop] call LM_fnc_setContent; // Register the top static

// Set size and position of topmost layout
[layout, [0, 0, 1, 1]] call LM_fnc_setPosAndSize;

// ==== Bottom bar ====
// 2 equal horizontal cells
private _bottomBar = [2, 1, _dlg, controlNull] call LM_fnc_createGridLayout;
[layout, 0, 2, _bottomBar] call LM_fnc_setContent; // Register the bottom bar
[_bottomBar, SIZE_ABS(0.16), SIZE_REL(1)] call LM_fnc_setAllContentSize;
[_bottomBar, _marginx, _marginy] call LM_fnc_setAllContentMargins;  // Set margins

private _buttonLeft = ["Button Left", _dlg, "RscButton"] call _createControl;
private _buttonRight = ["Button Right", _dlg, "RscButton"] call _createControl;
[_bottomBar, 0, 0, _buttonLeft] call LM_fnc_setContent;     // Register buttons
[_bottomBar, 1, 0, _buttonRight] call LM_fnc_setContent;

// ==== Central ====

// Divide it vertically
private _central = [2, 1, _dlg, controlNull] call LM_fnc_createGridLayout;

[_central, 0, SIZE_REL(1)] call LM_fnc_setColSize;
[_central, 1, SIZE_REL(3)] call LM_fnc_setColSize; // 2nd col is 2x wider

// Left part
private _lb = ["", _dlg, "RscListBox"] call _createControl;
for "_i" from 0 to 30 do {
    _lb lbAdd (format ["Item %1", _i]);
};
[_central, _marginx, _marginy] call LM_fnc_setAllContentMargins;
[_central, 0, 0, _lb] call LM_fnc_setContent; // Register listbox
[layout, 0, 1, _central] call LM_fnc_setContent; // Register the central part

// Right part
private _rightStatic = ["Description: ...", _dlg, "RscStatic"] call _createControl;
_rightStatic ctrlSetBackgroundColor [0,0,0, 0.3];
[_central, 1, 0, _rightStatic] call LM_fnc_setContent; // Register static


// Commit everything, it will rescale the layout and its child contents
[layout] call LM_fnc_commit;

//[layout, false] call LM_fnc_drawGrid;
//[_central, false] call LM_fnc_drawGrid;
//[_bottomBar, false] call LM_fnc_drawGrid;