#include "common.hpp"

/*
PUBLIC
Sets positions of all content cells.
__x, __y - use POS and SNAP macros from public.hpp
*/

params ["_layout", "__x", "__y"];

private _nrows = HM_GET(_layout,nRows);
private _ncols = HM_GET(_layout,nCols);

for "_idrow" from 0 to (_nrows - 1) do {
    for "_idcol" from 0 to (_ncols - 1) do {
        [_layout, _idcol, _idrow, __x, __y] call LM_fnc_setContentPos;
    };
};