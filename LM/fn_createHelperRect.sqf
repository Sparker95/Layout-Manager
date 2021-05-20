// Draws a rectangle or can also be used to draw vertical or horisontal line
// _margin is applied in all directions (up, down, left, right)


params ["_display", "_ctrlGroup", "_x0", "_y0", "_x1", "_y1", "_margin", ["_color", [1, 0, 0, 0.5]] ];

//diag_log format ["createHelperRect: %1", _this];

private _offsetx = _margin;
private _offsety = _margin * safeZoneW / safeZoneH;

private _width = _x1 - _x0 + 2*_offsetx;
private _height = _y1 - _y0 + 2*_offsety;
private _x = _x0 - _offsetx;
private _y = _y0 - _offsety;

private _ctrl = _display ctrlCreate ["RscText", -1, _ctrlGroup];

_ctrl ctrlSetBackgroundColor _color;

_ctrl ctrlSetPosition [_x, _y, _width, _height];

_ctrl ctrlCommit 0;

_ctrl;