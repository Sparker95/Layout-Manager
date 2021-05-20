#include "common.hpp"

/*
PUBLIC
Sets position of content in given cell.
_colid, _rowid - id of column and row
_posxStruct, _posyStruct - use POS and SNAP macros from public.hpp
*/

params ["_layout", "_colid", "_rowid", "_posxStruct", "_posyStruct"];

private _content = HM_GET(_layout,content);
private _contentStruct = _content#_colid#_rowid;
_contentStruct set [CONTENT_POS_X, _posxStruct];
_contentStruct set [CONTENT_POS_Y, _posyStruct];