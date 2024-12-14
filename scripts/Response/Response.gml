/// @function
function Response()
	: Object() constructor {
	self._.request_id = -1
	self._.url = ""
	self._.http_status = 0
	self._.status = 1
	self._.result = ""
	self._.content_length = -1
	self._.size_downloaded = -1
	
	/// @return {real}
	static getID = function() {
		return self._.request_id
	}
	
	/// @return {string}
	static getURL = function() {
		return self._.url
	}
	
	/// @return {real}
	static getStatus = function() {
		return self._.status
	}
	
	/// @return {real}
	static getStatusHTTP = function() {
		return self._.http_status
	}
	
	/// @return {string}
	static getBodyText = function() {
		return self._.result
	}
	
	/// @return {struct}
	static getBodyJSON = function() {
		return json_parse(self._.result)
	}
	
	/// @return {real}
	static getProgress = function() {
		return self._.size_downloaded / self._.content_length
	}

	/// @param {struct.Packet} _packet
	static update = function(_packet) {
		self._.request_id = _packet.id
		self._.url = _packet.url
		self._.http_status = _packet.http_status
		self._.status = _packet.status
		self._.result = _packet.result
		self._.content_length = _packet.contentLength
		self._.size_downloaded = _packet.sizeDownloaded
	}	

	/// @return {bool}
	static hasErrorResult = function() {
		return self._.status < 0
	}
	
	/// @return {bool}
	static hasPendingResult = function() {
		return self._.status > 0
	}
	
	/// @return {bool}
	static hasSuccessResult = function() {
		return self._.status == 0
	}
	
}