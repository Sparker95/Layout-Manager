#include "common.hpp"

params ["_layout", "_id", "_size"];

private _array = HM_GET(_layout,rowSize);
_array set [_id, _size];