/*
INTERNAL
Creates a 1D array.
*/

params ["_size", "_defaultValue"];

private _array = [];
_array resize _size;

if (! isNil "_defaultValue") then {
	if (typeName _defaultValue == "ARRAY") then {
		_array = _array apply {+_defaultValue};
	} else {
		_array = _array apply {_defaultValue};
	};
};

_array;