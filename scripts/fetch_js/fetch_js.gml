/// @function
/// @param {string} _url
/// @param {struct} _settings
function fetch_js(_url, _settings) {
	var _req = new Request(_url, _settings[$ "method"], _settings[$ "headers"], undefined, _settings[$ "body"])
	return fetch(_req)
}