/// @function
/// @param {id.DsMap} _map
function Packet(_map)
	: Struct() constructor {
	self.id = _map[? "id"]
	self.url = _map[? "url"]
	self.http_status = _map[? "http_status"]
	self.status = _map[? "status"]
	self.result = _map[? "result"]
	self.contentLength = _map[? "contentLength"] ?? -1
	self.sizeDownloaded = _map[? "sizeDownloaded"] ?? -1
}