#include "common.hpp"

/*
PUBLIC
Deletes the layout and all its contents and debug grids.
You should not use the _layout afterwards.
*/

params ["_layout"];

// Clear everything
[_layout] call LM_fnc_clearLayout;

// Delete the background control
private _bgControl = HM_GET(_layout,bgControl);
ctrlDelete _bgControl;
HM_SET(_layout,bgControl, controlNull);

// Clear up variables
{
    _layout set [_x, nil];
} forEach (keys _layout);