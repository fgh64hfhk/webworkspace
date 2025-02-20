$(() => {
	console.log("OK");
	let start = $('#start');
	let message_div = $('#message_div');
	let message = $('#message');
	let send = $('#send');
	let log = $('#log');
	
	let webSocket;
	
	start.on('click', () => {
		connect();
	});
	
	send.on('click', () => {
		let json_message = {
			message: message.val()
		};
		webSocket.send(JSON.stringify(json_message));
	});
	
	function connect() {
		webSocket = new WebSocket('ws://localhost:8080/eeit82_web/myserver');
		
		webSocket.onerror = function(event) {
			console.log("Error: " + event);
			message_div.hide('fast');
			start.show();
		}
		
		webSocket.onopen = function(event) {
			console.log("Open: " + event);
			console.log("Server Connection.");
			start.hide('fast');
			message_div.show();
		}
		
		webSocket.onmessage = function(event) {
			console.log("Message: " + event.data);
			let messageObj = JSON.parse(event.data);
			log.append(messageObj.message + "<br/ >");
		}

		webSocket.onclose = function(event) {
			console.log("Server Disconnection.");
			message_div.hide('fast');
			start.show();
		}
	}
})