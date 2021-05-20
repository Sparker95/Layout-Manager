#include "common.hpp"

/*
PUBLIC
Sets size of row with given ID.
_id - number
_size - use SIZE macros from public.hpp
*/


params ["_layout", "_id", "_size"];

private _array = HM_GET(_layout,rowSize);
_array set [_id, _size];