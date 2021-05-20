#include "common.hpp"

params ["_layout", "_colid", "_rowid", "_sizexStruct", "_sizeyStruct"];

private _content = HM_GET(_layout,content);
private _contentStruct = _content#_colid#_rowid;
_contentStruct set [CONTENT_SIZE_X, _sizexStruct];
_contentStruct set [CONTENT_SIZE_Y, _sizeyStruct];