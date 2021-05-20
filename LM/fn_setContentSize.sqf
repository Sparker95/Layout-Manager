#include "common.hpp"

/*
PUBLIC
Sets size of content in given cell.
_colid, _rowid - id of column and row
_sizexStruct, _sizeyStruct - use SIZE macros from public.hpp
*/

params ["_layout", "_colid", "_rowid", "_sizexStruct", "_sizeyStruct"];

private _content = HM_GET(_layout,content);
private _contentStruct = _content#_colid#_rowid;
_contentStruct set [CONTENT_SIZE_X, _sizexStruct];
_contentStruct set [CONTENT_SIZE_Y, _sizeyStruct];