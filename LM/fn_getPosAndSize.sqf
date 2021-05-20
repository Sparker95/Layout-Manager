#include "common.hpp"

/*
PRIVATE
Gets pos and size of layout or control.
*/

params ["_element"];

if (_layout isEqualType controlNull) then {
    ctrlPosition _element;
} else {
    [HM_GET(_layout,posx), HM_GET(_layout,posy), HM_GET(_layout,width), HM_GET(_layout,height)];
};