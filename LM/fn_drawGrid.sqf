#include "common.hpp"

params ["_layout", ["_drawCells", true]];

// Clear old grid
[_layout] call LM_fnc_clearGrid;

private _rowSizeReal = HM_GET(_layout,rowSizeReal);
private _colSizeReal = HM_GET(_layout,colSizeReal);
private _rowPosReal = HM_GET(_layout,rowPosReal);
private _colPosReal = HM_GET(_layout,colPosReal);
private _width = HM_GET(_layout,width);
private _height = HM_GET(_layout,height);
private _posx = HM_GET(_layout,posx);
private _posy = HM_GET(_layout,posy);
private _content = HM_GET(_layout,content);

private _controls = [];
private _display = findDisplay 46;
private _ctrlGroup = controlNull;
private _lineSize = 0.002;
private _lineColor = [1/255, 227/255, 239/255, 1];
private _cellColor = [252/255, 75/255, 31/255, 0.45];

// Draw rows
{
    private _rowYPos = _x;
    private _line = [_display, _ctrlGroup, _posx, _posy + _rowYPos, _posx + _width, _posy + _rowYPos, _lineSize, _lineColor] call LM_fnc_createHelperRect;
    _controls pushBack _line;
} forEach _rowPosReal;

// Draw columns
{
    private _colXPos = _x;
    private _line = [_display, _ctrlGroup, _posx + _colXPos, _posy, _posx + _colXPos, _posy + _height, _lineSize, _lineColor] call LM_fnc_createHelperRect;
    _controls pushBack _line;
} forEach _colPosReal;

// Draw the right and bottom border

// Bottom line
_controls pushBack ([_display, _ctrlGroup, _posx, _posy + _height, _posx + _width, _posy + _height, _lineSize, _lineColor] call LM_fnc_createHelperRect);

// Right line
_controls pushBack ([_display, _ctrlGroup, _posx + _width, _posy, _posx + _width, _posy + _height, _lineSize, _lineColor] call LM_fnc_createHelperRect);
 
// Draw cells
if (_drawCells) then {
    for "_idrow" from 0 to ((count _rowSizeReal) - 1) do {
        for "_idcol" from 0 to ((count _colSizeReal) - 1) do {
            private _contentStruct = _content#_idcol#_idrow;
            private _cellWidth = _colSizeReal#_idcol;
            private _cellHeight = _rowSizeReal#_idrow;

            // Calculate the size and pos of cell content
            private _posAndSize = [_contentStruct, _cellWidth, _cellHeight] call LM_fnc_calculateContentPosAndSize;
            
            // Add pos offsets
            private _cellPosx = _colPosReal#_idCol;
            private _cellPosy = _rowPosReal#_idRow;
            _posAndSize set [0, (_posAndSize#0) + _cellPosx + _posx];
            _posAndSize set [1, (_posAndSize#1) + _cellPosy + _posy];

            _controls pushBack ([_display, _ctrlGroup, _posAndSize#0, _posAndSize#1, _posAndSize#0 + _posAndSize#2, _posAndSize#1 + _posAndSize#3, 0, _cellColor] call LM_fnc_createHelperRect);
        };
    };
};

HM_SET(_layout,gridControls, _controls);