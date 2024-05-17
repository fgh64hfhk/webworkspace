/**
 * 
 */
var cookies_object = {};

window.onload = function() {
	var cookie = document.cookie;
	var cookies_object = parseCookie(cookie);
	
	console.log('-----cookie-----');
	console.log(cookie);
	console.log(cookies_object);
	
	function getCookie(key) {
		return cookies_object[key];
	}
	
	if (getCookie('account')) {
		document.getElementById('account').value = getCookie('account'); 
	}
	if (getCookie('password')) {
		document.getElementById('password').value = getCookie('password'); 
	}
	
	if (getCookie('remember') === 'false') {
		document.getElementById('remember').checked = false; 
	} else {
		document.getElementById('remember').checked = true;
	}
}

function parseCookie(from_cookie) {
	
	var cookies = from_cookie.split(";");
	cookies.forEach(function(item, index) {
		item = item.trim().split('=');
		cookies_object[item[0].trim()] = item[1];
	});
	
	return cookies_object;
}

function beforeSubmit() {
	let account = document.getElementById("account").value;
	let password = document.getElementById("password").value;
	let isRemember = document.getElementById("remember").checked;
	
	if (isRemember) {
		document.cookie = "account=" + account;
		document.cookie = "password=" + password;
		document.cookie = "remember=" + isRemember;
	} else {
		var cookie = document.cookie;
		var cookies = cookie.split(";");
		for (let i = 0; i < cookies.length; i++) {
			var setting = cookies[i].trim().split('=');
			document.cookie = setting[0].trim() + "=;expires=Thu, 21 May 2024 00:00:00 UTC";
		}
		document.cookie = "remember=" + false;
	}
	
	return true;
}