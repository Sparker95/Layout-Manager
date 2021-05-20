#include "common.hpp"

/*
INTERNAL
Updates these variables:
colSizeReal, rowSizeReal, colPosReal, rowSizeReal
*/

params ["_layout"];

private _nrows = HM_GET(_layout,nRows);
private _ncols = HM_GET(_layout,nCols);
private _width = HM_GET(_layout,width);
private _height = HM_GET(_layout,height);

// Calculate final real sizes of columns and rows

private _rowSizeReal = [HM_GET(_layout,rowSize), _height] call LM_fnc_calculateSizes;  // Real final size of each row
private _colSizeReal = [HM_GET(_layout,colSize), _width] call LM_fnc_calculateSizes;   // Real final size of each column

HM_SET(_layout,colSizeReal, _colSizeReal);
HM_SET(_layout,rowSizeReal, _rowSizeReal);

// Calculate top-left corner positions of all grid elements (without _posx, _posy offset!)

private _rowStartPosReal = [_nRows, 0] call LM_fnc_createArray1D; // Pos of each row
private _colStartPosReal = [_nCols, 0] call LM_fnc_createArray1D; // Pos of each column

private _acc = 0;
for "_i" from 1 to (_nCols - 1) do {
    _acc = _acc + _colSizeReal#(_i-1);
    _colStartPosReal set [_i, _acc];
};

_acc = 0;
for "_i" from 1 to (_nRows - 1) do {
    _acc = _acc + _rowSizeReal#(_i-1);
    _rowStartPosReal set [_i, _acc];
};

HM_SET(_layout,rowPosReal, _rowStartPosReal);
HM_SET(_layout,colPosReal, _colStartPosReal);