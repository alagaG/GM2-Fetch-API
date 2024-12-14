/// @function
function Object()
	constructor {
	static count = 0
	self._ = {}
	self._.__id = count++

	/// @param {struct.Object} _other
	/// @return {bool}
	static equals = function(_other) {
		return self._.__id == _other._.__id
	}

	/// @return {string}
	static getConstructor = function() {
		return instanceof(self)
	}
	
	/// @return {string}
	static toString = function() {
		return $"[{self.getConstructor()}:{self._.__id}]"
	}

}