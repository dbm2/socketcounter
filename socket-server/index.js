const server = require('http').createServer();
const io = require('socket.io')(server);
const port = process.env.PORT || 3000;

var counter = 0

function onConnection(socket) {

	socket.on('increaseCounter', () => {
		console.log('Counter increased.')
		counter += 1;

		io.emit('counterChanged', counter);
	});

	socket.on('decreaseCounter', () => {
		console.log('Counter decreased.')
		counter -= 1;

		io.emit('counterChanged', counter);
	});

	socket.on('updateCounter', () => {
		socket.emit('counterChanged', counter);
	});


}

io.on('connection', onConnection);

console.log('Socket.io Server initialized with port ' + port + '.\n');
server.listen(port);