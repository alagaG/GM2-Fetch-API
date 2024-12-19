/// @function
function InvalidSelfException()
	: Exception() constructor {
		
	/// @return {string}
	static getMessage = function() {
		return "Invalid \'self\' exception!"
	}

}