#include "common.hpp"

/*
INTERNAL
Calculates final sizes from array of SIZE_STRUCTs.
It is meant to calculate widths of columns and heights of rows.
*/

params [ ["_sizeArray", [], [[]]], ["_fullSize", 1, [0]]];

private _sumAbs = 0; // Sum of all absolute (fixed) sizes
private _sumRel = 0; // Sum of weights of relative sizes
{
    private _type = _x#SIZE_TYPE;
    private _value = _x#SIZE_VALUE;
    if (_type == SIZE_TYPE_ABS) then {
        _sumAbs = _sumAbs + _value;
    };
    if (_type == SIZE_TYPE_REL) then {
        _sumRel = _sumRel + _value;
    };
} forEach _sizeArray;

// This is the space we have left after reserving space for all fixed size elements.
// This space will be shared among the relative-sized elements.
private _remainingSize = _fullSize - _sumAbs;

private _finalSizes = _sizeArray apply {
    // If it's absolute size, keep it as it is
    // If it's relative size, scale it according to full size, weight and remaining size
    private _type = _x#SIZE_TYPE;
    private _value = _x#SIZE_VALUE;
    if (_type == SIZE_TYPE_ABS) then {
        _value;
    } else {
        if (_type == SIZE_TYPE_REL) then {
            private _valueOut = _value * _remainingSize / _sumRel;
            _valueOut;
        } else {
            private _str = format ["Wrong size type: %1", _type];
            LOG_ERROR(_str);
            0;
        };
    };
};

_finalSizes;