#include "..\LM\public.hpp"

if (! isNil {layouts}) then {
    {
        [_x] call LM_fnc_deleteLayout;
    } forEach layouts;
};

//createDialog "RscDisplayEmpty"; // will have idd -1
private _dlg = finddisplay 46;

layouts = [];

for "_i" from 0 to 2 do {

    private _layout = [4, 1, _dlg, controlNull, true] call LM_fnc_createGridLayout;

    [_layout, SIZE_REL(1), SIZE_REL(1)] call LM_fnc_setAllContentSize;

    [_layout, 0, 0, ["SIZE_REL(0.5)", _dlg] call LM_fnc_createButton] call LM_fnc_setContent;
    [_layout, 1, 0, ["SIZE_REL(0.75)", _dlg] call LM_fnc_createButton] call LM_fnc_setContent;
    [_layout, 2, 0, ["SIZE_REL(1)", _dlg] call LM_fnc_createButton] call LM_fnc_setContent;
    [_layout, 3, 0, ["SIZE_ABS(0.2)", _dlg] call LM_fnc_createButton] call LM_fnc_setContent;

    [_layout, 0, 0, SIZE_REL(0.5), SIZE_REL(1)] call LM_fnc_setContentSize;
    [_layout, 1, 0, SIZE_REL(0.75), SIZE_REL(1)] call LM_fnc_setContentSize;
    [_layout, 2, 0, SIZE_REL(1), SIZE_REL(1)] call LM_fnc_setContentSize;
    [_layout, 3, 0, SIZE_ABS(0.2), SIZE_REL(1)] call LM_fnc_setContentSize;

    [_layout, [-0.3, _i*0.15, 1 + _i*0.347, 0.07]] call LM_fnc_setPosAndSize;
    [_layout] call LM_fnc_commit;
    [_layout, false] call LM_fnc_drawGrid;


    layouts pushBack _layout;

};