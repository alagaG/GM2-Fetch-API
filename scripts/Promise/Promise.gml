/// @function
/// @param {struct.Request} _req
function Promise(_req)
	: Object() constructor {
	self._.req = _req
	self._.res = new Response()
	self._.then_callback = undefined
	self._.catch_callback = undefined
	self._.finally_callback = undefined
	
	/// @return {struct.Request} _req
	static request = function() {
		return self._.req
	}
	
	/// @return {struct.Response} _res
	static response = function() {
		return self._.res
	}
	
	/// @function
	static invokeCallbacks = function() {
		if (self._.res.hasPendingResult()) return undefined
		if (self._.res.hasSuccessResult()
			and not is_undefined(self._.then_callback)) method_call(self._.then_callback, [ self._.res ])
		if (self._.res.hasErrorResult()
			and not is_undefined(self._.catch_callback)) method_call(self._.catch_callback, [ self._.res ])
		if (not is_undefined(self._.finally_callback)) method_call(self._.finally_callback, [ self._.res ])
	}
	
	/// @param {function} _callback
	/// @return {struct.Promise}
	static onThen = function(_callback) {
		self._.then_callback = _callback
		return self
	}
	
	/// @param {function} _callback
	/// @return {struct.Promise}
	static onCatch = function(_callback) {
		self._.catch_callback = _callback
		return self
	}
	
	/// @param {function} _callback
	/// @return {struct.Promise}
	static onFinally = function(_callback) {
		self._.finally_callback = _callback
		return self
	}
	
}
