/// @function
/// @param {struct} _struct
/// @return {id.DsMap}
function struct_to_ds_map(_struct) {
	var _ds = ds_map_create()
	var _keys = struct_get_names(_struct)
	var _len = array_length(_keys)
	for (var _i=0; _i<_len; _i++) ds_map_replace(_ds, _keys[@ _i], _struct[$ _keys[@ _i]])
	return _ds
}