#include "common.hpp"

/*
INTERNAL
Can be used for debugging and demonstration purposes.
*/

params ["_text", ["_display", displayNull]];

//private _str = format ["createButton: %1", _this];
//LOG(_str);

if (isNull _display) then {
    _display = findDisplay 46;
};

private _b = _display ctrlCreate ["RscButton", -1];
_b ctrlSetText _text;
_b ctrlSetBackgroundColor [0, 0, 0, 0.9];
_b ctrlSetPosition [0, 0, 0.1, 0.06];
_b ctrlCommit 0;
_b;