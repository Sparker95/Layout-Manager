#include "common.hpp"

/*
PUBLIC
Sets background color. Takes no effect if it wasn't enabled at layout creation.
_color - color [Red, Green, Blue, Alpha]
*/

params ["_layout", ["_color", [0,0,0,0.3], [[]]]];

HM_SET(_layout,bgColor, _color);