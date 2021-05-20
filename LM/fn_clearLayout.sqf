#include "common.hpp"

/*
Recursively clears all contents of this layout:
controls are deleted, layouts are cleared.
Also clears the debug grid.
*/

params ["_layout"];

[_layout] call LM_fnc_clearGrid;

private _content = HM_GET(_layout,content);
private _nrows = HM_GET(_layout,nRows);
private _ncols = HM_GET(_layout,nCols);

for "_idrow" from 0 to (_nrows - 1) do {
    for "_idcol" from 0 to (_ncols - 1) do {
        private _contentStruct = _content#_idcol#_idrow;
        private _layoutOrControl = _contentStruct#CONTENT_CONTENT;
        if (!isNil "_layoutOrControl") then {
            if (_layoutOrControl isEqualType controlNull) then {
                ctrlDelete _layoutOrControl;
            } else {
                [_layoutOrControl] call LM_fnc_clearLayout;
            };
            _contentStruct set [CONTENT_CONTENT, nil];
        };
    };
};