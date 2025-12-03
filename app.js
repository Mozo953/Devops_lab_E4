const http = require('http');
const server = http.createServer((req, res) => {
res.writeHead(200, { 'Content-Type': 'text/plain' });
res.end('Bonjour, monde !\n');
});
const port = process.env.PORT || 8080;
server.listen(port,() => {
console.log(`Écoute sur le port ${port}`); });


