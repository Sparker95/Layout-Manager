#include "common.hpp"

// ======================================================================================
// ==    These are the public defines you should use while interacting with the code.  ==
// ======================================================================================

// PUBLIC Aliases

// Macros for positions

#define POS_REL(val)    [POS_TYPE_REL, val]
#define SNAP_MAX        [POS_TYPE_SNAP_MAX, 0]
#define SNAP_TOP        [POS_TYPE_SNAP_MIN, 0]
#define SNAP_RIGHT      [POS_TYPE_SNAP_MAX, 0]
#define SNAP_MIN        [POS_TYPE_SNAP_MIN, 0]
#define SNAP_BOTTOM     [POS_TYPE_SNAP_MAX, 0]
#define SNAP_LEFT       [POS_TYPE_SNAP_MIN, 0]
#define SNAP_CENTER     [POS_TYPE_REL, 0.5]

// Macros for sizes

#define SIZE_ABS(val)   [SIZE_TYPE_ABS, val]
#define SIZE_REL(val)   [SIZE_TYPE_REL, val]
#define SIZE_OWN        [SIZE_TYPE_OWN, 0]