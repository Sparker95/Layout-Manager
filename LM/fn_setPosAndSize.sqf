#include "common.hpp"

/*
PUBLIC
Sets position and size of whole layout.
_posAndSize - [x, y, width, height]
*/

params ["_layout", ["_posAndSize", [0,0,0,0], [[]]] ];

_posAndSize params [ ["_posx", 0, [0]], ["_posy", 0, [0]], ["_width", 0.5, [0]], ["_height", 0.5, [0]] ];

// Set variables
HM_SET(_layout,posx,_posx);
HM_SET(_layout,posy,_posy);
HM_SET(_layout,width,_width);
HM_SET(_layout,height,_height);