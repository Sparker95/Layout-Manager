// Helper function to create 2D arrays

params ["_nCols", "_nRows", "_defaultValue"];

private _array = [_nCols, nil] call LM_fnc_createArray1D;

for "_i" from 0 to (_nCols - 1) do {
    _array set [_i, [_nRows, _defaultValue] call LM_fnc_createArray1D ];
};

_array;