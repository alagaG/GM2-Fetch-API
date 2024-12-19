/// @function
function LinkedQueue()
	: Object() constructor {
	self._.data_first = undefined
	self._.data_last = undefined
	self._.size = 0
	
	/// @param {array} _array
	/// @return {struct.LinkedQueue}
	static fromArray = function(_array) {
		var _queue = new LinkedQueue()
		var _len = array_length(_array)
		for (var _i=0; _i<_len; _i++) {
			_queue.enqueue(_array[@ _i])
		}
		return _queue
	}
	
	/// @param {any} _value
	static enqueue = function(_value) {
		var _node = {}
		_node.value = _value
		_node.prev = undefined
		_node.next = undefined
		
		if (is_undefined(self._.data_first)) {
			self._.data_first = _node
			self._.data_last = _node
		} else {
			var _prev = self._.data_last 
			_prev.next = _node
			_node.prev = _prev
			self._.data_last = _node
		}
		
		self._.size++
	}
	
	/// @return {any} _value
	static dequeue = function() {
		if (self.isEmpty()) return undefined
		
		var _node = self._.data_first
		
		if (not is_undefined(_node.next)) {
			self._.data_first = _node.next
		} else {
			self._.data_first = undefined
		}
		self._.size--
		
		return _node.value
	}
	
	/// @return {real}
	static getSize = function() {
		return self._.size
	}
	
	/// @return {bool}
	static isEmpty = function() {
		return is_undefined(self._.data_first)
	}

}
new LinkedQueue()