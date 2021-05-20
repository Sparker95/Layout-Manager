// ==== SIZE_STRUCT ====

// PRIVATE

#define SIZE_STRUCT_NEW(type, value) [type, value]

#define SIZE_TYPE 0
#define SIZE_VALUE 1

/*
#define SIZE_TYPE_ABS   0
#define SIZE_TYPE_REL   1
#define SIZE_TYPE_OWN   2
*/

#define SIZE_TYPE_ABS   "SIZE_ABS"
#define SIZE_TYPE_REL   "SIZE_REL"
#define SIZE_TYPE_OWN   "SIZE_OWN"

// ==== POS_STRUCT ====

// PRIVATE

#define POS_STRUCT_NEW(type, value) [type, value]

#define POS_TYPE 0
#define POS_VALUE 1

/*
#define POS_TYPE_REL 0
#define POS_TYPE_SNAP_MAX 1
#define POS_TYPE_SNAP_MIN 2
*/

#define POS_TYPE_REL "POS_REL"
#define POS_TYPE_SNAP_MAX "POS_SNAP_MAX"
#define POS_TYPE_SNAP_MIN "POS_SNAP_MIN"

// ==== CONTENT_STRUCT ====

// PRIVATE

#define __DEFPOS POS_STRUCT_NEW(POS_TYPE_REL, 0.5)
#define __DEFSIZE SIZE_STRUCT_NEW(SIZE_TYPE_REL, 1)

#define CONTENT_STRUCT_NEW() [nil, __DEFPOS, __DEFPOS, __DEFSIZE, __DEFSIZE, 0, 0]

#define CONTENT_CONTENT     0
#define CONTENT_POS_X       1
#define CONTENT_POS_Y       2
#define CONTENT_SIZE_X      3
#define CONTENT_SIZE_Y      4
#define CONTENT_MARGIN_X    5
#define CONTENT_MARGIN_Y    6

// ==== LAYOUT OBJECT ====

// Some macros for run time checks of hash map keys
#define HM_GET(hm, _key) if (#_key in hm) then {hm get #_key;} else {diag_log format ["ERROR: invalid key: <%1> at %2 %3", #_key, __LINE__, __FILE__];}
#define HM_SET(hm, _key, value) if (#_key in hm) then {hm set [#_key, value];} else {diag_log format ["ERROR: invalid key: <%1> at %2 %3", #_key, __LINE__, __FILE__];}

//#define HM_GET(hm, key) hm get key
//#define HM_SET(hm, key, value) hm set [key, value]

// ==== Logging ====
#define LOG_ERROR(str) diag_log format ["[Layout Manager] Error: %1", str]