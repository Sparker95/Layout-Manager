#include "common.hpp"

/*
PUBLIC
Creates the grid layout
_nCols, _nRows - integer >=1, amount of columns and rows
_display - optional, the display (or dialog) where this layout belongs. Default value is finddisplay 46 (game main display).
_ctrlGroup - optional, the parent group control of this layout. NOTE that all content controls and layouts must be in the same group too.
_enableBackground - optional, default false. If true, a static background control will be rendered with same size as the whole layout.
*/

params [["_nCols", 1, [1]], ["_nRows", 1, [1]], ["_display", displayNull], ["_ctrlGroup", controlNull], ["_enableBackground", false]];

//private _str = format ["createGridLayout: %1", _this];
//LOG(_str);

// Validate input arguments

if (_nCols <= 0) exitWith {
    LOG_ERROR("Wrong column amount. You must use >=1 columns.");
};

if (_nRows <= 0) exitWith {
    LOG_ERROR("Wrong row amount. You must use >=1 rows");
};

if (isNull _display) then {
    _display = findDisplay 46;
};

private _layout = createHashmap;

_layout set ["nCols", _nCols];
_layout set ["nRows", _nRows];
_layout set ["display", _display];
_layout set ["ctrlGroup", _ctrlGroup];
_layout set ["posx", 0];
_layout set ["posy", 0];
_layout set ["width", 0.5];
_layout set ["height", 0.5];

// Size of each row. Array where each element is SIZE_STRUCT.

private _rowSize = [_nRows, SIZE_STRUCT_NEW(SIZE_TYPE_REL, 1)] call LM_fnc_createArray1D;
_layout set ["rowSize", _rowSize]; 


// Size of each column. Array where each element is SIZE_STRUCT.

private _colSize = [_nCols, SIZE_STRUCT_NEW(SIZE_TYPE_REL, 1)] call LM_fnc_createArray1D;
_layout set ["colSize", _colSize];


// Real (calculated) positions and sizes of each row and column.
_layout set ["colSizeReal", [_nCols, 0] call LM_fnc_createArray1D];
_layout set ["rowSizeReal", [_nRows, 0] call LM_fnc_createArray1D];
_layout set ["colPosReal", [_nCols, 0] call LM_fnc_createArray1D];
_layout set ["rowPosReal", [_nRows, 0] call LM_fnc_createArray1D];


// Content of the grid. Each element is a CONTENT_STRUCT

private _content = [_nCols, _nRows, CONTENT_STRUCT_NEW()] call LM_fnc_createArray2D;
_layout set ["content", _content];


// Helper lines for visualization

_layout set ["gridControls", []];


// Background
// We want to create it first of all, so that it's below all buttons and other controls

private _bgControl = controlNull;
if (_enableBackground) then {
    _bgcontrol = _display ctrlCreate ["RscText", -1, _ctrlGroup];
    _bgcontrol ctrlSetBackgroundColor [0, 0, 0, 0];
    _bgcontrol ctrlSetPosition [0, 0, 0.5, 0.5];
};
_layout set ["bgControl", _bgControl];
_layout set ["bgColor", [0, 0, 0, 0.4]];
_layout set ["bgEnabled", _enableBackground];

// Return
_layout;