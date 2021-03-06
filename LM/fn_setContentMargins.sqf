#include "common.hpp"

/*
PUBLIC
Sets inner margins of a cell.
_colid, _rowid - id of column and row
_x, _y - numbers
*/

params ["_layout", "_colid", "_rowid", "_x", "_y"];

private _content = HM_GET(_layout,content);
private _contentStruct = _content#_colid#_rowid;
_contentStruct set [CONTENT_MARGIN_X, _x];
_contentStruct set [CONTENT_MARGIN_Y, _y];