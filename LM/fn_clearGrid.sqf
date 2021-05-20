#include "common.hpp"

/*
PUBLIC
Clears debug markers of the layout.
*/

params ["_layout"];

private _controls = HM_GET(_layout,gridControls);

// Delete all lines
{ ctrlDelete _x; } forEach _controls;