#include "common.hpp"

params ["_layout", "_colid", "_rowid", "_posxStruct", "_posyStruct"];

private _content = HM_GET(_layout,content);
private _contentStruct = _content#_colid#_rowid;
_contentStruct set [CONTENT_POS_X, _posxStruct];
_contentStruct set [CONTENT_POS_Y, _posyStruct];