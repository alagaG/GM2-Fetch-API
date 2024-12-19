/// @function
function Exception()
	: Object() constructor {

	/// @return {string}
	static getMessage = function() {
		return "Exception!"
	}
	
	/// @return {string}
	static toString = function() {
		return $"[{self.getConstructor()}]\nMessage:\n\t{self.getMessage()}\n"
	}

}