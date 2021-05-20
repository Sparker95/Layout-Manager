#include "common.hpp"

/*
PUBLIC
Call this to have the grid apply the changes visually.

This should be called after applying changes through these commands:
setContentMargins
setBackgroundColor
setPosAndSize
setContent*
setAllContent*
*/

params ["_layout"];

// Calculate sizes

// Recalculate the row and column positions and sizes
[_layout] call LM_fnc_calculateGridPositions;
private _rowSizeReal = HM_GET(_layout,rowSizeReal); // These are calculated in LM_fnc_calculateGridPositions
private _colSizeReal = HM_GET(_layout,colSizeReal);
private _rowPosReal = HM_GET(_layout,rowPosReal);
private _colPosReal = HM_GET(_layout,colPosReal);
private _posx = HM_GET(_layout,posx);
private _posy = HM_GET(_layout,posy);
private _width = HM_GET(_layout,width);
private _height = HM_GET(_layout,height);

// Resize the content
private _content = HM_GET(_layout,content);
{
    private _idCol = _foreachindex;
    {
        private _idRow = _foreachindex;
        private _contentStruct = _x;
        private _layoutOrControl = _contentStruct#CONTENT_CONTENT;
        if (! isNil "_layoutOrControl") then {
            private _cellWidth = _colSizeReal#_idCol;
            private _cellHeight = _rowSizeReal#_idRow;

            // The positions calculated below are real and relative to current cell
            // The size is real
            private _posAndSize = [_contentStruct, _cellWidth, _cellHeight] call LM_fnc_calculateContentPosAndSize;
            
            // Add pos offsets
            private _cellPosx = _colPosReal#_idCol;
            private _cellPosy = _rowPosReal#_idRow;
            _posAndSize set [0, (_posAndSize#0) + _cellPosx + _posx];
            _posAndSize set [1, (_posAndSize#1) + _cellPosy + _posy];

            // Set position of cell content
            // If it's another layout, call its setPosAndSize
            // If its a control, ctrlSetPosition it
            if (_layoutOrControl isEqualType controlNull) then {
                _layoutOrControl ctrlSetPosition _posAndSize;
                _layoutOrControl ctrlCommit 0;
            } else {
                [_layoutOrControl, _posAndSize] call LM_fnc_setPosAndSize;
                [_layoutOrControl] call LM_fnc_commit;
            };
        };
    } forEach _x;
} forEach _content;

// Draw the background
private _bgEnabled = HM_GET(_layout,bgEnabled);
private _bgcolor = HM_GET(_layout,bgColor);
private _bgcontrol = HM_GET(_layout,bgControl);

if (_bgEnabled) then {
    _bgcontrol ctrlSetPosition [_posx, _posy, _width, _height];
    _bgcontrol ctrlSetBackgroundColor _bgcolor;
    _bgcontrol ctrlCommit 0;
};