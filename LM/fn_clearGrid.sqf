#include "common.hpp"

params ["_layout"];

private _controls = HM_GET(_layout,gridControls);

// Delete all lines
{ ctrlDelete _x; } forEach _controls;