#include "common.hpp"

params ["_layout", "_colid", "_rowid", ["_contentInCell", controlNull, [controlNull, createHashmap]]];

private _content = HM_GET(_layout,content);
private _contentStruct = _content#_colid#_rowid;
_contentStruct set [CONTENT_CONTENT, _contentInCell];