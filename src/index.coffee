express = require 'express'
path = require 'path'
bodyParser = require 'body-parser'

app = express()
app.use require('connect-livereload')()

app.use bodyParser.json()
app.use bodyParser.urlencoded extended:true

app.use express.static path.join __dirname, 'public'

data = [
  {nick:"Dr, Nick", content:"Hi~ everybody~"},
  {nick:"everybody", content:"Hi~ Dr. Nick~"}
]

app.get '/api/sweet', (req,res) ->
  res.json data

app.post '/api/sweet', (req,res) ->
  data.push req.body
  res.json data



app.listen 3000
