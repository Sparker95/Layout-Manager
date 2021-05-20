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

    private _layout = [5, 1, _dlg, controlNull, true] call LM_fnc_createGridLayout;

    [_layout, SIZE_REL(1), SIZE_REL(1)] call LM_fnc_setAllContentSize;

    for "_j" from 0 to 4 do {
        private _m = _j*0.005;
        private _text = str _m;
        [_layout, _j, 0, [_text, _dlg] call LM_fnc_createButton] call LM_fnc_setContent;
        [_layout, _j, 0, _m, _m] call LM_fnc_setContentMargins;
    };

    [_layout, [-0.3, _i*0.15, 1 + _i*0.347, 0.07]] call LM_fnc_setPosAndSize;
    [_layout] call LM_fnc_commit;
    [_layout, false] call LM_fnc_drawGrid;


    layouts pushBack _layout;

};