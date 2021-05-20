#include "common.hpp"

/*
PUBLIC
Assigns a content element to a given cell.
_colid, _rowid - column id and row id
_contentInCell - a control or another layout
*/

params ["_layout", "_colid", "_rowid", ["_contentInCell", controlNull, [controlNull, createHashmap]]];

private _content = HM_GET(_layout,content);
private _contentStruct = _content#_colid#_rowid;
_contentStruct set [CONTENT_CONTENT, _contentInCell];