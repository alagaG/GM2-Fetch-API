enum HTTPMethods {
	GET,
	HEAD, 
	POST, 
	PUT, 
	DELETE, 
	TRACE, 
	OPTIONS, 
	CONNECT
}

/// @function
function HTTPMethodsEnum()
	: Enum() constructor {
	
	/// @return {array<string>}
	static getNames = function() {
		return [ "GET",	"HEAD", "POST", "PUT", "DELETE", "TRACE", "OPTIONS", "CONNECT" ]
	}
	
	/// @param {struct.HTTPMethods}
	static getName = function(_method) {
		return HTTPMethodsEnum.getNames()[@ _method]
	}

}
new HTTPMethodsEnum()