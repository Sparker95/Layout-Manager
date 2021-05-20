params ["_size", "_defaultValue"];

private _array = [];
_array resize _size;
if (typeName _defaultValue == "ARRAY") then {
    _array = _array apply {+_defaultValue};
} else {
    _array = _array apply {_defaultValue};
};

_array;