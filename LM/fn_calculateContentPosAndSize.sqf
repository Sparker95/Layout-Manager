#include "common.hpp"

/*
INTERNAL
Calculates size and position of a content element according to size and positioning rules.
Returned position is the position of top-left cornet of the element. 
*/

params ["_contentStruct", "_cellWidth", "_cellHeight"];

_contentStruct params ["_layoutOrControl", "_cposx", "_cposy", "_csizex", "_csizey", "_cmarginx", "_cmarginy"];

private _calculatePosAndSize1D = {
    params ["_posStruct", "_sizeStruct", "_ownSize", "_cellSize", "_margin"];

    // Resolve size
    private _sizeType = _sizeStruct#SIZE_TYPE;
    private _sizeValue = _sizeStruct#SIZE_VALUE;
    private _sizeOut = 0;
    switch (_sizeType) do {
        case SIZE_TYPE_ABS: {
            _sizeOut = _sizeValue;
        };
        case SIZE_TYPE_REL: {
            _sizeOut = _sizeValue * (_cellSize - 2*_margin);
        };
        case SIZE_TYPE_OWN: {
            _sizeOut = _ownSize;
        };
        default {
            private _str = format ["Wrong size type: %1", _sizeType];
            LOG_ERROR(_str);
        };
    };
    private _sizeValue = _sizeStruct#SIZE_VALUE;

    // Resolve position
    private _posType = _posStruct#POS_TYPE;
    private _posValue = _posStruct#POS_VALUE;
    private _posOut = 0;
    switch (_posType) do {
        case POS_TYPE_REL: {
            private _centerPos = _margin + _posValue*(_cellSize - 2*_margin);
            _posOut = _centerPos - 0.5*_sizeOut;
        };
        case POS_TYPE_SNAP_MAX: {
            _posOut = _cellSize - _margin - _sizeOut;
        };
        case POS_TYPE_SNAP_MIN: {
            _posOut = _margin;
        };
        default {
            private _str = format ["Wrong pos type: %1", _posType];
            LOG_ERROR(_str);
        };
    };

    [_posOut, _sizeOut];
};

// Resolve x coordinate
private _ownPosAndSize = [_layoutOrControl] call LM_fnc_getPosAndSize;
private _ownSizex = _ownPosAndSize#2;
private _ownSizey = _ownPosAndSize#3;

private _horiz = [_cposx, _csizex, _ownSizex, _cellWidth, _cmarginx] call _calculatePosAndSize1D;
private _vert = [_cposy, _csizey, _ownSizey, _cellHeight, _cmarginy] call _calculatePosAndSize1D;

// Return
// pos x, pos y, width, height
[_horiz#0, _vert#0, _horiz#1, _vert#1];