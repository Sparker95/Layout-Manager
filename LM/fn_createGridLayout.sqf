#include "common.hpp"

params [["_nCols", 1, [1]], ["_nRows", 1, [1]]];

// Validate input arguments

if (_nCols <= 0) exitWith {
    LOG_ERROR("Wrong column amount. You must use >=1 columns.");
};

if (_nRows <= 0) exitWith {
    LOG_ERROR("Wrong row amount. You must use >=1 rows");
};

private _layout = createHashmap;

_layout set ["nCols", _nCols];
_layout set ["nRows", _nRows];
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

// Return
_layout;