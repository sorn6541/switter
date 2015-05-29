express = require 'express'
Sequelize = require 'sequelize'

# setting DB
sequelize = new Sequelize 'switter','switter','switter',
  host:'localhost'
  port:3306

# setting model
Switter = sequelize.define 'switter',
  nick: Sequelize.STRING(20)
  content: Sequelize.STRING(140)

# setting default db value
Switter.sync force:true
  .then () ->
    Switter.create 
      nick: "김창규씨"
      content: "스위터는 스윗해.."
  .then (sweet) ->
    console.log sweet.get 'nick'
    console.log sweet.get 'content'



# console.log __dirname
# express 
app = express()
app.use require('connect-livereload') 
  port:35729
app.use express.static 'view'

# route
app.get '/', (req, res) ->
  res.sendFile 'view/index.html',
    root: __dirname
# app.post '/', (req,res) ->
#   res.send 'post'

app.listen 3000

