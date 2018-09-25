const http = require('http')
const port = 3001

const requestHandler = (request, response) => {
  console.log('request url', request.url)
  if(request.url == '/make-payment'){
    random = Math.floor(Math.random() * 2) + 1
    success = random % 2 == 0
    console.log('success is',success)
    if(success){
      response.end(JSON.stringify({success: true, errors: []}))
    }else{
      response.end(JSON.stringify({success: false, errors: ['credit card declined']}))
    }

  }else{
    response.end("wrong url, try /make-payment")
  }
}

const server = http.createServer(requestHandler)

server.listen(port, (err) => {
  if (err) {
    return console.log('something bad happened', err)
  }

  console.log(`server is listening on ${port}`)
})
