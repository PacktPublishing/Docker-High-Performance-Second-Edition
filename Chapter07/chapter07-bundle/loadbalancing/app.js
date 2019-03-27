var http = require("http");

var server = http.createServer(function (request, response) {
  response.writeHead(200, {"Content-Type": "text/plain"});
  var version = "2.0.0";
  var log = {};
  log.header = "mywebapp";
  log.name = process.env.HOSTNAME;
  log.version = version;
  console.log(JSON.stringify(log));
  response.end(version + " Hello World " + process.env.HOSTNAME);
});

server.listen(8000);
