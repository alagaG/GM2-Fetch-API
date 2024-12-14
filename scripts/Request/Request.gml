/// @function
/// @param {string} _url
/// @param {struct.HTTPMethods} _method
/// @param {struct} _headers
/// @param {array<string>} _params
/// @param {real | string | id.Buffer} _body
function Request(_url, _method=undefined, _headers=undefined, _params=undefined, _body=undefined)
	: Object() constructor {
	self._.url = _url
	self._.params = _params ?? []
	self._.method = _method ?? HTTPMethods.GET
	self._.headers = _headers ?? {}
	self._.body = _body ?? ""

	/// @return {struct.Promise}
	static send = function() {
		var _url = self.getURL()
		var _method = HTTPMethodsEnum.getName(self._.method)
		var _headers = struct_to_ds_map(self._.headers)
		return http_request(_url, _method, _headers, self._.body)
	}
	
	/// @return {string}
	static getURL = function() {
		return self.getURLBody() + self.getURLParams()
	}
	
	/// @return {string}
	static getURLBody = function() {
		return self._.url
	}
	
	/// @return {string}
	static getURLParams = function() {
		return array_length(self._.params) > 0
			? $"?{string_join_ext("&", self._.params)}"
			: ""
	}
	
}